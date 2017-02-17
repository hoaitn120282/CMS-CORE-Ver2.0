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
     * @return Response
     */
    public function create($id, Request $request)
    {
        $model = new Collection();
        return view('TemplateManager::form', compact('model'));
    }
}