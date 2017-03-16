<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Administrator | ITLSVN</title>
    <!-- Bootstrap -->
    <link href="<?php echo e(URL::to('/assets/bootstrap/dist/css/bootstrap.min.css')); ?>" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="<?php echo e(URL::to('/assets/fontawesome/css/font-awesome.min.css')); ?>" rel="stylesheet">
    <link rel="stylesheet" href="<?php echo e(URL::to('/assets/sweetalert/sweetalert.css')); ?>">
    <link rel="stylesheet" href="<?php echo e(URL::to('/assets/iCheck/skins/flat/green.css')); ?>">
    <!-- Custom Theme Style -->
    <?php echo $__env->yieldPushContent('style-top'); ?>
    <?php echo $__env->yieldPushContent('style'); ?>
    <link href="<?php echo e(URL::to('/themes/dashboard/css/style.css')); ?>" rel="stylesheet">
    <link href="<?php echo e(URL::to('/themes/dashboard/css/custom.css')); ?>" rel="stylesheet">
</head>

<body class="nav-md footer_fixed">
<div class="container body">
    <div class="main_container">
        <div class="col-md-3 left_col">
            <div class="left_col scroll-view">
                <div class="navbar nav_title" style="border: 0;">
                    <a href="<?php echo e(Admin::route('contentManager.index')); ?>" class="site_title">
                        <i class="fa fa-paw"></i>
                        <span>Administrator</span>
                    </a>
                </div>

                <div class="clearfix"></div>

                <!-- menu profile quick info -->
                <div class="profile">
                    <div class="profile_pic">
                        <img src="<?php echo e(url('/assets/images').'/'.Auth::guard('admin')->user()->photo); ?>" alt="..."
                             class="img-circle profile_img">
                    </div>
                    <div class="profile_info">
                        <span>Welcome,</span>
                        <h2><?php echo e(Auth::guard('admin')->user()->name); ?></h2>
                    </div>
                </div>
                <!-- /menu profile quick info -->

                <br/>

                <!-- sidebar menu -->
                <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                    <div class="menu_section">
                        <h3>General</h3>
                        <ul class="nav side-menu">
                            <li>
                                <a href="<?php echo e(Admin::route('contentManager.index')); ?>"><i class="fa fa-home"></i> Dashboard</a>
                            </li>
                            <li <?php echo e(Admin::requestIs('contentManager/post*') ? ' class=active' : ''); ?>>
                                <a><i class="fa fa-newspaper-o"></i> Content Manager <span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu">
                                    <li><a href="<?php echo e(Admin::route('contentManager.page.index')); ?>">Pages</a></li>
                                    <li><a href="<?php echo e(Admin::route('contentManager.post.index')); ?>">Posts</a></li>
                                    <li><a href="<?php echo e(Admin::route('contentManager.comment')); ?>">Comments </a></li>
                                    <li><a href="<?php echo e(Admin::route('contentManager.category.index')); ?>">Categories</a></li>
                                    <li><a href="<?php echo e(Admin::route('contentManager.tag.index')); ?>">Tags</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="<?php echo e(Admin::route('contentManager.menu.index')); ?>"><i class="fa fa-sitemap"></i> Menu Manager</a>
                            </li>
                            <li>
                                <a href="<?php echo e(Admin::route('contentManager.media')); ?>"><i class="fa fa-file-image-o"></i> Media Manager</a>
                            </li>
                            
                            <li>
                                <a><i class="fa fa-desktop"></i> Theme Manager <span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu">
                                    <li><a href="<?php echo e(Admin::route('contentManager.theme')); ?>">Manage Theme</a></li>
                                    <li><a href="<?php echo e(Admin::route('contentManager.theme.view',['id'=>Theme::getID()])); ?>">Edit Theme Active</a></li>
                                </ul>
                            </li>
                            <li><a href="<?php echo e(Admin::route('contentManager.widget')); ?>"><i class="fa fa-clone"></i> Widget
                                    Manager </a></li>
                           
                            <?php /*<li><a href="/admin/contentManager/filemanager"><i class="fa fa-image"></i> File Manager </a></li>*/ ?>
                            <?php echo $__env->make('layouts.generated-menu', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
                            <!-- <li><a href="<?php echo e(Admin::route('contentManager.user.index')); ?>"><i class="fa fa-users"></i>
                                    Users Manager </a></li> -->
                            <li><a href="<?php echo e(Admin::route('contentManager.setting')); ?>"><i class="fa fa-gear"></i>
                                    Setting</a></li>
                        </ul>
                    </div>
                </div>
                <!-- /sidebar menu -->

                <!-- /menu footer buttons -->
                <div class="sidebar-footer hidden-small">
                    <a data-toggle="tooltip" data-placement="top" title="Settings">
                        <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
                    </a>
                    <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                        <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
                    </a>
                    <a data-toggle="tooltip" data-placement="top" title="Lock">
                        <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
                    </a>
                    <a data-toggle="tooltip" data-placement="top" title="Logout">
                        <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                    </a>
                </div>
                <!-- /menu footer buttons -->
            </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
            <div class="nav_menu">
                <nav>
                    <div class="nav toggle">
                        <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                    </div>
                    <ul class="nav navbar-nav navbar-left">
                        <li>
                            <?php /*<a href="<?php echo e(url('/')); ?>" target="_blank">
                                <strong>View Website <i class="fa fa-arrow-right"></i></strong>
                            </a>*/ ?>
                            <?php echo $__env->yieldContent('back'); ?>
                        </li>
                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        <li class="">
                            <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown"
                               aria-expanded="false">
                                <img src="<?php echo e(url('/assets/images').'/'.Auth::guard('admin')->user()->photo); ?>"
                                     alt=""><?php echo e(Auth::guard('admin')->user()->name); ?>

                                <span class=" fa fa-angle-down"></span>
                            </a>
                            <ul class="dropdown-menu dropdown-usermenu pull-right">
                                <li>
                                    <a href="<?php echo e(Admin::route('contentManager.user.show',['user'=>Auth::guard('admin')->user()->id])); ?>">
                                        Profile</a></li>
                                <li><a href="javascript:;">Help</a></li>
                                <li><a href="<?php echo e(Admin::route('logout')); ?>"><i class="fa fa-sign-out pull-right"></i> Log
                                        Out</a></li>
                            </ul>
                        </li>

                        <li role="presentation" class="dropdown">
                            <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown"
                               aria-expanded="false">
                                <i class="fa fa-envelope-o"></i>
                                <span class="badge bg-green">6</span>
                            </a>
                            <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                                <li>
                                    <a>
                                        <span class="image"><img
                                                    src="<?php echo e(url('/assets/images').'/'.Auth::guard('admin')->user()->photo); ?>"
                                                    alt="Profile Image"/></span>
                                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                                    </a>
                                </li>
                                <li>
                                    <a>
                                        <span class="image"><img src="<?php echo e(url('/assets/images/default-user.png')); ?>"
                                                                 alt="Profile Image"/></span>
                                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                                    </a>
                                </li>
                                <li>
                                    <a>
                                        <span class="image"><img src="<?php echo e(url('/assets/images/default-user.png')); ?>"
                                                                 alt="Profile Image"/></span>
                                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                                    </a>
                                </li>
                                <li>
                                    <a>
                                        <span class="image"><img src="<?php echo e(url('/assets/images/default-user.png')); ?>"
                                                                 alt="Profile Image"/></span>
                                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                                    </a>
                                </li>
                                <li>
                                    <div class="text-center">
                                        <a>
                                            <strong>See All Alerts</strong>
                                            <i class="fa fa-angle-right"></i>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>

        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
            <?php echo $__env->yieldContent('content'); ?>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
            <div class="pull-right">
               <!--  Thank for using ITLSVN-CMS 1.0 -->
            </div>
            <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
    </div>
</div>

<!-- jQuery -->
<script src="<?php echo e(URL::to('/assets/jquery/dist/jquery.min.js')); ?>"></script>
<!-- Bootstrap -->
<script src="<?php echo e(URL::to('/assets/bootstrap/dist/js/bootstrap.min.js')); ?>"></script>
<script src="<?php echo e(URL::to('/assets/sweetalert/sweetalert.min.js')); ?>"></script>
<script src="<?php echo e(URL::to('/assets/iCheck/icheck.min.js')); ?>"></script>

<!-- Custom Theme Scripts -->
<script src="<?php echo e(URL::to('/themes/dashboard/js/main.js')); ?>"></script>
<?php echo $__env->yieldPushContent('scripts'); ?>
</body>
</html>