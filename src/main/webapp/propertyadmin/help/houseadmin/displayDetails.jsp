<%@ page import="database.Property" %><%--
  Created by IntelliJ IDEA.
  User: Florencia
  Date: 4/30/18
  Time: 19:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Property details</title>
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
        <%Property property = (Property) request.getAttribute("property");%>
        <h3>Displaying "<%=property.getName()%>" details</h3>
        <p> <u>Address</u> <%=property.getAddress()%> </p><br>
        <p> <u>Amount of bathrooms</u> <%=property.getAmtBathrooms()%> </p><br>
        <p> <u>Amount of rooms</u> <%=property.getAmtRooms()%> </p><br>
        <p> <u>Square meter</u> <%=property.getSqrMeter()%> </p><br>
        <p> <u>Details</u> <%=property.getDetails()%> </p><br>
        <form>
            <input type="button" class="btn btn-warning" value="Go back" onclick="window.location.href='http://localhost:8080/properties.jsp'" />
        </form>
    </body>
</html>
