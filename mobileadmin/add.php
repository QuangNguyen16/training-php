
<?php
session_start();
include "./config/database.php";
include "./model/db.php";
include "./model/product.php";
require "./model/manufacturess.php";
require "./model/prototype.php";

//add product
if(isset($_POST['name']) && $_POST['price'] &&  $_POST['description'])
{
    if(is_int($_POST['price'])==false)
    {
        $_SESSION['mess']=1;
        header("location:form.php");
    }
    $product=new Product;
    move_uploaded_file($_FILES["fileUpload"]['tmp_name'],'./public/images/'.$_FILES["fileUpload"]['name']);
    $product->AddProduct($_POST['name'],$_POST['price'],$_FILES["fileUpload"]['name'],$_POST['description'],$_POST['manu_id'],$_POST['type_id']);
    header("location:index.php");
}
//add manu
else if(isset($_POST['manu_name']))
{
    $manu=new Manufacturess;
    move_uploaded_file($_FILES["fileUpload"]['tmp_name'],'./public/images/'.$_FILES["fileUpload"]['name']);
    $manu->AddManu($_POST['manu_name'],$_FILES["fileUpload"]['name']);
    header("location:manufactures.php");
}
else if(isset($_POST['type_name']))
{
    $protype=new Protype;
    move_uploaded_file($_FILES["fileUpload"]['tmp_name'],'./public/images/'.$_FILES["fileUpload"]['name']);
    $protype->AddProtype($_POST['type_name'],$_FILES["fileUpload"]['name']);
    header("location:protype.php");
}
else
{
    echo "Yeu cau nhap day du !";
}
?>