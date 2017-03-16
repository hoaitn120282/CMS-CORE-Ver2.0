<a href="#" id="back-to-top" title="Back to top">
    <i class="fa fa-angle-up"></i>
</a>
<header class="header">
    <div class="header-contact">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <p class="address-ct"><i class="fa fa-map-marker"></i>000 Fake Street, Fake City, Fake Country</p>
                </div>
                <div class="col-sm-6">
                    <ul class="list-contact list-inline pull-right">
                        <li><i class="fa fa-phone"></i>+1 420-000-000</li>
                        <li><i class="fa fa-envelope"></i>contact@indochinatravel.com</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!--Begin Navbar-->
    <nav class="navbar">
        <div class="container">
            <div>
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <ul class="navbar-brand list-inline">
                        <?php if(Theme::option('general','logo') != ""): ?>
                            <li>
                                <a href="<?php echo e(url('/')); ?>">
                                    <img class="logo" src="<?php echo e(Theme::option('general','logo')); ?>" alt="">
                                </a>
                            </li>
                        <?php else: ?>
                            <li class="sologan">
                                <a href="<?php echo e(url('/')); ?>">
                                    <p class="site-title"><?php echo e(Helper::option("site_title")); ?></p>
                                    <p><?php echo e(Helper::option("site_tagline")); ?></p>
                                </a>
                            </li>
                        <?php endif; ?>
                    </ul>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right nav-right-custom text-right">
                        <?php echo Theme::menu('menu-top'); ?>


                        <li class="dropdown language-select">
                            <a href="#" class="dropdown-toggle" 
                                data-toggle="dropdown" role="button"
                                aria-haspopup="true" 
                                aria-expanded="false">English <i
                                class="fa fa-angle-down hidden-sm hidden-xs"></i></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="#">Dutch</a>
                                </li>
                                <li>
                                    <a href="#">German</a>

                                </li>
                                <li>
                                    <a href="#">French</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </div>
    </nav>
    <!--End Navbar-->
    <div class="header-banner">
        <div class="slide-item"
             style="background: url(<?php echo e(URL::to("/themes/{$folder}")); ?>/images/banner.jpg) no-repeat center center; height: 350px; background-size: cover;">
        </div>
    </div>
    <!--End Slide-->
</header>