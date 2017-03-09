<?php

namespace App\Modules\SiteManager\Controllers;

use App\Http\Controllers\Controller;

class GenerateController extends Controller
{
    public function __construct()
    {
    }

    /*
     * Move all file to public/temp
     * */
    public function compress(){
        // create temp folder in public/generate
        if (!file_exists(public_path().'/generate/temp')) {
            mkdir(public_path().'/generate/temp', 0777, true);
        }
    }

    /*
     * Copy all file from $src to $dst
     * */
    public  function recurse_copy($src,$dst) {
        $dir = opendir($src);
        @mkdir($dst);
        while(false !== ( $file = readdir($dir)) ) {
            if (( $file != '.' ) && ( $file != '..' )) {
                if ( is_dir($src . '/' . $file) ) {
                    recurse_copy($src . '/' . $file,$dst . '/' . $file);
                }
                else {
                    copy($src . '/' . $file,$dst . '/' . $file);
                }
            }
        }
        closedir($dir);
    }
}