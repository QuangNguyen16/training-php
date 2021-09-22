<?php
session_start();    

if(isset($_SESSION['user'][0]['ID']))
{
$IdUser=$_SESSION['user'][0]['ID'];
}

if(isset($_SESSION['user']))
{
    $IdUser=$_SESSION['user'][0]['ID'];
}

if(isset($_GET['p']) && $_GET['p']=="all")
{
    unset($_SESSION['cart'][$IdUser]);
    header("location:cart.php");
}
else if(isset($_GET['id']))
{
   $id=$_GET['id']-1;
   unset($_SESSION['cart'][$IdUser][$id]);
   header("location:cart.php");
}
else
{
    header("location:index.php");
}
?>