<%@ page import="database.Employee" %>
<%@ page import="database.Property" %>
<%@ page import="java.util.List" %>
<%@ page import="database.User" %>
<%@ page import="database.DatabaseOps" %><%--
  Created by IntelliJ IDEA.
  User: DiegoMancini
  Date: 2/5/18
  Time: 00:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Search results</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Tajawal" rel="stylesheet">
        <style>
            body{
                background-color: rgb(38, 57, 123);
                font-family: 'Tajawal', sans-serif;
            }

            h3{
                font-family: 'Tajawal', sans-serif;
                text-align: center;
                margin-top: 40px;
                font-size: 30px;
                font-weight: 700;
                color: rgb(204, 155, 0);
            }

            p{
                text-align: center;
                margin-top: 30px;
                font-family: 'Tajawal', sans-serif;
                font-size:  18px;
                width: 100%;
                color: rgb(73, 211, 255);
            }
            h1{
                font-family: 'Tajawal', sans-serif;
                text-align: center;
                margin-top: 40px;
                font-size: 40px;
                font-weight: 700;
                color: rgb(204, 155, 0);
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

            input[type=button]{
                background-color: rgb(255, 189, 7);
                cursor: pointer;
                margin:auto;
                display:block;
                padding: 5px;
                font-size: 16px;
                color: rgb(255, 255, 255);
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>

    <h3> Search results </h3>

    <table>
        <% List<Property> properties = (List<Property>) request.getAttribute("searchedProperties"); %>
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
                            <button type="submit" name="chosenProperty" id="chosenProperty" value="<%=i%>" class="btn btn-warning">Display details</button>
                        </td>
                    </form>
                </tr>
            <%}%>
        <%} else { %>
            <p>There are no matching properties</p>
        <%}%>
    </table>
    <form>
        <input type="button" class="btn btn-warning" value="Go back" onclick="window.location.href='http://localhost:8080/home.jsp'" />
    </form>

    </body>
</html>
