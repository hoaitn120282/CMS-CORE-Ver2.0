<?php

namespace App\Modules\SiteManager\Models;

use Illuminate\Database\Eloquent\Model;

class ClinicDatabase extends Model
{
    protected $table = 'clinic_database';
    protected $primaryKey = 'clinic_database_id';
    public $timestamps = false;
    protected $fillable = array('clinic_id', 'host', 'port', 'database_name', 'username', 'password', 'table_prefix');
}