<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta content="text/html;charset=utf-8" http-equiv="Content-Type">
    <meta content="utf-8" http-equiv="encoding">
    <meta name="viewport" content="width=device-width,  initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
</head>
<title>Email</title>
<style>
    .container{
        max-width: 1170px;
        margin: 0 auto;
    }
</style>
<body>
    <div class="container">
        <h3 style="color: red">Hi {{ $adminName }}</h3>
        <p> Your website {{ $siteName }} has just been created successfully!</p>
        <p>To deploy the website, please clicking on the link for backend site first and then input the log-in information below. </p>
        <p style="margin-left: 20px">Link for frontend site: abcxyz@sanmax.com</p>
        <p style="margin-left: 20px">Link for backend site: abcxyz@sanmax.com/admin</p>
        <p style="margin-left: 20px">Username: {{ $siteName }}</p>
        <p style="margin-left: 20px">Password: {{ $password }}</p>
        <p>Best regards,</p>
    </div>
</body>
</html>


