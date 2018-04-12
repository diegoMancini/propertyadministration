<html>
    <head>
        <title>HouseAdmin - Home</title>
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
            }

            h3{
                font-family: Arial, sans-serif;
                text-align: center;
                width: 100%;
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

            input[type=button]{
                background-color: rgb(47, 152, 182);
                cursor: pointer;
                display:block;
                border: 0;
                padding: 5px;
                font-size: 16px;
                border: rgb(0,0,0);
                color: rgb(255, 255, 255);
                margin: 10px 0 10px 0;
            }
        </style>
    </head>
    <body>
        <h1>HOUSE ADMIN</h1>
        <h3>Welcome back <i><%=request.getUserPrincipal().getName()%></i></h3>
        <form>
            <input type="button" value="See properties" onclick="window.location.href='http://localhost:8080/properties.jsp'" />
        </form>
        <form>
            <input type="button" value="Log out" onclick="window.location.href='http://localhost:8080/logout.jsp'" />
        </form>
    </body>
</html>