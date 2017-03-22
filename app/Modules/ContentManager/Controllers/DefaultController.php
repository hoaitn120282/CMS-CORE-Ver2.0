<?php

namespace App\Modules\ContentManager\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Modules\SiteManager\Models\Clinic;
use App\Modules\TemplateManager\Models\Template;
use App\Modules\ContentManager\Models\User;
use DB;
use Illuminate\Support\Facades\Input;
use App\Modules\ContentManager\Models\UserMeta;
class DefaultController extends Controller
{
    public function index(Request $request){
//    	$post = Articles::where("post_type","post")->count();
//    	$page = Articles::where("post_type","page")->count();
//    	$category = Terms::where("taxonomy","category")->count();
//    	$comment = Comments::where("approved",1)->count();
//    	$themes = Template::where("id", "name")->count();
//        $q = Input::get("q");
        $q= Input::get("q");
        $sites = Clinic::count();
        $templates = Template::count();

        $filters = [];

        if (isset($q)){
            $filters[] = [
                'property' => 'name',
                'operator' => 'like',
                'value' => $q
            ];
        }

        $users = User::applyFilter($filters)
            ->with('meta')
            ->paginate(10);

    	return view("ContentManager::index", compact('sites', 'templates', 'users', 'q'));
    }
}
