<?php

namespace App\Modules\SiteManager\Models;

use Illuminate\Database\Eloquent\Model;

class ClinicLanguage extends Model
{
    protected $table = 'clinic_language';
    protected $primaryKey = 'clinic_language_id';
    public $timestamps = false;
    protected $fillable = array('language_id', 'clinic_id');
}