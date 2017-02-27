<?php

namespace App\Modules\TemplateManager\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Support\Collection;
use Illuminate\Http\Request;
use Validator;
use DB;
use App\Facades\Admin;
use App\Facades\Theme;
use App\Modules\TemplateManager\Models\Template;
use App\Modules\ContentManager\Models\Themes;
use League\Flysystem\Exception;
use Leafo\ScssPhp\Compiler;
use File;
use View;

class TemplateController extends Controller
{
    /**
     * Show list of templates library.
     *
     * @return Response
     */
    public function index($theme_type = 0)
    {
        if ($theme_type == 0) {
            $nodes = Template::get();
        } else {
            $nodes = Template::where('theme_type_id', $theme_type)->get();
        }
        return view('TemplateManager::index', ['nodes' => $nodes, 'theme_type' => $theme_type]);
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
        $nodes = Themes::orderBy('status', 'desc')->where('parent_id', 0)->get();
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
        $themeId = $request->get('theme_id');
        $input = $request->all();
        // validate
        $validator = Validator::make($input, [
            'name' => 'required|unique:themes|max:255',
        ]);
        if ($validator->fails()) {
            $request->session()->flash('response', [
                'success' => false,
                'message' => $validator->errors()->all()
            ]);

            return redirect(Admin::route('templateManager.create', ['id' => $themeId]));
        }

        $oldTemp = Template::find($themeId);
        $tempData = ($oldTemp instanceof Collection) ? clone $oldTemp : clone new Collection($oldTemp);
        $input['name'] = $tempData['name'] . '_' . $input['name'];
        $input['status'] = 0;
        $input['parent_id'] = ($tempData['parent_id'] == 0) ? $tempData['id'] : $tempData['parent_id'];
        $input = array_merge($tempData->toArray(), $input);
        $newTemp = $this->storeData($input, $oldTemp);
        $resGen = $this->generateCssFile($newTemp);
        $response = array(
            'success' => true,
            'message' => ['Template has been cloned successfully.']
        );
        if (!$resGen['success']) {
            $response['success'] = false;
            $response['message'] = (array)$response['errors'];
        }
        $request->session()->flash('response', $response);

        return redirect(Admin::route('templateManager.index'));
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
        $input = $request->get('meta');
        $temp = Template::find($id);
        $metaOpt = $this->storeMetaOptions($temp, $input);
        $genCss = $this->generateCssFile($temp);

        if (!$metaOpt['success'] || !$genCss['success']) {
            $request->session()->flash('response', [
                'success' => false,
                'message' => array_merge(isset($metaOpt['errors']) ? (array)$metaOpt['errors'] : [], isset($genCss['errors']) ? (array)$genCss['errors'] : [])
            ]);
        } else {
            $request->session()->flash('response', [
                'success' => true,
                'message' => array("{$temp->name} has been updated successfully.")
            ]);
        }


        return redirect(Admin::route('templateManager.index'));
    }

    /**
     * Publish theme
     * @param int $id
     */
    public function publish($id, Request $request)
    {
        $template = Template::find($id);
        $template->is_publish = !$template->is_publish;
        $strPublish = ($template->is_publish == 1 ? 'published' : 'drafted');
        $response = array(
            'success' => true,
            'message' => array("{$template->name} has been {$strPublish} successfully.")
        );
        if (!$template->save()) {
            $response['success'] = false;
            $response['message'] = array("{$template->name} has been {$strPublish} failure.");
        }

        $request->session()->flash('response', $response);
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
     * Store data of template
     *
     * @param array $input
     * @param boolean $isCreate
     * @return Template $template
     */
    private function storeData($input, $oldTemp = null, $id = null)
    {
        $template = null;
        $primaryInput = array_except($input, ['meta']);
        $metaInput = $input['meta'];
        if (empty($id)) {
            $template = Template::create($primaryInput);
        } else {
            $template = Template::find($id);
            $template->update($primaryInput);
        }

        if ($template instanceof Template) {
            $this->storeMeta($template, $metaInput, $oldTemp);
        }


        return empty($template) ? new Collection() : $template;
    }

    private function storeMeta($template, $input, $beforeTemp = null)
    {
        if (!$template instanceof Template) {
            throw new \Exception('First param could not is instanceof Template');
        }

        try {
            $resOps = $this->storeMetaNotOptions($template, $input, $beforeTemp);
            $resNOps = $this->storeMetaOptions($template, $input, $beforeTemp);

            if (!$resOps['success'] || !$resNOps['success']) {
                throw new Exception('Has error when store meta data.');
            }
            return array(
                'success' => true,
                'message' => 'Done',
            );

        } catch (\Exception $exception) {
            return array(
                'success' => false,
                'message' => 'Done',
                'errors' => $exception->getMessage()
            );
        }
    }

    /**
     * Store meta data not must options of template
     *
     * @param Template $template
     * @param array $input
     * @param Template $beforTemp
     */
    private function storeMetaNotOptions($template, $input, $beforeTemp = null)
    {
        if (!$template instanceof Template) {
            throw new \Exception('First param could not is instanceof Template');
        }

        try {
            $cloneTemp = ($beforeTemp instanceof Template) ? $beforeTemp : $template;
            $beforeMeta = $cloneTemp->meta()
                ->where('meta_group', '<>', 'options')
                ->get();
            foreach ($beforeMeta as $meta) {
                if ($beforeTemp instanceof Template) {
                    $metaData = array(
                        'meta_group' => $meta->meta_group,
                        'meta_key' => $meta->meta_key,
                        'meta_value' => $meta->meta_value,
                    );
                    $template->meta()
                        ->create($metaData);
                } else {
                    $template->meta()
                        ->where('meta_group', $meta->meta_group)
                        ->where('meta_key', $meta->meta_key)
                        ->update([
                            'meta_value' => $input[$meta->meta_group][$meta->meta_key]
                        ]);
                }
            }

        } catch (\Exception $exception) {
            return array(
                'success' => false,
                'message' => 'Done',
                'errors' => $exception->getMessage()
            );
        }
    }

    /**
     * Store meta data options of template
     *
     * @param Template $template
     * @param array $input
     * @param boolean $isCreate
     */
    private function storeMetaOptions($template, $input, $beforeTemp = null)
    {
        if (!$template instanceof Template) {
            throw new \Exception('First param could not is instanceof Template');
        }

        try {
            $cloneTemp = ($beforeTemp instanceof Template) ? $beforeTemp : $template;
            $beforeMeta = $cloneTemp->meta()
                ->where('meta_group', 'options')
                ->get();
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
                if ($beforeTemp instanceof Template) {
                    $metaData = array(
                        'meta_group' => 'options',
                        'meta_key' => $value->meta_key,
                        'meta_value' => serialize($meta)
                    );

                    $template->meta()
                        ->create($metaData);
                } else {
                    $template->meta()
                        ->where('meta_key', $value->meta_key)
                        ->update(['meta_value' => serialize($meta)]);
                }
            }

            return array(
                'success' => true,
                'message' => 'Done',
            );
        } catch (\Exception $exception) {
            return array(
                'success' => false,
                'message' => 'Done',
                'errors' => $exception->getMessage()
            );
        }

    }

    /**
     * Generate typography css file for template
     *
     * @param Template $template
     * @return array $response
     */
    private function generateCssFile($template)
    {
        try {
            if (!$template instanceof Template) {
                throw new \Exception('First param could not instanceof Template');
            }

            $css = array();
            $file = $template->name . '.css';
            $folder = empty($template->parent) ? $template->name : $template->parent->name;
            $path_theme = public_path("themes/{$folder}");
            $path_css = public_path("themes/{$folder}/css");
            $path_file = public_path("themes/{$folder}/css/{$file}");

            $typography = $template->meta()
                ->optionsKey('typography')
                ->first();
            if ($typography) {
                $typo_vals = $typography->getValue();
                foreach ($typo_vals as $typo) {
                    if (!empty($typo['items'])) {
                        foreach ($typo['items'] as $item) {
                            if (!empty($item['value'])) {
                                $css[str_slug($typo['name'] . "_" . $item['name'], '_')] = $item['value'];
                            }
                        }
                    }
                }
            }

            $string_sass = View::make("themes.{$folder}.typography", compact('css'))->render();
            $scss_compiler = new Compiler();
            $string_css = $scss_compiler->compile($string_sass);
            if (!File::isDirectory($path_css)) {
                File::makeDirectory($path_css, 0755, true);
            }
            File::put($path_file, $string_css);

            return array(
                'success' => true,
                'message' => 'Done',
                'data' => array(
                    'path' => $path_file
                )
            );
        } catch (\Exception $exception) {
            return array(
                'success' => false,
                'message' => 'Done',
                'errors' => $exception->getMessage()
            );
        }
    }

    /* Uninstall theme
    *
    * @param Request $request
    * @param string $themeName
    * @response mixed
    */
    public function uninstall(Request $request, $themeName)
    {
        try {
            // Could not uninstall if theme has parent id = 0
            $template = Template::where('name', $themeName)->first();
            if (0 == $template->parent_id) {
                throw new \Exception('Could not deleted this templatev because it is installed.');
            }

            Theme::uninstall($themeName);

            if (Theme::error()) {
                $errors = implode(Theme::getErrors(), ", ");
                throw new \Exception($errors);
            }

            $request->session()->flash('response', [
                'success' => true,
                'message' => array("Theme {$themeName} has been deleted successfully.")
            ]);
        } catch (\Exception $exception) {
            $messages = $exception->getMessage();
            $request->session()->flash('response', [
                'success' => false,
                'message' => is_array($messages) ? $messages : array($messages)
            ]);
        }

        redirect(Admin::route('templateManager.index'));
    }
}