<%--
  Created by IntelliJ IDEA.
  User: diego
  Date: 18/4/2018
  Time: 9:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Error creando cuenta</title>
	<style>
		body{
			background-color: rgb(38, 57, 123);
			font-family: Arial, sans-serif;
		}

		h1{
			text-align: center;
			margin-top: 40px;
			font-family: Arial, sans-serif;
			font-size: 50px;
			color: rgb(204, 155, 0);
		}

		p{
			text-align: center;
			margin-top: 30px;
			font-family: Arial, sans-serif;
			font-size: 20px;
			color: rgb(73, 211, 255);
		}
	</style></head>
<body>
<h1>Error creando cuenta</h1>
<p>Correo de email ya esta asociado a una cuenta. <a href="<%=response.encodeURL("signup.jsp")%>">Intente de nuevo</a>.</p>
</body>
</html>
