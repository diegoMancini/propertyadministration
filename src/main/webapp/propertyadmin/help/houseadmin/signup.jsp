<%--
  Created by IntelliJ IDEA.
  User: DiegoMancini
  Date: 4/4/18
  Time: 12:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Sign up</title>
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
        <form class="form-style" method="POST" action="signup">
            <h3>Not a member? Create an account </h3>

            <label for="newAccountName">Name</label>
            <input type="text" name="name" id="newAccountName" class="form-control" placeholder="Name" required><br>

            <label for="newAccountSurname">Surname</label>
            <input type="text" name="surname" id="newAccountSurname" class="form-control" placeholder="Surname" required><br>

            <label for="newAccountIdentityNumber">Identity number</label> <%--dni--%>
            <input type="number" name="identityNumber" id="newAccountIdentityNumber" class="form-control" placeholder="Identity number" required><br>

            <label for="newAccountPhoneNumber">Phone number</label>
            <input type="number" name="phoneNumber" id="newAccountPhoneNumber" class="form-control" placeholder="Phone number"><br>

            <label for="newUsername">Email address</label>
            <input type="email" name="username" id="newUsername" class="form-control" placeholder="Email address" required><br>

            <label for="newAccountPassword">Password</label>
            <input type="password" name="password" id="newAccountPassword" class="form-control" placeholder="Password" required><br>

            <input type="submit" class="btn btn-warning" value="Sign up">

            <form>
                <input type="button" class="btn btn-warning" value="Go back" onclick="window.location.href='http://localhost:8080/index.jsp'" />
            </form>
        </form>
    </body>
</html>
