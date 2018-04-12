<%--
  Created by IntelliJ IDEA.
  User: DiegoMancini
  Date: 4/4/18
  Time: 12:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Sign up</title>
        <style>
            body{
                background-color: rgb(236, 255, 253);
                font-family: Arial, sans-serif;
            }

            h3{
                font-family: Arial, sans-serif;
                text-align: center;
                font-size: 30px;
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

            input[type=password], input[type=number], input[type=text], input[type=email]{
                margin-top: 10px;
                margin-bottom: 10px;
            }

            .inbox-style{
                position: static;
                box-sizing: border-box;
                height: auto;
                padding: 5px;
                font-size: 16px;
                font-family: Arial, sans-serif;
            }

            input[type=button], input[type=submit]{
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

    <body class="text-center">
        <form class="form-style" method="POST" action="signup">
            <h3 class="h3 mb-3 font-weight-normal">Crea tu cuenta </h3>

            <label for="newAccountName">Nombre        </label>
            <input type="text" name="name" id="newAccountName" class="inbox-style" placeholder="" required><br> <%--TODO hacerlo required--%>

            <label for="newAccountSurname">Apellido       </label>
            <input type="text" name="surname" id="newAccountSurname" class="inbox-style" placeholder="" required><br>

            <label for="newAccountIdentityNumber">D.N.I.     </label> <%--dni--%>
            <input type="number" name="identityNumber" id="newAccountIdentityNumber" class="inbox-style" placeholder="" required><br>

            <label for="newNationality">Nacionalidad  </label>
            <input type="text" name="nationality" id="newNationality" class="inbox-style" placeholder="" required><br>

            <label for="newMaritalStatus">Estado Civil  </label>
            <input type="text" name="maritalStatus" id="newMaritalStatus" class="inbox-style" placeholder="" required><br>

            <label for="newAddress">Direccion     </label>
            <input type="text" name="address" id="newAddress" class="inbox-style" placeholder="" required><br>

            <label for="newAddressCountry">Pais            </label>
            <input type="text" name="addressCountry" id="newAddressCountry" class="inbox-style" placeholder="" required><br> <%--TODO hacerlo required--%>

            <label for="newAddressProvince">Provincia    </label>
            <input type="text" name="addressProvince" id="newAddressProvince" class="inbox-style" placeholder="" required><br> <%--TODO hacerlo required--%>

            <label for="newAddressCity">Ciudad       </label>
            <input type="text" name="addressCity" id="newAddressCity" class="inbox-style" placeholder="" required><br> <%--TODO hacerlo required--%>

            <label for="newAddressTown">Localidad     </label>
            <input type="text" name="addressTown" id="newAddressTown" class="inbox-style" placeholder="" required><br> <%--TODO hacerlo required--%>

            <label for="newAddressZipCode">C.P.           </label>
            <input type="text" name="addressZipCode" id="newAddressZipCode" class="inbox-style" placeholder="" required><br> <%--TODO hacerlo required--%>

            <label for="newAccountPhoneNumber">Telefono     </label>
            <input type="number" name="phoneNumber" id="newAccountPhoneNumber" class="inbox-style" placeholder=""><br>

            <label for="newAccountEmail">E-Mail      </label>
            <input type="email" name="email" id="newAccountEmail" class="inbox-style" placeholder="" required><br>

            <label for="newAccountPassword">Contraseña       </label>
            <input type="password" name="password" id="newAccountPassword" class="inbox-style" placeholder="" required><br>

            <input type="submit" value="Sign up">

            <form>
                <input type="button" value="Go back" onclick="window.location.href='http://localhost:8080/index.jsp'" />
            </form>
        </form>
    </body>
</html>
