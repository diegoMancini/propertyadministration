<%--
  Created by IntelliJ IDEA.
  User: Florencia
  Date: 4/10/18
  Time: 09:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Add Facilities</title>
        <style>
            body{
                background-color: rgb(236, 255, 253);
                font-family: Arial, sans-serif;
            }

            h1{
                font-family: Arial, sans-serif;
                text-align: center;
                margin-top: 40px;
                font-size: 40px;
                color: rgb(92, 216, 190);
                width: 400px;
            }

            form{
                width: 100%;
                max-width: 330px;
                padding: 15px;
                font-size: 16px;
                margin: 0 auto;
                font-family: Arial, sans-serif;
            }

            input[type=text], input[type=number], input[type=date]{
                margin-top: 15px;
                margin-bottom: 15px;
            }

            .inbox-style{
                position: static;
                box-sizing: border-box;
                width: 100%;
                height: auto;
                padding: 5px;
                font-size: 16px;
                font-family: Arial, sans-serif;
            }

            input[type=button], input[type=submit]{
                background-color: rgb(47, 152, 182);
                cursor: pointer;
                margin: auto;
                display:block;
                padding: 5px;
                font-size: 16px;
                margin-bottom: 5px;
                margin-top: 10px;
                color: rgb(255, 255, 255);
            }
        </style>
    </head>
    <body>
        <form method="POST" action="addfacilities">
            <%--display property name--%>
            <h1>Add facilities to your property</h1>
            <label for="newFacilitiesBathrooms">Amount of bathrooms</label>
            <input type="number" name="amtBathrooms" id="newFacilitiesBathrooms" class="inbox-style" placeholder="Amount of bathrooms" required><br>

            <label for="newFacilitiesRooms">Amount of rooms</label>
            <input type="number" name="amtRooms" id="newFacilitiesRooms" class="inbox-style" placeholder="Amount of rooms" required><br>

            <label for="newFacilitiesSqrMeter">Square meter</label>
            <input type="number" name="sqrMeter" id="newFacilitiesSqrMeter" class="inbox-style" placeholder="Square meter" required><br>

            <label for="newFacilitiesDetails">Details</label>
            <textarea name="details" id="newFacilitiesDetails" cols="30" rows="10" class="inbox-style" placeholder="Write something about the property"></textarea><br>

            <input type="submit" value="Add facilities">

            <form>
                <input type="button" value="Cancel" onclick="window.location.href='http://localhost:8080/addProperty.jsp'" />
            </form>
        </form>
    </body>
</html>
