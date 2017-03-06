<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" ng-app="angularstrapApp">
<?php include 'components/head.php'?>
<title>Simple Site Title</title>
<body>
    <a href="#" id="back-to-top" title="Back to top">
        <i class="fa fa-angle-up"></i>
    </a>
	<?php include 'components/header.php' ?>

    <!--Begin Content-->
    <div class="content"  >
        <div class="container">
            <div class="row">
        
                <div class="">
                    <aside class="sidebar-left"></aside>
                </div>

                <div class="col-md-9 col-sm-12">
                    <section class="content-dt">
                        <ul id="lightSlider" class="gallery list-unstyled cS-hidden">
                            <li data-thumb="images/content-img.jpg"> 
                                <img src="images/content-img.jpg" />
                            </li>
                            <li data-thumb="images/content-img.jpg"> 
                                <img src="images/content-img.jpg" />
                            </li>
                            <li data-thumb="images/content-img.jpg"> 
                                <img src="images/content-img.jpg" />
                            </li>
                        </ul>
                        <div class="ct-detail">
                            <h3>Example Title</h3>
                            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>
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
