<%@ page import="database.Property" %>
<%@ page import="java.util.List" %>
<%@ page import="database.DatabaseOps" %>
<%@ page import="javax.xml.crypto.Data" %>
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
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Tajawal" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <style>
            body{
                height: 100%;
                align-items: center;
                justify-content: center;
                background-color: rgb(38, 57, 123);
                font-family: 'Tajawal', sans-serif;
                color: rgb(204, 155, 0);
                line-height: 1;
            }

            h1{
                font-family: 'Tajawal', sans-serif;
                text-align: center;
                margin-top: 40px;
                font-size: 40px;
                font-weight: 700;
                color: rgb(204, 155, 0);
            }

            .navbar-inverse{
                background-color: rgb(63, 94, 203);
                color: rgb(73, 211, 255);
            }

            input[type = button]{
                background-color: #f0ad4e;
                cursor: pointer;
                margin:auto;
                display:block;
                padding: 5px;
                font-size: 16px;
                color: rgb(255, 255, 255);
            }

            .navbar-inverse .navbar-nav>li>a{
                color: rgb(255, 189, 7);
                font-size: 15px;
                cursor: pointer;
            }

            .navbar-inverse .navbar-brand {
                color: rgb(255, 189, 7);
                font-size: 18px;
                font-weight: 400;
                cursor: pointer;
            }

            .navbar navbar-inverse{
                position: sticky;
            }

            table{
                text-align: center;
                margin-top: 30px;
                font-family: 'Tajawal', sans-serif;
                font-size: 20px;
                color: rgb(73, 211, 255);
                width: 100%;
            }

            th{
                text-align: center;
            }

            form{
                font-family: 'Tajawal', sans-serif;
                text-align: center;
                margin-top: 40px;
                font-size: 40px;
                color: rgb(204, 155, 0);
                width: 100%;
            }

            p{
                text-align: center;
                margin-top: 30px;
                font-family: 'Tajawal', sans-serif;
                font-size:  18px;
                width: 100%;
                color: rgb(73, 211, 255);
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" onclick="window.location.href='http://localhost:8080/home.jsp'"><b>House Admin</b></a>
                </div>
                <ul class="nav navbar-nav">
                    <%--<li class="nav-item">--%>
                        <%--<form action="search" method="post">--%>
                            <%--<input name="searchInput" type="text" class="form-control" placeholder="Buscar..." onclick="window.location.href='http://localhost:8080/searchResult.jsp'">--%>
                        <%--</form>--%>
                    <%--</li>--%>
                    <%if (DatabaseOps.getInstance().getAccountRole(request.getRemoteUser()).equals("Owner")){ %>
                        <li class="nav-item ">
                            <a class="nav-link" onclick="window.location.href='http://localhost:8080/addProperty.jsp'" >Add property</a>
                        </li>
                    <%}%>
                    <li class="nav-item">
                        <a class="nav-link" onclick="window.location.href='http://localhost:8080/choosePropertyToChangeFacilities.jsp'">Change facilities</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" onclick="window.location.href='http://localhost:8080/deleteProperty.jsp'">Delete property</a>
                    </li>
                </ul>
            </div>
        </nav>

        <% if (DatabaseOps.getInstance().getAccountRole(request.getRemoteUser()).equals("Owner")){ %>
            <h1>  <%DatabaseOps.getInstance().getUser(request.getRemoteUser()).getFullName();%> properties</h1>
        <%} else { %>
        <h1>  <%DatabaseOps.getInstance().getEmployee(request.getRemoteUser()).getName();%> properties</h1>
        <%}%>
        <table>
            <% List<Property> properties = null;
                if (DatabaseOps.getInstance().getAccountRole(request.getRemoteUser()).equals("Owner")){
                properties = DatabaseOps.getInstance().getUser(request.getRemoteUser()).getAvailableProperties();
            } else {
                properties = DatabaseOps.getInstance().getEmployee(request.getRemoteUser()).getAvailableProperties();
            }%>
            <%if (properties.size() > 0){%>
                <tr>
                    <th><b>Number</b></th>
                    <th><b>Address</b></th>
                    <th><b>Name</b></th>
                </tr>

                <%for(int i=0; i< properties.size();i++) { %>
                    <tr>
                        <td><%=i+1%></td>
                        <td><%= (properties.get(i)).getAddress()%></td>
                        <td><%= (properties.get(i)).getName()%></td>
                        <form action="displayDetails" method="POST">
                            <td>
                                <button type="submit" name="chosenProperty" id="chosenProperty" value="<%=i%>" class="btn btn-default btn-sm">
                                    <span class="glyphicon glyphicon-home"></span>
                                </button>
                            </td>
                        </form>
                    </tr>
                <%}%>
            <% } else if (DatabaseOps.getInstance().getUser(request.getRemoteUser()).getRole().equals("Owner")){ %>
                <p>Here we display your properties once you add them.</p>
            <%} else {%>
                <p>Here we display the properties you administrate</p>
            <%}%>
        </table>
        <form>
            <input type="button" class="btn btn-warning" value="Go back" onclick="window.location.href='http://localhost:8080/home.jsp'" />
        </form>
    </body>
</html>
