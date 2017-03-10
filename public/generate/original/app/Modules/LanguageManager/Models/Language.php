<?php

namespace App\Modules\LanguageManager\Models;

use Illuminate\Database\Eloquent\Model;

class Language extends Model
{
    protected $table = 'language';
    protected $primaryKey = 'language_id';
    public $timestamps = false;
    protected $fillable = array('country_id', 'name', 'description');

    /*
     *  relationship with country
     * */
    public function country()
    {
        return $this->hasOne('App\Modules\LanguageManager\Models\Countries','country_id','country_id');
    }
}