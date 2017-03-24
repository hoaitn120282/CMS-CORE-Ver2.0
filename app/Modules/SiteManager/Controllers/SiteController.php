<?php

namespace App\Modules\SiteManager\Controllers;

use App\Http\Controllers\Controller;
use App\Modules\ContentManager\Models\ThemeMeta;
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
use Session;
use Validator;
use DB;
use Flash;
use Mail;
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

    public function __construct(ClinicRepository $clinicRepo)
    {
        $this->clinicRepository = $clinicRepo;
    }

    /**
     * Show list of site library.
     *
     * @return Response
     */
    public function index($theme_type_id = 0, $status = -1)
    {
        $templates = \Session::set('templates', []);
        $theme_type = ThemeType::all();

        $q = Input::get("q");

        if ($theme_type_id != 0) {
            // get all theme has theme_type_id = $theme_type_id
            $templates = Template::where('theme_type_id', $theme_type_id)->where('is_publish', 1)->get();

            $theme_ids = [];
            foreach ($templates as $temp) {
                array_push($theme_ids, $temp->id);
            }

            $clinicThemes = ClinicTheme::whereIn('theme_id', $theme_ids)->get();
            $clinic_ids = [];

            foreach ($clinicThemes as $ct) {
                array_push($clinic_ids, $ct->clinic_id);
            }

            if ($status != -1) {
                // filter template, filter status
                $clinics = Clinic::whereHas('info', function ($query) use ($q) {
                    return $query->where('site_name', 'like', '%' . strtolower($q) . '%');
                })->whereIn('clinic_id', $clinic_ids)->where('status', $status)->paginate(10);
            } else {
                // filter template, not filter status
                $clinics = Clinic::whereHas('info', function ($query) use ($q) {
                    return $query->where('site_name', 'like', '%' . strtolower($q) . '%');
                })->whereIn('clinic_id', $clinic_ids)->paginate(10);
            }

        } else {
            if ($status != -1) {
                // No filter template, filter by status
                $clinics = Clinic::whereHas('info', function ($query) use ($q) {
                    return $query->where('site_name', 'like', '%' . strtolower($q) . '%');
                })->where('status', $status)->paginate(10);
            } else {
                // No filter all.
                $clinics = Clinic::whereHas('info', function ($query) use ($q) {
                    return $query->where('site_name', 'like', '%' . strtolower($q) . '%');
                })->paginate(10);
            }
        }

        foreach ($clinics as &$clinic) {
            $clinicThemes = ClinicTheme::where('clinic_id', $clinic->clinic_id)->first();
            if ($clinicThemes) {
                $clinic->firstThemeId = $clinicThemes->theme_id;
            } else {
                $clinic->firstThemeId = 0;
            }
        }

        return view('SiteManager::index', [
            'clinics' => $clinics,
            'theme_type' => $theme_type,
            'theme_type_id' => $theme_type_id,
            'status' => $status,
            'query' => $q
        ]);
    }

    /**
     * @return view send email
     */

    public function sendEmail(Request $request)
    {
        $email = $request->all();
        Mail::send('SiteManager::email', array(
            'adminName' => $email["adminName"],
            'password' => $email['password'],
            'usernameName' => $email['usernameName'],
            'siteName' => $email['siteName']
        ), function ($message) use ($email) {
            $message->to($email['email'], 'Sanmax')->subject('Sanmax email!');
        });
        Session::flash('flash_message', 'Send message successfully!');

    }

    /**
     * Show site detqail.
     *
     * @return Response
     */
    public function getSiteDetail($id)
    {
        $clinic = Clinic::find($id);
        $languageSelected = [];
        $languages = Language::get();
        $templatesList = Template::get();

        for ($i = 0; $i < count($clinic->language); $i++) {
            foreach ($languages as $lang) {
                if ($lang->language_id == $clinic->language[$i]->language_id) {
                    array_push($languageSelected, $lang->name);
                }
            }
        }

        $templates = \Session::get('templates', []);

        if (empty($clinic)) {
            return redirect(Admin::route('siteManager.index'));
        }

        $checkHosting = $this->checkHosting($id);

        return view('SiteManager::site-detail',
            [
                'clinic' => $clinic,
                'templates' => $templates,
                'languageSelected' => $languageSelected,
                'checkHosting' => $checkHosting
            ]);
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
        $templatesList = Template::get();

        if (empty($clinic)) {
            return redirect(Admin::route('siteManager.index'));
        }

        $langs = $clinic->language;
        $languageSelected = [];
        foreach ($langs as $la) {
            array_push($languageSelected, $la->language_id);
        }

        return view('SiteManager::edit.edit', ['clinic' => $clinic, 'languages' => $languages, 'languageSelected' => $languageSelected]);

    }

    /*
     * Add new clinic site - step 1 : select template
     * @param : null
     * Save selected template to session
     * */
    public function selectTemplate($theme_type = 0)
    {
        $query = Input::get("q");
        if ($theme_type == 0) {
            $templates = Template::where('theme_type_id', '<>', 3)
                ->where('is_publish', 1)
                ->where('name', 'like', '%' . $query . '%')
                ->paginate(6);
        } else {
            $templates = Template::where('theme_type_id', '<>', 3)
                ->where('is_publish', 1)
                ->where('name', 'like', '%' . $query . '%')
                ->where('theme_type_id', $theme_type)
                ->paginate(6);
        }
        $selected = \Session::get('templates', []);

        return view('SiteManager::create.step-1-select-template',
            [
                'templates' => $templates,
                'theme_type' => $theme_type,
                'selected' => $selected,
                'query' => $query
            ]
        );
    }

    /*
     *  Add new clinic site - step 2: Add info clinic site
     * @param : null
     * */
    public function addInfo(Request $request)
    {
        $languages = Language::get();
        $templates = \Session::get('templates', []);

        if (count($templates) == 0) {
            Session::flash('message', 'Please select at least 1 template!');
            Session::flash('alert-class', 'alert-danger');
            return redirect(Admin::route('siteManager.select-template'));
        } else {
            return view('SiteManager::create.step-2-add-info', ['languages' => $languages]);
        }
    }

    //Create clinic
    public function createInfo(Request $request)
    {
        $input = Input::all();
        $templates = \Session::get('templates', []);

        $languages = $request->get('language');

        $rules = array(
            'site-name' => 'required',
            'admin-name' => 'required',
            'email-address' => 'required|email',
            'address' => 'required',
            'telephone' => 'required|numeric',
            'language' => 'required',
//            'domain' => 'required',
//            'host' => 'required',
//            'host-username' => 'required',
//            'host-password' => 'required',
//            'database-name' => 'required',
//            'database-host' => 'required',
//            'database-password' => 'required',
//            'database-username' => 'required',
        );

        $messages = [
            'site-name.required' => 'The Site Name field is required.',
            'admin-name.required' => 'The Admin Name field is required.',
            'email-address.required' => 'The Email Address field is required.',
            'email-address.email' => 'Please enter a valid email address.',
            'address.required' => 'The Address field is required.',
            'telephone.required' => 'The Telephone field is required.',
            'telephone.numeric' => 'Please enter a valid number.',
//            'domain.required' => 'The Domain field is required.',
//            'host.required' => 'The Host field is required.',
//            'host-username.required' => 'The Host Username field is required.',
//            'host-password.required' => 'The Host Password field is required.',
//            'database-name.required' => 'The Database Name field is required.',
//            'database-host.required' => 'The Database Host field is required.',
//            'database-password.required' => 'The Database Password field is required.',
//            'database-username.required' => 'The Database Username field is required.',
            'language.required' => 'The Language field is required.',
        ];

        $validator = Validator::make($input, $rules, $messages);

        if ($validator->fails()) {
            return redirect('admin/site-manager/add-info')
                ->withErrors($validator)
                ->withInput();
        } else {
            $clinic = new Clinic();
            $clinic->domain = $input['domain'];
            $clinic->save();
            $clinicId = $clinic->clinic_id;

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
            $clinicDatabase->password =$input['database-password'];
            $clinicDatabase->clinic()->associate($clinic);
            $clinicDatabase->save();

            // save clinic hosting table
            $clinicHosting = new ClinicHosting();
            $clinicHosting->host = $input['host'];
            $clinicHosting->username = $input['host-username'];
            $clinicHosting->password = $input['host-password'];
            $clinicHosting->clinic()->associate($clinic);
            $clinicHosting->save();

            // save clinic language table
            foreach ($languages as $langu) {
                $clinicLanguage = new ClinicLanguage();
                $clinicLanguage->language_id = $langu;
                $clinicLanguage->clinic()->associate($clinic);
                $clinicLanguage->save();
            }

            // save clinic theme table
            foreach ($templates as $temp) {
                $clinicTheme = new ClinicTheme();
                $clinicTheme->theme_id = $temp;
                $clinicTheme->clinic()->associate($clinic);
                $clinicTheme->save();
            }

            $templates = \Session::set('templates', []);

//            GenerateController::compress($clinicId);
            app('App\Modules\SiteManager\Controllers\GenerateController')->compress($clinicId);

            return redirect(Admin::route('siteManager.preview', ['id' => $clinicId]));
        }
    }

    //Update clinic info
    public function updateInfo($id, Request $request)
    {
        $input = Input::all();;
        $languages = $request->get('language');

        $rules = array(
            'site-name' => 'required',
            'admin-name' => 'required',
            'email-address' => 'required|email',
            'address' => 'required',
            'telephone' => 'required|numeric',
            'language' => 'required',
        );

        $messages = [
            'site-name.required' => 'The Site Name field is required.',
            'admin-name.required' => 'The Admin Name field is required.',
            'email-address.required' => 'The Email Address field is required.',
            'email-address.email' => 'Please enter a valid email address.',
            'address.required' => 'The Address field is required.',
            'telephone.required' => 'The Telephone field is required.',
            'telephone.numeric' => 'Please enter a valid number.',
            'language.required' => 'The Language field is required.',
        ];

        $validator = Validator::make($input, $rules, $messages);

        if ($validator->fails()) {
            return redirect('admin/site-manager/edit-info/' . $id)
                ->withErrors($validator)
                ->withInput();
        } else {
            $clinic = Clinic::find($id);
            $clinic->domain = $input['domain'];
            $clinic->save();

            $clinic->info->site_name = $input['site-name'];
            $clinic->info->email = $input['email-address'];
            $clinic->info->username = $input['admin-name'];
            $clinic->info->telephone = $input['telephone'];
            $clinic->info->address = $input['address'];
            $clinic->info->save();

            $clinic->database->database_name = $input['database-name'];
            $clinic->database->host = $input['database-host'];
            $clinic->database->username = $input['database-username'];
            $clinic->database->password = $input['database-password'];
            $clinic->database->save();

            $clinic->hosting->host = $input['host'];
            $clinic->hosting->username = $input['host-username'];
            $clinic->hosting->password = $input['host-password'];
            $clinic->hosting->save();

            // edit clinic language table
            foreach ($clinic->language as $lang) {
                $lang->delete();
            }

            foreach ($languages as $langu) {
                $clinicLanguage = new ClinicLanguage();
                $clinicLanguage->language_id = $langu;
                $clinicLanguage->clinic()->associate($clinic);
                $clinicLanguage->save();
            }

            //        return redirect(Admin::route('siteManager.index'));
            return $this->getSiteDetail($id);
        }
    }

    /*
    * Edit clinic site : select template
    * @param : clinic_id
    * Save selected template to session
    * */
    public function updateTemplate($id, $theme_type = 0)
    {
        $query = Input::get("q");

        \Session::set('templatesUpdate', []);

        $clinicThemes = ClinicTheme::where('clinic_id', $id)->get();
        $templates = [];
        foreach ($clinicThemes as $ct) {
            array_push($templates, $ct->theme_id);
        }
        \Session::set('templatesUpdate', $templates);

        if ($theme_type == 0) {
            $templatesUpdate = Template::where('theme_type_id', '<>', 3)
                ->where('is_publish', 1)
                ->where('name', 'like', '%' . $query . '%')
                ->paginate(6);
        } else {
            $templatesUpdate = Template::where('theme_type_id', '<>', 3)
                ->where('is_publish', 1)
                ->where('name', 'like', '%' . $query . '%')
                ->where('theme_type_id', $theme_type)
                ->paginate(6);
        }

        $selected = \Session::get('templatesUpdate', []);

        return view('SiteManager::edit.edit-template',
            [
                'id' => $id,
                'templatesUpdate' => $templatesUpdate,
                'theme_type' => $theme_type,
                'selected' => $selected,
                'query' => $query
            ]
        );
    }

    /*
    * Save clinic template
    * @param : clinic_id
    * Save selected template to table
    * */
    public function saveTemplate($id)
    {
        $clinic = Clinic::find($id);
        $templatesUpdate = \Session::get('templatesUpdate', []);

        if (count($templatesUpdate) == 0) {
            Session::flash('message', 'Please select at least 1 template!');
            Session::flash('alert-class', 'alert-danger');
            return redirect('admin/site-manager/update-template/' . $id);
//            return redirect(Admin::route('siteManager.update-template/'.$id));
        } else {
            // edit clinic theme table
            foreach ($clinic->theme as $theme) {
                $theme->delete();
            }

            foreach ($templatesUpdate as $temp) {
                $clinicTheme = new ClinicTheme();
                $clinicTheme->theme_id = $temp;
                $clinicTheme->clinic()->associate($clinic);
                $clinicTheme->save();
            }
            $templatesUpdate = \Session::set('templatesUpdate', []);
            return redirect(Admin::route('siteManager.edit-info', ['id' => $id]));
        }
    }

    /*
     * Push template to session
     * When sanmax admin check or uncheck session
     * */
    public function toggleTemplateSession($id)
    {
        $templates = \Session::get('templates', []);

        if (($key = array_search($id, $templates)) !== false) {
            unset($templates[$key]);
        } else {
            $templates[] = $id;
        }

        \Session::set('templates', $templates);
        \Session::save();
        $templates = \Session::get('templates', []);
    }

    /*
    * Push templatesUpdate to session
    * When sanmax admin check or uncheck session
    * */
    public function toggleUpdateTemplateSession($id)
    {
        $templatesUpdate = \Session::get('templatesUpdate', []);

        if (($key = array_search($id, $templatesUpdate)) !== false) {
            unset($templatesUpdate[$key]);
        } else {
            $templatesUpdate[] = $id;
        }

        \Session::set('templatesUpdate', $templatesUpdate);
        \Session::save();
        $templatesUpdate = \Session::get('templatesUpdate', []);
    }

    /*
     * Destroy site info
     * */
    public function destroyInfo($clinicID, Request $request)
    {
        // delete clinic
        Clinic::destroy($clinicID);
        $request->session()->flash('response', [
            'success' => true,
            'message' => array("This site is deleted successfully.")
        ]);

        //  return redirect(Admin::StrURL("site-manager/list"));
    }

    /*
     * Download template
     * */
    public function download($filename = null)
    {
        $file_path = public_path() . '/generate/destination/' . $filename;
        if (file_exists($file_path)) {
            return response()->download($file_path);
        } else {
            // Error
            exit('Requested file does not exist on our server!');
        }
    }

    /*
     * Deploy site to server
     *
     * */
    public function deploy($siteId){
        $response = app('App\Modules\SiteManager\Controllers\GenerateController')->deploy($siteId);
        return response()->json($response, 200); die();
    }

    /*
     * PHP check different hosting
     * return true : same hosting
     * return false : different hosting
     * */
    public function checkHosting($siteId){
        return true;
    }

}