<?php
Route::group(['middleware' => ['web']], function () {
	Route::post($this->admin,['as' => $this->admin.'.login', 'uses' => 'App\Modules\ContentManager\Controllers\AuthController@login']);
	Route::get($this->admin,['as' => $this->admin.'.showlogin', 'uses' => 'App\Modules\ContentManager\Controllers\AuthController@showLoginForm']);
    Route::get('/password',['as' => $this->admin.'.password', 'uses' => 'App\Modules\ContentManager\Controllers\PasswordController@showLinkRequestForm']);
    Route::get('/password/reset/{token?}',['as' => $this->admin.'.password.reset', 'uses' => 'App\Modules\ContentManager\Controllers\PasswordController@showResetForm']);
    Route::post('/password/reset/',['as' => $this->admin.'.password.reset', 'uses' => 'App\Modules\ContentManager\Controllers\PasswordController@reset']);
    Route::get('/blog', 'App\Modules\ContentManager\Controllers\PostController@blog');
    Route::post('/{slug?}/addcomment', 'App\Modules\ContentManager\Controllers\PostController@addcomment');

});

Route::group(['prefix' => $this->admin, 'middleware' => ['web', 'admin'], 'namespace' => 'App\Modules\ContentManager\Controllers'], function () {
    Route::get('logout', ['as' => $this->admin . '.logout', 'uses' => 'AuthController@logout']);
    Route::get('forgot-password',['as' => $this->admin.'.forgot-password', 'uses' => 'PasswordController@getForgotPassword']);
	Route::post('change-password', ['as' => $this->admin.'.change-password', 'uses' => 'PasswordController@changePassword']);

    Route::get('contentManager/index', ['as' => $this->admin . '.contentManager.index', 'uses' => 'DefaultController@index']);
    Route::get('contentManager/imageTiny', ['as' => $this->admin . '.contentManager.imageTiny', 'uses' => 'DefaultController@imageTiny']);
    Route::get('contentManager/post/tagsJson', ['as' => $this->admin . '.contentManager.post.tags', 'uses' => 'PostController@tagsJson']);

    //-----Media Manager------
    Route::get('contentManager/media', ['as' => $this->admin . '.contentManager.media', 'uses' => 'MediaController@index']);
    Route::post('contentManager/media/store', ['as' => $this->admin . '.contentManager.media.store', 'uses' => 'MediaController@store']);
    Route::get('contentManager/media/images', ['as' => $this->admin . '.contentManager.media.images', 'uses' => 'MediaController@images']);
    Route::delete('contentManager/media/delete/{id?}', ['as' => $this->admin . '.contentManager.media.destroy', 'uses' => 'MediaController@destroy']);
    Route::get('contentManager/theme/install', ['as' => $this->admin . '.contentManager.theme.install', 'uses' => 'ThemeController@install']);

    //-----Theme Manager------
    Route::get('contentManager/theme', ['as' => $this->admin . '.contentManager.theme', 'uses' => 'ThemeController@index']);
    Route::get('contentManager/theme/{id?}', ['as' => $this->admin . '.contentManager.theme.view', 'uses' => 'ThemeController@view']);
    Route::get('contentManager/theme/{id?}/active', ['as' => $this->admin . '.contentManager.theme.active', 'uses' => 'ThemeController@active']);
    Route::post('contentManager/theme', ['as' => $this->admin . '.contentManager.theme.update', 'uses' => 'ThemeController@update']);
    Route::get('contentManager/theme/install', ['as' => $this->admin . '.contentManager.theme.install', 'uses' => 'ThemeController@install']);
    Route::post('contentManager/theme/install', ['as' => $this->admin . '.contentManager.theme.install', 'uses' => 'ThemeController@installed']);
    Route::delete('contentManager/theme/{id}', ['as' => $this->admin . '.contentManager.theme.uninstall', 'uses' => 'ThemeController@uninstall']);

    //-----Setting-----
    Route::get('contentManager/setting', ['as' => $this->admin . '.contentManager.setting', 'uses' => 'OptionsController@index']);
    Route::post('contentManager/setting', ['as' => $this->admin . '.contentManager.setting.update', 'uses' => 'OptionsController@update']);

    //-----widget Manager------
    Route::get('contentManager/widget', ['as' => $this->admin . '.contentManager.widget', 'uses' => 'WidgetController@index']);
    Route::post('contentManager/widget', ['as' => $this->admin . '.contentManager.widget.store', 'uses' => 'WidgetController@store']);
    Route::post('contentManager/widget/reorder', ['as' => $this->admin . '.contentManager.widget.reorder', 'uses' => 'WidgetController@reorder']);
    Route::post('contentManager/widget/add', ['as' => $this->admin . '.contentManager.widget.addWidget', 'uses' => 'WidgetController@addWidget']);
    Route::delete('contentManager/widget/delete/{id?}', ['as' => $this->admin . '.contentManager.widget.destroy', 'uses' => 'WidgetController@destroy']);

    //-----post,page,category,tag,user------
    Route::resource('contentManager/post', 'PostController', ['except' => ['show']]);
    Route::resource('contentManager/page', 'PageController', ['except' => ['show']]);
    Route::resource('contentManager/category', 'CategoryController', ['except' => ['show']]);
    Route::resource('contentManager/tag', 'TagController', ['except' => ['show']]);
    Route::resource('contentManager/doctor', 'DoctorController', ['except' => ['show']]);
    Route::resource('contentManager/user', 'UsersController');

    //----comment --------
    Route::get('contentManager/comment', ['as' => $this->admin . '.contentManager.comment', 'uses' => 'CommentsController@index']);
    Route::get('contentManager/comment/{comment?}', ['as' => $this->admin . '.contentManager.comment.approve', 'uses' => 'CommentsController@approve']);
    Route::delete('contentManager/comment/delete/{id?}', ['as' => $this->admin . '.contentManager.comment.destroy', 'uses' => 'CommentsController@destroy']);

    //---menu---
    Route::get('contentManager/menu/{name?}', ['as' => $this->admin . '.contentManager.menu.index', 'uses' => 'MenuController@index']);
    Route::post('contentManager/menu/addgroup', ['as' => $this->admin . '.contentManager.menu.addgroup', 'uses' => 'MenuController@addGroupMenu']);
    Route::post('contentManager/menu/update', ['as' => $this->admin . '.contentManager.menu.update', 'uses' => 'MenuController@update']);
    Route::post('contentManager/menu/insert', ['as' => $this->admin . '.contentManager.menu.store', 'uses' => 'MenuController@store']);
    Route::post('contentManager/menu/insertmulti', ['as' => $this->admin . '.contentManager.menu.storemulti', 'uses' => 'MenuController@storemulti']);
    Route::delete('contentManager/menu/delete/{id?}', ['as' => $this->admin . '.contentManager.menu.destroy', 'uses' => 'MenuController@destroy']);
    Route::delete('contentManager/menu/destroy/{name?}', ['as' => $this->admin . '.contentManager.menu.destroygroup', 'uses' => 'MenuController@deleteGroup']);

    Route::get('contentManager/userLog/{id}/{userName}', ['as' => $this->admin . '.contentManager.user.log', 'uses' => 'UsersController@getUserLog']);
});
