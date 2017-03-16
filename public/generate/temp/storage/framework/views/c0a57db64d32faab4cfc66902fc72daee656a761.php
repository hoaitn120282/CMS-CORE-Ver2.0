<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>QSoft Vietnam CMS | Administrator</title>

    <!-- Fonts -->
    <link rel="stylesheet" href="<?php echo e(URL::to('/')); ?>/assets/fontawesome/css/font-awesome.min.css">

    <!-- Styles -->
    <link rel="stylesheet" href="<?php echo e(URL::to('/')); ?>/assets/bootstrap/dist/css/bootstrap.min.css">
    <?php echo $__env->yieldPushContent('style'); ?>

    <style>
        body {
            font-family: 'arial';
            padding:0 10px; 
        }

        .fa-btn {
            margin-right: 6px;
        }
    </style>
</head>
<body id="app-layout-blank">
    <?php echo $__env->yieldContent('content'); ?>

   

    <!-- JavaScripts -->
    <script src="<?php echo e(URL::to('/')); ?>/assets/jquery/dist/jquery.min.js"></script>
    <script src="<?php echo e(URL::to('/')); ?>/assets/bootstrap/dist/js/bootstrap.min.js"></script>
    <?php echo $__env->yieldPushContent('scripts'); ?>
</body>
</html>
