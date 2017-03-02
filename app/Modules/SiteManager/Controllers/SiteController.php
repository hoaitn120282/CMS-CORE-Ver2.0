<?php

namespace App\Modules\SiteManager\Controllers;

use App\Http\Controllers\Controller;
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