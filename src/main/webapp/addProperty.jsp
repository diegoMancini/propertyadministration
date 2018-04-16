<%--
  Created by IntelliJ IDEA.
  User: Florencia
  Date: 4/11/18
  Time: 09:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Add new propertyAdmin.property</title>
        <style>
            body{
                background-color: rgb(236, 255, 253);
                font-family: Arial, sans-serif;
            }

            h3{
                margin: 40px 0 0 0;
                font-family: Arial, sans-serif;
                text-align: center;
                font-size: 40px;
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

            input[type=text]{
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

            input[type=button]{
                background-color: rgb(47, 152, 182);
                cursor: pointer;
                margin:auto;
                display:block;
                padding: 5px;
                font-size: 16px;
                color: rgb(255, 255, 255);
            }

            input[type=submit]{
                background-color: rgb(47, 152, 182);
                cursor: pointer;
                margin:auto;
                display:block;
                padding: 5px;
                font-size: 20px;
                color: rgb(255, 255, 255);
            }

            p{
                text-align: center;
                margin-top: 30px;
                font-family: Arial, sans-serif;
                font-size:  18px;
            }
        </style>
    </head>
    <body>
        <h3>Add new propertyAdmin.property</h3>
        <form class="form-style" method="POST" action="addproperty">
            <label for="newPropertyAddress">Address</label>
            <input type="text" name="address" id="newPropertyAddress" class="inbox-style" placeholder="Address" required><br>

            <p>Choose a name to identify your propertyAdmin.property</p>
            <label for="newPropertyName">Name</label>
            <input type="text" name="name" id="newPropertyName" class="inbox-style" placeholder="Name" required><br>

            <form>
                <input type="button" value="Add facilities" onclick="window.location.href='http://localhost:8080/addFacilities.jsp'" /><br>
            </form>
            <form>
                <input type="button" value="Add tenant" onclick="window.location.href='http://localhost:8080/addTenant.jsp'" /><br>
            </form>

            <input type="submit" value="Add propertyAdmin.property"><br>

            <form>
                <input type="button" value="Cancel" onclick="window.location.href='http://localhost:8080/properties.jsp'" /><br>
            </form>

        </form>
    </body>
</html>
