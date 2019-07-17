<?php
require_once("includes/includes.php");
session_start();
if(isset($_COOKIE['remember'])){
    if($user = User::getUserByName($_COOKIE['remember'])){
        $_SESSION['user_id'] = $user->id;
        $_SESSION['user_name'] = $user->user_name;
        $_SESSION['user_type'] = $user->user_type_name;
        $_SESSION['first_name'] = $user->first_name;
        $_SESSION['last_name'] = $user->last_name;
        setcookie("remember" , $user->user_name , time() + REMEMBER_TIME );
    }
}
ob_start();
?>

<!DOCTYPE html>
<html>
<head>
    <?php
    require 'head.php';
    ?>
    <!--<meta charset="utf-8" />
    <title>مرکز دانلود کتابهای الکترونیکی</title>
    <link href="./assets/css/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700&amp;subset=cyrillic" >
    <script src="./assets/js/javascript.js" type="text/javascript"></script>
    <script src="./assets/js/jquery-3.3.1.min.js" crossorigin="anonymous" type="text/javascript"></script>
    <meta name="viewport" content="initial-scale=1, width=device-width, maximum-scale=1, minimum-scale=1, user-scalable=no">
    <script>
        $(document).ready(function() {
            $('.sm-form').hidden;
            $('#loginSingup').click(function () {
                $('.sm-form').toggleClass("show");

            });
        });
    </script>-->
</head>
<body>
<div id="wrapper">
    <button class="goTop">
        <a href="#wrapper" >Go Top</a>
    </button>
    <?php
    /*header*/
    require 'header.php'
    ?>
<div id="body">
    <!-- Posts -->
    <section class="content">
    <div class="hero">

        <div id="background">
            <img src="./images/Hero.jpg" alt="">
        </div>
    </div>


    </section>
    <section class="content">
        <div class="down-hero">
            <div>

            </div>
            <div id="background">
                <img src="./images/down-hero.png" style="padding-top: 5px" alt="">
            </div>
        </div>
    </section>
    <section class="content">
    <div class="mid-hero right">
    <div>

    </div>
        <div id="background">
            <img src="./images/top-content-right.jpg" alt="">
        </div>
    </div>
        <div class="mid-hero left">
            <div>

            </div>
            <div id="background">
                <img src="./images/top-content-left.jpg"  alt="">
            </div>
    </section>
    <section class="content">
        <div class="mid-hero right">
            <div>

            </div>
            <div id="background">
                <img src="./images/mid-hero.jpg" alt="">
            </div>
        </div>
        <div class="mid-hero left">
            <div>

            </div>
            <div id="background">
                <img src="./images/mid-hero1.jpg"  alt="">
            </div>
    </section>
        <?php
        $url = 'http://' . $_SERVER['SERVER_NAME'] . $_SERVER['REQUEST_URI'];


        if (strpos($url,'blog') !== false) {
            echo 'بلاگ';
        } else {
            echo '';
        }?>
        <?php
        if(isset($_GET['post']) and is_numeric($_GET['post']))
            include("includes/showpost.php");
        elseif(isset($_GET['cat']) and is_numeric($_GET['cat']))
            include("includes/showcat.php");
        elseif(isset($_GET['page']) and is_numeric($_GET['page']))
            include("includes/showpage.php");
        elseif(isset($_GET['action'])){
            if($_GET['action'] == "signup")
                include("includes/action/signup.php");
            elseif($_GET['action'] == "activate")
                include("includes/action/activate.php");
            elseif($_GET['action'] == "login")
                include("includes/action/login.php");
            elseif($_GET['action'] == "forget")
                include("includes/action/forget.php");
            elseif($_GET['action'] == "search")
                include("includes/action/search.php");
            elseif($_GET['action'] == "logout")
                include("includes/action/logout.php");
        }
        ?>

</div>
    <!--footer-->
    <?php
    /*footer*/
    require 'footer.php'
    ?>
</div>
</body>
</html>