<?php

return array(
    // Dashboard
    [
        'name' => 'Dashboard',
        'route' => 'contentManager.index',
        'class' => 'fa fa-dashboard',
        'active' => true,
    ],
    // Content manager
    [
        'name' => 'Content manager',
        'class' => 'fa fa-newspaper-o',
        'treeview' => true,
        'active' => true,
        'items' => [
            [
                'name' => 'Pages',
                'route' => 'contentManager.page.index',
                'actives' => ['contentManager.page.add', 'contentManager.page.edit']
            ],
            [
                'name' => 'Posts',
                'route' => 'contentManager.post.index',
                'active' => true,
                'actives' => ['contentManager.post.add', 'contentManager.post.edit']
            ],
            [
                'name' => 'Categories',
                'route' => 'contentManager.category.index',
                'actives' => ['contentManager.category.add', 'contentManager.category.edit']
            ],
            [
                'name' => 'Tags',
                'route' => 'contentManager.tag.index',
                'active' => true,
                'actives' => ['contentManager.tag.add', 'contentManager.tag.edit']
            ],
            [
                'name' => 'Doctors',
                'route' => 'contentManager.doctor.index',
                'active' => true,
                'actives' => ['contentManager.doctor.add', 'contentManager.doctor.edit']
            ]
        ]
    ],
    // Menu manager
    [
        'name' => 'Menu manager',
        'route' => 'contentManager.menu.index',
        'class' => 'fa fa-sitemap',
        'active' => true,
    ],
    // Media
    [
        'name' => 'Media',
        'route' => 'contentManager.media',
        'class' => 'fa fa-file-image-o',
        'active' => true,
    ],
    // Template manager
    [
        'name' => 'Template manager',
        'class' => 'fa fa-windows',
        'treeview' => false,
        'active' => true,
        'items' => [
            [
                'name' => 'Template Library',
                'route' => 'templateManager.index',
                'active' => true,
            ],
            [
                'name' => 'Install new template',
                'route' => 'templateManager.install',
                'active' => true,
            ],
        ]
    ],
    // Site manager
    [
        'name' => 'Site manager',
        'class' => 'fa fa-sitemap',
        'treeview' => false,
        'active' => true,
        'items' => [
            [
                'name' => 'List of sites',
                'route' => 'siteManager.index',
                'active' => true,
            ],
            [
                'name' => 'Create new',
                'route' => 'siteManager.select-template',
                'active' => true,
            ],
        ]
    ],
    // Language Manager
    [
        'name' => 'Language manager',
        'class' => 'fa fa-language',
        'treeview' => false,
        'active' => true,
        'items' => [
            [
                'name' => 'Manage language',
                'route' => 'languageManager.language.index',
                'active' => true,
                'actives' => ['languageManager.language.add', 'languageManager.language.edit']
            ],
            [
                'name' => 'Translation',
                'route' => 'languageManager.translate.index',
                'active' => true,
                'actives' => ['languageManager.translate.add', 'languageManager.translate.edit']
            ],
        ]
    ],
    // Theme Manager
    [
        'name' => 'Theme manager',
        'class' => 'fa fa-desktop',
        'treeview' => false,
        'active' => true,
        'items' => [
            [
                'name' => 'Manage theme',
                'route' => 'contentManager.theme',
                'active' => true,
            ],
            [
                'name' => 'Edit theme active',
                'route' => 'contentManager.theme.view',
                'paramsRoute' => ['id' => config('theme.active_id')],
                'active' => true
            ],
        ]
    ],
    // Widget manager
    [
        'name' => 'Widget manager',
        'route' => 'contentManager.widget',
        'class' => 'fa fa-clone',
        'active' => true,
    ],
    // Galleries
    [
        'name' => 'Galleries',
        'class' => 'fa fa-desktop',
        'treeview' => false,
        'active' => true,
        'items' => [
            [
                'name' => 'Manage gallery',
                'route' => 'galleries.index',
                'active' => true,
            ],
            [
                'name' => 'Gallery Images',
                'route' => 'galleryImages.index',
                'paramsRoute' => [],
                'active' => true
            ],
        ]
    ],
    // Contacts
    [
        'name' => 'Contacts',
        'route' => 'contacts.index',
        'class' => 'fa fa-envelope',
        'active' => true,
    ],
    // Roles
    [
        'name' => 'Roles',
        'route' => 'roles.index',
        'class' => 'fa fa-user',
        'active' => true,
    ],
    // User manager
    [
        'name' => 'User manager',
        'route' => 'contentManager.user.index',
        'class' => 'fa fa-users',
        'active' => true,
    ],
    // Settings
    [
        'name' => 'Settings',
        'route' => 'contentManager.setting',
        'class' => 'fa fa-gear',
        'active' => true,
    ],
);