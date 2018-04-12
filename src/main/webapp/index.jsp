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
              background-color: rgb(236, 255, 253);
          }

          h1{
              text-align: center;
              margin-top: 40px;
              font-family: Arial, sans-serif;
              font-size: 50px;
              color: rgb(92, 216, 190);
          }

          input[type = button]{
              background-color: rgb(47, 152, 182);
              cursor: pointer;
              margin:auto;
              display:block;
              border: 0;
              padding: 5px;
              font-size: 16px;
              border: rgb(0,0,0);
              color: rgb(255, 255, 255);
          }

          li {
              display: inline;
              padding: 0 10px 0 5px;
              font-family: Arial, sans-serif;
              font-size: 20px;
              color: rgb(73, 161, 140);
          }

          ul{
              margin-top: 35px;
              text-align: center;
          }
      </style>
  </head>
  <body>
    <h1>House Admin</h1>
    <form>
        <input type="button" value="Sign Up" onclick="window.location.href='http://localhost:8080/signup.jsp'" />
    </form>

    <form>
        <input type="button" value="Log in" onclick="window.location.href='http://localhost:8080/login.jsp'" />
    </form>
    <ul><li>Diego Mancini</li></ul>
  </body>
</html>
