<?php

namespace App\Modules\SiteManager\Models;

use Illuminate\Database\Eloquent\Model;

class ClinicTheme extends Model
{
    protected $table = 'clinic_theme';
    protected $primaryKey = 'clinic_theme_id';
    public $timestamps = false;
    protected $fillable = array('clinic_id', 'theme_id');
}