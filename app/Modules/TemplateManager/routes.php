<?php
Route::group([
    'prefix' => $this->admin,
    'middleware' => ['web', 'admin'],
    'namespace' => 'App\Modules\TemplateManager\Controllers'],
    function () {
        Route::get('templateManager', ['as' => $this->admin . '.templateManager.index', 'uses' => 'TemplateController@index']);
        Route::get('templateManager/list-create', ['as' => $this->admin . '.templateManager.list-create', 'uses' => 'TemplateController@listCreate']);
        Route::get('templateManager/install', ['as' => $this->admin . '.templateManager.install', 'uses' => 'TemplateController@install']);
        Route::get('templateManager/create/{id}', ['as' => $this->admin . '.templateManager.create', 'uses' => 'TemplateController@create']);
        Route::post('templateManager/store', ['as' => $this->admin . '.templateManager.store', 'uses' => 'TemplateController@store']);
        Route::get('templateManager/edit/{id}', ['as' => $this->admin . '.templateManager.edit', 'uses' => 'TemplateController@edit']);
        Route::put('templateManager/update/{id}', ['as' => $this->admin . '.templateManager.update', 'uses' => 'TemplateController@update']);
        Route::delete('templateManager/delete/{id}', ['as' => $this->admin . '.templateManager.delete', 'uses' => 'TemplateController@delete']);
    });