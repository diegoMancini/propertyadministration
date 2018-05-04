<%--
  Created by IntelliJ IDEA.
  User: Florencia
  Date: 4/27/18
  Time: 19:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Change facilities</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Tajawal" rel="stylesheet">
        <style>
            body{
                align-items: center;
                background-color: rgb(38, 57, 123);
                font-family: 'Tajawal', sans-serif;
            }

            h3{
                margin: 40px 0 0 0;
                font-family: 'Tajawal', sans-serif;
                text-align: center;
                font-size: 35px;
                color: rgb(204, 155, 0);
                font-weight: 700;
            }

            input[type=button], input[type = submit]{
                background-color: rgb(255, 189, 7);
                cursor: pointer;
                margin:auto;
                display:block;
                padding: 5px;
                font-size: 16px;
                color: rgb(255, 255, 255);
            }

            form{
                width: 100%;
                max-width: 330px;
                padding: 15px;
                font-size: 16px;
                margin: 0 auto;
                font-family: 'Tajawal', sans-serif;
            }

            label{
                text-align: center;
                margin-top: 30px;
                font-family: 'Tajawal', sans-serif;
                font-size:  18px;
                width: 100%;
                color: rgb(73, 211, 255);
            }
        </style>
    </head>
    <body>
        <h3>Change the facilities of the chosen property</h3>
        <form action="changeFacility" class="inbox-style" method="post">
            <input type="hidden" name="chosenProperty" value="<%=request.getAttribute("chosenProperty")%>">

            <label for="newFacilitiesName">Property name</label>
            <input type="text" name="newFacilitiesName" id="newFacilitiesName" class="form-control" placeholder="Property name"><br>

            <label for="newFacilitiesBathrooms">Amount of bathrooms</label>
            <input type="number" name="amtBathrooms" id="newFacilitiesBathrooms" class="form-control" placeholder="Amount of bathrooms" required><br>

            <label for="newFacilitiesRooms">Amount of rooms</label>
            <input type="number" name="amtRooms" id="newFacilitiesRooms" class="form-control" placeholder="Amount of rooms" required><br>

            <label for="newFacilitiesSqrMeter">Square meter</label>
            <input type="number" name="sqrMeter" id="newFacilitiesSqrMeter" class="form-control" placeholder="Square meter" required><br>

            <label for="newFacilitiesDetails">Details</label>
            <textarea name="details" id="newFacilitiesDetails" cols="30" rows="10" class="form-control" placeholder="Write something about the property"></textarea><br>
            <input type="submit" class="btn btn-warning" value="Change facilities"><br>
        </form>

        <form>
            <input type="button" class="btn btn-warning" value="Cancel" onclick="window.location.href='http://localhost:8080/choosePropertyToChangeFacilities.jsp'" /><br>
        </form>
    </body>
</html>
