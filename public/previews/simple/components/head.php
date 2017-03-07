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