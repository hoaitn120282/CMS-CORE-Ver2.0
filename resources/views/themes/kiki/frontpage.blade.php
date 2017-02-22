<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" ng-app="angularstrapApp">
<head>
    <meta content="text/html;charset=utf-8" http-equiv="Content-Type">
    <meta content="utf-8" http-equiv="encoding">
    <meta name="viewport" content="width=device-width,  initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <link rel="icon" href="img/favicon.ico" type="image/x-icon" />

    <link rel="stylesheet" href="{{URL::to('/themes/kiki')}}/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="{{URL::to('/themes/kiki')}}/css/font-awesome/font-awesome.min.css">
    <link rel="stylesheet" href="{{URL::to('/themes/kiki')}}/css/owl.carousel/dist/assets/owl.carousel.min.css" />
    <link rel="stylesheet" href="{{URL::to('/themes/kiki')}}/css/main.css">
</head>
<title>Clinic</title>
<body>
    <header class="header">
        <div class="header-contact bg-top-bottom">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <p>street</p>
                    </div>
                    <div class="col-sm-6">
                        <ul class="list-inline pull-right">
                            <li>00000</li>
                            <li>mail</li>
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
                        <a class="navbar-brand io-logo" href="#"><img src="{{URL::to('/themes/kiki')}}/images/logo.png"></a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right nav-right-custom text-right">
                            <li><a href="#">Home</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Team</a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Action</a></li>
                                    <li><a href="#">Another action</a></li>
                                    <li><a href="#">Something else here</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="#">Separated link</a></li>
                                </ul>
                            </li>
                            <li><a href="#">News</a></li>
                            <li><a href="#">Contact</a></li>
                            <li><a href="#">More</a></li>
                            <li><a href="#">English</a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </div>
        </nav>
        <!--End Navbar-->

        <div class="header-slide owl-carousel owl-theme">
            <div class="slide-item">
                <figure>
                    <img src="{{URL::to('/themes/kiki')}}/images/banner.jpg" alt="">
                </figure>
                <div class="make-appointment text-center">
                    <h1 class="header-title">Sed ut perspiciatis unde omnis</h1>
                    <p class="header-sologan">Voluptatem accusantium doloremque laudantium, totam rem aperiam</p>
                    <a href="#" class="btn btn-danger">MAKE APPOINTMENT</a>
                </div>
            </div>

            <div class="slide-item">
                <figure>
                    <img src="{{URL::to('/themes/kiki')}}/images/banner.jpg" alt="">
                </figure>
                <div class="make-appointment text-center">
                    <h1 class="header-title">Sed ut perspiciatis unde omnis</h1>
                    <p class="header-sologan">Voluptatem accusantium doloremque laudantium, totam rem aperiam</p>
                    <a href="#" class="btn btn-danger">MAKE APPOINTMENT</a>
                </div>
            </div>
        </div>
        <!--End Slide-->
    </header>

    <!--Begin Content-->
    <div class="content"  >
        <aside class="sidebar-left"></aside>

        <section class="our-doctors">
            <div class="container">
                <h3 class="article-title"><span>Our doctors</span></h3>
                <div class="row">
                    <div class="col-sm-4">
                        <article class="doctor-detail text-center">
                            <figure>
                                <img src="{{URL::to('/themes/kiki')}}/images/doctor-1.jpg" alt="">
                            </figure>
                            <h4>Dr. Anna Doe</h4>
                            <p>Sample Position</p>
                        </article>
                    </div>
                    <div class="col-sm-4">
                        <article class="doctor-detail text-center">
                            <figure>
                                <img src="{{URL::to('/themes/kiki')}}/images/doctor-1.jpg" alt="">
                            </figure>
                            <h4>Dr. Anna Doe</h4>
                            <p>Sample Position</p>
                        </article>
                    </div>
                    <div class="col-sm-4">
                        <article class="doctor-detail text-center">
                            <figure>
                                <img src="{{URL::to('/themes/kiki')}}/images/doctor-1.jpg" alt="">
                            </figure>
                            <h4>Dr. Anna Doe</h4>
                            <p>Sample Position</p>
                        </article>
                    </div>
                </div>
            </div>
        </section>
        <!--End Our Doctors-->

        <section class="news">
            <div class="container">
                <h3 class="article-title"><span>News</span></h3>
                <div class="row">
                    <div class="col-sm-4">
                        <article class="new-detail">
                            <figure>
                                <a href="#"><img src="{{URL::to('/themes/kiki')}}/images/new-1.jpg" alt=""></a>
                            </figure>
                            <div class="new-content">
                                <h3>Sample Title</h3>
                                <meta>Posted on Monday, Feb 18 2017 at 7:00 AM</meta>
                                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis</p>
                            </div>
                            <a href="#" class="btn btn-readmore pull-right">Read more</a>
                        </article>
                    </div>
                    <div class="col-sm-4">
                        <article class="new-detail">
                            <figure>
                                <a href="#"><img src="{{URL::to('/themes/kiki')}}/images/new-1.jpg" alt=""></a>
                            </figure>
                            <div class="new-content">
                                <h3>Sample Title</h3>
                                <meta>Posted on Monday, Feb 18 2017 at 7:00 AM</meta>
                                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis</p>
                            </div>
                            <a href="#" class="btn btn-readmore pull-right">Read more</a>
                        </article>
                    </div>
                    <div class="col-sm-4">
                        <article class="new-detail">
                            <figure>
                                <a href="#"><img src="{{URL::to('/themes/kiki')}}/images/new-1.jpg" alt=""></a>
                            </figure>
                            <div class="new-content">
                                <h3>Sample Title</h3>
                                <meta>Posted on Monday, Feb 18 2017 at 7:00 AM</meta>
                                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis</p>
                            </div>
                            <a href="#" class="btn btn-readmore pull-right">Read more</a>
                        </article>
                    </div>
                </div>
            </div>
        </section>
        <!--End News-->

        <section class="tips">
            <div class="container">
                <h3 class="article-title"><span>Tips</span></h3>

                <div class="tips-slide owl-carousel owl-theme">
                    <div class="tip-detail">
                        <div class="tip-content">
                            <h3>Sample Tip</h3>

                            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
                        </div>
                    </div>

                    <div class="tip-detail">
                        <div class="tip-content">
                            <h3>Sample Tip</h3>

                            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
                        </div>
                    </div>

                    <div class="tip-detail">
                        <div class="tip-content">
                            <h3>Sample Tip</h3>

                            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
                        </div>
                    </div>

                    <div class="tip-detail">
                        <div class="tip-content">
                            <h3>Sample Tip</h3>

                            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
                        </div>
                    </div>

                </div>
            </div>
        </section>
        <!--End Tips-->

        <!--Begin Sidebar Right-->
        <aside class="sidebar-right">

        </aside>
        <!--Begin Sidebar Right-->
    </div>
    <!--End Video-->

    <!--Begin Footer-->
    <footer class="bg-top-bottom">
        <p class="text-center io-copyright">®Copyright 2016. IO Vietnam. All rights reserved.</p>
    </footer>
    <!--End Footer-->
</body>

<script type="text/javascript" src="{{URL::to('/themes/kiki')}}/js/plugin/jquery.min.js"></script>
<script type="text/javascript" src="{{URL::to('/themes/kiki')}}/js/plugin/bootstrap.min.js"></script>
<script type="text/javascript" src="{{URL::to('/themes/kiki')}}/js/plugin/jquery.appear.js"></script>
<script type="text/javascript" src="{{URL::to('/themes/kiki')}}/js/plugin/owl.carousel.min.js"></script>

<script type="text/javascript" src="{{URL::to('/themes/kiki')}}/js/main.js"></script>

<<<<<<< HEAD
</html>
=======
</html>
>>>>>>> development
