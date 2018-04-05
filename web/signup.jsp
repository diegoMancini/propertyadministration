<%--
  Created by IntelliJ IDEA.
  persons.User: DiegoMancini
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
                text-align: justify-all;
                /*border-radius: 10px;*/
                /*margin: 20px 20px 20px 20px;*/
            }
            h3{
                font-family: Arial, sans-serif;
                text-align: justify-all;
                font-size: 30px;
                color: rgb(73, 161, 140);
                /*border-radius: 10px;*/
                /*margin: 20px 20px 20px 20px;*/
            }
            form{
                width: 100%;
                max-width: 330px;
                padding: 20px;
                font-size: 20px;
                font-family: Arial, sans-serif;
                text-align: justify-all;
                /*border-radius: 10px;*/
                /*margin: 20px 20px 20px 20px;*/

            }
            input[type="email"] {
                text-align: justify-all;
                /*border-radius: 10px;*/
                /*margin: 20px 20px 20px 20px;*/
            }

            input[type="password"] {
                text-align: center;
                /*border-radius: 10px;*/
                /*margin: 20px 20px 20px 20px;*/
            }

            input[type="number"] {
                text-align: justify-all;
                /*border-radius: 10px;*/
                /*margin: 20px 20px 20px 20px;*/
            }

            input[type="text"] {
                text-align: justify-all;
                /*border-radius: 10px;*/
                /*margin: 20px 20px 20px 20px;*/
            }

            .inbox-style{
                position: relative;
                box-sizing: border-box;
                height: auto;
                padding: 5px;
                font-size: 15px;
                font-family: Arial, sans-serif;
                text-align: center;
                border-radius: 5px;
                margin: 5px 0px 5px 0px;
            }

            p{
                text-align: justify-all;
                font-family: Arial, sans-serif;
                font-size: 20px;
                color: rgb(0, 0, 0);
                /*border-radius: 10px;*/
                /*margin: 50px 20px 20px 20px;*/

            }

            input[type="submit"]{
                background: #000000;
                color: white;
                padding: 10px;
                /*border-radius: 10px;*/
                /*margin: 20px 20px 20px 20px;*/
            }
        </style>
    </head>

    <body class="text-center">
        <form class="form-style" method="GET" action="signup.jsp">
            <h3 class="h3 mb-3 font-weight-normal"><nobr>Crea tu propia cuenta </nobr> </h3>

            <label for="newAccountName">Nombre        </label>
            <input type="text" name="name" id="newAccountName" class="inbox-style" placeholder="" required><br> <%--TODO hacerlo required--%>

            <label for="newAccoutSurname">Apellido       </label>
            <input type="text" name="surname" id="newAccoutSurname" class="inbox-style" placeholder="" required><br>

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

            <button type="submit">Sign in</button>

            <p><a href="<%=response.encodeURL("index.jsp")%>">Go back</a></p>
        </form>
    </body>
</html>
