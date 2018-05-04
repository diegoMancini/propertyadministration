<%--
  Created by IntelliJ IDEA.
  User: Florencia
  Date: 5/2/18
  Time: 11:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Add contact</title>
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
                margin: 40px 0 0 0;
                font-family: 'Tajawal', sans-serif;
                text-align: center;
                font-size: 25px;
                color: rgb(73, 211, 255);
                font-weight: 700;
            }

            form{
                width: 100%;
                max-width: 330px;
                padding: 15px;
                font-size: 16px;
                margin: 0 auto;
                font-family: 'Tajawal', sans-serif;
            }

            input[type=password], input[type=number], input[type=text], input[type=email]{
                margin-top: 10px;
                margin-bottom: 10px;
                width: 100%;
            }

            label{
                color: rgb(255, 255, 255);
            }

            input[type=button], input[type=submit]{
                background-color: rgb(255, 189, 7);
                cursor: pointer;
                display:block;
                padding: 5px;
                font-size: 16px;
                color: rgb(255, 255, 255);
                margin: 10px 0 10px 0;
            }

            input[type=radio]{
                color: rgb(255, 255, 255);
            }

            p{
                color: rgb(255,255,255);
                font-size: 16px;
            }
        </style>
    </head>

    <body class="text-center">
    <form class="form-style" method="POST" action="addContact">
        <h3>Type contact details </h3>
        <input type="hidden" name="chosenProperty" value="<%=request.getAttribute("chosenProperty")%>">

        <label for="newContactOccupation">Occupation</label>
        <input type="text" name="occupation" id="newContactOccupation" class="form-control" placeholder="Occupation" required><br>

        <label for="newContactName">Name</label>
        <input type="text" name="name" id="newContactName" class="form-control" placeholder="Name" required><br>

        <label for="newContactSurname">Surname</label>
        <input type="text" name="surname" id="newContactSurname" class="form-control" placeholder="Surname" required><br>

        <label for="newContactPhoneNumber">Phone number</label>
        <input type="number" name="phoneNumber" id="newContactPhoneNumber" class="form-control" placeholder="Phone number"><br>

        <input type="submit" class="btn btn-warning" value="Add contact">

        <form>
            <input type="button" class="btn btn-warning" value="Go back" onclick="window.location.href='http://localhost:8080/properties.jsp'" />
        </form>
    </form>
    </body>
</html>
