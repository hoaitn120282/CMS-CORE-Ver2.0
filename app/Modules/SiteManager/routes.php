<?php
Route::group([
    'prefix' => $this->admin,
    'middleware' => ['web', 'admin'],
    'namespace' => 'App\Modules\SiteManager\Controllers'],
    function () {
        Route::get('site-manager', ['as' => $this->admin . '.siteManager.index', 'uses' => 'SiteController@index']);

        Route::get('site-detail/{id}', ['as' => $this->admin . '.siteManager.preview', 'uses' => 'SiteController@getSiteDetail']);

        Route::get('site-manager/select-template', ['as' => $this->admin . '.siteManager.select-template', 'uses' => 'SiteController@selectTemplate']);
        Route::any('site-manager/add-info', ['as' => $this->admin . '.siteManager.add-info', 'uses' => 'SiteController@addInfo']);
        Route::post('site-manager/create-info', ['as' => $this->admin . '.siteManager.create-info', 'uses' => 'SiteController@createInfo']);

});