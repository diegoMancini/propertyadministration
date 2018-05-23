<%@ page import="propertyAdmin.operations.DatabaseOps" %>
<%@ page import="propertyAdmin.structure.persons.Tenant" %>
<%@ page import="propertyAdmin.structure.property.Property" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: diego
  Date: 4/5/2018
  Time: 3:09 AM
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
	<link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
	<title>P.A. - Propiedad: <%=request.getAttribute("propertyName")%></title>
	<!-- Custom CSS -->
	<link href="propertyadmin/dist/css/style.min.css" rel="stylesheet">
	<!-- Footable CSS -->
	<link href="assets/node_modules/footable/css/footable.core.css" rel="stylesheet">
	<link href="assets/node_modules/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" />
	<!-- page css -->
	<link href="propertyadmin/dist/css/pages/footable-page.css" rel="stylesheet">
	<!-- Dashboard 1 Page CSS -->
	<link href="propertyadmin/dist/css/pages/dashboard1.css" rel="stylesheet">
	<!-- Editable CSS -->
	<link type="text/css" rel="stylesheet" href="assets/node_modules/jsgrid/jsgrid.min.css" />
	<link type="text/css" rel="stylesheet" href="assets/node_modules/jsgrid/jsgrid-theme.min.css" />
	<!--Toaster Popup message CSS -->
	<link href="assets/node_modules/toast-master/css/jquery.toast.css" rel="stylesheet">
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>
<body class="skin-blue fixed-layout">
<div id="main-wrapper">
	<!-- ============================================================== -->
	<!-- Topbar header - style you can find in pages.scss -->
	<!-- ============================================================== -->
    <%
        Integer amountOfProperties = DatabaseOps.getInstance().getAccount(request.getRemoteUser()).getAmountOfProperties();
        Integer amountOfFunctionalUnits = DatabaseOps.getInstance().getAccount(request.getRemoteUser()).getAmountOfFunctionalUnits();
        Integer amountOfFunctionalUnitsOccupied = DatabaseOps.getInstance().getAccount(request.getRemoteUser()).getAmountOfOccupiedFunctionalUnits();
        String username = request.getRemoteUser();
    %>
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
                    <img src="assets/images/logo-icon.png" alt="homepage" class="dark-logo" />
                    <!-- Light Logo icon -->
                    <img src="assets/images/logo-light-icon.png" alt="homepage" class="light-logo" />
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
                            <input type="text" class="form-control" name="searchInput" id="searchInput" placeholder="Buscar...">
                        </form>
                    </li>
                </ul>
                <ul class="navbar-nav mr-auto text-white font-weight-normal text-lg-">
                    <li class="nav-item m-r-30 m-l-30" >
                        <form action="goToProperties" method="post" id="goToProperties">
                            <input type="hidden" name="account" value="<%=username%>">
                            <a class="waves-effect waves-dark" onclick="goToProperties.submit()" ><i class="ti-home"></i><span class="hide-menu">  Propiedades</span></a>
                        </form>
                    </li>
                    <li class="nav-item m-r-30 m-l-30">
                        <form action="goToFunctionalUnits" method="post" id="goToFunctionalUnits">
                            <input type="hidden" name="account" value="<%=username%>">
                            <a class="waves-effect waves-dark" onclick="goToFunctionalUnits.submit()"><i class="ti-layout"></i><span class="hide-menu">  U.F.</span></a>
                        </form>
                    </li>
                    <li class="nav-item m-r-30 m-l-30">
                        <form action="goToClients" method="post" id="goToClients">
                            <input type="hidden" name="account" value="<%=username%>">
                            <a class="waves-effect waves-dark" onclick="goToClients.submit()"><i class="ti-user"></i><span class="hide-menu">  Clientes</span></a>
                        </form>
                    </li>
                    <li class="nav-item m-r-30 m-l-30">
                        <form action="goToMyBalance" method="post" id="goToMyBalance">
                            <input type="hidden" name="account" value="<%=username%>">
                            <a class="waves-effect waves-dark" onclick="goToMyBalance.submit()"><i class="ti-wallet"></i> <span class="hide-menu">  Balance</span></a>
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
                        <a class="nav-link dropdown-toggle waves-effect waves-dark profile-pic" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="assets/images/users/default.jpg" alt="user" class=""> <span class="hidden-md-down"> <%=username%> &nbsp;<i class="fa fa-angle-down"></i></span> </a>
                        <div class="dropdown-menu dropdown-menu-right animated flipInY">
                            <!-- text-->
                            <form action="goToMyProfile" method="post">
                                <a onclick="goToMyProfile.submit()" class="dropdown-item"><i class="ti-user"></i> Mi perfil</a>
                            </form>
                            <!-- text-->
                            <form action="goToMyBalance" method="post">
                                <a onclick="goToMyBalance.submit()" class="dropdown-item"><i class="ti-wallet"></i> Mi balance</a>
                            </form>
                            <!-- text-->
                            <form>
                                <div class="dropdown-divider"></div>
                            </form>
                            <!-- text-->
                            <form>
                                <a href="javascript:void(0)" class="dropdown-item"><i class="ti-settings"></i> Ajustes</a>
                            </form>
                            <!-- text-->
                            <div class="dropdown-divider"></div>
                            <!-- text-->
                            <form action="logoutAccount" method="post">
                                <a onclick="logoutAccount.submit()" class="dropdown-item"><i class="fa fa-power-off"></i> Cerrar sesion</a>
                            </form>
                            <!-- text-->
                        </div>
                    </li>
                    <!-- ============================================================== -->
                    <!-- End User Profile -->
                    <!-- ============================================================== -->
                    <%--<li class="nav-item right-side-toggle"> <a class="nav-link  waves-effect waves-light" href="javascript:void(0)"><i class="ti-settings"></i></a></li>--%>
                </ul>
            </div>
        </nav>
    </header>	<!-- ============================================================== -->
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
                    <li class="user-pro"> <a class="waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><img src="assets/images/users/default.jpg" alt="user-img" class="img-circle"><span class="hide-menu"><%=DatabaseOps.getInstance().getAccount(request.getRemoteUser()).getFullName()%></span></a></li>
                    <li> <a class="has-arrow waves-effect waves-dark text-dark" href="javascript:void(0)" aria-expanded="false"><i class="ti-home"></i><span class="hide-menu">Propiedades<span class="badge badge-pill badge-info"><%=DatabaseOps.getInstance().getAccountProperties(request.getRemoteUser()).size()%></span></span></a>
                        <ul aria-expanded="false" class="collapse">
                            <% if (amountOfProperties > 0){%>
                            <%List<Property> propertyList = DatabaseOps.getInstance().getAccountProperties(username);%>
                            <%for (int i = 0 ; i < propertyList.size() ; i++) {%>
                            <form action="goToSpecificProperty" method="post" id="goToSpecificProperty">
                                <li onclick="goToSpecificProperty.submit()" >
                                    <input type="hidden" name="username" value="<%=username%>">
                                    <input type="hidden" name="chosenProperty" value="<%=i%>">
                                    <a name="chosenProperty" value="<%=i%>" class="waves-effect waves-dark text-dark"><i class="ti-home"></i> <%=propertyList.get(i).getName()%></a>
                                </li>
                            </form>
                            <%}%>
                            <%}%>
                        </ul>
                    </li>
                    <li> <a class="has-arrow waves-effect waves-dark text-dark" href="javascript:void(0)" aria-expanded="false"><i class="ti-files"></i><span class="hide-menu">U.F.<span class="badge badge-pill badge-info"><%=DatabaseOps.getInstance().getAccount(request.getRemoteUser()).getAmountOfFunctionalUnits()%></span></span></a>
                        <ul aria-expanded="false" class="collapse">
                            <% if (amountOfProperties > 0){%>
                            <%List<Property> propertyList = DatabaseOps.getInstance().getAccountProperties(request.getRemoteUser());%>
                            <%for (int i = 0 ; i < propertyList.size() ; i++) {%>
                            <li>
                                <a href="javascript:void(0)" class="has-arrow text-dark"><%=propertyList.get(i).getName()%></a>
                                <ul aria-expanded="false" class="collapse">
                                    <%if (propertyList.get(i).getFunctionalUnits().size() > 0) {%>
                                    <%for (int j = 0 ; j < propertyList.get(i).getFunctionalUnits().size() ; j++) {%>
                                    <form action="goToSpecificFunctionalUnit" id="goToSpecificFunctionalUnit1" method="post">
                                        <li onclick="goToSpecificFunctionalUnit1.submit()">
                                            <input type="hidden" name="chosenProperty" value="<%=i%>">
                                            <input type="hidden" name="chosenFunctionalUnit" value="<%=j%>">
                                            <input type="hidden" name="account" value="<%=username%>">
                                            <a name="chosenFU" value="<%=j%>" class="waves-effect waves-dark text-dark"><i class="ti-layout"></i>  <%=propertyList.get(i).getFunctionalUnits().get(j).getName()%></a>
                                        </li>
                                    </form>
                                    <%}%>
                                    <%} else {%>
                                    <form action="newFunctionalUnit" method="post" >
                                        <li>
                                            <input type="hidden" name="chosenProperty" value="<%=i%>">
                                            <input type="hidden" name="account" value="<%=username%>">
                                            <button type="submit" name="chosenProperty" value="<%=i%>"> Agregar UF</button>
                                        </li>
                                    </form>
                                    <%}%>
                                </ul>
                            </li>
                            <%}%>
                            <%}%>
                        </ul>
                    </li>
                    <li> <a class="has-arrow waves-effect waves-dark text-dark" href="javascript:void(0)" aria-expanded="false"><i class="ti-user"></i><span class="hide-menu">Clientes<span class="badge badge-pill badge-info"><%=DatabaseOps.getInstance().getAccount(request.getRemoteUser()).getAmountOfOccupiedFunctionalUnits()%></span></span></a>
                        <ul aria-expanded="false" class="collapse">
                            <% if (amountOfProperties > 0){%>
                            <%List<Property> propertyList = DatabaseOps.getInstance().getAccountProperties(username);%>
                            <%for (int i = 0 ; i < propertyList.size() ; i++) {%>
                            <li>
                                <a href="javascript:void(0)" class="has-arrow text-dark"> <%=propertyList.get(i).getName()%></a>
                                <ul aria-expanded="false" class="collapse">
                                    <%if (amountOfFunctionalUnitsOccupied > 0) {%>
                                    <%for (int j = 0 ; j < propertyList.get(i).getOccupiedFUList().size() ; j++) {%>
                                    <form action="goToSpecificClient" id="goToSpecificClient" method="post">
                                        <li onclick="goToSpecificClient.submit()">
                                            <input type="hidden" name="account" value="<%=username%>">
                                            <input type="hidden" name="chosenProperty" value="<%=i%>">
                                            <input type="hidden" name="chosenFunctionalUnit" value="<%=j%>">
                                            <a name="chosenFU" value="<%=j%>" class="waves-effect waves-dark text-dark"><i class="ti-user"></i>  <%=propertyList.get(i).getFunctionalUnits().get(j).getContract().getTenant().getName()%></a>
                                        </li>
                                    </form>
                                    <%}%>
                                    <%} else {%>
                                    <li> ----- </li>
                                    <%}%>
                                </ul>
                            </li>
                            <%}%>
                            <%}%>
                        </ul>
                    </li>
                    <li onclick="goToMyProfile.submit()">
                        <form action="goToMyProfile" method="post" id="goToMyProfile">
                            <input type="hidden" name="account" value="<%=username%>">
                            <a class="waves-effect waves-dark text-dark" ><i class="ti-user"></i><span class="hide-menu">  Mi perfil</span></a>
                        </form>
                    </li>
                    <li onclick="goToQuestions.submit()">
                        <form action="goToQuestions" method="post" id="goToQuestions">
                            <input type="hidden" name="account" value="<%=username%>">
                            <a class="waves-effect waves-dark text-dark" aria-expanded="false"><i class="fa fa-circle-o text-info"></i><span class="hide-menu">  Preguntas</span></a>
                        </form>
                    </li>
                    <li onclick="logout.submit()">
                        <form action="logoutAccount" method="post" id="logout">
                            <input type="hidden" name="account" value="<%=username%>">
                            <a class="waves-effect waves-dark text-dark" aria-expanded="false"><i class="fa fa-circle-o text-success"></i><span class="hide-menu">  Cerrar sesion</span></a>
                        </form>
                    </li>
                </ul>
            </nav>
            <!-- End Sidebar navigation -->
        </div>
        <!-- End Sidebar scroll-->
    </aside>
	<!-- ============================================================== -->
	<!-- End Left Sidebar - style you can find in sidebar.scss  -->
	<!-- ============================================================== -->
	<!-- Page wrapper  -->
	<!-- ============================================================== -->
	<div class="page-wrapper">
        <%Property property = (Property) request.getAttribute("property");%>
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
							<li class="breadcrumb-item"><a href="properties.jsp">Propiedades</a></li>
							<li class="breadcrumb-item active m-r-10"><%=request.getAttribute("propertyName")%></li>
						</ol>
						</div>
				</div>
			</div>
			<div class="row">
				<!-- column -->
				<div class="col-lg-12">
					<!-- Property Items -->
					<div class="card">
						<%--<!-- row -->--%>
						<div class="row-lg-3">
								<h4>
									<button type="submit" class="btn btn-info waves-effect waves-light m-l-30 m-t-10 m-b-10"><%=request.getAttribute("propertyName")%></button>
								</h4>
						</div>
						<div class="row no-gutters">
							<div class="col-md-3 m-l-20 m-b-15" style="background: url(<%=property.getImageLink()%>)center center / cover no-repeat; min-height:250px;">
							</div>
							<!-- column -->
							<div class="col-md-8">
								<!-- Row -->
								<div class="row no-gutters">
									<div class="col-md-6 border-bottom">
										<div class="p-40">
											<div class="d-flex no-block align-items-center">
												<span><img src="assets/images/property/pro-garage.png"></span>
												<span class="p-10"> Unidades funcionales</span>
												<span class="badge badge-pill badge-secondary ml-auto"><%=property.getFunctionalUnits().size()%></span>
											</div>
											<div class="d-flex no-block align-items-center">
												<span><img src="assets/images/property/pro-garage.png"></span>
												<span class="p-10"> Unidades funcionales ocupadas</span>
												<span class="badge badge-pill badge-secondary ml-auto"><%=property.getOccupiedFunctionalUnits()%></span>
											</div>
										</div>
									</div>
									<!-- column -->
									<div class="col-md-12">
										<div class="p-20">
											<div class="d-flex no-block align-items-center">
												<a href="javascript:void(0)" class="m-r-10" ><img alt="img" class="thumb-md img-circle m-r-10" src="assets/images/users/default.jpg"></a>
												<div>
													<h5 class="card-title m-b-0"><%=DatabaseOps.getInstance().getAccount(request.getRemoteUser()).getName()%></h5>
												</div>
												<div class="ml-auto text-muted text-right">
													<i class="fa fa-map-marker text-danger m-r-10"></i> <%=property.getFullAddress()%>
												</div>
											</div>
										</div>
									</div>
									<!-- column -->
								</div>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-body">
                            <div class="row">
                                <div class="col-md-10">
							        <h4 class="card-title">Lista de Unidades Funcionales </h4>
                                </div>
                            </div>
							<table id="fu-toggler-table" class="table toggle-circle table-hover footable">
								<thead>
								<tr>
									<th data-toggle="true">N°</th>
									<th>Nombre</th>
									<th>Direccion</th>
									<th>Tipo</th>
                                    <th>Estado</th>
									<th>Cuenta Corriente</th>
									<th data-hide="all">Contrato</th>
									<th data-hide="all">Cliente</th>
								</tr>
								</thead>
                                <div class="m-t-40">
                                    <div class="d-flex">
                                        <div class="mr-auto">
                                            <div class="button-box">
                                                <button type="button" class="btn btn-info waves-effect waves-light m-r-20 m-b-15 m-l-15" data-toggle="modal" data-target="#newFU" data-whatever="@newFU"><span class="p-10"> Nueva U.F.</span></button>
                                            </div>
                                            <div class="modal fade" id="newFU" tabindex="-1" role="dialog" aria-labelledby="newFULabel">
                                                <div class="modal-dialog " role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h4 class="modal-title" id="newFULabel">Nueva U.F.</h4>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form method="post" action="addFunctionalUnit">
                                                                <input type="hidden" name="account" value="<%=request.getAttribute("username")%>">
                                                                <input type="hidden" name="property" value="<%=request.getAttribute("property")%>">
                                                                <input type="hidden" name="chosenProperty" value="<%=request.getAttribute("chosenProperty")%>">
                                                                <div class="form-group">
                                                                    <input type="text" class="form-control" id="fuName" name="fuName" placeholder="Nombre...">
                                                                </div>
                                                                <div class="form-group">
                                                                    <input type="text" class="form-control" id="fuAddress" name="fuAddress" placeholder="Direccion...">
                                                                </div>
                                                                <div class="form-group">
                                                                    <select name="fuType" class="form-control custom-select" id="fuType">
                                                                        <option value="0" disabled selected>Tipo de Unidad Funcional</option>
                                                                        <option value="Vivienda">Vivienda</option>
                                                                        <option value="Oficina">Oficina</option>
                                                                        <option value="Local">Local Comercial</option>
                                                                        <option value="Garage">Garage</option>
                                                                    </select>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="submit" class="submit-btn btn-primary">Agregar</button>
                                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
	                                    <div class="ml-auto">
		                                    <div class="form-group">
			                                    <input id="demo-input-search2" type="text" placeholder="Buscar..." autocomplete="off">
		                                    </div>
	                                    </div>
                                    </div>
                                </div>
								<tbody>
								<%if (property.getFunctionalUnits().size() > 0) {
									for (int j = 0; j < property.getFunctionalUnits().size();j++) {
										String state = property.getFunctionalUnits().get(j).getState();
										String client = "";
										String contractName = "";
										if(state.equals("Ocupado")) {
											client += property.getFunctionalUnits().get(j).getContract().getTenant().getFullName();
											contractName += property.getFunctionalUnits().get(j).getContract().getName();
										} else {
											client += "------";
											contractName += "------";
										}
								%>
								<tr>
									<td><%=j+1%></td>
									<td>
										<form action="goToSpecificFunctionalUnit" method="post" id="goToSpecificFunctionalUnit">
											<input type="hidden" name="account" value="<%=request.getRemoteUser()%>">
											<input type="hidden" name="chosenProperty" value="<%=request.getAttribute("chosenProperty")%>">
											<input type="hidden" name="chosenFunctionalUnit" value="<%=j%>">
											<a class="waves-effect waves-dark text-info" onclick="goToSpecificFunctionalUnit.submit()"> <%=property.getFunctionalUnits().get(j).getName()%></a>
										</form>
									</td>
									<td><%=property.getFunctionalUnits().get(j).getAddress()%></td>
									<td><%=property.getFunctionalUnits().get(j).getType()%></td>
									<%if (state.equals("Ocupado")){%>
									<td><span class="label label-danger"><%=state%></span> </td>
									<%} else {%>
									<td><span class="label label-success"><%=state%></span> </td>
									<%}%>
                                    <td>
	                                    <form action="goToFunctionalUnitCheckingAccount" method="post" id="goToFunctionalUnitCheckingAccount">
		                                    <input type="hidden" name="account" value="<%=request.getRemoteUser()%>">
		                                    <input type="hidden" name="chosenProperty" value="<%=request.getAttribute("chosenProperty")%>">
		                                    <input type="hidden" name="chosenFunctionalUnit" value="<%=j%>">
		                                    <input type="hidden" name="propertyName" value="<%=property.getName()%>">
		                                    <button type="button" class="btn btn-sm btn-icon btn-pure  btn-outline delete-row-btn" data-toggle="tooltip" data-original-title="Pago" onclick="goToFunctionalUnitCheckingAccount.submit()"><i class="ti-home" aria-hidden="true"></i></button>
	                                    </form>
                                    </td>
									<%if (property.getFunctionalUnits().get(j).getContract() != null) {%>
									<td>
                                            <form action="goToSpecificContract" method="post" id="goToSpecificContract">
	                                            <input type="hidden" name="chosenFunctionalUnit" value="<%=j%>">
	                                            <input type="hidden" name="chosenProperty" value="<%=request.getAttribute("chosenProperty")%>">
	                                            <input type="hidden" name="account" value="<%=request.getAttribute("username")%>">
	                                            <input type="hidden" name="property" value="<%=request.getAttribute("property")%>">
	                                            <a onclick="goToSpecificContract.submit()" class="waves-effect waves-dark text-info"><%=contractName%></a>
                                            </form>
                                    </td>
                                    <td>
                                        <form action="goToSpecificClient" method="post" id="goToSpecificClient1">
                                            <input type="hidden" name="chosenFunctionalUnit" value="<%=j%>">
                                            <input type="hidden" name="chosenProperty" value="<%=request.getAttribute("chosenProperty")%>">
                                            <input type="hidden" name="account" value="<%=request.getAttribute("username")%>">
                                            <input type="hidden" name="property" value="<%=request.getAttribute("property")%>">
                                            <a onclick="goToSpecificClient1.submit()" class="waves-effect waves-dark text-info" ><%=client%></a>
                                        </form>
									</td>
									<%} else {%>
                                    <td>
	                                    <form action="newContract" method="post" id="newContract">
		                                    <input type="hidden" name="chosenProperty" value="<%=request.getAttribute("chosenProperty")%>">
		                                    <input type="hidden" name="chosenFunctionalUnit" value="<%=j%>">
		                                    <input type="hidden" name="propertyName" value="<%=property.getName()%>">
		                                    <input type="hidden" name="account" value="<%=request.getRemoteUser()%>">
                                            <a onclick="newContract.submit()" class="waves-effect waves-dark text-info" > Agregar Contrato </a>
	                                    </form>
                                    </td>
									<td> No hay aun </td>
									<%}%>
								</tr>
								<%}%>
								<%}%>
								</tbody>
								<tfoot>
								<tr>
									<td colspan="5">
										<div class="text-right">
											<ul class="pagination pagination-split m-t-30"> </ul>
										</div>
									</td>
								</tr>
								</tfoot>
							</table>
						</div>
					</div>
				</div>
			</div>
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
									<a href="javascript:void(0)"><img src="assets/images/users/1.jpg" alt="user-img" class="img-circle"> <span>Varun Dhavan <small class="text-success">online</small></span></a>
								</li>
								<li>
									<a href="javascript:void(0)"><img src="assets/images/users/2.jpg" alt="user-img" class="img-circle"> <span>Genelia Deshmukh <small class="text-warning">Away</small></span></a>
								</li>
								<li>
									<a href="javascript:void(0)"><img src="assets/images/users/3.jpg" alt="user-img" class="img-circle"> <span>Ritesh Deshmukh <small class="text-danger">Busy</small></span></a>
								</li>
								<li>
									<a href="javascript:void(0)"><img src="assets/images/users/4.jpg" alt="user-img" class="img-circle"> <span>Arijit Sinh <small class="text-muted">Offline</small></span></a>
								</li>
								<li>
									<a href="javascript:void(0)"><img src="assets/images/users/5.jpg" alt="user-img" class="img-circle"> <span>Govinda Star <small class="text-success">online</small></span></a>
								</li>
								<li>
									<a href="javascript:void(0)"><img src="assets/images/users/6.jpg" alt="user-img" class="img-circle"> <span>John Abraham<small class="text-success">online</small></span></a>
								</li>
								<li>
									<a href="javascript:void(0)"><img src="assets/images/users/7.jpg" alt="user-img" class="img-circle"> <span>Hritik Roshan<small class="text-success">online</small></span></a>
								</li>
								<li>
									<a href="javascript:void(0)"><img src="assets/images/users/8.jpg" alt="user-img" class="img-circle"> <span>Pwandeep rajan <small class="text-success">online</small></span></a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- End Right sidebar -->
				<!-- ============================================================== -->
			</div>
	</div>
	</div>
<script src="assets/node_modules/jquery/jquery-3.2.1.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="assets/node_modules/popper/popper.min.js"></script>
<script src="assets/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- slimscrollbar scrollbar JavaScript -->
<script src="propertyadmin/dist/js/perfect-scrollbar.jquery.min.js"></script>
<!--Wave Effects -->
<script src="propertyadmin/dist/js/waves.js"></script>
<!--Menu sidebar -->
<script src="propertyadmin/dist/js/sidebarmenu.js"></script>
<!--Custom JavaScript -->
<script src="propertyadmin/dist/js/custom.min.js"></script>
<!-- Footable -->
<script src="assets/node_modules/footable/js/footable.all.min.js"></script>
<!--stickey kit -->
<script src="assets/node_modules/sticky-kit-master/dist/sticky-kit.min.js "></script>
<script src="assets/node_modules/sparkline/jquery.sparkline.min.js "></script>
<!--FooTable init-->
<script src="propertyadmin/dist/js/pages/footable-init.js"></script>
<!--morris JavaScript -->
<script src="assets/node_modules/raphael/raphael-min.js"></script>
<script src="assets/node_modules/morrisjs/morris.min.js"></script>
<script src="assets/node_modules/jquery-sparkline/jquery.sparkline.min.js"></script>
<!-- Popup message jquery -->
<script src="assets/node_modules/toast-master/js/jquery.toast.js"></script>
<!-- This is data table -->
<script src="assets/node_modules/datatables/jquery.dataTables.min.js"></script>
<!-- start - This is for export functionality only -->
<script src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.flash.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
<script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
<script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.print.min.js"></script>
<!-- end - This is for export functionality only -->
<script>
    $(document).ready(function() {
        $('#myTable').DataTable();
        $(document).ready(function() {
            var table = $('#example').DataTable({
                "columnDefs": [{
                    "visible": false,
                    "targets": 2
                }],
                "order": [
                    [2, 'asc']
                ],
                "displayLength": 25,
                "drawCallback": function(settings) {
                    var api = this.api();
                    var rows = api.rows({
                        page: 'current'
                    }).nodes();
                    var last = null;
                    api.column(2, {
                        page: 'current'
                    }).data().each(function(group, i) {
                        if (last !== group) {
                            $(rows).eq(i).before('<tr class="group"><td colspan="5">' + group + '</td></tr>');
                            last = group;
                        }
                    });
                }
            });
            // Order by the grouping
            $('#example tbody').on('click', 'tr.group', function() {
                var currentOrder = table.order()[0];
                if (currentOrder[0] === 2 && currentOrder[1] === 'asc') {
                    table.order([2, 'desc']).draw();
                } else {
                    table.order([2, 'asc']).draw();
                }
            });
        });
    });
    $('#example23').DataTable({
        dom: 'Bfrtip',
        buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ]
    });
</script>
<script>
    jQuery(function($){
        $("#fu-toggler-table").footable();
    });
    jQuery(function($){
        $("#clients-toggler-table").footable();
    });
    var table = $('#fu-toggler-table');
    $('#demo-input-search2').on('input', function (e) {
        e.preventDefault();
        table.trigger('footable_filter', {filter: $(this).val()});
    });
</script>
</body>
</html>
