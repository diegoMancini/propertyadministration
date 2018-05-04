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
        <title>Add new property</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Tajawal" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            body{
                background-color: rgb(38, 57, 123);
                font-family: 'Tajawal', sans-serif;
            }

            h3{
                margin: 40px 0 0 0;
                font-family: 'Tajawal', sans-serif;
                text-align: center;
                font-size: 40px;
                font-weight: 700;
                color: rgb(204, 155, 0);
            }

            form{
                width: 100%;
                max-width: 330px;
                padding: 15px;
                font-size: 16px;
                margin: 0 auto;
                font-family: 'Tajawal', sans-serif;
            }

            input[type=text], input[type = image]{
                margin-top: 10px;
                margin-bottom: 10px;
            }

            .navbar-inverse{
                background-color: rgb(63, 94, 203);
                color: rgb(73, 211, 255);
            }

            .navbar-inverse .navbar-nav>li>a{
                color: rgb(255, 189, 7);
                font-size: 15px;
                cursor: pointer;
            }

            .navbar-inverse .navbar-brand {
                color: rgb(255, 189, 7);
                font-size: 18px;
                font-weight: 400;
                cursor: pointer;
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

            label{
                color: rgb(255,255,255);
            }

            p{
                text-align: center;
                margin-top: 30px;
                font-family: 'Tajawal', sans-serif;
                font-size:  18px;
                color: rgb(73, 211, 255);
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" onclick="window.location.href='http://localhost:8080/home.jsp'"><b>House Admin</b></a>
                </div>
            </div>
        </nav>

        <h3>Add new property</h3>
        <form class="form-style" method="POST" action="addProperty">
            <label for="newPropertyAddress">Address</label>
            <input type="text" name="address" id="newPropertyAddress"  class="form-control" placeholder="Address" required><br>

            <p>Choose a name to identify your property</p>
            <label for="newPropertyName">Name</label>
            <input type="text" name="name" id="newPropertyName"  class="form-control" placeholder="Name" required><br>

            <p>Add facilities to your property</p>
            <label for="newFacilitiesBathrooms">Amount of bathrooms</label>
            <input type="number" name="amtBathrooms" id="newFacilitiesBathrooms" class="form-control" placeholder="Amount of bathrooms" required><br>

            <label for="newFacilitiesRooms">Amount of rooms</label>
            <input type="number" name="amtRooms" id="newFacilitiesRooms" class="form-control" placeholder="Amount of rooms" required><br>

            <label for="newFacilitiesSqrMeter">Square meter</label>
            <input type="number" name="sqrMeter" id="newFacilitiesSqrMeter" class="form-control" placeholder="Square meter" required><br>

            <label for="newFacilitiesDetails">Details</label>
            <textarea name="details" id="newFacilitiesDetails" cols="30" rows="10" class="form-control" placeholder="Write something about the property"></textarea><br>

            <input type="submit" value="Add property" class="btn btn-warning"><br>
        </form>

        <%--<form action="upload" method="post" enctype="multipart/form-data">--%>
            <%--<input type="image" name="image" />--%>
            <%--<input type="file" name="file" />--%>
            <%--<input type="submit" value="Add image" />--%>
        <%--</form>--%>

        <form>
            <input type="button" value="Cancel" class="btn btn-warning" onclick="window.location.href='http://localhost:8080/properties.jsp'" /><br>
        </form>
    </body>
</html>
