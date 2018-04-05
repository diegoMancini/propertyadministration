<%--
  Created by IntelliJ IDEA.
  persons.User: DiegoMancini
  Date: 4/4/18
  Time: 12:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Log In</title>
        <style>
            body{
                background-color: rgb(236, 255, 253);
                font-family: Arial, sans-serif;
            }
            h3{
                font-family: Arial, sans-serif;
                text-align: center;
                font-size: 30px;
                color: rgb(73, 161, 140);
            }
            form{
                width: 100%;
                max-width: 330px;
                padding: 15px;
                font-size: 16px;
                margin: 0 auto;
                font-family: Arial, sans-serif;
            }
            input[type="email"] {
                margin-top: 30px;
                margin-bottom: 10px;
            }

            input[type="password"] {
                margin-top: 30px;
                margin-bottom: 10px;
            }

            .inbox-style{
                position: relative;
                box-sizing: border-box;
                height: auto;
                padding: 5px;
                font-size: 16px;
                font-family: Arial, sans-serif;
            }

            input[type="submit"]{
                background: #000000;
                color: white;
                padding: 10px;
            }

            p{
                text-align: center;
                margin-top: 40px;
                font-family: Arial, sans-serif;
                font-size: 20px;
                color: rgb(0, 0, 0);
            }
        </style>
    </head>
    <body class="text-center">
        <form id="loginForm" action="<%=response.encodeURL("j_security_check")%>" method="POST">
            <h3 class="h3 mb-3 font-weight-normal"><nobr>Already a member? Log in</nobr></h3>

            <label for="inputEmail">Email address</label>
            <input type="email" name="j_username" id="inputEmail" class="inbox-style" placeholder="Email address" required><br>

            <label for="inputPassword" >Password</label>
            <input type="password" name="j_password" id="inputPassword" class="inbox-style" placeholder="Password" required><br>

            <button type ="submit" >Log in</button>

            <p><a href="<%=response.encodeURL("index.jsp")%>">Go back</a></p>
        </form>
    </body>
</html>
