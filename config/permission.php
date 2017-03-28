<?php
return array(
    'administrator' => [
        // Dashboard
        'Dashboard' => [
            'DefaultController@index' => 'Dashboard'
        ],
        // Content manager
        'Page' => [
            'PageController@index' => "List",
            'PageController@create' => "Create",
            'PageController@store' => "Store",
            'PageController@edit' => "Edit",
            'PageController@update' => "Update",
            'PageController@destroy' => "Destroy"
        ],
        'Post' => [
            'PostController@index' => "List",
            'PostController@create' => "Create",
            'PostController@store' => "Store",
            'PostController@edit' => "Edit",
            'PostController@update' => "Update",
            'PostController@destroy' => "Destroy"
        ],
        'Category' => [
            'CategoryController@index' => "List",
            'CategoryController@create' => "Create",
            'CategoryController@store' => "Store",
            'CategoryController@edit' => "Edit",
            'CategoryController@update' => "Update",
            'CategoryController@destroy' => "Destroy"
        ],
        'Tag' => [
            'TagController@index' => "List",
            'TagController@create' => "Create",
            'TagController@store' => "Store",
            'TagController@edit' => "Edit",
            'TagController@update' => "Update",
            'TagController@destroy' => "Destroy"
        ],
        'Doctor' => [
            'DoctorController@index' => "List",
            'DoctorController@create' => "Create",
            'DoctorController@store' => "Store",
            'DoctorController@edit' => "Edit",
            'DoctorController@update' => "Update",
            'DoctorController@destroy' => "Destroy"
        ],
        // Menu manager
        'Menu' => [
            'MenuController@index' => "List",
            'MenuController@create' => "Create",
            'MenuController@store' => "Store",
            'MenuController@edit' => "Edit",
            'MenuController@update' => "Update",
            'MenuController@destroy' => "Delete",
            'MenuController@storemulti' => "Store multiple",
            'MenuController@addGroupMenu' => "Add group",
            'MenuController@deleteGroup' => "Delete group"
        ],
        // Media manager
        'Media' => [
            'MediaController@index' => "List",
            'MediaController@create' => "Create",
            'MediaController@store' => "Store",
            'MediaController@images' => "List of Image",
            'MediaController@destroy' => "Delete",
        ],
        // Template manager
        'Template manager' => [
            'TemplateController@install' => 'Install (form)',
            'TemplateController@installed' => 'Install (Save to database)',
            'TemplateController@create' => 'Clone (form)',
            'TemplateController@store' => 'Clone (Save to database)',
            'TemplateController@edit' => 'Edit',
            'TemplateController@update' => 'Update',
            'TemplateController@publish' => 'Publish (publish or draft template)',
            'TemplateController@preview' => 'Preview',
            'TemplateController@delete' => 'Delete (Use for themes was cloned)',
        ],
        // Site manager
        'Site manager' => [
            'SiteController@index' => 'List',
            'SiteController@getSiteDetail' => 'Site detail',
            'SiteController@editInfo' => 'Edit information',
            'SiteController@updateInfo' => 'Update information',
            'SiteController@updateTemplate' => 'Update template',
            'SiteController@saveTemplate' => 'Save template',
            'SiteController@selectTemplate' => 'List',
            'SiteController@addInfo' => 'Add information',
            'SiteController@createInfo' => 'Create information',
            'SiteController@toggleTemplateSession' => 'toggle template session',
            'SiteController@toggleUpdateTemplateSession' => 'Update template session',
            'SiteController@destroyInfo' => 'Delete Information',
            'SiteController@sendEmail' => 'Send email',
            'SiteController@download' => 'Download',
            'SiteController@deploy' => 'Deploy',
            'GenerateController@compress' => 'Compress',
        ],
        // Language manager
        'Language manager' => [
            'LanguageController@index' => 'List',
            'LanguageController@create' => 'Create and Store',
            'LanguageController@edit' => 'Edit and Update',
            'LanguageController@destroy' => 'Delete',
        ],
        // Translations
        'Translations' => [
            'TranslateController@index' => 'List',
            'TranslateController@create' => 'Create',
            'TranslateController@store' => 'Store',
            'TranslateController@edit' => 'Edit',
            'TranslateController@update' => 'Update',
            'TranslateController@destroy' => 'Delete',
        ],
        // Theme manager
        'Theme manager' => [
            'ThemeController@index' => 'List',
            'ThemeController@view' => 'Show',
            'ThemeController@active' => 'Active',
            'ThemeController@update' => 'Update',
            'ThemeController@install' => 'Install (form)',
            'ThemeController@installed' => 'Install (Save to database)',
        ],
        // Widget manager
        'Widget manager' => [
            'WidgetController@index' => 'List',
            'WidgetController@addWidget' => 'Add',
            'WidgetController@store' => 'Store',
            'WidgetController@reorder' => 'Re-order',
            'WidgetController@destroy' => 'Delete',
        ],
        // Galleries
        'Galleries' => [
            'GalleriesController@index' => 'List',
            'GalleriesController@create' => 'Create',
            'GalleriesController@store' => 'Store',
            'GalleriesController@edit' => 'Edit',
            'GalleriesController@update' => 'Update',
            'GalleriesController@show' => 'Show',
            'GalleriesController@destroy' => 'Delete',
        ],
        // Gallery images
        'Gallery images' => [
            'GalleryImagesController@index' => 'List',
            'GalleryImagesController@create' => 'Create',
            'GalleryImagesController@store' => 'Store',
            'GalleryImagesController@edit' => 'Edit',
            'GalleryImagesController@update' => 'Update',
            'GalleryImagesController@show' => 'Show',
            'GalleryImagesController@destroy' => 'Delete',
        ],
        // Contacts
        'Contacts' => [
            'ContactController@index' => 'List',
            'ContactController@create' => 'Create',
            'ContactController@store' => 'Store',
            'ContactController@edit' => 'Edit',
            'ContactController@update' => 'Update',
            'ContactController@show' => 'Show',
            'ContactController@destroy' => 'Delete',
        ],
        // Roles
        'Roles' => [
            'RolesController@index' => 'List',
            'RolesController@create' => 'Create',
            'RolesController@store' => 'Store',
            'RolesController@edit' => 'Edit',
            'RolesController@update' => 'Update',
            'RolesController@show' => 'Show',
            'RolesController@destroy' => 'Delete',
        ],
        // User manager
        'User manager' => [
            'UsersController@index' => 'List',
            'UsersController@add' => 'Add',
            'UsersController@store' => 'Store',
            'UsersController@edit' => 'Edit',
            'UsersController@update' => 'Update',
            'UsersController@destroy' => 'Delete',
        ],
        // Settings
        'Settings' => [
            'OptionsController@index' => 'Show settings',
            'OptionsController@update' => 'Update'
        ]
    ]
);