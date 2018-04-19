<%--
  Created by IntelliJ IDEA.
  propertyAdmin.database.User: Florencia
  Date: 4/3/18
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cerrar sesion</title>
    <style>
        body{
            background-color: rgb(38, 57, 123);
            font-family: Arial, sans-serif;
        }

        h1{
            text-align: center;
            margin-top: 40px;
            font-family: Arial, sans-serif;
            font-size: 50px;
            color: rgb(204, 155, 0);
        }

        h3{
            font-family: Arial, sans-serif;
            text-align: center;
            width: 100%;
            color: rgb(73, 211, 255);
        }

        input[type = button]{
            background-color: rgb(255, 189, 7);
            cursor: pointer;
            margin:auto;
            display:block;
            border: 0;
            padding: 5px;
            font-size: 16px;
            color: rgb(255, 255, 255);
        }
    </style>
</head>
<body>
    <h1>Cerrar sesion</h1>
    <h3>El usuario <i><%=request.getRemoteUser()%></i> ha cerrado su sesion.</h3>
    <% session.invalidate(); %>
    <form>
        <input type="button" value="Go home" onclick="window.location.href='http://localhost:8080/home.jsp'" />
    </form>
</body>
</html>
