<?php
/**
 * Created by PhpStorm.
 * User: Mohammad Ali
 * Date: 2/7/2019
 * Time: 1:19 PM
 */
?>
<header id="top">
</header>
<nav id="menu">

    <div class="right">
        <ul><li><a href="./"><span><img id="logo" src="images/Logo.gif" /></span></a></li></ul>
    </div>
    <div class="center">
        <ul>
            <li><a href="./">صفحه‌ اصلی</a></li>
            <?php
            if($pages = Post::getAllPosts(2)){
                foreach($pages as $page){?>
                    <li><a href="./blog.php?page=<?php echo $page->id ?>"><?php echo $page->title ?></a></li>
                    <?php
                }
            }

            if(isset($_SESSION['user_type']) and $_SESSION['user_type'] == "admin")
                echo '<li><a href="./cpanel/">پنل مدیریت</a></li>';
            elseif(isset($_SESSION['user_type']))
                echo '<li><a href="./cpanel/">پنل کاربری</a></li>';
            ?>
        </ul>
    </div>


    <div class="left">
            <div class="search sm-search">
                <form id="search-form" class="search-form hide-search">
                    <input id="search-text" type="hidden" name="action" value="search" >
                    <input id="search-place" type="text" name="q" placeholder="جستجو کنید" autofocus >
                    <button id="search-button" type="submit"></button>
                    <input style="display: none" type="checkbox" name="title" value="yes" checked="checked" >
                    <input style="display: none" type="checkbox" name="content" value="yes" checked="checked" >
                    <button class="bt-close-search" type="button">
                        <span class="close-search">
                        <span class="close-left"></span>
                        <span class="close-right"></span>
                    </span>
                    </button>
                </form>
                <button id="search-click" type="submit"></button>
            </div>
        <ul>
            <li><span><a id="loginSingup" href="./login.php"><img src="./images/Login-icon.png" alt="Login/Signup"></a></span></li>
        </ul>

    </div>
</nav>
