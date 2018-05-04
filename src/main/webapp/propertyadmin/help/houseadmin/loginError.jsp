<%--
  Created by IntelliJ IDEA.
  database.User: Florencia
  Date: 4/4/18
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Log in error</title>
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

            h1{
                text-align: center;
                margin-top: 40px;
                font-family: 'Tajawal', sans-serif;
                font-size: 50px;
                font-weight: 700;
                color: rgb(204, 155, 0);
            }

            p{
                text-align: center;
                margin-top: 30px;
                font-family: 'Tajawal', sans-serif;
                font-size: 20px;
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
            }
        </style>
    </head>
    <body>
        <h1>Login Error</h1>
        <p>Wrong username or password</p>
        <form>
            <input type="button" class="btn btn-warning" value="Retry" onclick="window.location.href='http://localhost:8080/login.jsp'" /><br>
        </form>
    </body>
</html>
