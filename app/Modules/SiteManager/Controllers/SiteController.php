<?php

namespace App\Modules\SiteManager\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Collection;
use Illuminate\Http\Request;
use Validator;
use DB;
use App\Facades\Admin;
use App\Facades\Theme;
use App\Modules\TemplateManager\Models\Template;
use App\Modules\ContentManager\Models\Themes;
use App\Modules\SiteManager\Models\Clinic;

use File;
use View;

class SiteController extends Controller
{
    /**
     * Show list of site library.
     *
     * @return Response
     */
    public function index()
    {
        $clinics = Clinic::get();
        return view('SiteManager::index', ['clinics' => $clinics]);
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
    /*
     * Add new clinic site - step 1 : select template
     * @param : null
     * Save selected template to session
     * */
    public function selectTemplate(){
        $theme_type = 1;
        $templates = Template::where('is_publish',1)->paginate(6);
        return view('SiteManager::create.step-1-select-template', ['templates'=> $templates, 'theme_type' => $theme_type]);
    }

    /*
     *  Add new clinic site - step 2: Add info clinic site
     * @param : null
     * */
    public function addInfo(Request $request){
        return view('SiteManager::create.step-2-add-info');
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
        ];

        $validator = Validator::make($input, $rules, $messages);

        if ($validator->fails())
        {
            return redirect('admin/site-manager/add-info')
                ->withErrors($validator)
                ->withInput();
        } else {
            dd($input);
        }

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
            array_push($templates,$id);
        }

        \Session::set('templates', $templates);
        \Session::save();
        $templates = \Session::get('templates',[]);
        dd($templates);

    }

}