<%--
  Created by IntelliJ IDEA.
  User: DiegoMancini
  Date: 4/4/18
  Time: 12:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Log In</title>
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

            input[type=email], input[type=password] {
                margin-top: 30px;
                margin-bottom: 10px;
            }

            label{
                color: rgb(255,255,255);
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
        </style>
    </head>
    <body class="text-center">
        <form id="loginForm" action="<%=response.encodeURL("j_security_check")%>" method="POST">
            <h3><nobr>Already a member? Log in</nobr></h3>

            <label for="inputUsername">Email address</label>
            <input type="email" name="j_username" id="inputUsername" class="form-control" placeholder="Email address" required><br>

            <label for="inputPassword" >Password</label>
            <input type="password" name="j_password" id="inputPassword" class="form-control" placeholder="Password" required><br>

            <input type="submit" class="btn btn-warning" value="Log in">

            <form>
                <input type="button" class="btn btn-warning" value="Go back" onclick="window.location.href='http://localhost:8080/index.jsp'" />
            </form>
        </form>
    </body>
</html>
