<%@ page import="propertyAdmin.operations.DatabaseOps" %>
<%@ page import="propertyAdmin.structure.property.Property" %><%--
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
                            <input type="text" class="form-control" placeholder="Buscar...">
                        </form>
                    </li>
                    <%--<li class="nav-item"> <a class="nav-link waves-effect waves-dark" href="home.jsp"><i class="icon-speedometer"></i><span class="font-bold">  Inicio</span></a></li>--%>
                    <%--<li class="nav-item"> <a class="nav-link waves-effect waves-dark" href="properties.jsp"><i class="ti-home"></i><span class="font-bold">  Propiedades</span></a></li>--%>
                    <%--<li class="nav-item"> <a class="nav-link waves-effect waves-dark" href="functionalUnits.jsp"><i class="ti-layout"></i><span class="font-bold">  U.F.</span></a></li>--%>
                    <%--<li class="nav-item"> <a class="nav-link waves-effect waves-dark" href="clients.jsp"><i class="ti-user"></i><span class="font-bold">  Clientes</span></a></li>--%>
                </ul>
                <!-- ============================================================== -->
                <!-- User profile and search -->
                <!-- ============================================================== -->
                <ul class="navbar-nav my-lg-0">
                    <!-- User Profile -->
                    <!-- ============================================================== -->

                    <li class="nav-item dropdown u-pro">
                        <a class="nav-link dropdown-toggle waves-effect waves-dark profile-pic" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="assets/images/users/default.jpg" alt="user" class=""> <span class="hidden-md-down"> <%=DatabaseOps.getInstance().getAccount(request.getRemoteUser()).getUsername()%> &nbsp;<i class="fa fa-angle-down"></i></span> </a>
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
    </header>
    <aside class="left-sidebar">
        <!-- Sidebar scroll-->
        <div class="scroll-sidebar">
            <!-- Sidebar navigation-->
            <nav class="sidebar-nav">
                <ul id="sidebarnav">
                    <%--has-arrow va antes de waves-effect --%>
                    <li class="user-pro"> <a class="waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><img src="assets/images/users/default.jpg" alt="user-img" class="img-circle"><span class="hide-menu"><%=DatabaseOps.getInstance().getAccount(request.getRemoteUser()).getFullName()%></span></a>
                    </li>

                    <li> <a class="waves-effect waves-dark" href="home.jsp"><i class="icon-speedometer"></i><span class="hide-menu"> Inicio</span></a></li>
                    <form action="goToProperties" method="post" id="goToProperties">
                        <input type="hidden" name="account" value="<%=request.getRemoteUser()%>">
                        <li> <a class="waves-effect waves-dark" onclick="goToProperties.submit()" ><i class="ti-home"></i><span class="hide-menu">  - Propiedades</span></a></li>
                    </form>
                    <form action="goToFunctionalUnits" method="post" id="goToFunctionalUnits">
                        <input type="hidden" name="account" value="<%=request.getRemoteUser()%>">
                        <li onclick="goToFunctionalUnits.submit()"> <a class="waves-effect waves-dark" ><i class="ti-layout"></i><span class="hide-menu">  - U. Funcionales</span></a></li>
                    </form>
                    <form action="goToClients" method="post" id="goToClients">
                        <input type="hidden" name="account" value="<%=request.getRemoteUser()%>">
                        <li onclick="goToClients.submit()"> <a class="waves-effect waves-dark" ><i class="ti-user"></i><span class="hide-menu">  - Clientes</span></a></li>
                    </form>
                    <form action="goToMyBalance" method="post" id="goToMyBalance">
                        <input type="hidden" name="account" value="<%=request.getRemoteUser()%>">
                        <li ><a class="waves-effect waves-dark" onclick="goToMyBalance.submit()"><i class="ti-wallet"></i> <span class="hide-menu">  - Mi balance</span></a></li>
                    </form>
                    <form action="goToMyProfile" method="post" id="goToMyProfile">
                        <input type="hidden" name="account" value="<%=request.getRemoteUser()%>">
                        <li onclick="goToMyProfile.submit()"> <a class="waves-effect waves-dark" ><i class="ti-user"></i><span class="hide-menu">  - Mi perfil</span></a> </li>
                    </form>
                    <form action="goToQuestions" method="post" id="goToQuestions">
                        <input type="hidden" name="account" value="<%=request.getRemoteUser()%>">
                        <li onclick="goToQuestions.submit()"> <a class="waves-effect waves-dark"  aria-expanded="false"><i class="fa fa-circle-o text-info"></i><span class="hide-menu">  - Preguntas</span></a></li>
                    </form>
                    <form action="logoutAccount" method="post" id="logout">
                        <input type="hidden" name="account" value="<%=request.getRemoteUser()%>">
                        <li onclick="logout.submit()"> <a class="waves-effect waves-dark" aria-expanded="false"><i class="fa fa-circle-o text-success"></i><span class="hide-menu">  - Cerrar sesion</span></a></li>
                    </form>
                </ul>
            </nav>
            <!-- End Sidebar navigation -->
        </div>
        <!-- End Sidebar scroll-->
    </aside>
    <div class="page-wrapper">
            <%%>
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
