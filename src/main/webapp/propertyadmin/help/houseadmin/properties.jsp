<%@ page import="database.Property" %>
<%@ page import="java.util.List" %>
<%@ page import="database.DatabaseOps" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
  Created by IntelliJ IDEA.
  User: Florencia
  Date: 4/9/18
  Time: 19:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
    <head>
        <title>User properties</title>
        <style>
            body{
                height: 100%;
                align-items: center;
                justify-content: center;
                background-color: rgb(38, 57, 123);
                font-family: Arial, sans-serif;
            }

            h1{
                font-family: Arial, sans-serif;
                text-align: center;
                margin-top: 40px;
                font-size: 40px;
                color: rgb(204, 155, 0);
            }

            input[type = button]{
                background-color: rgb(255, 189, 7);
                cursor: pointer;
                margin:auto;
                display:block;
                padding: 5px;
                font-size: 16px;
                color: rgb(255, 255, 255);
            }

            table{
                text-align: center;
                margin-top: 30px;
                font-family: Arial, sans-serif;
                font-size: 20px;
                color: rgb(73, 211, 255);
                width: 100%;
            }

            form{
                font-family: Arial, sans-serif;
                text-align: center;
                margin-top: 40px;
                font-size: 40px;
                color: rgb(204, 155, 0);
                width: 100%;
            }
        </style>
    </head>
    <body>
        <form method="GET" action="displayProperties" >
        <h1> <%=DatabaseOps.getInstance().getUser(request.getRemoteUser()).getFullName()%> properties</h1>
            <table>
                <tr>
                    <th><b>Number</b></th>
                    <th><b>Address</b></th>
                    <th><b>Name</b></th>
                </tr>
                <% List<Property> properties = DatabaseOps.getInstance().getUser(request.getRemoteUser()).getAvailableProperties(); %>
                <%for(int i=0; i< properties.size();i++) { %>
                    <tr>
                        <td><%=i+1%></td>
                        <td><%= (properties.get(i)).getAddress()%></td>
                        <td><%= (properties.get(i)).getName()%></td>
                    </tr>
                <%}%>
            </table>
        </form>

        <form>
            <input type="button" value="Add property" onclick="window.location.href='http://localhost:8080/addProperty.jsp'" />
        </form>
        <form>
            <input type="button" value="Delete property" onclick="window.location.href='http://localhost:8080/deleteProperty.jsp'" />
        </form>
        <form>
            <input type="button" value="Go back" onclick="window.location.href='http://localhost:8080/home.jsp'" />
        </form>
    </body>
</html>
