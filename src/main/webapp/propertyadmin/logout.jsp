<%--
  Created by IntelliJ IDEA.
  User: DiegoMancini
  Date: 5/5/18
  Time: 04:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title> Property Admin - Fin Sesion</title>

    <!-- Favicon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/favicon.png">

    <!-- Core Stylesheet -->
    <link href="/propertyadmin/dist/css/style2.css" rel="stylesheet">

    <link href="dist/css/style.min.css" rel="stylesheet">

    <!-- Responsive CSS -->
    <link href="/propertyadmin/dist/css/responsive.css" rel="stylesheet">

    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>

    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
</head>
<body>
<!-- Preloader Start -->
<div class="preloader">
    <div class="loader">
        <div class="loader__figure"></div>
        <p class="loader__label">Property-Admin</p>
    </div>
</div>
<section class="our-monthly-membership section_padding_50 clearfix">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-8">
                <div class="membership-description">
                    <h2>Gracias por usar Property Admin.</h2>
                    <p>Vuelva pronto.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="get-started-button wow bounceInDown" data-wow-delay="0.5s">
                    <%session.invalidate();%>
                    <a href="landingpage.jsp">Finalizar sesion</a>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
