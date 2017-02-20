<?php

namespace App\Modules\TemplateManager\Models;

use Illuminate\Database\Eloquent\Model;

class TemplateMeta extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'theme_meta';
    public $timestamps = false;

    /**
     * Get meta value
     *
     * @return json
     */
    public function getValue()
    {
        $value = unserialize($this->meta_value);
        return $value;
    }

}
