<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" ng-app="angularstrapApp">
<head>
    <meta content="text/html;charset=utf-8" http-equiv="Content-Type">
    <meta content="utf-8" http-equiv="encoding">
    <meta name="viewport" content="width=device-width,  initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <link rel="icon" href="images/favicon.ico" type="image/x-icon" />

    <link rel="stylesheet" href="{{URL::to('/themes/clinic_simple')}}/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="{{URL::to('/themes/clinic_simple')}}/css/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="{{URL::to('/themes/clinic_simple')}}/css/owl.carousel/dist/assets/owl.carousel.min.css" />
    <link rel="stylesheet" href="{{URL::to('/themes/clinic_simple')}}/css/lightslider/lightslider.min.css" />
    <?php
		$css_name = Theme::getID().".css";
		$css_path = "themes/clinic_simple/css/{$css_name}";
		$css_file = public_path($css_path);
	?>
	@if (File::exists($css_file))
		<link rel="stylesheet" href="{{ asset($css_path) }}">
	@else
		<link rel="stylesheet" href="{{URL::to('/themes/clinic_simple')}}/css/main.css">
	@endif

</head>
<title>Simple Site Title</title>
<body>
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
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand io-logo" href="#"><span class="site-title">Simple Site Title</span></a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right nav-right-custom text-right">
                        <li><a href="index.html" class="active">Home</a></li>
                        <li><a href="info.html">INFO FOR PATIENT</a></li>
                        <li><a href="contact.html">Contact</a></li>
                        <li class="dropdown language-select">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">English <i class="fa fa-angle-down hidden-sm hidden-xs"></i></a>
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
        <div class="slide-item" style="background: url({{URL::to('/themes/clinic_simple')}}/images/banner.jpg) no-repeat center center; height: 350px; background-size: cover;">
        </div>
    </div>
    <!--End Slide-->
</header>