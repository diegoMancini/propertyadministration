<%@ page import="propertyAdmin.operations.DatabaseOps" %><%--
  Created by IntelliJ IDEA.
  User: diego
  Date: 4/5/2018
  Time: 3:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- Tell the browser to be responsive to screen width -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<!-- Favicon icon -->
	<link rel="icon" type="image/png" sizes="16x16" href="../assets/images/favicon.png">
	<title>P.A. - Nueva propiedad</title>
	<!-- Custom CSS -->
	<link rel="stylesheet" href="../assets/node_modules/dropify/dist/css/dropify.min.css">
	<link href="../assets/node_modules/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.css" rel="stylesheet" />
	<link href="dist/css/style.min.css" rel="stylesheet">
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]--></head>

<body class="skin-blue fixed-layout">
<!-- ============================================================== -->
<!-- Preloader - style you can find in spinners.css -->
<!-- ============================================================== -->
<div class="preloader">
	<div class="loader">
		<div class="loader__figure"></div>
		<p class="loader__label">Elite realestate</p>
	</div>
</div>
<!-- ============================================================== -->
<!-- Main wrapper - style you can find in pages.scss -->
<!-- ============================================================== -->
<div id="main-wrapper">
	<!-- ============================================================== -->
	<!-- Topbar header - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<header class="topbar">
		<nav class="navbar top-navbar navbar-expand-md navbar-dark">
			<!-- ============================================================== -->
			<!-- Logo -->
			<!-- ============================================================== -->
			<div class="navbar-header">
				<a class="navbar-brand" href="home.jsp">
					<!-- Logo icon --><b>
					<!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
					<!-- Dark Logo icon -->
					<img src="../assets/images/logo-icon.png" alt="homepage" class="dark-logo" />
					<!-- Light Logo icon -->
					<img src="../assets/images/logo-light-icon.png" alt="homepage" class="light-logo" />
				</b>
					<!--End Logo icon -->
					<span class="hidden-xs"><span class="font-bold">elite</span>realestate</span>
				</a>
			</div>
			<!-- ============================================================== -->
			<!-- End Logo -->
			<!-- ============================================================== -->
			<div class="navbar-collapse">
				<!-- ============================================================== -->
				<!-- toggle and nav items -->
				<!-- ============================================================== -->
				<ul class="navbar-nav mr-auto">
					<!-- This is  -->
					<li class="nav-item"> <a class="nav-link nav-toggler d-block d-md-none waves-effect waves-dark" href="javascript:void(0)"><i class="ti-menu"></i></a> </li>
					<li class="nav-item"> <a class="nav-link sidebartoggler d-none d-lg-block d-md-block waves-effect waves-dark" href="javascript:void(0)"><i class="icon-menu"></i></a> </li>
					<!-- ============================================================== -->
					<!-- Search -->
					<!-- ============================================================== -->
					<li class="nav-item">
						<form class="app-search d-none d-md-block d-lg-block">
							<input type="text" class="form-control" placeholder="Buscar...">
						</form>
					</li>
				</ul>
				<!-- ============================================================== -->
				<!-- User profile and search -->
				<!-- ============================================================== -->
				<ul class="navbar-nav my-lg-0">
					<!-- User Profile -->
					<!-- ============================================================== -->
					<li class="nav-item dropdown u-pro">
						<a class="nav-link dropdown-toggle waves-effect waves-dark profile-pic" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="../assets/images/users/default.jpg" alt="user" class=""> <span class="hidden-md-down"> <%=DatabaseOps.getInstance().getAccount(request.getRemoteUser()).getUsername()%> &nbsp;<i class="fa fa-angle-down"></i></span> </a>
						<div class="dropdown-menu dropdown-menu-right animated flipInY">
							<!-- text-->
							<a href="/propertyadmin/profile.jsp" class="dropdown-item"><i class="ti-user"></i> Mi perfil</a>
							<!-- text-->
							<a href="javascript:void(0)" class="dropdown-item"><i class="ti-wallet"></i> Mi balance</a>
							<!-- text-->
							<div class="dropdown-divider"></div>
							<!-- text-->
							<a href="javascript:void(0)" class="dropdown-item"><i class="ti-settings"></i> Ajustes</a>
							<!-- text-->
							<div class="dropdown-divider"></div>
							<!-- text-->
							<a href="logout.jsp" class="dropdown-item"><i class="fa fa-power-off"></i> Cerrar sesion</a>
							<!-- text-->
						</div>
					</li>
					<!-- ============================================================== -->
					<!-- End User Profile -->
					<!-- ============================================================== -->
					<li class="nav-item right-side-toggle"> <a class="nav-link  waves-effect waves-light" href="javascript:void(0)"><i class="ti-settings"></i></a></li>
				</ul>
			</div>
		</nav>
	</header>
	<!-- ============================================================== -->
	<!-- End Topbar header -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- Left Sidebar - style you can find in sidebar.scss  -->
	<!-- ============================================================== -->
	<aside class="left-sidebar">
		<!-- Sidebar scroll-->
		<div class="scroll-sidebar">
			<!-- Sidebar navigation-->
			<nav class="sidebar-nav">
				<ul id="sidebarnav">
					<%--has-arrow va antes de waves-effect --%>
					<li class="user-pro"> <a class="waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><img src="../assets/images/users/default.jpg" alt="user-img" class="img-circle"><span class="hide-menu"><%=DatabaseOps.getInstance().getAccount(request.getRemoteUser()).getName() + " " + DatabaseOps.getInstance().getAccount(request.getRemoteUser()).getSurname() %></span></a>
					</li>
					<li> <a class="waves-effect waves-dark" href="home.jsp"><i class="icon-speedometer"></i><span class="hide-menu">Inicio</span></a></li>
					<li> <a class="waves-effect waves-dark" href="properties.jsp"><i class="ti-home"></i><span class="hide-menu">Propiedades</span></a></li>
					<li> <a class="waves-effect waves-dark" href="functionalUnits.jsp"><i class="ti-layout"></i><span class="hide-menu">U. Funcionales</span></a></li>
					<li> <a class="waves-effect waves-dark" href="clients.jsp"><i class="ti-user"></i><span class="hide-menu">Clientes</span></a></li>
					<li><a class="waves-effect waves-dark" href="balance.jsp"><i class="ti-wallet"></i> <span class="hide-menu">Mi balance</span></a></li>
					<li> <a class="waves-effect waves-dark" href="profile.jsp"><i class="ti-user"></i><span class="hide-menu">Mi perfil</span></a> </li>
					<li> <a class="waves-effect waves-dark" href="faqs.jsp" aria-expanded="false"><i class="fa fa-circle-o text-info"></i><span class="hide-menu">Preguntas</span></a></li>
					<li> <a class="waves-effect waves-dark" href="logout.jsp" aria-expanded="false"><i class="fa fa-circle-o text-success"></i><span class="hide-menu">Cerrar sesion</span></a></li>
				</ul>
			</nav>
			<!-- End Sidebar navigation -->
		</div>
		<!-- End Sidebar scroll-->
	</aside>
	<!-- ============================================================== -->
	<!-- End Left Sidebar - style you can find in sidebar.scss  -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- Page wrapper  -->
	<!-- ============================================================== -->
	<div class="page-wrapper">
		<!-- ============================================================== -->
		<!-- Container fluid  -->
		<!-- ============================================================== -->
		<div class="container-fluid">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<div class="row page-titles">
				<div class="col-md-5 align-self-center">
					<h4 class="text-themecolor">Nueva propiedad</h4>
				</div>
				<div class="col-md-7 align-self-center text-right">
					<div class="d-flex justify-content-end align-items-center">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="home.jsp">Inicio</a></li>
							<li class="breadcrumb-item active">Nueva Propiedad</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Start Page Content -->
			<!-- ============================================================== -->
			<!-- .row -->
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-body">
							<form class="pro-add-form" action="/addProperty" method="post">
								<div class="form-group">
									<label for="propertyName">Nombre de la propiedad</label>
									<input type="text" class="form-control" name="propertyName" id="propertyName" placeholder="Nombre"> </div>
								<div class="form-group">
									<label for="propertyDescription">Property Description</label>
									<textarea class="form-control" rows="5" id="propertyDescription" name="propertyDescription" placeholder="Enter Description"></textarea>
								</div>
								<div class="form-group">
									<label for="plocation">Property Location</label>
									<input type="email" class="form-control" id="plocation" placeholder="Enter Location"> </div>
								<div class="form-group">
									<label class="control-label">Property For</label>
									<div class="col-md-9">
										<div class="row">
											<div class="custom-control custom-radio">
												<input type="radio" id="customRadio3" name="member" class="custom-control-input">
												<label class="custom-control-label" for="customRadio3">For Rent</label>
											</div>
											<div class="custom-control custom-radio m-l-15">
												<input type="radio" id="customRadio4" name="member" class="custom-control-input">
												<label class="custom-control-label" for="customRadio4">For Sale</label>
											</div>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="plocation">Price / Rent</label>
									<input type="email" class="form-control" id="plocation" placeholder="Enter Number"> </div>
								<div class="form-group">
									<label for="paddress">Property Address</label>
									<textarea class="form-control" rows="3" id="paddress"></textarea>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-sm-4">
											<label for="tch1">Bedrooms</label>
											<input id="tch1" type="text" value="" name="tch1" data-bts-button-down-class="btn btn-secondary btn-outline" data-bts-button-up-class="btn btn-secondary btn-outline">
										</div>
										<div class="col-sm-4">
											<label for="tch2">Garages</label>
											<input id="tch2" type="text" value="" name="tch2" data-bts-button-down-class="btn btn-secondary btn-outline" data-bts-button-up-class="btn btn-secondary btn-outline"> </div>
										<div class="col-sm-4">
											<label for="tch3">Bathrooms</label>
											<input id="tch3" type="text" value="" name="tch3" data-bts-button-down-class="btn btn-secondary btn-outline" data-bts-button-up-class="btn btn-secondary btn-outline"> </div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-sm-4">
											<label for="tch4">Full Bath</label>
											<input id="tch4" type="text" value="" name="tch4" data-bts-button-down-class="btn btn-secondary btn-outline" data-bts-button-up-class="btn btn-secondary btn-outline">
										</div>
										<div class="col-sm-4">
											<label for="tch5">Half Bath</label>
											<input id="tch5" type="text" value="" name="tch5" data-bts-button-down-class="btn btn-secondary btn-outline" data-bts-button-up-class="btn btn-secondary btn-outline"> </div>
										<div class="col-sm-4">
											<label for="psqft">Square Ft</label>
											<input type="text" class="form-control" id="psqft"> </div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-sm-4">
											<label for="pyear">Year Built</label>
											<select class="form-control custom-select" id="pyear">
												<option value="0" disabled selected>Year</option>
												<option value="1">2015</option>
												<option value="2">2017</option>
											</select>
										</div>
										<div class="col-sm-4">
											<label for="style">Style</label>
											<select class="form-control custom-select" id="style">
												<option value="0" disabled selected>Style</option>
												<option value="1">Bi-level</option>
												<option value="2">Tri-level</option>
											</select>
										</div>
										<div class="col-sm-4">
											<label for="status">Status</label>
											<select class="form-control custom-select" id="status">
												<option value="0" disabled selected>Status</option>
												<option value="1">Active</option>
												<option value="2">Inactive</option>
											</select>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-sm-4">
											<label for="type">Type</label>
											<select class="form-control custom-select" id="type">
												<option value="0" disabled selected>Type</option>
												<option value="1">Single</option>
												<option value="2">Double</option>
											</select>
										</div>
										<div class="col-sm-4">
											<label for="subdiv">Subdivision</label>
											<select class="form-control custom-select" id="subdiv">
												<option value="0" disabled selected>Subdivision</option>
												<option value="1">Matindale</option>
												<option value="2">citadel</option>
											</select>
										</div>
										<div class="col-sm-4">
											<label for="city">City</label>
											<select class="form-control custom-select" id="city">
												<option value="0" disabled selected>City</option>
												<option value="1">Ahmedabad</option>
												<option value="2">Mountain View</option>
											</select>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label>Amenities</label>
									<div class="row">
										<div class="col-sm-4">
											<div class="custom-control custom-checkbox">
												<input type="checkbox" class="custom-control-input" id="customCheck1">
												<label class="custom-control-label" for="customCheck1"> Private Space </label>
											</div>
											<div class="custom-control custom-checkbox">
												<input type="checkbox" class="custom-control-input" id="customCheck2">
												<label class="custom-control-label" for="customCheck2"> Wifi</label>
											</div>
											<div class="custom-control custom-checkbox">
												<input type="checkbox" class="custom-control-input" id="customCheck3">
												<label class="custom-control-label" for="customCheck3"> Basketball Court</label>
											</div>
										</div>
										<div class="col-sm-4">
											<div class="custom-control custom-checkbox">
												<input type="checkbox" class="custom-control-input" id="customCheck4">
												<label class="custom-control-label" for="customCheck4"> Fireplace </label>
											</div>
											<div class="custom-control custom-checkbox">
												<input type="checkbox" class="custom-control-input" id="customCheck5">
												<label class="custom-control-label" for="customCheck5"> Doorman</label>
											</div>
											<div class="custom-control custom-checkbox">
												<input type="checkbox" class="custom-control-input" id="customCheck6">
												<label class="custom-control-label" for="customCheck6"> Swimming Pool</label>
											</div>
										</div>
										<div class="col-sm-4">
											<div class="custom-control custom-checkbox">
												<input type="checkbox" class="custom-control-input" id="customCheck7">
												<label class="custom-control-label" for="customCheck7"> Gym </label>
											</div>
											<div class="custom-control custom-checkbox">
												<input type="checkbox" class="custom-control-input" id="customCheck8">
												<label class="custom-control-label" for="customCheck8"> Parking</label>
											</div>
											<div class="custom-control custom-checkbox">
												<input type="checkbox" class="custom-control-input" id="customCheck9">
												<label class="custom-control-label" for="customCheck9"> laundry</label>
											</div>
										</div>
									</div>
								</div>
								<h5 class="card-title">Dimensions</h5>
								<hr>
								<div class="form-group">
									<div class="row">
										<div class="col-sm-4">
											<label for="diningroom">Dining Room</label>
											<input type="text" class="form-control" id="diningroom" data-mask="99x99"> </div>
										<div class="col-sm-4">
											<label for="kitchen">Kitchen</label>
											<input type="text" class="form-control" id="kitchen" data-mask="99x99"> </div>
										<div class="col-sm-4">
											<label for="livingroom">Living Room</label>
											<input type="text" class="form-control" id="livingroom" data-mask="99x99"> </div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-sm-4">
											<label for="mbedroom">Master Bedroom</label>
											<input type="text" class="form-control" id="mbedroom" data-mask="99x99"> </div>
										<div class="col-sm-4">
											<label for="bed2">Bedroom 2</label>
											<input type="text" class="form-control" id="bed2" data-mask="99x99"> </div>
										<div class="col-sm-4">
											<label for="otherroom">Other Room</label>
											<input type="text" class="form-control" id="otherroom" data-mask="99x99"> </div>
									</div>
								</div>
								<div class="form-group">
									<label for="input-file-now">Upload Files</label>
									<input type="file" id="input-file-now" class="dropify" />
								</div>
								<button type="submit" class="btn btn-success waves-effect waves-light m-r-10">Add Property</button>
								<button type="submit" class="btn btn-dark waves-effect waves-light">Cancel</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- .row -->
			<!-- ============================================================== -->
			<!-- End PAge Content -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Right sidebar -->
			<!-- ============================================================== -->
			<!-- .right-sidebar -->
			<div class="right-sidebar">
				<div class="slimscrollright">
					<div class="rpanel-title"> Service Panel <span><i class="ti-close right-side-toggle"></i></span> </div>
					<div class="r-panel-body">
						<ul id="themecolors" class="m-t-20">
							<li><b>With Light sidebar</b></li>
							<li><a href="javascript:void(0)" data-skin="skin-default" class="default-theme">1</a></li>
							<li><a href="javascript:void(0)" data-skin="skin-green" class="green-theme">2</a></li>
							<li><a href="javascript:void(0)" data-skin="skin-red" class="red-theme">3</a></li>
							<li><a href="javascript:void(0)" data-skin="skin-blue" class="blue-theme working">4</a></li>
							<li><a href="javascript:void(0)" data-skin="skin-purple" class="purple-theme">5</a></li>
							<li><a href="javascript:void(0)" data-skin="skin-megna" class="megna-theme">6</a></li>
							<li class="d-block m-t-30"><b>With Dark sidebar</b></li>
							<li><a href="javascript:void(0)" data-skin="skin-default-dark" class="default-dark-theme ">7</a></li>
							<li><a href="javascript:void(0)" data-skin="skin-green-dark" class="green-dark-theme">8</a></li>
							<li><a href="javascript:void(0)" data-skin="skin-red-dark" class="red-dark-theme">9</a></li>
							<li><a href="javascript:void(0)" data-skin="skin-blue-dark" class="blue-dark-theme">10</a></li>
							<li><a href="javascript:void(0)" data-skin="skin-purple-dark" class="purple-dark-theme">11</a></li>
							<li><a href="javascript:void(0)" data-skin="skin-megna-dark" class="megna-dark-theme ">12</a></li>
						</ul>
						<ul class="m-t-20 chatonline">
							<li><b>Chat option</b></li>
							<li>
								<a href="javascript:void(0)"><img src="../assets/images/users/1.jpg" alt="user-img" class="img-circle"> <span>Varun Dhavan <small class="text-success">online</small></span></a>
							</li>
							<li>
								<a href="javascript:void(0)"><img src="../assets/images/users/2.jpg" alt="user-img" class="img-circle"> <span>Genelia Deshmukh <small class="text-warning">Away</small></span></a>
							</li>
							<li>
								<a href="javascript:void(0)"><img src="../assets/images/users/3.jpg" alt="user-img" class="img-circle"> <span>Ritesh Deshmukh <small class="text-danger">Busy</small></span></a>
							</li>
							<li>
								<a href="javascript:void(0)"><img src="../assets/images/users/4.jpg" alt="user-img" class="img-circle"> <span>Arijit Sinh <small class="text-muted">Offline</small></span></a>
							</li>
							<li>
								<a href="javascript:void(0)"><img src="../assets/images/users/5.jpg" alt="user-img" class="img-circle"> <span>Govinda Star <small class="text-success">online</small></span></a>
							</li>
							<li>
								<a href="javascript:void(0)"><img src="../assets/images/users/6.jpg" alt="user-img" class="img-circle"> <span>John Abraham<small class="text-success">online</small></span></a>
							</li>
							<li>
								<a href="javascript:void(0)"><img src="../assets/images/users/7.jpg" alt="user-img" class="img-circle"> <span>Hritik Roshan<small class="text-success">online</small></span></a>
							</li>
							<li>
								<a href="javascript:void(0)"><img src="../assets/images/users/8.jpg" alt="user-img" class="img-circle"> <span>Pwandeep rajan <small class="text-success">online</small></span></a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- End Right sidebar -->
			<!-- ============================================================== -->
		</div>
		<!-- ============================================================== -->
		<!-- End Container fluid  -->
		<!-- ============================================================== -->
	</div>
	<!-- ============================================================== -->
	<!-- End Page wrapper  -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- footer -->
	<!-- ============================================================== -->
	<footer class="footer">
		© 2018 Eliteadmin by themedesigner.in
	</footer>
	<!-- ============================================================== -->
	<!-- End footer -->
	<!-- ============================================================== -->
</div>
<!-- ============================================================== -->
<!-- End Wrapper -->
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- All Jquery -->
<!-- ============================================================== -->
<script src="../assets/node_modules/jquery/jquery-3.2.1.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="../assets/node_modules/popper/popper.min.js"></script>
<script src="../assets/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- slimscrollbar scrollbar JavaScript -->
<script src="dist/js/perfect-scrollbar.jquery.min.js"></script>
<!--Wave Effects -->
<script src="dist/js/waves.js"></script>
<!--Menu sidebar -->
<script src="dist/js/sidebarmenu.js"></script>
<!--Custom JavaScript -->
<script src="dist/js/custom.min.js"></script>
<script src="dist/js/pages/mask.js"></script>
<script src="../assets/node_modules/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.js" type="text/javascript"></script>
<!-- jQuery file upload -->
<script src="../assets/node_modules/dropify/dist/js/dropify.min.js"></script>
<script>
    $("input[name='tch1']").TouchSpin();
    $("input[name='tch2']").TouchSpin();
    $("input[name='tch3']").TouchSpin();
    $("input[name='tch4']").TouchSpin();
    $("input[name='tch5']").TouchSpin();
    $('.dropify').dropify();
</script>
<script type="text/javascript">
    jQuery.browser = {};
    (function() {
        jQuery.browser.msie = false;
        jQuery.browser.version = 0;
        if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
            jQuery.browser.msie = true;
            jQuery.browser.version = RegExp.$1;
        }
    })();
</script>
</body>

</html>
