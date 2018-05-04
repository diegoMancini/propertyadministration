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
        <style>
            body{
                background-color: rgb(38, 57, 123);
                font-family: Arial, sans-serif;
            }

            h3{
                font-family: Arial, sans-serif;
                text-align: center;
                font-size: 30px;
                color: rgb(204, 155, 0);
            }

            form{
                width: 100%;
                max-width: 330px;
                padding: 15px;
                font-size: 16px;
                margin: 0 auto;
                font-family: Arial, sans-serif;
            }

            input[type=password], input[type=number], input[type=text], input[type=email]{
                margin-top: 10px;
                margin-bottom: 10px;
            }

            .inbox-style{
                position: static;
                box-sizing: border-box;
                height: auto;
                padding: 5px;
                font-size: 16px;
                font-family: Arial, sans-serif;
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
        <form class="form-style" method="POST" action="signup">
            <h3 class="h3 mb-3 font-weight-normal">Not a member? Create an account </h3>

            <label for="newAccountName">Name</label>
            <input type="text" name="name" id="newAccountName" class="inbox-style" placeholder="Name" required><br> <%--TODO hacerlo required--%>

            <label for="newAccountSurname">Surname</label>
            <input type="text" name="surname" id="newAccountSurname" class="inbox-style" placeholder="Surname" required><br>

            <label for="newAccountIdentityNumber">Identity number</label> <%--dni--%>
            <input type="number" name="identityNumber" id="newAccountIdentityNumber" class="inbox-style" placeholder="Identity number" required><br>

            <label for="newAccountPhoneNumber">Phone number</label>
            <input type="number" name="phoneNumber" id="newAccountPhoneNumber" class="inbox-style" placeholder="Phone number"><br>

            <label for="newUsername">Email address</label>
            <input type="email" name="username" id="newUsername" class="inbox-style" placeholder="Email address" required><br>

            <label for="newAccountPassword">Password</label>
            <input type="password" name="password" id="newAccountPassword" class="inbox-style" placeholder="Password" required><br>

            <label>
                <input type="radio" name="role" value="Owner" class="inbox-style" checked>
            </label> Owner<br>
            <label>
                <input type="radio" name="role" value="Employee" class="inbox-style">
            </label> Employee<br>

            <input type="submit" value="Sign up">

            <form>
                <input type="button" value="Go back" onclick="window.location.href='http://localhost:8080/index.jsp'" />
            </form>
        </form>
    </body>
</html>
