<?php

namespace App\Modules\SiteManager\Controllers;

use App\Http\Controllers\Controller;
use App\Modules\LanguageManager\Models\Language;
use App\Modules\SiteManager\Models\ClinicDatabase;
use App\Modules\SiteManager\Models\ClinicHosting;
use App\Modules\SiteManager\Models\ClinicInfo;
use App\Modules\SiteManager\Models\Hosting;
use App\Modules\SiteManager\Models\ClinicLanguage;
use App\Modules\SiteManager\Models\ClinicTheme;
use App\Modules\SiteManager\Models\ThemeType;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Http\Request;
use Validator;
use DB;
use Flash;
use App\Facades\Admin;
use App\Facades\Theme;
use App\Modules\TemplateManager\Models\Template;
use App\Modules\ContentManager\Models\Themes;
use App\Modules\SiteManager\Models\Clinic;
use App\Repositories\ClinicRepository;

use File;
use View;

class SiteController extends Controller
{

    /** @var  ClinicRepository */
    private $clinicRepository;

    public function __construct(ClinicRepository $clinicRepo) {
        $this->clinicRepository = $clinicRepo;
    }

    /**
     * Show list of site library.
     *
     * @return Response
     */
    public function index($theme_type_id = 0, $status = -1)
    {
        $theme_type = ThemeType::all();
        $query = Input::get("q");

        if($theme_type_id !=0){
            // get all theme has theme_type_id = $theme_type_id
            $templates = Template::where('theme_type_id', $theme_type_id)->where('is_publish', 1)->get();

            $theme_ids = [];
            foreach ($templates as $temp){
                array_push($theme_ids, $temp->id);
            }

            $clinicThemes = ClinicTheme::whereIn('theme_id',$theme_ids)->get();
            $clinic_ids = [];

            foreach ($clinicThemes as $ct){
                array_push($clinic_ids, $ct->clinic_id);
            }

            if($status != -1){
                // filter template, filter status
                $clinics = Clinic::whereIn('clinic_id', $clinic_ids)->where('status', $status)->paginate(10);
            }else{
                // filter template, not filter status
                $clinics = Clinic::whereIn('clinic_id', $clinic_ids)->paginate(10);
            }

        }else{
            if($status!= -1) {
                // No filter template, filter by status
                $clinics = Clinic::where('status', $status)->paginate(10);
            }else{
                // No filter all.
                $clinics = Clinic::paginate(10);
            }
        }
//        $clinics = Clinic::get();

        return view('SiteManager::index', [
            'clinics' => $clinics,
            'theme_type'=> $theme_type,
            'theme_type_id' => $theme_type_id,
            'status' => $status,
            'query'=> $query
        ]);
    }


    /**
     * Show site detqail.
     *
     * @return Response
     */
    public function getSiteDetail($id)
    {
        $clinic = Clinic::find($id);
        if (empty($clinic)) {
            return redirect(Admin::route('siteManager.index'));
        }

        return view('SiteManager::site-detail', compact('clinic'));
    }

    /**
     * Show site edit.
     *
     * @return Response
     */
    public function editInfo($id)
    {
        $clinic = Clinic::find($id);
        $languages = Language::get();
        if (empty($clinic)) {
            return redirect(Admin::route('siteManager.index'));
        }

        return view('SiteManager::edit.edit', ['clinic' => $clinic, 'languages'=> $languages]);
    }

    /*
     * Add new clinic site - step 1 : select template
     * @param : null
     * Save selected template to session
     * */
    public function selectTemplate($theme_type = 0){
        $query = Input::get("q");
        if ($theme_type == 0) {
            $templates = Template::where('theme_type_id', '<>', 3)
                ->where('is_publish',1)
                ->where('name', 'like', '%'.$query.'%')
                ->paginate(6);
        } else {
            $templates = Template::where('theme_type_id', '<>', 3)
                ->where('is_publish',1)
                ->where('name', 'like', '%'.$query.'%')
                ->where('theme_type_id', $theme_type)
                ->paginate(6);
        }
        $selected =  \Session::get('templates',[]);

        return view('SiteManager::create.step-1-select-template',
            [
                'templates'=> $templates,
                'theme_type' => $theme_type,
                'selected' =>$selected,
                'query' => $query
            ]
        );
    }

    /*
     *  Add new clinic site - step 2: Add info clinic site
     * @param : null
     * */
    public function addInfo(Request $request){
        $languages = Language::get();

        return view('SiteManager::create.step-2-add-info', ['languages' => $languages]);
    }


    public function createInfo(Request $request){
        $input = Input::all();

        $rules = array(
            'site-name' => 'required',
            'admin-name' => 'required',
            'email-address' => 'required',
            'address' => 'required',
            'telephone' => 'required',
            'domain' => 'required',
            'host' => 'required',
            'host-username' => 'required',
            'host-password' => 'required',
            'database-name' => 'required',
            'default-language' =>'required',
            'database-host' => 'required',
            'database-password' => 'required',
            'database-username' => 'required',
        );

        $messages = [
            'site-name.required' => 'The Site Name field is required.',
            'admin-name.required' => 'The Admin Name field is required.',
            'email-address.required' => 'The Email Address field is required.',
            'address.required' => 'The Address field is required.',
            'telephone.required' => 'The Telephone field is required.',
            'domain.required' => 'The Domain field is required.',
            'host.required' => 'The Host field is required.',
            'host-username.required' => 'The Host Username field is required.',
            'host-password.required' => 'The Host Password field is required.',
            'database-name.required' => 'The Database Name field is required.',
            'database-host.required' => 'The Database Host field is required.',
            'database-password.required' => 'The Database Password field is required.',
            'database-username.required' => 'The Database Username field is required.',
            'default-language.required' => 'The Language field is required.',
        ];

        $validator = Validator::make($input, $rules, $messages);

        if ($validator->fails())
        {
            return redirect('admin/site-manager/add-info')
                ->withErrors($validator)
                ->withInput();
        } else {
            $clinic = new Clinic();
            $clinic->domain = $input['domain'];
            $clinic->save();

            // save clinic info table
            $clinicInfo = new ClinicInfo();
            $clinicInfo->site_name = $input['site-name'];
            $clinicInfo->email = $input['email-address'];
            $clinicInfo->username = $input['admin-name'];
            $clinicInfo->telephone = $input['telephone'];
            $clinicInfo->address = $input['address'];
            $clinicInfo->clinic()->associate($clinic);
            $clinicInfo->save();

            // save clinic database table
            $clinicDatabase = new ClinicDatabase();
            $clinicDatabase->database_name = $input['database-name'];
            $clinicDatabase->host = $input['database-host'];
            $clinicDatabase->username = $input['database-username'];
            $clinicDatabase->password = bcrypt($input['database-password']);
            $clinicDatabase->clinic()->associate($clinic);
            $clinicDatabase->save();

            // save clinic hosting table
            $clinicHosting = new ClinicHosting();
            $clinicHosting->host = $input['host'];
            $clinicHosting->username = $input['host-username'];
            $clinicHosting->password =bcrypt($input['host-password']);
            $clinicHosting->clinic()->associate($clinic);
            $clinicHosting->save();

            // save clinic language table
            $clinicLanguage = new ClinicLanguage();
            $clinicLanguage->language_id = $input['default-language'];
            $clinicLanguage->clinic()->associate($clinic);
            $clinicLanguage->save();

            $clinicTheme = new ClinicTheme();

            $clinics = Clinic::get();
            return view('SiteManager::index', ['clinics' => $clinics]);
//            return redirect('admin/site-manager');
        }

    }

    //Update clinic info
    public function updateInfo($id, Request $request){
        $clinic = Clinic::find($id);
        $input = Input::all();;

        $clinic->domain = $input['domain'];
        $clinic->save();

        $clinicInfo = ClinicInfo::find($id);
        $clinicInfo->site_name = $input['site-name'];
        $clinicInfo->email = $input['email-address'];
        $clinicInfo->username = $input['admin-name'];
        $clinicInfo->telephone = $input['telephone'];
        $clinicInfo->address = $input['address'];
        $clinicInfo->save();

        $clinicDatabase = ClinicDatabase::find($id);
        $clinicDatabase->database_name = $input['database-name'];
        $clinicDatabase->host = $input['database-host'];
        $clinicDatabase->username = $input['database-username'];
        $clinicDatabase->password = bcrypt($input['database-password']);
        $clinicDatabase->save();

        $clinicHosting = ClinicHosting::find($id);
        $clinicHosting->host = $input['host'];
        $clinicHosting->username = $input['host-username'];
        $clinicHosting->password =bcrypt($input['host-password']);
        $clinicHosting->save();

        $clinicLanguage = ClinicLanguage::find($id);
        $clinicLanguage->country_id = $input['default-language'];
        $clinicLanguage->save();

        return redirect('admin/site-manager');
    }

    /*
     * Push template to session
     * When sanmax admin check or uncheck session
     * */
    public function toggleTemplateSession($id){
        $templates = \Session::get('templates', []);

        if (($key = array_search($id, $templates)) !== false) {
            unset($templates[$key]);
        }else{
//            array_push($templates,$id);
            $templates[] = $id;
        }

        \Session::set('templates', $templates);
        \Session::save();
        $templates = \Session::get('templates',[]);
        dd($templates);
    }

    /*
     * Destroy site info
     * */
    public function destroyInfo($clinicID){
        // delete clinic
        Clinic::destroy($clinicID);
    }

}