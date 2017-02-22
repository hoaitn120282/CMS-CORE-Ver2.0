<?php

namespace App\Modules\TemplateManager\Models;

use Illuminate\Database\Eloquent\Model;

class Template extends Model
{
    protected $table = 'themes';
    protected $primaryKey = 'id';
    public $timestamps = false;
    protected $fillable = array('parent_id', 'theme_type_id', 'name', 'version', 'author', 'author_url', 'description', 'image_preview', 'status', 'is_publish');

    /**
     * Relationship one - many ThemeMeta
     */
    public function meta()
    {
        return $this->hasMany('App\Modules\TemplateManager\Models\TemplateMeta', 'theme_id');
    }

    /**
     * Get meta options where meta_group
     *
     * @return mixed
     */
    public function metaOptions()
    {
        return $this->meta()->where("meta_group", "options")->get();
    }
}
