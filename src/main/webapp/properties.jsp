<%@ page import="database.User" %>
<%@ page import="database.Property" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Florencia
  Date: 4/9/18
  Time: 19:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>User properties</title>
        <style>
            body{
                height: 100%;
                align-items: center;
                justify-content: center;
                background-color: rgb(236, 255, 253);
            }

            h1{
                font-family: Arial, sans-serif;
                text-align: center;
                margin-top: 40px;
                font-size: 40px;
                color: rgb(92, 216, 190);
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

            p{
                text-align: center;
                margin-top: 30px;
                font-family: Arial, sans-serif;
                font-size: 20px;
            }
        </style>
    </head>
    <body >
        <h1> <i><%=request.getRemoteUser()%></i> properties</h1>
        <p>Here we display your properties, once you add them</p>
        <%--<i><%--%>
            <%--User user = (User) request.getAttribute("user");--%>
            <%--List<Property> properties = user.getProperty();--%>
            <%--for (int i = 0; i < properties.size(); i++) {--%>
                <%--System.out.println("Property number " + i);--%>
                <%--properties.get(i).toString();--%>
            <%--}--%>
        <%--%></i>--%>
        <form>
            <input type="button" value="Add property" onclick="window.location.href='addProperty.jsp'" />
        </form>
        <form>
            <input type="button" value="Delete property" onclick="window.location.href='http://localhost:8080/deleteProperty.jsp'" />
        </form>
        <form>
            <input type="button" value="Go back" onclick="window.location.href='http://localhost:8080/home.jsp'" />
        </form>
    </body>
</html>
