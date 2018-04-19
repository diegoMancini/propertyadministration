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
                background-color: rgb(38, 57, 123);
                font-family: Arial, sans-serif;
            }

            h3{
                margin: 40px 0 0 0;
                font-family: Arial, sans-serif;
                text-align: center;
                font-size: 40px;
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

            input[type=text], input[type = image]{
                margin-top: 10px;
                margin-bottom: 10px;
            }

            .inbox-style{
                position: static;
                box-sizing: border-box;
                width: 100%;
                height: auto;
                padding: 5px;
                font-size: 16px;
                font-family: Arial, sans-serif;
                margin-bottom: 10px;
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
                font-family: Arial, sans-serif;
                font-size:  18px;
                color: rgb(73, 211, 255);
            }
        </style>
    </head>
    <body>
        <h3>Add new Property</h3>
        <form class="form-style" method="POST" action="addproperty">
            <label for="newPropertyAddress">Direccion</label>
            <input type="text" name="address" id="newPropertyAddress" class="inbox-style" placeholder="" required><br>

            <p>Ingrese el nombre de su propiedad</p>
            <label for="newPropertyName">Name</label>
            <input type="text" name="name" id="newPropertyName" class="inbox-style" placeholder="" required><br>

            <p>Ingrese los datos de su propiedad</p>
            <label for="newFacilitiesDetails">Descripcion</label>
            <textarea name="details" id="newFacilitiesDetails" cols="30" rows="10" class="inbox-style" placeholder=""></textarea><br>

            <%--<label for="newFacilitiesBathrooms">Baños</label>--%>
            <%--<input type="number" name="amtBathrooms" id="newFacilitiesBathrooms" class="inbox-style" placeholder="" required><br>--%>

            <%--<label for="newFacilitiesRooms">Dormitorios</label>--%>
            <%--<input type="number" name="amtRooms" id="newFacilitiesRooms" class="inbox-style" placeholder="" required><br>--%>

            <%--<label for="newFacilitiesSqrMeter">Superficie</label>--%>
            <%--<input type="number" name="sqrMeter" id="newFacilitiesSqrMeter" class="inbox-style" placeholder="" required><br>--%>

            <input type="submit" value="Add Property"><br>

            <form>
                <input type="button" value="Cancel" onclick="window.location.href='http://localhost:8080/properties.jsp'" /><br>
            </form>

        </form>
    </body>
</html>
