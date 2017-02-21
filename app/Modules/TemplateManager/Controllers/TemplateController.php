<?php

namespace App\Modules\TemplateManager\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;
use DB;
use App\Facades\Admin;
use App\Facades\Theme;
use App\Modules\TemplateManager\Models\Template;
use App\Modules\ContentManager\Models\Themes;

class TemplateController extends Controller
{
    /**
     * Show list of templates library.
     *
     * @return Response
     */
    public function index()
    {
        $nodes = Template::get();

        return view('TemplateManager::index', compact('nodes'));
    }

    /*
     * View list to create new template
     * @param null
     * @return
     * */
    public function listCreate(){
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

        return view('TemplateManager::form', compact('node'));
    }

    /**
     * Form install template
     *
     * @return view
     */
    public function install()
    {
        $nodes = Themes::orderBy('status', 'desc')
            ->get();

        return view('TemplateManager::install', ['nodes' => $nodes]);
    }

    /**
     * Store new template to database
     *
     * @param int $id
     * @return Response
     */
    public function store($id, Request $request)
    {

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

        return view('TemplateManager::form', compact('node'));
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

}