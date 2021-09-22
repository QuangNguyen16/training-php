<?php

session_start();

include "./config/database.php";
include "./model/db.php";
include "./model/product.php";
require "./model/manufacturess.php";
require "./model/prototype.php";
require "./../model/user.php";

//update product

if(isset($_POST['name']) && $_GET['p'] )
{
$product=new Product;
$suaproduct=$product->GetProductByID($_GET['p']);
//xem neu ma co anh roi thi gan gia tri anh vao 
if(!($_FILES["fileUpload"]['name']==""))
{
    $image=$_FILES["fileUpload"]['name'];
}
//con chua gan anh vao thi lay anh cu trc do
else
{
    $image=$suaproduct[0]["image"];
}

//di chuyen file image vao thu muc image
move_uploaded_file($_FILES['fileUpload']['tmp_name'],'./public/images/' . $_FILES['fileUpload']['name']);

$product->UpdateProduct($_POST['name'],$_POST['price'],$image,$_POST['description'],$_POST['manu_id'],$_POST['type_id'],$_GET['p']);
header("location:index.php");
}
//update manu
else if(isset($_POST['manu_name']) && $_GET['id'])
{
    $manu=new Manufacturess;
    $suamuna=$manu->GetManuByID($_GET['id']);

    if(!($_FILES["fileUpload"]['name']==""))
    {
        $image=$_FILES["fileUpload"]['name'];
    }
    else
    {
        $image=$suamuna[0]['manu_img'];
    }
    
    //di chuyen file 
    move_uploaded_file($_FILES['fileUpload']['tmp_name'],'./public/images/'.$_FILES['fileUpload']['name']);

    $manu->UpdateManu($_POST['manu_ID'],$_POST['manu_name'],$image,$_GET['id']);
    header("location:manufactures.php");
}

//update protype
else if(isset($_POST['type_name']) && $_GET['t'])
{
    $protype=new Protype;
    $suaprotype=$protype->getProtypeByID($_GET['t']);



    if(!($_FILES["fileUpload"]['name']==""))
    {
        $image=$_FILES["fileUpload"]['name'];
    }
    else
    {
        $image=$suamuna[0]['manu_img'];
    }
    
    //di chuyen file 
    move_uploaded_file($_FILES['fileUpload']['tmp_name'],'./public/images/'.$_FILES['fileUpload']['name']);
    
    $protype->UpdateProtype($_POST['type_ID'],$_POST['type_name'], $image,$_GET['t']);
    header("location:protype.php");
}
else if(isset($_GET['user']) && $_POST['username'])
{
    $user=new User;

    $userbyid=$user->UpdateUser($_POST['username'],$_POST['password'],$_POST['type_id'],$_GET['user']);

    header("location:user.php");

}
else{
    header("location:index.php");
}
?>