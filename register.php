<?php
session_start();
include "./config/database.php";
include "./model/db.php";
include "./model/product.php";
include "./model/user.php";

if(isset($_SESSION['user']))
{
    header("location:index.php");
}
$getname=new products;

$user=new User;
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Đăng ký</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="public/register/fonts/material-icon/css/material-design-iconic-font.min.css">
    <script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="sweetalert2.all.min.js"></script>
    <!-- Main css -->
    <link rel="stylesheet" href="public/register/css/style.css">
</head>
<body>

    <div class="main">

        <section class="signup">
            <!-- <img src="images/signup-bg.jpg" alt=""> -->
            <div class="container">
                <div class="signup-content">
                    <form method="POST" id="signup-form" class="signup-form">
                        <h2 class="form-title">Tạo acc</h2>
                        <div class="form-group">
                            <input type="text" class="form-input" name="name" id="name" placeholder="Tên tài khoản"/>
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-input" name="email" id="email" placeholder="Email"/>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="password" id="password" placeholder="Mật khẩu"/>
                            <span toggle="#password" class="zmdi zmdi-eye field-icon toggle-password"></span>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-input" name="re_password" id="re_password" placeholder="Nhập lại mật khẩu"/>
                        </div>
                        <div class="form-group">
                            <input type="submit" name="submit" id="submit" class="form-submit" value="Sign up"/>
                        </div>
                    </form>
                    <p class="loginhere">
                        Đã có sẵn tài khoản <a href="login.php" class="loginhere-link">Login here</a>
                    </p>
                </div>
            </div>
        </section>

    </div>
    <?php
    if(isset($_POST['name']) && $_POST['password'] && $_POST['re_password'])
    {
        if($_POST['password']==$_POST['re_password'])
        {
            $user->addUser($_POST['name'],$_POST['password']);
            header("location:login.php");
        }
        else
        {
            echo "<script>swal({title: 'Đăng ký thất bại!',text:'Xin mời nhập lại' ,icon: 'error',});</script>";
        }
    }
    ?>
    <!-- JS -->
    <script src="public/register/vendor/jquery/jquery.min.js"></script>
    <script src="public/register/js/main.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>