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
        return view('LanguageManager::language.index', ['model' => $model]);
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

        return view('LanguageManager::language.create', ['countries'=>$countries]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $tmp = explode(",", $id);
        if(is_array($tmp)){
            Language::destroy($tmp);
        }else{
            Language::destroy($id);
        }
        Admin::userLog(\Auth::guard('admin')->user()->id,'Delete language id :'.$id);
    }

    /*
     * Edit Language
     * */
    public function edit($id, Request $request){

        $current_language = Language::find($id);

        $languages = Language::all();
        $language_selected = array();

        foreach ($languages as $lang) {
            if($lang->country_id != $current_language->country_id){
                array_push($language_selected, $lang->country_id);
            }
        }

        $countries = Countries::whereNotIn('country_id', $language_selected)->get();

        if($request->isMethod('post')){

            $this->validate($request, [
                'name' => 'required',
            ]);

            $data = $request->all();
            $current_language->country_id = $data['countries'];
            $current_language->name = $data['name'];
            $current_language->update();
            return redirect(Admin::StrURL('language-manager'));
        }

        return view('LanguageManager::language.edit', ['countries' => $countries, 'current_language' => $current_language]);
    }

}