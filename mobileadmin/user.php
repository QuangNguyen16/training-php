<?php 
require "./config/database.php";
require "./model/db.php";
require "./../model/user.php";
$user=new User;

$showuser=$user->getAll();
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Mobile Admin</title>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="public/css/bootstrap.min.css" />
	<link rel="stylesheet" href="public/css/bootstrap-responsive.min.css" />
	<link rel="stylesheet" href="public/css/uniform.css" />
	<link rel="stylesheet" href="public/css/select2.css" />
	<link rel="stylesheet" href="public/css/matrix-style.css" />
	<link rel="stylesheet" href="public/css/matrix-media.css" />
	<link href="public/font-awesome/css/font-awesome.css" rel="stylesheet" />
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
</head>
<body>

<!--Header-part-->
<div id="header">
	<h1><a href="dashboard.php">Dashboard</a></h1>
</div>
<!--close-Header-part-->

<!--top-Header-menu-->
<div id="user-nav" class="navbar navbar-inverse">
	<ul class="nav">
		<li  class="dropdown" id="profile-messages" ><a title="" href="form.php" data-toggle="dropdown" data-target="form.php profile-messages" class="dropdown-toggle"><i class="icon icon-user"></i>  <span class="text">Welcome Super Admin</span><b class="caret"></b></a>
			<ul class="dropdown-menu">
				<li><a href="form.php"><i class="icon-user"></i> My Profile</a></li>
				<li class="divider"></li>
				<li><a href="form.php"><i class="icon-check"></i> My Tasks</a></li>
				<li class="divider"></li>
				<li><a href="login.php"><i class="icon-key"></i> Log Out</a></li>
			</ul>
		</li>
		<li class="dropdown" id="menu-messages"><a href="form.php" data-toggle="dropdown" data-target="form.phpmenu-messages" class="dropdown-toggle"><i class="icon icon-envelope"></i> <span class="text">Messages</span> <span class="label label-important">5</span> <b class="caret"></b></a>
			<ul class="dropdown-menu">
				<li><a class="sAdd" title="" href="form.php"><i class="icon-plus"></i> new message</a></li>
				<li class="divider"></li>
				<li><a class="sInbox" title="" href="form.php"><i class="icon-envelope"></i> inbox</a></li>
				<li class="divider"></li>
				<li><a class="sOutbox" title="" href="form.php"><i class="icon-arrow-up"></i> outbox</a></li>
				<li class="divider"></li>
				<li><a class="sTrash" title="" href="form.php"><i class="icon-trash"></i> trash</a></li>
			</ul>
		</li>
		<li class=""><a title="" href="form.php"><i class="icon icon-cog"></i> <span class="text">Settings</span></a></li>
		<li><a href="logout.php?p=user"><i class="icon-key"></i> Log Out</a></li>
	</ul>
</div>

<!--start-top-serch-->
<div id="search">
	<form action="result.php" method="get">
	<input type="text" placeholder="Search here..." name="key"/>
	<button type="submit" class="tip-bottom" title="Search"><i class="icon-search icon-white"></i></button>
</form>
</div>
<!--close-top-serch-->

<!--sidebar-menu-->

<div id="sidebar"> <a href="form.php" class="visible-phone"><i class="icon icon-th"></i>Tables</a>
	<ul>
		<li><a href="../index.php"><i class="icon icon-home"></i> <span>Xem trang chủ</span></a> </li>
		<li><a href="index.php"><i class="icon icon-home"></i> <span>Product</span></a> </li>
		<li> <a href="manufactures.php"><i class="icon icon-th-list"></i> <span>Manu</span></a></li>
		<li> <a href="protype.php"><i class="icon icon-th-list"></i> <span>Protype</span></a></li>
		<li> <a href="user.php"><i class="icon icon-th-list"></i> <span>User</span></a></li>
	</ul>
</div>
<!-- BEGIN CONTENT -->
<div id="content">
	<div id="content-header">
		<div id="breadcrumb"> <a href="index.php" title="Go to Home" class="tip-bottom current"><i class="icon-home"></i> Home</a></div>
		<h1>User</h1>
	</div>
	<div class="container-fluid">
		<hr>
		<div class="row-fluid">
			<div class="span12">
				<div class="widget-box">
					<div class="widget-content nopadding">
						<table class="table table-bordered table-striped">
							<thead>
							<tr>
								<th>Tên user</th>
								<th>Mật khẩu user</th>
                                <th>Loại user</th>
                                <th>Action</th>
							</tr>
							</thead>
							<tbody>
                                <?php
								foreach($showuser as $value){
								?>
							<tr class="">
								<td> <?php echo $value['username']?> </td>
								<td> <?php echo $value['password']?> </td>
                                <td> <?php echo $value['type_user']?></td>
								<td>
								<a href="formedit_manager_user.php?user=<?php echo $value['ID'] ?>" class="btn btn-success btn-mini">Edit</a>
								<a href="delete.php?user=<?php echo $value['ID'] ?>" class="btn btn-danger btn-mini">Delete</a>
								</td>
							
							</tr>
								<?php } ?>
							

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- END CONTENT -->

<!--Footer-part-->
<div class="row-fluid">
	<div id="footer" class="span12"> 2017 &copy; TDC - Lập trình web 1</div>
</div>
<!--end-Footer-part-->
<script src="public/js/jquery.min.js"></script>
<script src="public/js/jquery.ui.custom.js"></script>
<script src="public/js/bootstrap.min.js"></script>
<script src="public/js/jquery.uniform.js"></script>
<script src="public/js/select2.min.js"></script>
<script src="public/js/jquery.dataTables.min.js"></script>
<script src="public/js/matrix.js"></script>
<script src="public/js/matrix.tables.js"></script>
</body>
</html>
