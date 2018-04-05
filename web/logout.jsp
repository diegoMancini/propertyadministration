<%--
  Created by IntelliJ IDEA.
  database.persons.User: Florencia
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

        p{
            text-align: center;
            margin-top: 40px;
            font-family: Arial, sans-serif;
            font-size: 20px;
            color: rgb(0, 0, 0);
        }
    </style>

</head>
<body>
    <h1>Log out</h1>
    <%--<%@include file="/menu.jsp"%> TODO later--%>
    <h3>The user <i><%=request.getRemoteUser()%></i> has logged out</h3>
    <% session.invalidate(); %>
    <p><a href="<%=response.encodeURL("index.jsp")%>">Go home</a></p>
</body>
</html>
