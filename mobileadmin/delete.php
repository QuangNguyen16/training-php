<?php 
require "./config/database.php";
require "./model/Db.php";
require "./model/manufacturess.php";
require "./model/product.php";
require "./model/prototype.php";
require "./../model/user.php";
//deleted manu
if(isset($_GET['id'])){
    $manufacturess= new Manufacturess;
    $id=$_GET['id'];
    $deteleManufactures =$manufacturess->deteleManufactures($id);
    header("location:manufactures.php");
}
//deleted product
else if(isset($_GET['p']))
{
$product= new Product;
$id=$_GET['p'];
$product->DeletedProduct($id);
header("location:index.php");
}   
else if(isset($_GET['t']))
{
$protype=new Protype;
$id=$_GET['t'];
$protype->DeleteProtype($_GET['t']);
header("location:protype.php");
}
else if(isset($_GET['user']))
{
  $deluser=new User;
  $deluser->DelUser($_GET['user']);
  header("location:user.php");
}
else 
{
header("location:index.php");
}

