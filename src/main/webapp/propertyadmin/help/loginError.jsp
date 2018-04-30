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
        <style>
            body{
                background-color: rgb(38, 57, 123);
                font-family: Arial, sans-serif;
            }

            h1{
                text-align: center;
                margin-top: 40px;
                font-family: Arial, sans-serif;
                font-size: 50px;
                color: rgb(204, 155, 0);
            }

            p{
                text-align: center;
                margin-top: 30px;
                font-family: Arial, sans-serif;
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
            <input type="button" value="Retry" onclick="window.location.href='http://localhost:8080/login.jsp'" /><br>
        </form>
    </body>
</html>
