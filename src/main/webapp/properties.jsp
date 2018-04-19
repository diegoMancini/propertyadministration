<%@ page import="propertyAdmin.database.DatabaseOps" %>
<%@ page import="propertyAdmin.property.structure.Property" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Florencia
  Date: 4/9/18
  Time: 19:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>User properties</title>
        <style>
            body{
                height: 100%;
                align-items: center;
                justify-content: center;
                background-color: rgb(38, 57, 123);
                font-family: Arial, sans-serif;            }

            h1{
                font-family: Arial, sans-serif;
                text-align: center;
                margin-top: 40px;
                font-size: 40px;
                color: rgb(204, 155, 0);
            }

            input[type = button]{
                background-color: rgb(255, 189, 7);
                cursor: pointer;
                margin:auto;
                display:block;
                border: 0;
                padding: 5px;
                font-size: 16px;
                border: rgb(0,0,0);
                color: rgb(255, 255, 255);
            }

            p{
                text-align: center;
                margin-top: 30px;
                font-family: Arial, sans-serif;
                font-size: 20px;
                color: rgb(73, 211, 255);
            }

            form{
                font-family: Arial, sans-serif;
                text-align: center;
                margin-top: 40px;
                font-size: 40px;
                color: rgb(204, 155, 0);
            }
        </style>
    </head>
    <body >
    <form method="GET" action="displayProperties" >
        <h1> Propiedades de <i><%=DatabaseOps.getInstance().getAccount(request.getRemoteUser()).getName()%></i>.</h1>
        <%--<p>Here we display your properties, once you add them</p>--%>
        <%!
            private void printPropery(javax.servlet.jsp.JspWriter out, Property property, int index) throws IOException {
                out.println("\n" + index + ") " + property.getName() + "\n");
            }
        %>
        <%
            List<Property> properties = DatabaseOps.getInstance().getAccount(request.getRemoteUser()).getProperties();
            if(properties.size() != 0){
                out.println("\nLista de propiedades: ");
                for (int i = 0; i < properties.size(); i++) {
                    printPropery(out, properties.get(i), i+1);
                }
            } else {
                out.println("Here we display your properties once you add them");
            }
        %>
    </form>
        <form>
            <input type="button" value="Add Property" onclick="window.location.href='addProperty.jsp'" />
        </form>
        <form>
            <input type="button" value="Delete Property" onclick="window.location.href='http://localhost:8080/deleteProperty.jsp'" />
        </form>
        <form>
            <input type="button" value="Go back" onclick="window.location.href='http://localhost:8080/home.jsp'" />
        </form>
    </body>
</html>
