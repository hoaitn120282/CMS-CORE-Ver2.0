<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" ng-app="angularstrapApp">
<head>
    <meta content="text/html;charset=utf-8" http-equiv="Content-Type">
    <meta content="utf-8" http-equiv="encoding">
    <meta name="viewport" content="width=device-width,  initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <link rel="icon" href="img/favicon.ico" type="image/x-icon" />

    <link rel="stylesheet" href="css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/owl.carousel/dist/assets/owl.carousel.min.css" />
    <link rel="stylesheet" href="css/lightslider/lightslider.min.css" />
<!--    <link rel="stylesheet" href="css/main.css">-->
    <?php

    $url = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
    $parts = parse_url($url);
    if (isset($parts['query'])){
        parse_str($parts['query'], $query);
    }
    if (isset($query['template'])) {
        $templateId = $query['template'];
    }else{
        $templateId = null;
    }
    ?>
	<link rel="stylesheet" href="css/<?php echo $templateId ?>.css">
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
                        <a class="navbar-brand" href="#"><span class="site-title">Simple Site Title</span></a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling --> 
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right nav-right-custom text-right">
                            <li><a href="index.php?template=<?php echo $templateId ?>">Home</a></li>
                            <li><a href="info.php?template=<?php echo $templateId ?>">INFO FOR PATIENT</a></li>
                            <li><a href="contact.php?template=<?php echo $templateId ?>" class="active">Contact</a></li>
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
            <div class="slide-item">
            </div>
        </div>
        <!--End Slide-->
    </header>

    <!--Begin Content-->
    <div class="content"  >
        <div class="container">
            <div class="row">
        
                <div class="">
                    <aside class="sidebar-left"></aside>
                </div>

                <div class="col-md-9 col-sm-12">
                    <section class="content-dt content-contact">
                        <div class="ct-detail">
                            <h3>Company Name</h3>
                            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. </p>

                            <ul class="contact-info list-unstyled">
                                <li><span>Address</span> 123 Fake Street, Fake City, Fake Country</li>
                                <li><span>Phone number</span> +401 111 222 xxx</li>
                                <li><span>Email  address</span> companyname@support.com</li>
                                <li><span>Skype</span> companyname.skype</li>
                            </ul>

                            <div class="contact-map">
                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.0405366193354!2d105.78919731545666!3d21.031063971852408!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab31fa9089bd%3A0xab696ce4f403011!2sQSoft+Vietnam!5e0!3m2!1svi!2s!4v1487733047422" width="600" height="450" frameborder="0" style="border:0; width: 100%" allowfullscreen></iframe>
                            </div>
                        </div>
                    </section>
                </div>

                <div class="col-md-3 col-sm-12">
                    <!--Begin Sidebar Right-->
                    <aside class="sidebar-right">
                        <div class="row">
                            <div class="col-md-12 col-sm-6">
                                <div class="make-appointment">
                                    <figure>
                                        <img src="images/doctor-1.jpg" alt="">
                                    </figure>
                                    <header>
                                        <h4>Dr. Anna Doe</h4>
                                        <p>Sample Position</p>
                                        <a href="#" class="btn btn-make-appointment">MAKE APPOINTMENT</a>
                                    </header>
                                </div>
                            </div>    

                            <div class="col-md-12 col-sm-6">
                                <div class="make-appointment">
                                    <figure>
                                        <img src="images/doctor-2.jpg" alt="">
                                    </figure>
                                    <header>
                                        <h4>Dr. Anna Doe</h4>
                                        <p>Sample Position</p>
                                        <a href="#" class="btn btn-make-appointment">MAKE APPOINTMENT</a>
                                    </header>
                                </div>
                            </div>  
                        </div>
                    </aside>
                    <!--Begin Sidebar Right-->
                </div>
            </div>
        </div>
    </div>
    <!--End Video-->

    <!--Begin Footer-->
    <footer class="bg-top-bottom">
        <div class="container">
            <p class="">Powered by Sanmax #afsprakenbeheer.</p>
        </div>
    </footer>
    <!--End Footer-->
</body>

<script type="text/javascript" src="js/plugin/jquery.min.js"></script>
<script type="text/javascript" src="js/plugin/bootstrap.min.js"></script>
<script type="text/javascript" src="js/plugin/lightslider.min.js"></script>
<script type="text/javascript" src="js/plugin/jquery.appear.js"></script>
<script type="text/javascript" src="js/plugin/owl.carousel.min.js"></script>

<script type="text/javascript" src="js/main.js"></script>
</html>
