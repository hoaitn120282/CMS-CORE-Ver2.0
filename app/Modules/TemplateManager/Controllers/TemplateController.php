<?php

namespace App\Modules\TemplateManager\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;
use DB;
use App\Facades\Admin;
use App\Facades\Theme;
use App\Modules\TemplateManager\Models\Template;
use App\Modules\TemplateManager\Models\TemplateMeta;
use App\Modules\ContentManager\Models\Themes;

class TemplateController extends Controller
{
    /**
     * Show list of templates library.
     *
     * @return Response
     */
    public function index($theme_type = 0)
    {
        if($theme_type == 0){
            $nodes = Template::get();
        }else{
            $nodes = Template::where('theme_type_id',$theme_type)->get();
        }
        return view('TemplateManager::index', ['nodes'=>$nodes,'theme_type'=>$theme_type]);
    }

    /*
     * View list to create new template
     * @param null
     * @return
     * */
    public function listCreate()
    {
        $nodes = Template::get();
        return view('TemplateManager::list-create', compact('nodes'));
    }

    /**
     * Create new template from existing templates.
     *
     * @param int $id
     * @return Response
     */
    public function create($id)
    {
        $node = Template::find($id);
        if (empty($node)) {
            return redirect(Admin::route('templateManager.index'));
        }

        return view('TemplateManager::form', compact('node'));
    }

    /**
     * Form install template
     *
     * @return view
     */
    public function install()
    {
        $nodes = Themes::orderBy('status', 'desc')->where('parent_id',0)->get();
        return view('TemplateManager::install', ['nodes' => $nodes]);
    }
    /**
     * Process install theme
     *
     * @param Request $request
     * @return Illuminate\Response redirect
     */
    public function installed(Request $request)
    {
        try {
            if (!$request->hasFile('theme_zip')) {
                throw new \Exception('Theme not exists.');
            }

            $themeZip = $request->file('theme_zip');
            if (!$themeZip->isValid()) {
                throw new \Exception('Theme is valid.');
            }

            $clientMimeType = $themeZip->getClientMimeType();
            $extension = $themeZip->extension();
            if ((!in_array($clientMimeType, ["application/x-zip-compressed", "application/octet-stream"]))
                || ('zip' != $extension)
            ) {
                throw new \Exception('You must install theme in a .zip format');
            }

            $clientOriginalName = $themeZip->getClientOriginalName();
            $themeName = explode(".{$extension}", $clientOriginalName)[0];
            $countTheme = Themes::where('name', $themeName)->count();
            if ($countTheme > 0) {
                throw new \Exception("Theme {$themeName} is exists. Please choose other theme.");
            }
            $themeZip->move(app_path('Themes/upload'), $clientOriginalName);

            Theme::install($themeName);
            if (Theme::error()) {
                $errors = implode(Theme::getErrors(), ", ");
                throw new \Exception($errors);
            }

            $request->session()->flash('response', [
                'success' => true,
                'message' => array("Theme {$themeName} is install successfully.")
            ]);
        } catch (\Exception $exception) {
            $messages = $exception->getMessage();
            $request->session()->flash('response', [
                'success' => false,
                'message' => is_array($messages) ? $messages : array($messages)
            ]);
        }

        return redirect(Admin::route('templateManager.index'));
    }
    /**
     * Store new template to database
     *
     * @param int $id
     * @return Response
     */
    public function store(Request $request)
    {
        $input = $request->all();
        $themeId = $request->get('theme_id');
        $this->storeData($themeId, $input);
        return redirect(Admin::route('templateManager.create', ['id' => $themeId]));
    }

    /**
     * Edit the template.
     *
     * @param int $id
     * @return Response
     */
    public function edit($id)
    {
        $node = Template::find($id);
        $isEdit = true;
        if (empty($node)) {
            return redirect(Admin::route('templateManager.index'));
        }

        return view('TemplateManager::form', compact('node', 'isEdit'));
    }

    /**
     * Update the template to database
     *
     * @param int $id
     * @param Request
     * @return Response
     */
    public function update($id, Request $request)
    {

    }

    /**
     * Delete the template
     *
     * @param int $id
     */
    public function delete($id)
    {

    }

    /**
     * Store data
     */
    protected function storeData($id, $input)
    {
        $beforeMeta = TemplateMeta::where('theme_id', $id)->where('meta_group', 'options')->get();

        foreach ($beforeMeta as $value) {
            $meta = unserialize($value->meta_value);
            foreach ($meta as &$val) {
                if (isset($input[$value->meta_key][$val['name']])) {
                    if (isset($val['value'])) {
                        $val['value'] = $input[$value->meta_key][$val['name']];
                    }

                    if (isset($val['items']) && is_array($val['items'])) {
                        foreach ($val['items'] as &$item) {
                            if (isset($item['value'])) {
                                $item['value'] = $input[$value->meta_key][$val['name']][$item['name']];
                            }
                        }
                    }
                }
            }
            TemplateMeta::where('theme_id', $id)->where('meta_key', $value->meta_key)->update(['meta_value' => serialize($meta)]);
        }
    }

}