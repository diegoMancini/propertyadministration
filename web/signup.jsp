<%--
  Created by IntelliJ IDEA.
  persons.User: DiegoMancini
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
                margin-top: 10px;
                margin-bottom: 10px;
            }

            input[type="password"] {
                margin-top: 10px;
                margin-bottom: 10px;
            }

            input[type="number"] {
                margin-top: 10px;
                margin-bottom: 10px;
            }

            input[type="text"] {
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

            p{
                text-align: center;
                margin-top: 40px;
                font-family: Arial, sans-serif;
                font-size: 20px;
                color: rgb(0, 0, 0);
            }

            input[type="submit"]{
                background: #000000;
                color: white;
                padding: 10px;
            }
        </style>
    </head>

    <body class="text-center">
        <form class="form-style" method="GET" action="signup">
            <h3 class="h3 mb-3 font-weight-normal">Not a member? Create an account </h3>

            <label for="newAccountName">Name</label>
            <input type="text" name="name" id="newAccountName" class="inbox-style" placeholder="Name" required><br> <%--TODO hacerlo required--%>

            <label for="newAccoutSurname">Surname</label>
            <input type="text" name="surname" id="newAccoutSurname" class="inbox-style" placeholder="Surname" required><br>

            <label for="newAccountIdentityNumber">Identity number</label> <%--dni--%>
            <input type="number" name="identityNumber" id="newAccountIdentityNumber" class="inbox-style" placeholder="Identity number" required><br>

            <label for="newAccountPhoneNumber">Phone number</label>
            <input type="number" name="phoneNumber" id="newAccountPhoneNumber" class="inbox-style" placeholder="Phone number"><br>

            <label for="newAccountEmail">Email address</label>
            <input type="email" name="email" id="newAccountEmail" class="inbox-style" placeholder="Email address" required><br>

            <label for="newAccountPassword">Password</label>
            <input type="password" name="password" id="newAccountPassword" class="inbox-style" placeholder="Password" required><br>

            <label>
                <input type="radio" name="role" value="Owner" class="inbox-style" checked>
            </label> Owner<br>
            <label>
                <input type="radio" name="role" value="Employee" class="inbox-style" checked>
            </label> Employee<br>

            <button type="submit">Sign in</button>

            <p><a href="<%=response.encodeURL("index.jsp")%>">Go back</a></p>
        </form>
    </body>
</html>
