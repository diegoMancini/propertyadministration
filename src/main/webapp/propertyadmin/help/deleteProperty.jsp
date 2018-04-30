<%@ page import="database.Property" %>
<%@ page import="java.util.List" %>
<%@ page import="database.DatabaseOps" %>
<%--
  Created by IntelliJ IDEA.
  User: Florencia
  Date: 4/9/18
  Time: 20:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Property manager</title>

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>

            body{
                height: 100%;
                align-items: center;
                justify-content: center;
                background-color: rgb(38, 57, 123);
                font-family: Arial, sans-serif;
            }

            h3{
                margin: 40px 0 0 0;
                font-family: Arial, sans-serif;
                text-align: center;
                font-size: 40px;
                font-weight: 700;
                color: rgb(204, 155, 0);
            }

            input[type=text]{
                margin-top: 10px;
                margin-bottom: 10px;
            }

            input[type=button], input[type = submit]{
                background-color: rgb(255, 189, 7);
                cursor: pointer;
                margin:auto;
                display:block;
                padding: 5px;
                font-size: 16px;
                color: rgb(255, 255, 255);
            }

            p{
                text-align: center;
                margin-top: 30px;
                font-family: Arial, sans-serif;
                font-size:  18px;
                width: 100%;
                color: rgb(73, 211, 255);
            }

            table{
                text-align: center;
                margin-top: 30px;
                font-family: Arial, sans-serif;
                font-size: 20px;
                color: rgb(67, 135, 177);
                width: 100%;
            }

            th{
                text-align: center;
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
        <h3>Manage properties</h3>
        <p>Choose a property to delete</p>
        <form action="deleteProperty" method="POST">
            <table>
                <tr>
                    <th><b>Number</b></th>
                    <th><b>Address</b></th>
                    <th></th>
                </tr>
                <% List<Property> properties = DatabaseOps.getInstance().getUser(request.getRemoteUser()).getAvailableProperties(); %>
                <%for(int i=0; i< properties.size();i++) { %>
                    <tr>
                        <td><%=i+1%></td>
                        <td><%= (properties.get(i)).getName()%></td>
                        <td>
                            <button type="submit" class="btn btn-default btn-sm" onclick="">
                                <span class="glyphicon glyphicon-trash"></span> DELETE
                            </button>
                        </td>
                    </tr>
                <%}%>
            </table>
            <%--<input type="submit" value="Delete">--%>
        </form>
        <form>
            <input type="button" value="Cancel" onclick="window.location.href='http://localhost:8080/properties.jsp'" /><br>
        </form>
    </body>
</html>