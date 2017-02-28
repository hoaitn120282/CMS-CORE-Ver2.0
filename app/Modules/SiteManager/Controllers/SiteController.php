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
use League\Flysystem\Exception;
use Leafo\ScssPhp\Compiler;
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
        $sites = Template::get();
        return view('SiteManager::index', ['nodes' => $sites]);
    }
}