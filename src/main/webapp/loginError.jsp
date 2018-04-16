<%--
  Created by IntelliJ IDEA.
  propertyAdmin.database.User: Florencia
  Date: 4/4/18
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Log in error</title>
    <style>
        body{
            background-color: rgb(236, 255, 253);
            font-family: Arial, sans-serif;
        }
        h1{
            text-align: center;
            margin-top: 40px;
            font-family: Arial, sans-serif;
            font-size: 50px;
            color: rgb(92, 216, 190);
        }
        p{
            text-align: center;
            margin-top: 30px;
            font-family: Arial, sans-serif;
            font-size: 20px;
        }
    </style>
</head>
<body>
    <h1>Login Error</h1>
    <%--<%@include file="/menu.jsp" %>--%>
    <p>Wrong username or password, please <a href="<%=response.encodeURL("login.jsp")%>">retry</a>.</p>
</body>
</html>
