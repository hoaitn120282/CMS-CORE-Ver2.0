<?php
Route::group([
    'prefix' => $this->admin,
    'middleware' => ['web', 'admin'],
    'namespace' => 'App\Modules\SiteManager\Controllers'],
    function () {
        Route::get('site-manager/list/{theme_type_id?}/{status?}', ['as' => $this->admin . '.siteManager.index', 'uses' => 'SiteController@index']);

        Route::get('site-detail/{id}', ['as' => $this->admin . '.siteManager.preview', 'uses' => 'SiteController@getSiteDetail']);
        Route::get('site-manager/edit-info/{id}', ['as' => $this->admin . '.siteManager.edit-info', 'uses' => 'SiteController@editInfo']);
        Route::post('site-manager/edit-info/{id}', ['as' => $this->admin . '.siteManager.edit-info', 'uses' => 'SiteController@updateInfo']);

        Route::get('site-manager/select-template/{theme_type?}', ['as' => $this->admin . '.siteManager.select-template', 'uses' => 'SiteController@selectTemplate'])->where('theme_type', '[0-9]+');
        Route::any('site-manager/add-info', ['as' => $this->admin . '.siteManager.add-info', 'uses' => 'SiteController@addInfo']);
        Route::post('site-manager/create-info', ['as' => $this->admin . '.siteManager.create-info', 'uses' => 'SiteController@createInfo']);

        Route::any('site-manager/template-id/{id?}', ['as' => $this->admin . '.siteManager.template-id', 'uses' => 'SiteController@toggleTemplateSession']);

});