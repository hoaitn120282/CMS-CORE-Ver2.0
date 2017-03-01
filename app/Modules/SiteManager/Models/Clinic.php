<?php

namespace App\Modules\SiteManager\Models;

use Illuminate\Database\Eloquent\Model;

class Clinic extends Model
{
    protected $table = 'clinic';
    protected $primaryKey = 'clinic_id';
    public $timestamps = false;
    protected $fillable = array('domain', 'is_sanmax_hosting', 'contact_info', 'description');

    /*
     *  relationship with hosting
     * */
    public function hosting()
    {
        return $this->hasOne('App\Modules\SiteManager\Models\ClinicHosting','clinic_id');
    }
    /*
     *  relationship with database
     * */
    public function database()
    {
        return $this->hasOne('App\Modules\SiteManager\Models\ClinicDatabase','clinic_id');
    }

    /*
     *  relationship with info
     * */
    public function info()
    {
        return $this->hasOne('App\Modules\SiteManager\Models\ClinicInfo','clinic_id');
    }

    /*
     *  relationship with language
     * */
    public function language()
    {
        return $this->hasMany('App\Modules\SiteManager\Models\ClinicInfo','clinic_id', 'clinic_id');
    }

    /*
     *  relationship with theme
     * */
    public function theme()
    {
        return $this->hasMany('App\Modules\SiteManager\Models\ClinicTheme','clinic_id', 'clinic_id');
    }
}