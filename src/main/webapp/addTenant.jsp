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
        <title>Add Tenant</title>
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
                font-size: 30px;
                color: rgb(73, 161, 140);
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

            input[type=text], input[type=number], input[type=email], input[type=date]{
                margin-top: 10px;
                margin-bottom: 10px;
            }

            .inbox-style{
                position: static;
                box-sizing: border-box;
                width: 300px;
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
                color: rgb(255, 255, 255);
                margin-bottom: 10px;
            }

            p{
                text-align: center;
                margin-top: 10px;
                font-family: Arial, sans-serif;
                font-size: 20px;
                font-style: italic;
            }
        </style>
    </head>
    <body>
        <%--TODO create checkTenantServlet--%>
        <h1>Add tenant and contract information</h1>
        <form method="POST" action="checktenant">
            <h3>Is this user already added? Write its identity number</h3><br>
            <label for="searchTenantById">Tenant id</label>
            <input type="number" name="tenantId" id="searchTenantById" class="inbox-style" placeholder="Tenant identity number"><br>
            <form>
                <input type="button" value="Check for tenant" onclick="window.location.href='http://localhost:8080/createTenant.jsp'" />
            </form>
        </form>


        <form method="POST" action="createtenant">
            <h3>If it is not, please add it</h3>
            <p>TENANT INFORMATION</p>
            <label for="newTenantIdentityNumber">Tenant identity number</label>
            <input type="number" name="tenantIdentityNumber" id="newTenantIdentityNumber" class="inbox-style" placeholder="Tenant identity number" required><br>

            <label for="newTenantName">Tenant name</label>
            <input type="text" name="tenantName" id="newTenantName" class="inbox-style" placeholder="Tenant name" required><br>

            <label for="newTenantSurname">Tenant surname</label>
            <input type="text" name="tenantSurname" id="newTenantSurname" class="inbox-style" placeholder="Tenant surname" required><br>

            <label for="newTenantMail">Tenant mail</label>
            <input type="email" name="tenantMal" id="newTenantMail" class="inbox-style" placeholder="Tenant mail" required><br>

            <label for="newTenantCuil">Tenant CUIL</label>
            <input type="number" name="tenantCuil" id="newTenantCuil" class="inbox-style" placeholder="Tenant CUIL" required><br>

        <%--creamos contract--%>
            <p>CONTRACT INFORMATION</p>
            <label for="newContractName">Contract name</label>
            <input type="text" name="contractName" id="newContractName" class="inbox-style" placeholder="Contract name" required><br>

            <label for="newContractFile">Contract file</label>
            <input type="text" name="contractFile" id="newContractFile" class="inbox-style" placeholder="Choose file..." required><br>

            <label for="newConractStartDate">Strart date</label>
            <input type="date" name="startDate" id="newConractStartDate" class="inbox-style" placeholder="Start date" required><br>

            <label for="newConractEndDate">End date</label>
            <input type="date" name="endDate" id="newConractEndDate" class="inbox-style" placeholder="End date" required><br>

            <label for="newContractRenovationCost">Renovation cost</label>
            <input type="number" name="renovationCost" id="newContractRenovationCost" class="inbox-style" placeholder="Renovation cost" required><br>

            <input type="submit" value="Add tenant and contract">

            <form>
                <input type="button" value="Cancel" onclick="window.location.href='http://localhost:8080/addProperty.jsp'" /><br>
            </form>
        </form>
    </body>
</html>
