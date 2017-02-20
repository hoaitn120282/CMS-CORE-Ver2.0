<?php

namespace App\Modules\TemplateManager\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;
use DB;
use App\Facades\Admin;
use App\Facades\Theme;
use App\Modules\TemplateManager\Models\Template;

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

    /**
     * Create new template from existing templates.
     *
     * @param int $id
     * @return Response
     */
    public function create($id)
    {
        $node = Template::with('meta')->find($id);
        // dd($node->toArray());

        return view('TemplateManager::form', compact('node'));
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
        $model = Template::find($id);

        return view('TemplateManager::form', compact('model'));
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