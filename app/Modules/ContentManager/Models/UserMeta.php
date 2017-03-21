<?php

namespace App\Modules\ContentManager\Models;

use Illuminate\Database\Eloquent\Model;

class UserMeta extends Model
{
    protected $table = 'user_meta';
    protected $primaryKey = 'meta_id';
    public $timestamps = true;

    public $fillable = ['meta_key', 'meta_value', 'created_at', 'updated_at'];
}
