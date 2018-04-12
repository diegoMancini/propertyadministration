<%--
  Created by IntelliJ IDEA.
  database.User: Florencia
  Date: 4/3/18
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Log out</title>
    <style>
        body{
            background-color: rgb(236, 255, 253);
        }

        h1{
            text-align: center;
            margin-top: 40px;
            font-family: Arial, sans-serif;
            font-size: 50px;
            color: rgb(92, 216, 190);
        }

        h3{
            font-family: Arial, sans-serif;
            text-align: center;
            width: 100%;
            color: rgb(73, 161, 140);
        }

        input[type = button]{
            background-color: rgb(47, 152, 182);
            cursor: pointer;
            margin:auto;
            display:block;
            border: 0;
            padding: 5px;
            font-size: 16px;
            border: rgb(0,0,0);
            color: rgb(255, 255, 255);
        }
    </style>
</head>
<body>
    <h1>Log out</h1>
    <h3>The user <i><%=request.getRemoteUser()%></i> has logged out</h3>
    <% session.invalidate(); %>
    <form>
        <input type="button" value="Go home" onclick="window.location.href='http://localhost:8080/home.jsp'" />
    </form>
</body>
</html>
