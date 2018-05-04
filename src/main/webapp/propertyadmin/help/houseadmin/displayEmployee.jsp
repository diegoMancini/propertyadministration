<%@ page import="database.User" %>
<%@ page import="database.Property" %>
<%@ page import="java.util.List" %>
<%@ page import="database.DatabaseOps" %>
<%@ page import="database.Employee" %><%--
  Created by IntelliJ IDEA.
  User: Florencia
  Date: 5/1/18
  Time: 00:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
            <title>Employee details</title>
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
    <h3><%Employee employee = (Employee) request.getAttribute("employee");%> Displaying "<%=employee.getName()%>" details</h3>
    <p> <u>Username: </u> <%=employee.getUsername()%> </p><br>
    <p> <u>Full name: </u> <%=employee.getName()%> </p><br>
    <p> <u>Identity number: </u> <%=employee.getIdentityNumber()%> </p><br>
    <p> <u>Phone number: </u> <%=employee.getPhoneNumber()%> </p>  <br>

    <table>
        <% List<Property> properties = employee.getAvailableProperties(); %>
        <%if (properties.size() > 0){%>
        <p> <u><%=employee.getName()%> allowed properties to manage:</u></p>
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
                </tr>
            <%}%>
        <%} else { %>
            <p>This employee has no properties to manage</p>
        <%}%>
    </table>
    <form>
        <input type="button" class="btn btn-warning" value="Go back" onclick="window.location.href='http://localhost:8080/home.jsp'" />
    </form>
    </body>

</html>