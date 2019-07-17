<?php
/**
 * Created by PhpStorm.
 * User: Mohammad Ali
 * Date: 2/18/2019
 * Time: 7:58 AM
 */
require_once("includes/includes.php");
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
    <!doctype html>
 <html>
  <head>
<?php require 'head.php'?>
      <link rel="stylesheet" href="./assets/css/bootstrap.min.css">
    </head>
    <body class="login-wrapper">
<section  class="log">
    <header>
        <h1>ورود</h1>
    </header>
    <div>
        <form method="post" action="./blog.php?action=login">
            <table>
                <tr>
                    <td>
                        <input class="text-pass" type="text" name="user" placeholder="نام کاربری"
                               required="required"
                               oninvalid="this.setCustomValidity('لطفاً نام کاربری را وارد کنید.')"
                               oninput="setCustomValidity('')"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input class="text-pass" type="password" name="pass"
                               placeholder="کلمه عبور" required="required"
                               oninvalid="this.setCustomValidity('لطفاً رمز عبور خود را وارد کنید.')"
                               oninput="setCustomValidity('')"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <p class="remember-text">مرا به خاطر بسپار</p>
                        <input class="remember-box" type="checkbox" name="remember" value="yes" />
                        <input type="submit" value="ورود" style="background-color: #4a77d4; "  class=" btn btn-primary btn-block btn-large" />
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
    </body>
  </html>