<?php
session_start();
include "config/database.php";
include "model/db.php";
include "model/product.php";

if(empty($_GET['id']))
{
    header("location:index.php");
}

if(isset($_SESSION['user'][0]['ID']))
{
$IdUser=$_SESSION['user'][0]['ID'];
$totalmoney=0;
$qty=0;
//tinh tong tien 
    if(isset($_SESSION['cart'][$IdUser]))
    {
        foreach($_SESSION['cart'][$IdUser] as $value)
        {
            $totalmoney+=($value['price']*$value['qty']);
            $qty+=$value['qty'];
        }

    }
}
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
                <p><?php if(isset($_SESSION['cart'])) {?> <?php echo $totalmoney." VNĐ" ?> (<?php echo $qty; ?> items)<i class="fas fa-shopping-cart"></i></p> <?php } ?>
                <a href="cart.php"><p>Xem giỏ hàng</p></a>
                <a href="logout.php?p=user">Đăng xuất</a>   

                <!--khi dang nhap la admin-->
                <?php }else if($_SESSION['user'][0]['type_user']=='admin') {?>

                <h5>Xin chào:<?php echo $_SESSION['user'][0]['username'] ?></h5>
                <a href="mobileadmin/index.php"><p>Chỉnh sửa</p> </a>
                <a href="logout.php?p=user"><p>Đăng xuất</p></a>  

                <?php } ?>
                 <!--khi chua dang nhap-->
                <?php }else{ ?>

                <a href="login.php">Đăng nhập</a>

                <?php } ?>
            </div>
        </div>
        <!--end cart-->
        <!--navbar-->
        <div class="container">
            <nav class="navbar navbar-expand-sm navbar-light bg-pink">
                <div class="logo"><a href="index.php"><img class="img-fluid" src="public/images/logo.png" alt=""></a></div>
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
                        $getname=new products;
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
        <!--end navbar-->
        <!--banner-->
       
        <!--end banner-->
    </header>
    <!--end header-->
    <!--content-->
    <div class="content">
        <h1>Chi tiết sản phẩm</h1>
        <div class="container">
            <!--line 1 -->
           
            <div class="row">
            <?php
            $id=$_GET['id'];
            $product=new products;
            if(isset($id))
            {
            $productaddtocard=$product->GetProductByID($id);
        }
            ?>
                <div class="col-md-12">
                    <div class="item">
                        <div class="product"><img class="img-fluid" src="public/images/<?php echo $productaddtocard[0]['image'] ?>" width="180px" ></div>
                        <p style=text-align:center;><strong ><?php echo $productaddtocard[0]['name']?></strong><span class="star"><i class="fas fa-star"></i><i
                         class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i
                         class="fas fa-star"></i></span><br><span class="comment"><?php echo  "<br/>".$productaddtocard[0]['description']?></span>
                        </p>
                        <div class="row cost">
                            <div class="col-md-9">
                                <p><strong><?php echo $productaddtocard[0]['price'] ?></strong></p>
                            </div>
                            <div class="col-md-3">
                                <a href="cart.php?id=<?php echo $productaddtocard[0]['id'] ?>">ADD TO CART</a>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
     
        </div>
        
    </div>
    <!--end content-->
    <footer>
		<div class="container">
			<div class="f1">
				
				<form action="">
					<span class="icon"><i class="fas fa-envelope"></i></span>
					<input id="email" type="text" value="Enter your email address">
					<input id="join" type="submit" value="Join Us">
				</form>
			</div>
		</div>
    <div class="f2">
        <p>&copy; 2016 FIT TDC</p>
    </div>
	</footer>
</body>
</html>