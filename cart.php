<?php
session_start();
include "config/database.php";
include "model/db.php";
include "model/product.php";
include "model/user.php";
include "model/cart_user.php";

if(empty($_SESSION['user']) || $_SESSION['user'][0]['type_user']=="admin")
{
        header("location:login.php");
}
    //id
if(isset($_SESSION['user']))
{
        $IdUser=$_SESSION['user'][0]['ID'];
}
if(isset($_GET['id']))
{
    $id=$_GET['id']-1;
    $product=new products;
    $getproduct=$product->GetAll();
if(empty($_SESSION['cart'][$IdUser][$id]))
{
        $getproduct[$id]['qty']=1;
        $_SESSION['cart'][$IdUser][$id]=$getproduct[$id];    
}
else
{
    if(array_key_exists($id,$_SESSION['cart'][$IdUser]))
    {
        $_SESSION['cart'][$IdUser][$id]['qty']+=1;
    }
}
}
var_dump($_SESSION['cart'][$IdUser][$id]);

$user_cart=new cart_user;

$getname=new products;

$user=new User;
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Exe6</title>
    <link rel="stylesheet" href="public/css/style.css">
    <link rel="stylesheet" href="public/css/bootstrap.min.css">
    <script src="public/js/jquery-3.3.1.min.js"></script>
    <script src="public/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
        integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
</head>

<body>
    <!--header-->
    <header>
        <!--cart-->
        <div class="container">
            <div class="cart">

                <?php if(isset($_SESSION['user'])) {?>
                <!--khi dang nhap la user-->
                <?php if($_SESSION['user'][0]['type_user']=='user') { ?>

                <h5>Xin chào:<?php echo $_SESSION['user'][0]['username'] ?></h5>
                <a href="logout.php?p=user">Đăng xuất</a>   

                <!--khi dang nhap la admin-->
                <?php }else if($_SESSION['user'][0]['type_user']=='admin') {?>

                <h5>Xin chào:<?php echo $_SESSION['user'][0]['username'] ?></h5>
                <a href="mobileadmin/index.php"><p>Chỉnh sửa</p> </a>
                <a href="logout.php?p=user"><p>Đăng xuất</p></a>  

                <?php } ?>
                 <!--khi chua dang nhap-->
                <?php }else{ ?>

                <a href="login.php?p=<?php echo $_GET['p'] ?>">Đăng nhập</a>

                <?php } ?>
            </div>
        </div>
        <!--end cart-->
        <!--navbar-->
        <div class="container">
            <nav class="navbar navbar-expand-sm navbar-light bg-pink">
            <div class="logo"><a href="index.php"><img class="img-fluid" src="public/images/logo_fnc.jpg" style="width: 200px; height: 100px;"></a></div>
                <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse"
                    data-target="#collapsibleNavId" aria-controls="collapsibleNavId" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="collapsibleNavId">
                    <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
                        <li class="nav-item active">
                            <a id="home" class="nav-link" href="index.php">HOME<span class="sr-only">(current)</span></a>
                        </li>
                        <?php

                        $showmenu=$getname->GetName();
                        foreach($showmenu as $key){
                        ?>
                        <li class="nav-item">
                            <a id="a1" class="nav-link" href="manu.php?p=<?php echo $key['manu_ID'] ?>"><?php echo $key['manu_name'] ?></a>
                        </li>
                        <?php } ?>
                    </ul>
                </div>
            </nav>
        </div>
        <div class="container">
            <div class="cart" style="margin-top:100px">
            <!--end navbar-->
            <!--banner-->
                <center>
                    <table border="1">
                    <?php
                    if(isset($_SESSION['cart'][$IdUser]) && count($_SESSION['cart'][$IdUser])>=1){?>
                    <a href="delete.php?p=all"><h5 style="margin-left:500px;">Xóa tất cả</h5></a> 
                    <tr> 
                    <th>Name</th>
                    <th>Giá</th>
                    <th>Số lượng</th>
                    <th>Deleted </th>
                    </tr>
                    <?php foreach($_SESSION['cart'][$IdUser] as $value) {  ?>
                    <tr>
                    <td><a href="detail.php?id=<?php echo $value['id'] ?>"><?php echo $value['name']?></a></td>
                    <td><?php echo $value['price'] ?></td>
                    <td><?php echo $value['qty']   ?></td>
                    <td> <a href="delete.php?id=<?php echo $value['id'] ?>">Delete </a></td>
                    <?php } 
                    }else {
                     echo "<h1>KHÔNG CÓ SẢN PHẨM NÀO CẢ ! </h1>";
                     $user_cart->DelCartUser($IdUser);
                    }
                     ?>
                   </tr>
                   </table>
               </center>
           </div>
       </div>
        <!--end banner-->
    </header>
    <!--end header-->
    <!--content-->
    <!--end content-->
    <?php
    //update user_cart

    if(isset($_SESSION['cart'][$IdUser])){
    $name="";
    $price=0;
    $qty=0;
    foreach($_SESSION['cart'][$IdUser] as $value){
        $qty+=$value['qty'];
    }
    foreach($_SESSION['cart'][$IdUser] as $value){
        $arr=explode(" ",$value['name']);
        $name.=implode(" ",$arr)." (".$value['qty'].")"."\n";
    }
    foreach($_SESSION['cart'][$IdUser] as $value){
        $price+=$value['price'];
    }

    if(array_key_exists($IdUser,$_SESSION['cart']))
    {
        $addcart=$user_cart->addtocart($IdUser,$_SESSION['user'][0]['username'],$name,$price,$qty);
        $addcart=$user_cart->updatetocard($name,$price,$qty,$IdUser);  
    }
    if(count($_SESSION['cart'][$IdUser])<=0)
    {
       
    }
}
    ?>
</body>
</html>