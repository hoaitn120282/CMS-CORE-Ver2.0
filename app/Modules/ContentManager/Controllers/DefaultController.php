<?php

namespace App\Modules\ContentManager\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Modules\SiteManager\Models\Clinic;
use App\Modules\TemplateManager\Models\Template;
use App\Modules\ContentManager\Models\User;
use DB;
use App\Modules\ContentManager\Models\UserMeta;
class DefaultController extends Controller
{
    public function index(){
//    	$post = Articles::where("post_type","post")->count();
//    	$page = Articles::where("post_type","page")->count();
//    	$category = Terms::where("taxonomy","category")->count();
//    	$comment = Comments::where("approved",1)->count();
//    	$themes = Template::where("id", "name")->count();
        $sites = Clinic::count();
        $templates = Template::count();
        $users = User::with(['meta' => function($query) {
            return $query->orderBy('user_meta.created_at', 'desc');
        }])->paginate();
//        dd($users);
//dd($users->toArray());
    	return view("ContentManager::index", compact('sites', 'templates', 'users'));
    }

    //Get log all admin
    public function getAdminLog() {

    }
}
