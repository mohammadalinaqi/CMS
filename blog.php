<?php
/**
 * Created by PhpStorm.
 * User: Mohammad Ali
 * Date: 2/4/2019
 * Time: 9:43 AM
 */
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
    <link href="./assets/css/blog.css" rel="stylesheet" />
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
    <?php
    require 'header.php';
    ?>
<div id="body">
<aside id="sidebar">
    <section id="login">
        <header>
            ورود
        </header>
        <div>
            <form method="post" action="./blog.php?action=login">
                <table>
                    <tr>
                        <td>
                            نام کاربری
                        </td>
                        <td>
                            <input type="text" name="user" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            کلمه عبور
                        </td>
                        <td>
                            <input type="password" name="pass" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            مرا به خاطر بسپار
                            <input type="checkbox" name="remember" value="yes" />
                            <input type="submit" value="ورود" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <a href="./blog.php?action=signup" class="linkbutton">ثبت نام</a>
                            <a href="./blog.php?action=forget" class="linkbutton">فراموشی کلمه عبور</a>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </section>
    <?php
    require 'search.php';
    ?>
    <section id="categories">
        <header>
            گروه‌ها
        </header>
        <div>
            <ul>
                <?php
                if($rootCats = Category::getCategoriesByParentId(0)){
                foreach($rootCats as $rootCat){?>
                    <li>
                    <a href="./?cat=<?php echo $rootCat->id ?>"><?php echo $rootCat->category_name ?></a>
                        <ul>
                            <?php
                            if($childCats = Category::getCategoriesByParentId($rootCat->id)){
                            foreach($childCats as $childCat){?>
                            <li><a href="./?cat=<?php echo $childCat->id ?>"><?php echo $childCat->category_name ?></a></li>
                            <?php
                                }}
                            ?>
                        </ul>
                        </li>
                <?php
                }}
                ?>
            </ul>
        </div>
    </section>
    <section id="lastposts">
        <header>
            آخرین مطالب
        </header>
        <div>
            <ul>
                <?php
                $lastPosts = Post::getAllPosts(1 , true , MAX_LAST_POST);
                foreach($lastPosts as $post){?>
                <li>
                    <a href="./?post=<?php echo $post->id ?>"><?php echo $post->title ?></a>
                </li>
                <?php
                }
                ?>
            </ul>
        </div>
    </section>
</aside>
    <!-- Posts -->
    <section id="content">
        <?php
        $url = 'http://' . $_SERVER['SERVER_NAME'] . $_SERVER['REQUEST_URI'];


        if (strpos($url,'blog') !== false) {
        echo 'بلاگ';
        } else {
        echo 'No cars.';
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
        else
            include("includes/showall.php");
        ?>
    </section>
</div>
    <!--footer-->
    <?php
    /*footer*/
    include 'footer.php'
    ?>
</div>
</body>
</html>