<%@ page import="propertyAdmin.database.DatabaseOps" %>
<html>
    <head>
        <title>HouseAdmin - Home</title>
        <style>
            body{
                background-color: rgb(38, 57, 123);
                font-family: Arial, sans-serif;
            }

            h1{
                font-family: Arial, sans-serif;
                text-align: center;
                margin-top: 40px;
                font-size: 40px;
                color: rgb(204, 155, 0);
            }

            h3{
                font-family: Arial, sans-serif;
                text-align: center;
                width: 100%;
                color: rgb(73, 211, 255);
            }

            form{
                width: 100%;
                max-width: 330px;
                padding: 15px;
                font-size: 16px;
                margin: 0 auto;
                font-family: Arial, sans-serif;
            }

            input[type=button]{
                background-color: rgb(255, 189, 7);
                cursor: pointer;
                display:block;
                border: 0;
                padding: 5px;
                font-size: 16px;
                color: rgb(255, 255, 255);
                margin: 10px 0 10px 0;
            }
        </style>
    </head>
    <body>
        <h1>HOUSE ADMIN</h1>
        <h3>Bienvenido/a <i><%=DatabaseOps.getInstance().getAccount(request.getRemoteUser()).getName() + " " + DatabaseOps.getInstance().getAccount(request.getRemoteUser()).getSurname()%></i> !</h3>
        <form>
            <input type="button" value="Acceder al menu propiedades" onclick="window.location.href='http://localhost:8080/properties.jsp'" />
        </form>
        <form>
            <input type="button" value="Cerrar sesion" onclick="window.location.href='http://localhost:8080/logout.jsp'" />
        </form>
    </body>
</html>