<?php
Route::group([
    'prefix' => $this->admin,
    'middleware' => ['web', 'admin'],
    'namespace' => 'App\Modules\LanguageManager\Controllers'],
    function () {
        Route::get('language-manager', ['as' => $this->admin . '.languageManager.index', 'uses' => 'LanguageController@index']);
        Route::any('language-manager/create', ['as' => $this->admin . '.languageManager.create', 'uses' => 'LanguageController@create']);
        Route::any('language-manager/edit/{id}', ['as' => $this->admin . '.languageManager.edit', 'uses' => 'LanguageController@edit']);
        Route::any('language-manager/destroy/{id?}', ['as' => $this->admin . '.languageManager.destroy', 'uses' => 'LanguageController@destroy']);
});