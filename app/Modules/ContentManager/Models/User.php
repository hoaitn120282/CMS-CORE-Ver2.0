<?php

namespace App\Modules\ContentManager\Models;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    protected $table = 'users';
    protected $primaryKey = 'id';
    public $timestamps = false;


    public function meta()
    {
        return $this->hasMany('App\Modules\ContentManager\Models\UserMeta', 'user_id', 'id');
    }
}
