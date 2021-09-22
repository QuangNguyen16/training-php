<?php
session_start();

if(isset($_GET['p']) && $_GET['p']=='user')
{
unset($_SESSION['user']);
header("location:index.php");
}
else {
    header("location:index.php");
}
?>