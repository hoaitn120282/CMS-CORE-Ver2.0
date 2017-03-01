<?php
Route::group([
    'prefix' => $this->admin,
    'middleware' => ['web', 'admin'],
    'namespace' => 'App\Modules\SiteManager\Controllers'],
    function () {
        Route::get('site-manager', ['as' => $this->admin . '.siteManager.index', 'uses' => 'SiteController@index']);
        Route::get('site-detail/{id}', ['as' => $this->admin . '.siteManager.preview', 'uses' => 'SiteController@getSiteDetail']);
});