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
                font-family: Arial, sans-serif;
                font-size: 50px;
                color: rgb(204, 155, 0);
                font-weight: bold;
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
                font-family: Arial, sans-serif;
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
            <input type="button" value="Log in" onclick="window.location.href='http://localhost:8080/login.jsp'" />
        </form>

        <form>
            <input type="button" value="Sign up" onclick="window.location.href='http://localhost:8080/signup.jsp'" />
        </form>
        <ul><li>Diego Mancini</li> <li>Florencia Vimberg</li></ul>
    </body>
</html>
