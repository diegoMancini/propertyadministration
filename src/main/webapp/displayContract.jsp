<%@ page import="propertyAdmin.operations.DatabaseOps" %>
<%@ page import="propertyAdmin.structure.property.Property" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: DiegoMancini
  Date: 16/5/18
  Time: 13:14
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
    <title>P.A. - Contrato</title>
    <!-- Custom CSS -->
    <link href="dist/css/style.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<!-- ============================================================== -->
<!-- Preloader - style you can find in spinners.css -->
<!-- ============================================================== -->
<div class="preloader">
    <div class="loader">
        <div class="loader__figure"></div>
        <p class="loader__label">Property Admin</p>
    </div>
</div>
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
                        <form action="goToProperties" method="get" id="goToProperties">
                            <input type="hidden" name="account" value="<%=username%>">
                            <a class="waves-effect waves-dark" onclick="goToProperties.submit()" ><i class="ti-home"></i><span class="hide-menu">  Propiedades</span></a>
                        </form>
                    </li>
                    <li class="nav-item m-r-30 m-l-30">
                        <form action="goToFunctionalUnits" method="get" id="goToFunctionalUnits">
                            <input type="hidden" name="account" value="<%=username%>">
                            <a class="waves-effect waves-dark" onclick="goToFunctionalUnits.submit()"><i class="ti-layout"></i><span class="hide-menu">  U.F.</span></a>
                        </form>
                    </li>
                    <li class="nav-item m-r-30 m-l-30">
                        <form action="goToClients" method="get" id="goToClients">
                            <input type="hidden" name="account" value="<%=username%>">
                            <a class="waves-effect waves-dark" onclick="goToClients.submit()"><i class="ti-user"></i><span class="hide-menu">  Clientes</span></a>
                        </form>
                    </li>
                    <li class="nav-item m-r-30 m-l-30">
                        <form action="goToMyBalance" method="get" id="goToMyBalance">
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
                        <a class="nav-link dropdown-toggle waves-effect waves-dark profile-pic" href="home.jsp" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="assets/images/users/default.jpg" alt="user" class=""> <span class="hidden-md-down"> <%=username%> &nbsp;<i class="fa fa-angle-down"></i></span> </a>
                        <div class="dropdown-menu dropdown-menu-right animated flipInY">
                            <!-- text-->
                            <form action="goToMyProfile" method="get">
                                <a onclick="goToMyProfile.submit()" class="dropdown-item"><i class="ti-user"></i> Mi perfil</a>
                            </form>
                            <!-- text-->
                            <form action="goToMyBalance" method="get">
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
                    <li class="user-pro"> <a class="waves-effect waves-dark text-dark m-b-10 m-t-10" href="home.jsp" aria-expanded="false"><img src="assets/images/users/default.jpg" alt="user-img" class="img-circle"><span class="hide-menu"><%=DatabaseOps.getInstance().getAccount(request.getRemoteUser()).getFullName()%></span></a></li>
                    <li> <a class="has-arrow waves-effect waves-dark text-dark m-b-10 m-t-10" href="javascript:void(0)" aria-expanded="false"><i class="ti-home"></i><span class="hide-menu"> Propiedades<span class="badge badge-pill badge-info"><%=DatabaseOps.getInstance().getAccountProperties(request.getRemoteUser()).size()%></span></span></a>
                        <ul aria-expanded="false" class="collapse">
                            <% if (amountOfProperties > 0){%>
                            <%List<Property> propertyList = DatabaseOps.getInstance().getAccountProperties(username);%>
                            <%for (int i = 0 ; i < propertyList.size() ; i++) {%>
                            <li onclick="goToSpecificProperty.submit()">
                                <form action="goToSpecificProperty" method="get" id="goToSpecificProperty">
                                    <input type="hidden" name="username" value="<%=username%>">
                                    <button type="submit" name="chosenProperty" value="<%=i%>" style="background-color: transparent" class="btn btn-sm d-none d-lg-block m-b-5 m-t-5" ><a class="waves-effect waves-dark text-dark" name="chosenProperty" value="<%=i%>"><i class="ti-home"></i> <%=propertyList.get(i).getName()%></a></button>
                                </form>
                            </li>
                            <%}%>
                            <%} else {%>
                            <li>
                                <form action="addProperty" method="get" id="addProperty">
                                    <input type="hidden" name="account" value="<%=username%>">
                                    <%--<input type="hidden" name="chosenProperty" value="<%=i%>">--%>
                                    <button type="submit" style="background-color: transparent" class="btn btn-sm d-none d-lg-block m-b-5 m-t-5" ><a class="waves-effect waves-dark text-dark"><i class="ti-file"></i> Agregar Propiedad</a></button>
                                </form>
                            </li>
                            <%}%>
                        </ul>
                    </li>
                    <li> <a class="has-arrow waves-effect waves-dark text-dark m-b-10 m-t-10" href="javascript:void(0)" aria-expanded="false"><i class="ti-layout"></i><span class="hide-menu">U.F.<span class="badge badge-pill badge-info"><%=DatabaseOps.getInstance().getAccount(request.getRemoteUser()).getAmountOfFunctionalUnits()%></span></span></a>
                        <ul aria-expanded="false" class="collapse">
                            <% if (amountOfProperties > 0){%>
                            <%List<Property> propertyList = DatabaseOps.getInstance().getAccountProperties(request.getRemoteUser());%>
                            <%for (int i = 0 ; i < propertyList.size() ; i++) {%>
                            <li>
                                <a href="javascript:void(0)" class="has-arrow text-dark m-b-5 m-t-5"><%=propertyList.get(i).getName()%></a>
                                <ul aria-expanded="false" class="collapse">
                                    <%if (propertyList.get(i).getFunctionalUnits().size() > 0) {%>
                                    <%for (int j = 0 ; j < propertyList.get(i).getFunctionalUnits().size() ; j++) {%>
                                    <form action="goToSpecificFunctionalUnit" id="goToSpecificFunctionalUnit" method="get">
                                        <li onclick="goToSpecificFunctionalUnit.submit()">
                                            <input type="hidden" name="chosenProperty" value="<%=i%>">
                                            <input type="hidden" name="chosenFunctionalUnit" value="<%=j%>">
                                            <input type="hidden" name="account" value="<%=username%>">
                                            <button type="submit" name="chosenFunctionalUnit" value="<%=j%>" style="background-color: transparent" class="btn btn-sm d-none d-lg-block m-b-15 m-t-10" ><a class="waves-effect waves-dark text-dark" name="chosenProperty" value="<%=i%>"><i class="ti-layout"></i> <%=propertyList.get(i).getFunctionalUnits().get(j).getName()%></a></button>
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
                    <li> <a class="has-arrow waves-effect waves-dark text-dark m-b-10 m-t-10" href="javascript:void(0)" aria-expanded="false"><i class="ti-user"></i><span class="hide-menu">Clientes<span class="badge badge-pill badge-info"><%=DatabaseOps.getInstance().getAccount(request.getRemoteUser()).getAmountOfOccupiedFunctionalUnits()%></span></span></a>
                        <ul aria-expanded="false" class="collapse">
                            <% if (amountOfProperties > 0){%>
                            <%List<Property> propertyList = DatabaseOps.getInstance().getAccountProperties(username);%>
                            <%for (int i = 0 ; i < propertyList.size() ; i++) {%>
                            <li>
                                <a href="javascript:void(0)" class="has-arrow text-dark text-dark m-b-5 m-t-5"> <%=propertyList.get(i).getName()%></a>
                                <ul aria-expanded="false" class="collapse">
                                    <%if (amountOfFunctionalUnitsOccupied > 0) {%>
                                    <%for (int j = 0 ; j < propertyList.get(i).getOccupiedFUList().size() ; j++) {%>
                                    <form action="goToSpecificClient" id="goToSpecificClient" method="get">
                                        <li onclick="goToSpecificClient.submit()">
                                            <input type="hidden" name="account" value="<%=username%>">
                                            <input type="hidden" name="chosenProperty" value="<%=i%>">
                                            <input type="hidden" name="chosenFunctionalUnit" value="<%=j%>">
                                            <button type="submit" name="chosenFunctionalUnit" value="<%=j%>" style="background-color: transparent" class="btn btn-sm d-none d-lg-block m-b-15 m-t-10" ><a class="waves-effect waves-dark text-dark" name="chosenProperty" value="<%=i%>"><i class="ti-user"></i> <%=propertyList.get(i).getOccupiedFUList().get(j).getContract().getTenant().getName()%></a></button>
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
                        <form action="goToMyProfile" method="get" id="goToMyProfile">
                            <input type="hidden" name="account" value="<%=username%>">
                            <a class="waves-effect waves-dark text-dark m-b-10 m-t-10" ><i class="ti-user"></i><span class="hide-menu">  Mi perfil</span></a>
                        </form>
                    </li>
                    <li onclick="goToQuestions.submit()">
                        <form action="goToQuestions" method="get" id="goToQuestions">
                            <input type="hidden" name="account" value="<%=username%>">
                            <a class="waves-effect waves-dark text-dark m-b-10 m-t-10" aria-expanded="false"><i class="fa fa-circle-o text-info"></i><span class="hide-menu">  Preguntas</span></a>
                        </form>
                    </li>
                    <li onclick="logout.submit()">
                        <form action="logoutAccount" method="get" id="logout">
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
    <div class="page-wrapper">
        <div class="container-fluid">
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h4 class="text-themecolor">Propiedades</h4>
                </div>
                <div class="col-md-7 align-self-center text-right">
                    <div class="d-flex justify-content-end align-items-center">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home.jsp">Inicio</a></li>
                            <li class="breadcrumb-item"><a href="properties.jsp">Propiedades</a></li>
                            <li class="breadcrumb-item active m-r-10"><%%></li>
                        </ol>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header bg-info">
                            <h4 class="m-b-0 text-white">Contrato</h4>
                        </div>
                        <div class="card-body">
                            <form class="form-horizontal" role="form">
                                <div class="form-body">
                                    <h3 class="box-title">Contrato</h3>
                                    <hr class="m-t-0 m-b-40">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label class="control-label text-right col-md-3">First Name:</label>
                                                <div class="col-md-9">
                                                    <p class="form-control-static"> John </p>
                                                </div>
                                            </div>
                                        </div>
                                        <!--/span-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label class="control-label text-right col-md-3">Last Name:</label>
                                                <div class="col-md-9">
                                                    <p class="form-control-static"> Doe </p>
                                                </div>
                                            </div>
                                        </div>
                                        <!--/span-->
                                    </div>
                                    <!--/row-->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label class="control-label text-right col-md-3">Gender:</label>
                                                <div class="col-md-9">
                                                    <p class="form-control-static"> Male </p>
                                                </div>
                                            </div>
                                        </div>
                                        <!--/span-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label class="control-label text-right col-md-3">Date of Birth:</label>
                                                <div class="col-md-9">
                                                    <p class="form-control-static"> 11/06/1987 </p>
                                                </div>
                                            </div>
                                        </div>
                                        <!--/span-->
                                    </div>
                                    <!--/row-->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label class="control-label text-right col-md-3">Category:</label>
                                                <div class="col-md-9">
                                                    <p class="form-control-static"> Category1 </p>
                                                </div>
                                            </div>
                                        </div>
                                        <!--/span-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label class="control-label text-right col-md-3">Membership:</label>
                                                <div class="col-md-9">
                                                    <p class="form-control-static"> Free </p>
                                                </div>
                                            </div>
                                        </div>
                                        <!--/span-->
                                    </div>
                                    <!--/row-->
                                    <h3 class="box-title">Address</h3>
                                    <hr class="m-t-0 m-b-40">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label class="control-label text-right col-md-3">Address:</label>
                                                <div class="col-md-9">
                                                    <p class="form-control-static"> E104, Dharti-2, Near silverstar mall </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label class="control-label text-right col-md-3">City:</label>
                                                <div class="col-md-9">
                                                    <p class="form-control-static"> Bhavnagar </p>
                                                </div>
                                            </div>
                                        </div>
                                        <!--/span-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label class="control-label text-right col-md-3">State:</label>
                                                <div class="col-md-9">
                                                    <p class="form-control-static"> Gujarat </p>
                                                </div>
                                            </div>
                                        </div>
                                        <!--/span-->
                                    </div>
                                    <!--/row-->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label class="control-label text-right col-md-3">Post Code:</label>
                                                <div class="col-md-9">
                                                    <p class="form-control-static"> 457890 </p>
                                                </div>
                                            </div>
                                        </div>
                                        <!--/span-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label class="control-label text-right col-md-3">Country:</label>
                                                <div class="col-md-9">
                                                    <p class="form-control-static"> India </p>
                                                </div>
                                            </div>
                                        </div>
                                        <!--/span-->
                                    </div>
                                </div>
                                <div class="form-actions">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="row">
                                                <div class="col-md-offset-3 col-md-9">
                                                    <button type="submit" class="btn btn-danger"> <i class="fa fa-pencil"></i> Edit</button>
                                                    <button type="button" class="btn btn-inverse">Cancel</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6"> </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


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
<!--stickey kit -->
<script src="../assets/node_modules/sticky-kit-master/dist/sticky-kit.min.js"></script>
<script src="../assets/node_modules/sparkline/jquery.sparkline.min.js"></script>
<!--Custom JavaScript -->
<script src="dist/js/custom.min.js"></script>
<script src="../assets/node_modules/jquery-sparkline/jquery.sparkline.min.js"></script>
</body>
</html>
