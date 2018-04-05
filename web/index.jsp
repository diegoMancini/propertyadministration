<%--
  Created by IntelliJ IDEA.
  database.persons.User: Florencia
  Date: 3/31/18
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
      <title>Welcome to Houseadmin</title>
          <%--h3{--%>

          <%--}--%>

          <%--.form-style {--%>
              <%--width: 100%;--%>
              <%--max-width: 330px;--%>
              <%--padding: 15px;--%>
              <%--margin: 0 auto;--%>
              <%--font-family: Arial, sans-serif;--%>

          <%--}--%>

          <%--.form-style .form-control {--%>
              <%--position: relative;--%>
              <%--box-sizing: border-box;--%>
              <%--height: auto;--%>
              <%--padding: 10px;--%>
              <%--font-size: 16px;--%>
              <%--font-family: Arial, sans-serif;--%>
          <%--}--%>

          <%--.form-style .form-control:focus {--%>
              <%--z-index: 2;--%>
          <%--}--%>

          <%--.form-style input[type="email"] {--%>
              <%--margin-bottom: 10px;--%>
              <%--border-bottom-right-radius: 0;--%>
              <%--border-bottom-left-radius: 0;--%>

          <%--}--%>

          <%--.form-style input[type="password"] {--%>
              <%--margin-bottom: 10px;--%>
              <%--border-top-left-radius: 0;--%>
              <%--border-top-right-radius: 0;--%>
          <%--}--%>

          <%--/*TODO darle estilo al boton*/--%>
          <%--/*input[type = "submit"]{*/--%>
          <%--/*background: #000000;*/--%>
          <%--/*color: white;*/--%>
          <%--/*padding: 10px;*/--%>
          <%--/*}*/--%>

          <%--.form-style input[type="text"] {--%>
              <%--margin-bottom: 10px;--%>
              <%--border-top-left-radius: 0;--%>
              <%--border-top-right-radius: 0;--%>
          <%--}--%>

          <%--.form-style input[type="number"] {--%>
              <%--margin-bottom: 10px;--%>
              <%--border-top-left-radius: 0;--%>
              <%--border-top-right-radius: 0;--%>
          <%--}--%>
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

          p{
              text-align: center;
              margin-top: 40px;
              font-family: Arial, sans-serif;
              font-size: 20px;
              color: rgb(0, 0, 0);
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
    <p><a href="<%=response.encodeURL("signup.jsp")%>">Sign Up</a></p>
    <p><a href="<%=response.encodeURL("login.jsp")%>">Log In</a></p>
    <ul><li>Florencia Vimberg</li> <li>Diego Mancini</li></ul>
  </body>
</html>
