<?php

namespace App\Modules\LanguageManager\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Support\Collection;
use Illuminate\Http\Request;
use Validator;
use DB;
use App\Facades\Admin;
use App\Facades\Theme;
use App\Modules\LanguageManager\Models\Language;
use App\Modules\LanguageManager\Models\Countries;
use League\Flysystem\Exception;
use Leafo\ScssPhp\Compiler;
use File;
use View;

class LanguageController extends Controller
{
    /**
     * Show list of site library.
     *
     * @return Response
     */
    public function index()
    {
        $model = Language::orderBy('language_id', 'desc')->paginate(10);
        return view('LanguageManager::index', ['model' => $model]);
    }

    /*
     * Create new Language
     * */
    public function create(Request $request){

        $languages = Language::all();
        $language_selected = array();
        foreach ($languages as $lang) {
            array_push($language_selected, $lang->country_id);
        }

        $countries = Countries::whereNotIn('country_id', $language_selected)->get();

        if($request->isMethod('post')){

            $this->validate($request, [
                'name' => 'required',
            ]);

            $data = $request->all();
            $language = new Language();
            $language->country_id = $data['countries'];
            $language->name = $data['name'];
            $language->save();
            return redirect(Admin::StrURL('language-manager'));
        }

        return view('LanguageManager::create', ['countries'=>$countries]);
    }

}