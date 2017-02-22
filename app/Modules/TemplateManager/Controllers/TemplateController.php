<?php

namespace App\Modules\TemplateManager\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Support\Collection;
use Illuminate\Http\Request;
use Validator;
use DB;
use App\Facades\Admin;
use App\Modules\TemplateManager\Models\Template;
use App\Modules\ContentManager\Models\Themes;
use League\Flysystem\Exception;

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
        $input['parent_id'] = ($tempData['parent_id'] == 0) ? $tempData['id'] : $tempData['parent_id'];
        $input = array_merge($tempData->toArray(), $input);
        $this->storeData($input, $oldTemp);

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
        $this->storeMetaOptions($temp, $input);

        return redirect(Admin::route('templateManager.index'));
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

}