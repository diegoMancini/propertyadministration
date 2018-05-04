<%@ page import="database.Property" %>
<%@ page import="database.Contact" %>
<%@ page import="java.util.List" %><%--
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

            input[type=submit]{
                background-color: #f0ad4e;
                cursor: pointer;
                margin:auto;
                display:block;
                padding: 5px;
                font-size: 16px;
                color: rgb(255, 255, 255);
                margin-bottom: 10px;
            }

            table{
                text-align: center;
                font-family: 'Tajawal', sans-serif;
                font-size: 20px;
                color: rgb(73, 211, 255);
                width: 100%;
            }

            th{
                text-align: center;
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

            .btn-warning{
                font-size: 16px;
            }

            form{
                font-family: 'Tajawal', sans-serif;
                text-align: center;
                margin-top: 40px;
                font-size: 40px;
                color: rgb(204, 155, 0);
                width: 100%;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" onclick="window.location.href='http://localhost:8080/home.jsp'"><b>House Admin</b></a>
                </div>
            </div>
        </nav>
        <%Property property = (Property) request.getAttribute("property");%>
        <h3>Displaying "<%=property.getName()%>" details</h3>
        <p> <u>Address</u> <%=property.getAddress()%> </p><br>
        <p> <u>Amount of bathrooms</u> <%=property.getAmtBathrooms()%> </p><br>
        <p> <u>Amount of rooms</u> <%=property.getAmtRooms()%> </p><br>
        <p> <u>Square meter</u> <%=property.getSqrMeter()%> </p><br>
        <p> <u>Details</u> <%=property.getDetails()%> </p><br>
        <p><u>Contacts list</u>:</p>
            <table>
                <%List<Contact> contacts = (List<Contact>) request.getAttribute("contacts");
                    if (contacts.size() > 0){%>
                    <tr>
                        <th><b>Number</b></th>
                        <th><b>Occupation</b></th>
                        <th><b>Full name</b></th>
                        <th><b>Contact phone</b></th>

                    </tr>
                <% for (int i = 0; i < contacts.size(); i++) { %>
                    <tr>
                        <td><%=i+1%></td>
                        <td><%= (contacts.get(i)).getOccupation()%></td>
                        <td><%= (contacts.get(i)).getFullName()%></td>
                        <td><%= (contacts.get(i)).getPhoneNumber()%></td>
                        <td>
                            <form action="deleteContact" method="post">
                                <input type="hidden" name="chosenProperty" value="<%=request.getAttribute("chosenProperty")%>">
                                <button type="submit" name="contactToDelete" id="contactToDelete" value="<%=i%>" class="btn btn-default btn-sm">
                                    <span class="glyphicon glyphicon-trash"></span>
                                </button>
                            </form>
                        </td>
                    </tr>
                <%}%>
            </table>
        <%} else { %>
               <p>You don't have contacts on your contact list</p>
        <%}%>
        <form action="chooseContact" method="post">
            <input type="hidden" name="chosenProperty" value="<%=request.getAttribute("chosenProperty")%>">
            <input type="submit" class="btn btn-warning" name="addContact" value="Add contact">
        </form>
    </body>
</html>
