<!DOCTYPE html>
<?php

$folder = Theme::strActive();
?>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta content="text/html;charset=utf-8" http-equiv="Content-Type">
    <meta content="utf-8" http-equiv="encoding">
    <meta name="viewport" content="width=device-width,  initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title><?php echo e(Helper::option("site_title")); ?> | <?php echo $__env->yieldContent('appTitle'); ?></title>

    <link rel="icon" href="images/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="<?php echo e(URL::to("/themes/{$folder}")); ?>/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="<?php echo e(URL::to("/themes/{$folder}")); ?>/css/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="<?php echo e(URL::to("/themes/{$folder}")); ?>/css/owl.carousel/dist/assets/owl.carousel.min.css"/>
    <link rel="stylesheet" href="<?php echo e(URL::to("/themes/{$folder}")); ?>/css/lightslider/lightslider.min.css"/>
    <link rel="stylesheet" href="<?php echo e(Theme::cssFile()); ?>">
</head>
<body>

<?php echo $__env->make(Theme::active().'.components.header', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
<?php echo $__env->make(Theme::active().".layouts.{$layout}", array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
<?php echo $__env->make(Theme::active().'.components.footer', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>

</body>
<script type="text/javascript" src="<?php echo e(URL::to("/themes/{$folder}")); ?>/js/plugin/jquery.min.js"></script>
<script type="text/javascript" src="<?php echo e(URL::to("/themes/{$folder}")); ?>/js/plugin/bootstrap.min.js"></script>
<script type="text/javascript" src="<?php echo e(URL::to("/themes/{$folder}")); ?>/js/plugin/lightslider.min.js"></script>
<script type="text/javascript" src="<?php echo e(URL::to("/themes/{$folder}")); ?>/js/plugin/jquery.appear.js"></script>
<script type="text/javascript" src="<?php echo e(URL::to("/themes/{$folder}")); ?>/js/plugin/owl.carousel.min.js"></script>
<!-- Custom -->
<script type="text/javascript" src="<?php echo e(URL::to("/themes/{$folder}")); ?>/js/main.js"></script>

</html>
