<?php

namespace App\Helpers;

use App\Modules\LanguageManager\Models\Translate;
use Carbon\Carbon;
use Illuminate\Support\Facades\App;
use App\Modules\LanguageManager\Models\Language;

class Trans
{
    protected $locale;

    public function __construct()
    {
        $this->locale = App::getLocale();
    }


    /**
     * Get locale
     *
     * @return string
     */
    public function locale()
    {
        return $this->locale;
    }

    /**
     * Set locale
     *
     * @param string $locale
     * @return $this
     */
    public function setLocale($locale = 'en')
    {
        App::setLocale($locale);
        Carbon::setLocale($locale);
        $this->locale = App::getLocale();

        return $this;
    }

    /**
     * Translate interface
     *
     * @param string $key
     * @return string
     */
    public function face($key, $locale = '')
    {
        try {
            $trans = Translate::where('trans_key', $key)->first();
            if ($trans) {
                $faces = unserialize($trans->trans_meta);
                $locale = empty($locale) ? $this->locale() : $locale;
                if (empty($faces[$locale]['trans'])) {
                    throw new \Exception("\"{$key}\" has not translated yet.");
                }
                return $faces[$locale]['trans'];
            }
            throw new \Exception("\"{$key}\" has not translated yet.");
        } catch (\Exception $exception) {
            return "\"{$key}\" has not translated yet.";
        }
    }

    /**
     * Get all languages from DB
     */
    public function languages()
    {
        return Language::where('status', true)->orderBy('language_id', 'desc')->get();
    }
}