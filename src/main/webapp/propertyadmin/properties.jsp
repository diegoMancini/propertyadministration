<%@ page import="propertyAdmin.operations.DatabaseOps" %>
<%@ page import="java.util.List" %>
<%@ page import="propertyAdmin.structure.property.structure.Property" %>
<%@ page import="propertyAdmin.structure.persons.Account" %><%--
  Created by IntelliJ IDEA.
  User: diego
  Date: 4/5/2018
  Time: 3:08 AM
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
	<title>P.A. - Propiedades</title>
	<!-- Custom CSS -->
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
		<p class="loader__label">Elite admin</p>
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
					<!-- ============================================================== -->
					<!-- Comment -->
					<!-- ============================================================== -->
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="ti-email"></i>
							<div class="notify"> <span class="heartbit"></span> <span class="point"></span> </div>
						</a>
						<div class="dropdown-menu dropdown-menu-right mailbox animated bounceInDown">
							<ul>
								<li>
									<div class="drop-title">Notificaciones</div>
								</li>
								<li>
									<div class="message-center">
										<!-- Message -->
										<a href="javascript:void(0)">
											<div class="btn btn-danger btn-circle"><i class="fa fa-link"></i></div>
											<div class="mail-contnet">
												<h5>Luanch Admin</h5> <span class="mail-desc">Just see the my new admin!</span> <span class="time">9:30 AM</span> </div>
										</a>
										<!-- Message -->
										<a href="javascript:void(0)">
											<div class="btn btn-success btn-circle"><i class="ti-calendar"></i></div>
											<div class="mail-contnet">
												<h5>Event today</h5> <span class="mail-desc">Just a reminder that you have event</span> <span class="time">9:10 AM</span> </div>
										</a>
										<!-- Message -->
										<a href="javascript:void(0)">
											<div class="btn btn-info btn-circle"><i class="ti-settings"></i></div>
											<div class="mail-contnet">
												<h5>Settings</h5> <span class="mail-desc">You can customize this template as you want</span> <span class="time">9:08 AM</span> </div>
										</a>
										<!-- Message -->
										<a href="javascript:void(0)">
											<div class="btn btn-primary btn-circle"><i class="ti-user"></i></div>
											<div class="mail-contnet">
												<h5>Pavan kumar</h5> <span class="mail-desc">Just see the my admin!</span> <span class="time">9:02 AM</span> </div>
										</a>
									</div>
								</li>
								<li>
									<a class="nav-link text-center link" href="javascript:void(0);"> <strong>Check all notifications</strong> <i class="fa fa-angle-right"></i> </a>
								</li>
							</ul>
						</div>
					</li>
					<!-- ============================================================== -->
					<!-- End Comment -->
					<!-- ============================================================== -->
					<!-- ============================================================== -->
					<!-- Messages -->
					<!-- ============================================================== -->
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle waves-effect waves-dark" href="" id="2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="icon-note"></i>
							<div class="notify"> <span class="heartbit"></span> <span class="point"></span> </div>
						</a>
						<div class="dropdown-menu mailbox dropdown-menu-right animated bounceInDown" aria-labelledby="2">
							<ul>
								<li>
									<div class="drop-title">You have 4 new messages</div>
								</li>
								<li>
									<div class="message-center">
										<!-- Message -->
										<a href="javascript:void(0)">
											<div class="user-img"> <img src="../assets/images/users/1.jpg" alt="user" class="img-circle"> <span class="profile-status online pull-right"></span> </div>
											<div class="mail-contnet">
												<h5>Pavan kumar</h5> <span class="mail-desc">Just see the my admin!</span> <span class="time">9:30 AM</span> </div>
										</a>
										<!-- Message -->
										<a href="javascript:void(0)">
											<div class="user-img"> <img src="../assets/images/users/2.jpg" alt="user" class="img-circle"> <span class="profile-status busy pull-right"></span> </div>
											<div class="mail-contnet">
												<h5>Sonu Nigam</h5> <span class="mail-desc">I've sung a song! See you at</span> <span class="time">9:10 AM</span> </div>
										</a>
										<!-- Message -->
										<a href="javascript:void(0)">
											<div class="user-img"> <img src="../assets/images/users/3.jpg" alt="user" class="img-circle"> <span class="profile-status away pull-right"></span> </div>
											<div class="mail-contnet">
												<h5>Arijit Sinh</h5> <span class="mail-desc">I am a singer!</span> <span class="time">9:08 AM</span> </div>
										</a>
										<!-- Message -->
										<a href="javascript:void(0)">
											<div class="user-img"> <img src="../assets/images/users/4.jpg" alt="user" class="img-circle"> <span class="profile-status offline pull-right"></span> </div>
											<div class="mail-contnet">
												<h5>Pavan kumar</h5> <span class="mail-desc">Just see the my admin!</span> <span class="time">9:02 AM</span> </div>
										</a>
									</div>
								</li>
								<li>
									<a class="nav-link text-center link" href="javascript:void(0);"> <strong>See all e-Mails</strong> <i class="fa fa-angle-right"></i> </a>
								</li>
							</ul>
						</div>
					</li>
					<!-- ============================================================== -->
					<!-- End Messages -->
					<!-- ============================================================== -->
					<!-- ============================================================== -->
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
							<a href="/propertyadmin/landingpage.jsp" class="dropdown-item"><i class="fa fa-power-off"></i> Cerrar sesion</a>
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
					<li class="user-pro"> <a class="waves-effect waves-dark" href="home.jsp" aria-expanded="false"><img src="../assets/images/users/default.jpg" alt="user-img" class="img-circle"><span class="hide-menu"><%=DatabaseOps.getInstance().getAccount(request.getRemoteUser()).getName() + " " + DatabaseOps.getInstance().getAccount(request.getRemoteUser()).getSurname() %></span></a>
					</li>
					<li> <a class="waves-effect waves-dark" href="home.jsp"><i class="icon-speedometer"></i><span class="hide-menu">Inicio</span></a></li>
					<li> <a class="waves-effect waves-dark" href="properties.jsp"><i class="ti-home"></i><span class="hide-menu">Propiedades</span></a></li>
					<li> <a class="waves-effect waves-dark" href="functionalUnits.jsp"><i class="ti-layout"></i><span class="hide-menu">U. Funcionales</span></a></li>
					<li> <a class="waves-effect waves-dark" href="clients.jsp"><i class="ti-user"></i><span class="hide-menu">Clientes</span></a></li>
					<li><a class="waves-effect waves-dark" href="balance.jsp"><i class="ti-wallet"></i> <span class="hide-menu">Mi balance</span></a></li>
					<li> <a class="waves-effect waves-dark" href="profile.jsp"><i class="ti-user"></i><span class="hide-menu">Mi perfil</span></a> </li>
					<li> <a class="waves-effect waves-dark" href="faqs.jsp" aria-expanded="false"><i class="fa fa-circle-o text-info"></i><span class="hide-menu">Preguntas</span></a></li>
					<li> <a class="waves-effect waves-dark" href="landingpage.jsp" aria-expanded="false"><i class="fa fa-circle-o text-success"></i><span class="hide-menu">Cerrar sesion</span></a></li>
				</ul>
			</nav>
			<!-- End Sidebar navigation -->
		</div>
		<!-- End Sidebar scroll-->
	</aside>
	<!-- ============================================================== -->
	<!-- End Left Sidebar - style you can find in sidebar.scss  -->
	<!-- ============================================================== -->
	!-- ============================================================== -->
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
					<h4 class="text-themecolor">Propiedades</h4>
				</div>
				<div class="col-md-7 align-self-center text-right">
					<div class="d-flex justify-content-end align-items-center">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="home.jsp">Inicio</a></li>
							<li class="breadcrumb-item active">Propiedades</li>
						</ol>
						<button type="button" class="btn btn-info d-none d-lg-block m-l-15" href="addProperty.jsp"><i class="fa fa-plus-circle"></i> Nueva Propiedad</button>
					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Start Page Content -->
			<!-- ============================================================== -->
			<!-- row -->
			<div class="row">
				<%--<div class="row">--%>
					<div class="col-md-12">
						<div class="card">
							<div class="card-body">
								<h5 class="card-title">Filtrar</h5>
								<form role="form" class="row">
									<div class="col-sm-6 col-md-3">
										<div class="form-group has-info">
											<select class="form-control custom-select">
												<option value="" disabled selected>Estado</option>
												<option value="1">Disponible</option>
												<option value="2">No disponible</option>
											</select>
										</div>
									</div>
									<div class="col-sm-6 col-md-3">
										<div class="form-group has-info">
											<select class="form-control custom-select">
												<option value="" disabled selected>Tipo de propiedad</option>
												<option value="1">Vivienda</option>
												<option value="2">Local</option>
												<option value="3">Oficina</option>
												<option value="4">Garage</option>
											</select>
										</div>
									</div>
									<div class="col-sm-6 col-md-1">
										<button type="submit" class="btn btn-dark btn-block form-control"><i class="fa fa-search text-white"></i></button>
									</div>
								</form>
							</div>
						</div>
					</div>
				<%--</div>--%>
				<!-- column -->
				<div class="col-lg-12">
					<%List<Property> propertyList = DatabaseOps.getInstance().getAccountProperties(request.getRemoteUser());
						Account account = DatabaseOps.getInstance().getAccount(request.getRemoteUser());
					%>
						<%if (propertyList.size() > 0) {%>
						<%for (Property property: propertyList) {%>
							<%String name = property.getName();
							Integer fu = property.getFunctionalUnits().size();
							String nameAcc = account.getFullName();
							String addressAcc = account.getFullAddress();
							%>
							<!-- Property Items -->
							<div class="card">
								<!-- row -->
								<div class="row no-gutters">
									<div class="col-md-4" style="background: url('../assets/images/property/prop1.jpeg') center center / cover no-repeat; min-height:250px;">
									</div>
									<!-- column -->
									<div class="col-md-8">
										<!-- Row -->
										<div class="row no-gutters">
											<!-- column -->
											<div class="col-md-6 border-right border-bottom">
												<div class="p-20">
													<h5 class="card-title" type="butt"><%=name%></h5>
													<h5 class="text-success">&#36; 0</h5>
												</div>
											</div>
											<!-- column -->
											<div class="col-md-6 border-bottom">
												<div class="p-20">
													<div class="d-flex no-block align-items-center">
														<span><img src="../assets/images/property/pro-garage.png"></span>
														<span class="p-10 text-muted">Unidades funcionales</span>
														<span class="badge badge-pill badge-secondary ml-auto"><%=fu%></span>
													</div>
													<div class="d-flex no-block align-items-center">
														<span><img src="../assets/images/property/pro-garage.png"></span>
														<span class="p-10 text-muted">Unidades funcionales ocupadas</span>
														<span class="badge badge-pill badge-secondary ml-auto"><%=property.getAmountOccupied()%></span>
													</div>
												</div>
											</div>
											<!-- column -->
											<div class="col-md-12">
												<div class="p-20">
													<div class="d-flex no-block align-items-center">
														<a href="javascript:void(0)" class="m-r-15" ><img alt="img" class="thumb-md img-circle m-r-10" src="../assets/images/users/default.jpg"></a>
														<div>
															<h5 class="card-title m-b-0"><%=nameAcc%></h5>
														</div>
														<div class="ml-auto text-muted text-right">
															<i class="fa fa-map-marker text-danger m-r-10"></i> <%=addressAcc%>
														</div>
													</div>
												</div>
											</div>
											<!-- column -->
										</div>
									</div>
								</div>
							</div>
					<%}%>
					<%}%>
				</div>
			</div>
			<!-- /row -->
		</div>
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
<script src="../assets/node_modules/jquery/jquery-3.2.1.min.js "></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="../assets/node_modules/popper/popper.min.js "></script>
<script src="../assets/node_modules/bootstrap/dist/js/bootstrap.min.js "></script>
<!-- slimscrollbar scrollbar JavaScript -->
<script src="dist/js/perfect-scrollbar.jquery.min.js "></script>
<!--Wave Effects -->
<script src="dist/js/waves.js "></script>
<!--Menu sidebar -->
<script src="dist/js/sidebarmenu.js "></script>
<!--stickey kit -->
<script src="../assets/node_modules/sticky-kit-master/dist/sticky-kit.min.js "></script>
<script src="../assets/node_modules/sparkline/jquery.sparkline.min.js "></script>
<!--Custom JavaScript -->
<script src="dist/js/custom.min.js "></script>
</body>
</html>
