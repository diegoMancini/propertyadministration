<html>
    <head>
        <style>
            body{
                background-color: rgb(236, 255, 253);
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

            p{
                text-align: center;
                margin-top: 40px;
                font-family: Arial, sans-serif;
                font-size: 20px;
                color: rgb(0, 0, 0);
            }
        </style>
    </head>
    <body>
        <h1>ADMIN</h1>
        <h3>This is the home page.</h3>
        <p>If you want to log out, please click <a href="<%=response.encodeURL("logout.jsp")%>">here</a></p>
    </body>
</html>