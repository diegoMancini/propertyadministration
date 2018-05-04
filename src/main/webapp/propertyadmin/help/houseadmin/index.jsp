<%--
  Created by IntelliJ IDEA.
  database.User: Florencia
  Date: 3/31/18
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Welcome to Houseadmin</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Tajawal" rel="stylesheet">
        <style>
            body{
                height: 100%;
                align-items: center;
                justify-content: center;
                background-color: rgb(38, 57, 123);
                background-image: url("/images/houseBlueprint.jpg");
                background-size: cover;
                background-position: center;

            }

            h1{
                text-align: center;
                margin-top: 100px;
                font-family: 'Tajawal', sans-serif;
                font-size: 50px;
                color: rgb(204, 155, 0);
                font-weight: 700;
            }

            input[type = button]{
                background-color: rgb(255, 189, 7);
                cursor: pointer;
                margin:auto;
                display:block;
                padding: 5px;
                font-size: 16px;
                color: rgb(255, 255, 255);
                border: 0;
            }

            li {
                display: inline;
                padding: 0 10px 0 5px;
                font-family: 'Tajawal', sans-serif;
                font-size: 20px;
                color: rgb(73, 211, 255);
                font-weight: bold;
                border: 2px;
                border-color: white;
            }

            ul{
                margin-top: 50px;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <h1>House Admin</h1>
        <form>
            <input type="button" class="btn btn-warning" value="Log in" onclick="window.location.href='http://localhost:8080/login.jsp'" />
        </form>

        <form>
            <input type="button" class="btn btn-warning" value="Sign up" onclick="window.location.href='http://localhost:8080/signup.jsp'" />
        </form>
        <ul><li><b>Diego Mancini</b></li> <li><b>Florencia Vimberg</b></li></ul>
    </body>
</html>
