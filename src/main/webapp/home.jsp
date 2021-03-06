<%@ page import="propertyAdmin.operations.DatabaseOps" %>
<%@ page import="propertyAdmin.structure.property.Property" %>
<%@ page import="propertyAdmin.structure.property.FunctionalUnit" %>
<%@ page import="propertyAdmin.structure.persons.Tenant" %>
<%@ page import="java.util.List" %>
<%@ page import="propertyAdmin.structure.persons.Account" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
    <title>P.A. - Pagina principal</title>
    <!-- This page CSS -->
    <!-- chartist CSS -->
    <link href="assets/node_modules/morrisjs/morris.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="propertyadmin/dist/css/jquery.autocomplete.css" />
    <!--Toaster Popup message CSS -->
    <link href="assets/node_modules/toast-master/css/jquery.toast.css" rel="stylesheet">
    <!-- Calendar CSS -->
    <link href="assets/node_modules/calendar/dist/fullcalendar.css" rel="stylesheet" />
    <!-- Footable CSS -->
    <link href="assets/node_modules/footable/css/footable.core.css" rel="stylesheet">
    <link href="assets/node_modules/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="propertyadmin/dist/css/style.min.css" rel="stylesheet">
    <!-- Dashboard 1 Page CSS -->
    <link href="propertyadmin/dist/css/pages/dashboard1.css" rel="stylesheet">
    <!-- Editable CSS -->
    <link type="text/css" rel="stylesheet" href="assets/node_modules/jsgrid/jsgrid.min.css" />
    <link type="text/css" rel="stylesheet" href="assets/node_modules/jsgrid/jsgrid-theme.min.css" />
    <script src="propertyadmin/dist/js/jquery.autocomplete.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body class="skin-blue fixed-layout">
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <div class="loader">
            <div class="loader__figure"></div>
            <p class="loader__label">Property-Admin</p>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">

        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <%
            Integer amountOfProperties = DatabaseOps.getInstance().getAccount(request.getRemoteUser()).getAmountOfProperties();
            Integer amountOfFunctionalUnits = DatabaseOps.getInstance().getAccount(request.getRemoteUser()).getAmountOfFunctionalUnits();
            Integer amountOfFunctionalUnitsOccupied = DatabaseOps.getInstance().getAccount(request.getRemoteUser()).getAmountOfOccupiedFunctionalUnits();
            String username = request.getRemoteUser();
            Account account = DatabaseOps.getInstance().getAccount(username);
            List<Property> propertyList = account.getProperties();
            List<FunctionalUnit> functionalUnitList = new ArrayList<>();
            for (int i = 0; i < propertyList.size(); i++) {
                functionalUnitList.addAll(propertyList.get(i).getOccupiedFUList());
            }
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
                        <li class="user-pro"> <a class="waves-effect waves-dark text-dark m-b-5 m-t-5" href="home.jsp" aria-expanded="false"><img src="assets/images/users/default.jpg" alt="user-img" class="img-circle"><span class="hide-menu"><%=DatabaseOps.getInstance().getAccount(request.getRemoteUser()).getFullName()%></span></a></li>
                            <li> <a class="has-arrow waves-effect waves-dark text-dark m-b-5 m-t-5" href="javascript:void(0)" aria-expanded="false"><i class="ti-home"></i><span class="hide-menu"> Propiedades<span class="badge badge-pill badge-info"><%=DatabaseOps.getInstance().getAccountProperties(request.getRemoteUser()).size()%></span></span></a>
                                <ul aria-expanded="false" class="collapse">
                                    <% if (amountOfProperties > 0){%>
                                    <%--<%List<Property> propertyList = DatabaseOps.getInstance().getAccountProperties(username);%>--%>
                                        <%for (int i = 0 ; i < propertyList.size() ; i++) {%>
                                            <li onclick="goToSpecificProperty.submit()">
                                                <form action="goToSpecificProperty" method="get" id="goToSpecificProperty">
                                                    <input type="hidden" name="username" value="<%=username%>">
                                                    <button type="submit" name="chosenProperty" value="<%=i%>" style="background-color: transparent" class="btn btn-sm d-none d-lg-block m-b-3 m-t-3" ><a class="waves-effect waves-dark text-dark" name="chosenProperty" value="<%=i%>"><i class="ti-home"></i> <%=propertyList.get(i).getName()%></a></button>
                                                </form>
                                            </li>
                                        <%}%>
                                    <%} else {%>
                                    <li>
                                        <form action="addProperty" method="get" id="addProperty">
                                            <input type="hidden" name="account" value="<%=username%>">
                                            <%--<input type="hidden" name="chosenProperty" value="<%=i%>">--%>
                                            <button type="submit" style="background-color: transparent" class="btn btn-sm d-none d-lg-block m-b-3 m-t-3" ><a class="waves-effect waves-dark text-dark"><i class="ti-file"></i> Agregar Propiedad</a></button>
                                        </form>
                                    </li>
                                    <%}%>
                                </ul>
                            </li>
                            <li> <a class="has-arrow waves-effect waves-dark text-dark m-b-5 m-t-5" href="javascript:void(0)" aria-expanded="false"><i class="ti-layout"></i><span class="hide-menu">U.F.<span class="badge badge-pill badge-info"><%=DatabaseOps.getInstance().getAccount(request.getRemoteUser()).getAmountOfFunctionalUnits()%></span></span></a>
                                <ul aria-expanded="false" class="collapse">
                                    <% if (amountOfProperties > 0){%>
                                    <%--<%List<Property> propertyList = DatabaseOps.getInstance().getAccountProperties(request.getRemoteUser());%>--%>
                                    <%for (int i = 0 ; i < propertyList.size() ; i++) {%>
                                    <li>
                                        <a href="javascript:void(0)" class="has-arrow text-dark m-b-3 m-t-3"><%=propertyList.get(i).getName()%></a>
                                        <ul aria-expanded="false" class="collapse">
                                            <%if (propertyList.get(i).getFunctionalUnits().size() > 0) {%>
                                            <%for (int j = 0 ; j < propertyList.get(i).getFunctionalUnits().size() ; j++) {%>
                                                <form action="goToSpecificFunctionalUnit" id="goToSpecificFunctionalUnit" method="get">
                                                    <li onclick="goToSpecificFunctionalUnit.submit()">
                                                        <input type="hidden" name="chosenProperty" value="<%=i%>">
                                                        <input type="hidden" name="chosenFunctionalUnit" value="<%=j%>">
                                                        <input type="hidden" name="account" value="<%=username%>">
                                                        <button type="submit" name="chosenFunctionalUnit" value="<%=j%>" style="background-color: transparent" class="btn btn-sm d-none d-lg-block m-b-5 m-t-5" ><a class="waves-effect waves-dark text-dark" name="chosenProperty" value="<%=i%>"><i class="ti-layout"></i> <%=propertyList.get(i).getFunctionalUnits().get(j).getName()%></a></button>
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
                            <li> <a class="has-arrow waves-effect waves-dark text-dark m-b-5 m-t-5" href="javascript:void(0)" aria-expanded="false"><i class="ti-user"></i><span class="hide-menu">Clientes<span class="badge badge-pill badge-info"><%=DatabaseOps.getInstance().getAccount(request.getRemoteUser()).getAmountOfOccupiedFunctionalUnits()%></span></span></a>
                                <ul aria-expanded="false" class="collapse">
                                    <% if (amountOfProperties > 0){%>
                                    <%--<%List<Property> propertyList = DatabaseOps.getInstance().getAccountProperties(username);%>--%>
                                    <%for (int i = 0 ; i < propertyList.size() ; i++) {%>
                                    <li>
                                        <a href="javascript:void(0)" class="has-arrow text-dark text-dark m-b-3 m-t-3"> <%=propertyList.get(i).getName()%></a>
                                        <ul aria-expanded="false" class="collapse">
                                            <%if (amountOfFunctionalUnitsOccupied > 0) {%>
                                            <%for (int j = 0 ; j < propertyList.get(i).getOccupiedFUList().size() ; j++) {%>
                                                <form action="goToSpecificClient" id="goToSpecificClient" method="get">
                                                    <li onclick="goToSpecificClient.submit()">
                                                        <input type="hidden" name="account" value="<%=username%>">
                                                        <input type="hidden" name="chosenProperty" value="<%=i%>">
                                                        <input type="hidden" name="chosenFunctionalUnit" value="<%=j%>">
                                                        <button type="submit" name="chosenFunctionalUnit" value="<%=j%>" style="background-color: transparent" class="btn btn-sm d-none d-lg-block m-b-5 m-t-5" ><a class="waves-effect waves-dark text-dark" name="chosenProperty" value="<%=i%>"><i class="ti-user"></i> <%=propertyList.get(i).getOccupiedFUList().get(j).getContract().getTenant().getName()%></a></button>
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
                                     <a class="waves-effect waves-dark text-dark m-b-5 m-t-5" ><i class="ti-user"></i><span class="hide-menu">  Mi perfil</span></a>
                                </form>
                            </li>
                            <li onclick="goToQuestions.submit()">
                                <form action="goToQuestions" method="get" id="goToQuestions">
                                    <input type="hidden" name="account" value="<%=username%>">
                                     <a class="waves-effect waves-dark text-dark m-b-5 m-t-5" aria-expanded="false"><i class="fa fa-circle-o text-info"></i><span class="hide-menu">  Preguntas</span></a>
                                </form>
                            </li>
                            <li onclick="logout.submit()">
                                <form action="logoutAccount" method="get" id="logout">
                                    <input type="hidden" name="account" value="<%=username%>">
                                     <a class="waves-effect waves-dark text-dark m-b-5 m-t-5" aria-expanded="false"><i class="fa fa-circle-o text-success"></i><span class="hide-menu">  Cerrar sesion</span></a>
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
                        <h4 class="text-themecolor">Inicio</h4>
                    </div>
                    <div class="col-md-7 align-self-center text-right">
                        <div class="d-flex justify-content-end align-items-center">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="javascript:void(0)">Inicio</a></li>
                            </ol>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Info box -->
                <!-- ============================================================== -->
                <!--.row -->
                <div class="row">
                    <div class="col-lg-3 col-sm-6 col-xs-12">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title text-uppercase"> PROPIEDADES </h5>
                                <div class="d-flex align-items-center no-block m-t-20 m-b-10">
                                    <h1><i class="ti-home text-info"></i></h1>
                                    <div class="ml-auto">
                                        <h1 class="text-muted"><%=amountOfProperties%></h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6 col-xs-12">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title text-uppercase"> TOTAL U.F. </h5>
                                <div class="d-flex align-items-center no-block m-t-20 m-b-10">
                                    <h1><i class="ti-layout text-purple"></i></h1>
                                    <div class="ml-auto">
                                        <h1 class="text-muted"><%=amountOfFunctionalUnits%></h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6 col-xs-12">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title text-uppercase"> U.F. OCUPADAS </h5>
                                <div class="d-flex align-items-center no-block m-t-20 m-b-10">
                                    <h1><i class="ti-user text-danger"></i></h1>
                                    <div class="ml-auto">
                                        <h1 class="text-muted"><%=amountOfFunctionalUnitsOccupied%></h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6 col-xs-12">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title text-uppercase">GANANCIAS </h5>
                                <div class="d-flex align-items-center no-block m-t-20 m-b-10">
                                    <h1><i class="ti-wallet text-success"></i></h1>
                                    <div class="ml-auto">
                                        <h1 class="text-muted">$0</h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
                <!-- ============================================================== -->
                <!-- .row  -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <h4 class="card-title">Contratos</h4>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="d-flex">
                                            <div class="ml-auto">
                                                <div class="form-group">
                                                    <input id="demo-input-search2" type="text" placeholder="Buscar..." autocomplete="off">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <table id="fu-toggler-table" class="table toggle-circle table-hover footable">
                                    <thead>
                                    <tr>
                                        <th class="footable-sorted-desc">Fecha cierre</th>
                                        <th>Valor</th>
                                        <th>Inquilino</th>
                                        <th>U.F.</th>
                                        <th>Contrato</th>
                                        <%--<th>Cuenta C.</th>--%>
                                        <th>Pago</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%if (amountOfProperties > 0) {

                                        for (int i = 0; i < propertyList.size(); i++) {%>
                                            <%for (int j = 0; j < propertyList.get(i).getOccupiedFUList().size();j++) {%>
                                    <tr>
                                        <td><%=propertyList.get(i).getOccupiedFUList().get(j).getContract().getContractDateEnd().toString("dd-MM-yy")%></td>
                                        <td>$ <%=propertyList.get(i).getOccupiedFUList().get(j).getContract().getCurrentPrice()%></td>
                                        <td>
                                            <form action="goToSpecificClient" method="get" id="goToSpecificClient1">
                                                <input type="hidden" name="chosenFunctionalUnit" value="<%=j%>">
                                                <input type="hidden" name="account" value="<%=username%>">
                                                <input type="hidden" name="clientId" value="<%=propertyList.get(i).getOccupiedFUList().get(j).getContract().getTenant().getId()%>">
                                                <button type="submit" class="btn btn-sm btn-icon btn-pure btn-info btn-outline delete-row-btn" data-toggle="tooltip" data-original-title="" ><i class="ti-user" aria-hidden="true"></i>  <%=propertyList.get(i).getOccupiedFUList().get(j).getContract().getTenant().getName()%></button>
                                            </form>
                                        </td>
                                        <td>
                                            <form action="goToSpecificFunctionalUnit" method="get">
                                                <input type="hidden" name="chosenFunctionalUnit" value="<%=j%>">
                                                <input type="hidden" name="account" value="<%=username%>">
                                                <input type="hidden" name="functionalUnitId" value="<%=propertyList.get(i).getOccupiedFUList().get(j).getId()%>">
                                                <button type="submit" class="btn btn-sm btn-icon btn-info btn-pure btn-outline delete-row-btn" data-toggle="tooltip" data-original-title="  <%=propertyList.get(i).getOccupiedFUList().get(j).getName()%>" ><i class="ti-home" aria-hidden="true"></i>  <%=propertyList.get(i).getOccupiedFUList().get(j).getName()%></button>
                                            </form>
                                        </td>
                                        <td>
                                            <form action="goToSpecificContract" method="get" id="goToSpecificContract">
                                                <input type="hidden" name="chosenProperty" value="<%=i%>">
                                                <input type="hidden" name="chosenFunctionalUnit" value="<%=j%>">
                                                <input type="hidden" name="property" value="<%=propertyList.get(i)%>">
                                                <input type="hidden" name="account" value="<%=username%>">
                                                <button type="submit" name="chosenProperty" value="<%=i%>" class="btn btn-sm btn-icon btn-info btn-pure btn-outline delete-row-btn" data-toggle="tooltip" data-original-title=""><i class="ti-file" name="chosenProperty" value="<%=i%>" aria-hidden="true"></i>  Contrato </button>
                                            </form>
                                        </td>
                                        <%--<td>--%>
                                            <%--<form action="goToFunctionalUnitCheckingAccount" method="get" id="goToFunctionalUnitCheckingAccount">--%>
                                                <%--<input type="hidden" name="account" value="<%=username%>">--%>
                                                <%--<input type="hidden" name="clientId" value="<%=propertyList.get(i).getOccupiedFUList().get(j).getContract().getTenant().getId()%>">--%>
                                                <%--<input type="hidden" name="chosenFunctionalUnit" value="<%=j%>">--%>
                                                <%--<input type="hidden" name="functionalUnitId" value="<%=propertyList.get(i).getOccupiedFUList().get(j).getId()%>">--%>
                                                <%--<button type="submit" class="btn btn-sm btn-icon btn-info btn-pure btn-outline delete-row-btn" data-toggle="tooltip" data-original-title="Pago" ><i class="ti-money" aria-hidden="true"></i>  Cuenta Corriente</button>--%>
                                            <%--</form>--%>
                                        <%--</td>--%>
                                        <td> Si o No</td>
                                    </tr>
                                    <%}%>
                                    <%}%>
                                    <%}%>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <td colspan="10">
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
                <!-- End Page Content -->
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
    <script src="assets/node_modules/jquery/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap popper Core JavaScript -->
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
    <!--stickey kit -->
    <script src="assets/node_modules/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <script src="assets/node_modules/sparkline/jquery.sparkline.min.js"></script>
    <!-- Calendar JavaScript -->
    <script src="assets/node_modules/calendar/jquery-ui.min.js"></script>
    <script src="assets/node_modules/moment/moment.js"></script>
    <script src='assets/node_modules/calendar/dist/fullcalendar.min.js'></script>
    <script src="assets/node_modules/calendar/dist/cal-init.js"></script>
    <!-- ============================================================== -->
    <!-- This page plugins -->
    <!-- ============================================================== -->
    <!--morris JavaScript -->
    <script src="assets/node_modules/raphael/raphael-min.js"></script>
    <script src="assets/node_modules/morrisjs/morris.min.js"></script>
    <script src="assets/node_modules/jquery-sparkline/jquery.sparkline.min.js"></script>
    <!-- Popup message jquery -->
    <script src="assets/node_modules/toast-master/js/jquery.toast.js"></script>
    <script>
        $("#searchInput").autocomplete("getSearchData.jsp");
    </script>
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
    <script src="propertyadmin/dist/js/custom.min.js"></script>
    <!-- Footable -->
    <script src="assets/node_modules/footable/js/footable.all.min.js"></script>
    <!--stickey kit -->
    <script src="assets/node_modules/sticky-kit-master/dist/sticky-kit.min.js "></script>
    <script src="assets/node_modules/sparkline/jquery.sparkline.min.js "></script>
    <!--FooTable init-->
    <script src="propertyadmin/dist/js/pages/footable-init.js"></script>
</body>

</html>