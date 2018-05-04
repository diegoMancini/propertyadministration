<%@ page import="database.User" %>
<%@ page import="database.DatabaseOps" %>
<%@ page import="java.util.List" %>
<%@ page import="database.Employee" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>HouseAdmin - Home</title>
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

            h3{
                margin: 40px 0 0 0;
                font-family: 'Tajawal', sans-serif;
                text-align: center;
                font-size: 25px;
                color: rgb(73, 211, 255);
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

            form{
                font-family: 'Tajawal', sans-serif;
            }

            .navbar-inverse{
                background-color: rgb(63, 94, 203);
                color: rgb(73, 211, 255);
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

            .form-control{
                height: 25px;
                font-size: 12px;
                margin: 10px 15px 10px 10px;
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

            input[type = button]{
                background-color: #f0ad4e;
                cursor: pointer;
                display:block;
                padding: 5px;
                font-size: 16px;
                color: rgb(255, 255, 255);
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
                    <li class="nav-item ">
                        <a class="nav-link" onclick="window.location.href='http://localhost:8080/properties.jsp'">See properties</a>
                    </li>
                    <%if (DatabaseOps.getInstance().getAccountRole(request.getRemoteUser()).equals("Owner")){ %>
                        <li class="nav-item ">
                            <a class="nav-link" onclick="window.location.href='http://localhost:8080/addEmployee.jsp'">Add employee</a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" onclick="window.location.href='http://localhost:8080/deleteEmployee.jsp'">Delete employee</a>
                        </li>
                    <%}%>
                    <li class="nav-item">
                        <form action="search" method="post">
                            <input name="searchInput" id="searchInput" type="text" class="form-control" placeholder="Search..." onsubmit="window.location.href='http://localhost:8080/searchResult.jsp'">
                        </form>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" onclick="window.location.href='http://localhost:8080/logout.jsp'"><i>Log out</i></a>
                    </li>
                </ul>
            </div>
        </nav>

        <h1><b>HOUSE ADMIN</b></h1>
        <h3>Welcome back <%=request.getUserPrincipal().getName()%></h3>
        <table>
            <% if(DatabaseOps.getInstance().getAccountRole(request.getRemoteUser()).equals("Owner")){
                List<Employee> employee = DatabaseOps.getInstance().getUser(request.getRemoteUser()).getAvailableEmployees();%>
                <%if (employee.size() > 0){%>
                    <tr>
                        <th><b>Number</b></th>
                        <th><b>Full name</b></th>
                        <th><b>Username</b></th>
                    </tr>

                    <%for(int i=0; i< employee.size();i++) { %>
                        <tr>
                            <td><%=i+1%></td>
                            <td><%= (employee.get(i)).getName()%></td>
                            <td><%= (employee.get(i)).getUsername()%></td>
                            <form action="displayEmployee" method="POST">
                                <td>
                                    <button type="submit" name="chosenEmployee" id="chosenEmployee" value="<%=i%>" class="btn btn-default btn-sm">
                                        <span class="glyphicon glyphicon-user"></span>
                                    </button>
                                </td>
                            </form>
                            <form action="chooseEmployee" method="POST">
                                <td>
                                    <button type="submit" name="employee" id="employee" value="<%=employee.get(i).getUsername()%>" class="btn btn-default btn-sm">
                                        <span class="glyphicon glyphicon-plus"></span>
                                    </button>
                                </td>
                            </form>
                        </tr>
                    <%}%>
                <% } else { %>
                    <p>Here we display your employees once you add them.</p>
                <%}%>
            <%} else if (DatabaseOps.getInstance().getAccountRole(request.getRemoteUser()).equals("Employee")){ %>
                <p></p>
            <%}%>
        </table>
    </body>
</html>