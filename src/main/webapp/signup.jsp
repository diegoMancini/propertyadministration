<%--
  Created by IntelliJ IDEA.
  User: DiegoMancini
  Date: 29/4/18
  Time: 18:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
    <title>Elite Admin Template - The Ultimate Multipurpose admin template</title>
    <link href="assets/node_modules/wizard/steps.css" rel="stylesheet">
    <!--alerts CSS -->
    <link href="assets/node_modules/sweetalert/sweetalert.css" rel="stylesheet" type="text/css">
    <!-- page css -->
    <link href="propertyadmin/dist/css/pages/login-register-lock.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="propertyadmin/dist/css/style.min.css" rel="stylesheet">
    <script type= "text/javascript" src = "assets/countries.js"></script>


    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body class="skin-blue card-no-border">
<!-- ============================================================== -->
<!-- Preloader - style you can find in spinners.css -->
<!-- ============================================================== -->
<div class="preloader">
    <div class="loader">
        <div class="loader__figure"></div>
        <p class="loader__label">Property-Admin</p>
    </div>
</div>
<!-- ============================================================== -->
<!-- Main wrapper - style you can find in pages.scss -->
<!-- ============================================================== -->
<section id="wrapper">
    <div class="login-register" style="background-image:url(assets/images/background/admin-background.jpg);">
        <div class="row" id="validation">
            <div class="login-box card">
                <div class="card-body">
                    <form class="form-horizontal form-material" id="loginform" action="/signup" method="post">
                        <h3 class="box-title m-b-20">Crear cuenta</h3>
                        <div class="form-group row">
                            <div class="col-md-12">
                                <h3 class="box-title m-b-12"> Datos personales </h3>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12">
                                <input class="form-control required" type="text" name="name" placeholder="Nombre">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12">
                                <input class="form-control required" type="text" name="surname" required="" placeholder="Apellido">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12">
                                <input class="form-control required" type="text" name="identityNumber" required="" placeholder="D.N.I.">
                            </div>
                        </div>
                        <div class="form-group ">
                            <div class="col-xs-12">
                                <input class="form-control" type="text" name="phoneNumber" required="" placeholder="Telefono">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12">
                            <label for="country2"> Nacionalidad : <span class="danger"></span> </label>
                            <select class="custom-select form-control required" id="country2" name="nationality">
                                <option value="">-----</option>
                                <option  value="AFG">Afghanistan</option>
                                <option value="ALA">Åland Islands</option>
                                <option value="ALB">Albania</option>
                                <option value="DZA">Algeria</option>
                                <option value="ASM">American Samoa</option>
                                <option value="AND">Andorra</option>
                                <option value="AGO">Angola</option>
                                <option value="AIA">Anguilla</option>
                                <option value="ATA">Antarctica</option>
                                <option value="ATG">Antigua and Barbuda</option>
                                <option id="argCountry" value="ARG">Argentina</option>
                                <option value="ARM">Armenia</option>
                                <option value="ABW">Aruba</option>
                                <option value="AUS">Australia</option>
                                <option value="AUT">Austria</option>
                                <option value="AZE">Azerbaijan</option>
                                <option value="BHS">Bahamas</option>
                                <option value="BHR">Bahrain</option>
                                <option value="BGD">Bangladesh</option>
                                <option value="BRB">Barbados</option>
                                <option value="BLR">Belarus</option>
                                <option value="BEL">Belgium</option>
                                <option value="BLZ">Belize</option>
                                <option value="BEN">Benin</option>
                                <option value="BMU">Bermuda</option>
                                <option value="BTN">Bhutan</option>
                                <option value="BOL">Bolivia, Plurinational State of</option>
                                <option value="BES">Bonaire, Sint Eustatius and Saba</option>
                                <option value="BIH">Bosnia and Herzegovina</option>
                                <option value="BWA">Botswana</option>
                                <option value="BVT">Bouvet Island</option>
                                <option value="BRA">Brazil</option>
                                <option value="IOT">British Indian Ocean Territory</option>
                                <option value="BRN">Brunei Darussalam</option>
                                <option value="BGR">Bulgaria</option>
                                <option value="BFA">Burkina Faso</option>
                                <option value="BDI">Burundi</option>
                                <option value="KHM">Cambodia</option>
                                <option value="CMR">Cameroon</option>
                                <option value="CAN">Canada</option>
                                <option value="CPV">Cape Verde</option>
                                <option value="CYM">Cayman Islands</option>
                                <option value="CAF">Central African Republic</option>
                                <option value="TCD">Chad</option>
                                <option value="CHL">Chile</option>
                                <option value="CHN">China</option>
                                <option value="CXR">Christmas Island</option>
                                <option value="CCK">Cocos (Keeling) Islands</option>
                                <option value="COL">Colombia</option>
                                <option value="COM">Comoros</option>
                                <option value="COG">Congo</option>
                                <option value="COD">Congo, the Democratic Republic of the</option>
                                <option value="COK">Cook Islands</option>
                                <option value="CRI">Costa Rica</option>
                                <option value="CIV">Côte d'Ivoire</option>
                                <option value="HRV">Croatia</option>
                                <option value="CUB">Cuba</option>
                                <option value="CUW">Curaçao</option>
                                <option value="CYP">Cyprus</option>
                                <option value="CZE">Czech Republic</option>
                                <option value="DNK">Denmark</option>
                                <option value="DJI">Djibouti</option>
                                <option value="DMA">Dominica</option>
                                <option value="DOM">Dominican Republic</option>
                                <option value="ECU">Ecuador</option>
                                <option value="EGY">Egypt</option>
                                <option value="SLV">El Salvador</option>
                                <option value="GNQ">Equatorial Guinea</option>
                                <option value="ERI">Eritrea</option>
                                <option value="EST">Estonia</option>
                                <option value="ETH">Ethiopia</option>
                                <option value="FLK">Falkland Islands (Malvinas)</option>
                                <option value="FRO">Faroe Islands</option>
                                <option value="FJI">Fiji</option>
                                <option value="FIN">Finland</option>
                                <option value="FRA">France</option>
                                <option value="GUF">French Guiana</option>
                                <option value="PYF">French Polynesia</option>
                                <option value="ATF">French Southern Territories</option>
                                <option value="GAB">Gabon</option>
                                <option value="GMB">Gambia</option>
                                <option value="GEO">Georgia</option>
                                <option value="DEU">Germany</option>
                                <option value="GHA">Ghana</option>
                                <option value="GIB">Gibraltar</option>
                                <option value="GRC">Greece</option>
                                <option value="GRL">Greenland</option>
                                <option value="GRD">Grenada</option>
                                <option value="GLP">Guadeloupe</option>
                                <option value="GUM">Guam</option>
                                <option value="GTM">Guatemala</option>
                                <option value="GGY">Guernsey</option>
                                <option value="GIN">Guinea</option>
                                <option value="GNB">Guinea-Bissau</option>
                                <option value="GUY">Guyana</option>
                                <option value="HTI">Haiti</option>
                                <option value="HMD">Heard Island and McDonald Islands</option>
                                <option value="VAT">Holy See (Vatican City State)</option>
                                <option value="HND">Honduras</option>
                                <option value="HKG">Hong Kong</option>
                                <option value="HUN">Hungary</option>
                                <option value="ISL">Iceland</option>
                                <option value="IND">India</option>
                                <option value="IDN">Indonesia</option>
                                <option value="IRN">Iran, Islamic Republic of</option>
                                <option value="IRQ">Iraq</option>
                                <option value="IRL">Ireland</option>
                                <option value="IMN">Isle of Man</option>
                                <option value="ISR">Israel</option>
                                <option value="ITA">Italy</option>
                                <option value="JAM">Jamaica</option>
                                <option value="JPN">Japan</option>
                                <option value="JEY">Jersey</option>
                                <option value="JOR">Jordan</option>
                                <option value="KAZ">Kazakhstan</option>
                                <option value="KEN">Kenya</option>
                                <option value="KIR">Kiribati</option>
                                <option value="PRK">Korea, Democratic People's Republic of</option>
                                <option value="KOR">Korea, Republic of</option>
                                <option value="KWT">Kuwait</option>
                                <option value="KGZ">Kyrgyzstan</option>
                                <option value="LAO">Lao People's Democratic Republic</option>
                                <option value="LVA">Latvia</option>
                                <option value="LBN">Lebanon</option>
                                <option value="LSO">Lesotho</option>
                                <option value="LBR">Liberia</option>
                                <option value="LBY">Libya</option>
                                <option value="LIE">Liechtenstein</option>
                                <option value="LTU">Lithuania</option>
                                <option value="LUX">Luxembourg</option>
                                <option value="MAC">Macao</option>
                                <option value="MKD">Macedonia, the former Yugoslav Republic of</option>
                                <option value="MDG">Madagascar</option>
                                <option value="MWI">Malawi</option>
                                <option value="MYS">Malaysia</option>
                                <option value="MDV">Maldives</option>
                                <option value="MLI">Mali</option>
                                <option value="MLT">Malta</option>
                                <option value="MHL">Marshall Islands</option>
                                <option value="MTQ">Martinique</option>
                                <option value="MRT">Mauritania</option>
                                <option value="MUS">Mauritius</option>
                                <option value="MYT">Mayotte</option>
                                <option value="MEX">Mexico</option>
                                <option value="FSM">Micronesia, Federated States of</option>
                                <option value="MDA">Moldova, Republic of</option>
                                <option value="MCO">Monaco</option>
                                <option value="MNG">Mongolia</option>
                                <option value="MNE">Montenegro</option>
                                <option value="MSR">Montserrat</option>
                                <option value="MAR">Morocco</option>
                                <option value="MOZ">Mozambique</option>
                                <option value="MMR">Myanmar</option>
                                <option value="NAM">Namibia</option>
                                <option value="NRU">Nauru</option>
                                <option value="NPL">Nepal</option>
                                <option value="NLD">Netherlands</option>
                                <option value="NCL">New Caledonia</option>
                                <option value="NZL">New Zealand</option>
                                <option value="NIC">Nicaragua</option>
                                <option value="NER">Niger</option>
                                <option value="NGA">Nigeria</option>
                                <option value="NIU">Niue</option>
                                <option value="NFK">Norfolk Island</option>
                                <option value="MNP">Northern Mariana Islands</option>
                                <option value="NOR">Norway</option>
                                <option value="OMN">Oman</option>
                                <option value="PAK">Pakistan</option>
                                <option value="PLW">Palau</option>
                                <option value="PSE">Palestinian Territory, Occupied</option>
                                <option value="PAN">Panama</option>
                                <option value="PNG">Papua New Guinea</option>
                                <option value="PRY">Paraguay</option>
                                <option value="PER">Peru</option>
                                <option value="PHL">Philippines</option>
                                <option value="PCN">Pitcairn</option>
                                <option value="POL">Poland</option>
                                <option value="PRT">Portugal</option>
                                <option value="PRI">Puerto Rico</option>
                                <option value="QAT">Qatar</option>
                                <option value="REU">Réunion</option>
                                <option value="ROU">Romania</option>
                                <option value="RUS">Russian Federation</option>
                                <option value="RWA">Rwanda</option>
                                <option value="BLM">Saint Barthélemy</option>
                                <option value="SHN">Saint Helena, Ascension and Tristan da Cunha</option>
                                <option value="KNA">Saint Kitts and Nevis</option>
                                <option value="LCA">Saint Lucia</option>
                                <option value="MAF">Saint Martin (French part)</option>
                                <option value="SPM">Saint Pierre and Miquelon</option>
                                <option value="VCT">Saint Vincent and the Grenadines</option>
                                <option value="WSM">Samoa</option>
                                <option value="SMR">San Marino</option>
                                <option value="STP">Sao Tome and Principe</option>
                                <option value="SAU">Saudi Arabia</option>
                                <option value="SEN">Senegal</option>
                                <option value="SRB">Serbia</option>
                                <option value="SYC">Seychelles</option>
                                <option value="SLE">Sierra Leone</option>
                                <option value="SGP">Singapore</option>
                                <option value="SXM">Sint Maarten (Dutch part)</option>
                                <option value="SVK">Slovakia</option>
                                <option value="SVN">Slovenia</option>
                                <option value="SLB">Solomon Islands</option>
                                <option value="SOM">Somalia</option>
                                <option value="ZAF">South Africa</option>
                                <option value="SGS">South Georgia and the South Sandwich Islands</option>
                                <option value="SSD">South Sudan</option>
                                <option value="ESP">Spain</option>
                                <option value="LKA">Sri Lanka</option>
                                <option value="SDN">Sudan</option>
                                <option value="SUR">Suriname</option>
                                <option value="SJM">Svalbard and Jan Mayen</option>
                                <option value="SWZ">Swaziland</option>
                                <option value="SWE">Sweden</option>
                                <option value="CHE">Switzerland</option>
                                <option value="SYR">Syrian Arab Republic</option>
                                <option value="TWN">Taiwan, Province of China</option>
                                <option value="TJK">Tajikistan</option>
                                <option value="TZA">Tanzania, United Republic of</option>
                                <option value="THA">Thailand</option>
                                <option value="TLS">Timor-Leste</option>
                                <option value="TGO">Togo</option>
                                <option value="TKL">Tokelau</option>
                                <option value="TON">Tonga</option>
                                <option value="TTO">Trinidad and Tobago</option>
                                <option value="TUN">Tunisia</option>
                                <option value="TUR">Turkey</option>
                                <option value="TKM">Turkmenistan</option>
                                <option value="TCA">Turks and Caicos Islands</option>
                                <option value="TUV">Tuvalu</option>
                                <option value="UGA">Uganda</option>
                                <option value="UKR">Ukraine</option>
                                <option value="ARE">United Arab Emirates</option>
                                <option value="GBR">United Kingdom</option>
                                <option value="USA">United States</option>
                                <option value="UMI">United States Minor Outlying Islands</option>
                                <option value="URY">Uruguay</option>
                                <option value="UZB">Uzbekistan</option>
                                <option value="VUT">Vanuatu</option>
                                <option value="VEN">Venezuela, Bolivarian Republic of</option>
                                <option value="VNM">Viet Nam</option>
                                <option value="VGB">Virgin Islands, British</option>
                                <option value="VIR">Virgin Islands, U.S.</option>
                                <option value="WLF">Wallis and Futuna</option>
                                <option value="ESH">Western Sahara</option>
                                <option value="YEM">Yemen</option>
                                <option value="ZMB">Zambia</option>
                                <option value="ZWE">Zimbabwe</option>
                            </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-12">
                                <h3 class="box-title m-b-12"> Direccion </h3>
                            </div>
                        </div>
                        <div class="form-group ">
                            <div class="col-xs-12">
                                <input class="form-control" type="text" name="address" required="" placeholder="Direccion">
                            </div>
                        </div>
                        <div class="form-group ">
                            <div class="col-xs-12">
                                <input class="form-control" type="text" name="addressTown" required="" placeholder="Localidad">
                            </div>
                        </div>
                        <div class="form-group ">
                            <div class="col-xs-12">
                                <input class="form-control" type="text" name="addressCity" required="" placeholder="Ciudad">
                            </div>
                        </div>
                        <div class="form-group ">
                            <div class="col-xs-12">
                                <input class="form-control" type="text" name="addressProvince" required="" placeholder="Provincia">
                            </div>
                        </div>
                        <div class="form-group ">
                            <div class="col-xs-12">
                                <input class="form-control" type="text" name="addressCountry" required="" placeholder="Pais">
                            </div>
                        </div>
                        <div class="form-group ">
                            <div class="col-xs-12">
                                <input class="form-control" type="text" name="addressZipCode" required="" placeholder="Codigo Postal">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-12">
                                <h3 class="box-title m-b-12"> Datos cuenta </h3>
                            </div>
                        </div>
                        <div class="form-group ">
                            <div class="col-xs-12">
                                <input class="form-control" type="text" name="username" required="" placeholder="Nombre de usuario">
                            </div>
                        </div>
                        <div class="form-group ">
                            <div class="col-xs-12">
                                <input class="form-control" type="email" name="email" required="" placeholder="Email">
                            </div>
                        </div>
                        <div class="form-group ">
                            <div class="col-xs-12">
                                <input class="form-control" type="password" required="" name="password" placeholder="Contraseña">
                            </div>
                        </div>
                        <div class="form-group text-center p-b-20">
                            <div class="col-xs-12">
                                <button class="btn btn-info btn-lg btn-block btn-rounded text-uppercase waves-effect waves-light" type="submit">Sign Up</button>
                            </div>
                        </div>
                        <div class="form-group m-b-0">
                            <div class="col-sm-12 text-center">
                                Ya tienes una cuenta ? <a href="login.jsp" class="text-info m-l-5"><b>Iniciar Sesion</b></a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <%--<div class="col-md-6">--%>
    <%--<div class="form-group">--%>
    <%--<label for="wnationality"> Nacionalidad : <span class="danger"></span> </label>--%>
    <%--<select class="custom-select form-control required" id="wnationality" name="nationality">--%>
    <%--<option value="">-----</option>--%>
    <%--<option value="AFG">Afghanistan</option>--%>
    <%--<option value="ALA">Åland Islands</option>--%>
    <%--<option value="ALB">Albania</option>--%>
    <%--<option value="DZA">Algeria</option>--%>
    <%--<option value="ASM">American Samoa</option>--%>
    <%--<option value="AND">Andorra</option>--%>
    <%--<option value="AGO">Angola</option>--%>
    <%--<option value="AIA">Anguilla</option>--%>
    <%--<option value="ATA">Antarctica</option>--%>
    <%--<option value="ATG">Antigua and Barbuda</option>--%>
    <%--<option value="ARG">Argentina</option>--%>
    <%--<option value="ARM">Armenia</option>--%>
    <%--<option value="ABW">Aruba</option>--%>
    <%--<option value="AUS">Australia</option>--%>
    <%--<option value="AUT">Austria</option>--%>
    <%--<option value="AZE">Azerbaijan</option>--%>
    <%--<option value="BHS">Bahamas</option>--%>
    <%--<option value="BHR">Bahrain</option>--%>
    <%--<option value="BGD">Bangladesh</option>--%>
    <%--<option value="BRB">Barbados</option>--%>
    <%--<option value="BLR">Belarus</option>--%>
    <%--<option value="BEL">Belgium</option>--%>
    <%--<option value="BLZ">Belize</option>--%>
    <%--<option value="BEN">Benin</option>--%>
    <%--<option value="BMU">Bermuda</option>--%>
    <%--<option value="BTN">Bhutan</option>--%>
    <%--<option value="BOL">Bolivia, Plurinational State of</option>--%>
    <%--<option value="BES">Bonaire, Sint Eustatius and Saba</option>--%>
    <%--<option value="BIH">Bosnia and Herzegovina</option>--%>
    <%--<option value="BWA">Botswana</option>--%>
    <%--<option value="BVT">Bouvet Island</option>--%>
    <%--<option value="BRA">Brazil</option>--%>
    <%--<option value="IOT">British Indian Ocean Territory</option>--%>
    <%--<option value="BRN">Brunei Darussalam</option>--%>
    <%--<option value="BGR">Bulgaria</option>--%>
    <%--<option value="BFA">Burkina Faso</option>--%>
    <%--<option value="BDI">Burundi</option>--%>
    <%--<option value="KHM">Cambodia</option>--%>
    <%--<option value="CMR">Cameroon</option>--%>
    <%--<option value="CAN">Canada</option>--%>
    <%--<option value="CPV">Cape Verde</option>--%>
    <%--<option value="CYM">Cayman Islands</option>--%>
    <%--<option value="CAF">Central African Republic</option>--%>
    <%--<option value="TCD">Chad</option>--%>
    <%--<option value="CHL">Chile</option>--%>
    <%--<option value="CHN">China</option>--%>
    <%--<option value="CXR">Christmas Island</option>--%>
    <%--<option value="CCK">Cocos (Keeling) Islands</option>--%>
    <%--<option value="COL">Colombia</option>--%>
    <%--<option value="COM">Comoros</option>--%>
    <%--<option value="COG">Congo</option>--%>
    <%--<option value="COD">Congo, the Democratic Republic of the</option>--%>
    <%--<option value="COK">Cook Islands</option>--%>
    <%--<option value="CRI">Costa Rica</option>--%>
    <%--<option value="CIV">Côte d'Ivoire</option>--%>
    <%--<option value="HRV">Croatia</option>--%>
    <%--<option value="CUB">Cuba</option>--%>
    <%--<option value="CUW">Curaçao</option>--%>
    <%--<option value="CYP">Cyprus</option>--%>
    <%--<option value="CZE">Czech Republic</option>--%>
    <%--<option value="DNK">Denmark</option>--%>
    <%--<option value="DJI">Djibouti</option>--%>
    <%--<option value="DMA">Dominica</option>--%>
    <%--<option value="DOM">Dominican Republic</option>--%>
    <%--<option value="ECU">Ecuador</option>--%>
    <%--<option value="EGY">Egypt</option>--%>
    <%--<option value="SLV">El Salvador</option>--%>
    <%--<option value="GNQ">Equatorial Guinea</option>--%>
    <%--<option value="ERI">Eritrea</option>--%>
    <%--<option value="EST">Estonia</option>--%>
    <%--<option value="ETH">Ethiopia</option>--%>
    <%--<option value="FLK">Falkland Islands (Malvinas)</option>--%>
    <%--<option value="FRO">Faroe Islands</option>--%>
    <%--<option value="FJI">Fiji</option>--%>
    <%--<option value="FIN">Finland</option>--%>
    <%--<option value="FRA">France</option>--%>
    <%--<option value="GUF">French Guiana</option>--%>
    <%--<option value="PYF">French Polynesia</option>--%>
    <%--<option value="ATF">French Southern Territories</option>--%>
    <%--<option value="GAB">Gabon</option>--%>
    <%--<option value="GMB">Gambia</option>--%>
    <%--<option value="GEO">Georgia</option>--%>
    <%--<option value="DEU">Germany</option>--%>
    <%--<option value="GHA">Ghana</option>--%>
    <%--<option value="GIB">Gibraltar</option>--%>
    <%--<option value="GRC">Greece</option>--%>
    <%--<option value="GRL">Greenland</option>--%>
    <%--<option value="GRD">Grenada</option>--%>
    <%--<option value="GLP">Guadeloupe</option>--%>
    <%--<option value="GUM">Guam</option>--%>
    <%--<option value="GTM">Guatemala</option>--%>
    <%--<option value="GGY">Guernsey</option>--%>
    <%--<option value="GIN">Guinea</option>--%>
    <%--<option value="GNB">Guinea-Bissau</option>--%>
    <%--<option value="GUY">Guyana</option>--%>
    <%--<option value="HTI">Haiti</option>--%>
    <%--<option value="HMD">Heard Island and McDonald Islands</option>--%>
    <%--<option value="VAT">Holy See (Vatican City State)</option>--%>
    <%--<option value="HND">Honduras</option>--%>
    <%--<option value="HKG">Hong Kong</option>--%>
    <%--<option value="HUN">Hungary</option>--%>
    <%--<option value="ISL">Iceland</option>--%>
    <%--<option value="IND">India</option>--%>
    <%--<option value="IDN">Indonesia</option>--%>
    <%--<option value="IRN">Iran, Islamic Republic of</option>--%>
    <%--<option value="IRQ">Iraq</option>--%>
    <%--<option value="IRL">Ireland</option>--%>
    <%--<option value="IMN">Isle of Man</option>--%>
    <%--<option value="ISR">Israel</option>--%>
    <%--<option value="ITA">Italy</option>--%>
    <%--<option value="JAM">Jamaica</option>--%>
    <%--<option value="JPN">Japan</option>--%>
    <%--<option value="JEY">Jersey</option>--%>
    <%--<option value="JOR">Jordan</option>--%>
    <%--<option value="KAZ">Kazakhstan</option>--%>
    <%--<option value="KEN">Kenya</option>--%>
    <%--<option value="KIR">Kiribati</option>--%>
    <%--<option value="PRK">Korea, Democratic People's Republic of</option>--%>
    <%--<option value="KOR">Korea, Republic of</option>--%>
    <%--<option value="KWT">Kuwait</option>--%>
    <%--<option value="KGZ">Kyrgyzstan</option>--%>
    <%--<option value="LAO">Lao People's Democratic Republic</option>--%>
    <%--<option value="LVA">Latvia</option>--%>
    <%--<option value="LBN">Lebanon</option>--%>
    <%--<option value="LSO">Lesotho</option>--%>
    <%--<option value="LBR">Liberia</option>--%>
    <%--<option value="LBY">Libya</option>--%>
    <%--<option value="LIE">Liechtenstein</option>--%>
    <%--<option value="LTU">Lithuania</option>--%>
    <%--<option value="LUX">Luxembourg</option>--%>
    <%--<option value="MAC">Macao</option>--%>
    <%--<option value="MKD">Macedonia, the former Yugoslav Republic of</option>--%>
    <%--<option value="MDG">Madagascar</option>--%>
    <%--<option value="MWI">Malawi</option>--%>
    <%--<option value="MYS">Malaysia</option>--%>
    <%--<option value="MDV">Maldives</option>--%>
    <%--<option value="MLI">Mali</option>--%>
    <%--<option value="MLT">Malta</option>--%>
    <%--<option value="MHL">Marshall Islands</option>--%>
    <%--<option value="MTQ">Martinique</option>--%>
    <%--<option value="MRT">Mauritania</option>--%>
    <%--<option value="MUS">Mauritius</option>--%>
    <%--<option value="MYT">Mayotte</option>--%>
    <%--<option value="MEX">Mexico</option>--%>
    <%--<option value="FSM">Micronesia, Federated States of</option>--%>
    <%--<option value="MDA">Moldova, Republic of</option>--%>
    <%--<option value="MCO">Monaco</option>--%>
    <%--<option value="MNG">Mongolia</option>--%>
    <%--<option value="MNE">Montenegro</option>--%>
    <%--<option value="MSR">Montserrat</option>--%>
    <%--<option value="MAR">Morocco</option>--%>
    <%--<option value="MOZ">Mozambique</option>--%>
    <%--<option value="MMR">Myanmar</option>--%>
    <%--<option value="NAM">Namibia</option>--%>
    <%--<option value="NRU">Nauru</option>--%>
    <%--<option value="NPL">Nepal</option>--%>
    <%--<option value="NLD">Netherlands</option>--%>
    <%--<option value="NCL">New Caledonia</option>--%>
    <%--<option value="NZL">New Zealand</option>--%>
    <%--<option value="NIC">Nicaragua</option>--%>
    <%--<option value="NER">Niger</option>--%>
    <%--<option value="NGA">Nigeria</option>--%>
    <%--<option value="NIU">Niue</option>--%>
    <%--<option value="NFK">Norfolk Island</option>--%>
    <%--<option value="MNP">Northern Mariana Islands</option>--%>
    <%--<option value="NOR">Norway</option>--%>
    <%--<option value="OMN">Oman</option>--%>
    <%--<option value="PAK">Pakistan</option>--%>
    <%--<option value="PLW">Palau</option>--%>
    <%--<option value="PSE">Palestinian Territory, Occupied</option>--%>
    <%--<option value="PAN">Panama</option>--%>
    <%--<option value="PNG">Papua New Guinea</option>--%>
    <%--<option value="PRY">Paraguay</option>--%>
    <%--<option value="PER">Peru</option>--%>
    <%--<option value="PHL">Philippines</option>--%>
    <%--<option value="PCN">Pitcairn</option>--%>
    <%--<option value="POL">Poland</option>--%>
    <%--<option value="PRT">Portugal</option>--%>
    <%--<option value="PRI">Puerto Rico</option>--%>
    <%--<option value="QAT">Qatar</option>--%>
    <%--<option value="REU">Réunion</option>--%>
    <%--<option value="ROU">Romania</option>--%>
    <%--<option value="RUS">Russian Federation</option>--%>
    <%--<option value="RWA">Rwanda</option>--%>
    <%--<option value="BLM">Saint Barthélemy</option>--%>
    <%--<option value="SHN">Saint Helena, Ascension and Tristan da Cunha</option>--%>
    <%--<option value="KNA">Saint Kitts and Nevis</option>--%>
    <%--<option value="LCA">Saint Lucia</option>--%>
    <%--<option value="MAF">Saint Martin (French part)</option>--%>
    <%--<option value="SPM">Saint Pierre and Miquelon</option>--%>
    <%--<option value="VCT">Saint Vincent and the Grenadines</option>--%>
    <%--<option value="WSM">Samoa</option>--%>
    <%--<option value="SMR">San Marino</option>--%>
    <%--<option value="STP">Sao Tome and Principe</option>--%>
    <%--<option value="SAU">Saudi Arabia</option>--%>
    <%--<option value="SEN">Senegal</option>--%>
    <%--<option value="SRB">Serbia</option>--%>
    <%--<option value="SYC">Seychelles</option>--%>
    <%--<option value="SLE">Sierra Leone</option>--%>
    <%--<option value="SGP">Singapore</option>--%>
    <%--<option value="SXM">Sint Maarten (Dutch part)</option>--%>
    <%--<option value="SVK">Slovakia</option>--%>
    <%--<option value="SVN">Slovenia</option>--%>
    <%--<option value="SLB">Solomon Islands</option>--%>
    <%--<option value="SOM">Somalia</option>--%>
    <%--<option value="ZAF">South Africa</option>--%>
    <%--<option value="SGS">South Georgia and the South Sandwich Islands</option>--%>
    <%--<option value="SSD">South Sudan</option>--%>
    <%--<option value="ESP">Spain</option>--%>
    <%--<option value="LKA">Sri Lanka</option>--%>
    <%--<option value="SDN">Sudan</option>--%>
    <%--<option value="SUR">Suriname</option>--%>
    <%--<option value="SJM">Svalbard and Jan Mayen</option>--%>
    <%--<option value="SWZ">Swaziland</option>--%>
    <%--<option value="SWE">Sweden</option>--%>
    <%--<option value="CHE">Switzerland</option>--%>
    <%--<option value="SYR">Syrian Arab Republic</option>--%>
    <%--<option value="TWN">Taiwan, Province of China</option>--%>
    <%--<option value="TJK">Tajikistan</option>--%>
    <%--<option value="TZA">Tanzania, United Republic of</option>--%>
    <%--<option value="THA">Thailand</option>--%>
    <%--<option value="TLS">Timor-Leste</option>--%>
    <%--<option value="TGO">Togo</option>--%>
    <%--<option value="TKL">Tokelau</option>--%>
    <%--<option value="TON">Tonga</option>--%>
    <%--<option value="TTO">Trinidad and Tobago</option>--%>
    <%--<option value="TUN">Tunisia</option>--%>
    <%--<option value="TUR">Turkey</option>--%>
    <%--<option value="TKM">Turkmenistan</option>--%>
    <%--<option value="TCA">Turks and Caicos Islands</option>--%>
    <%--<option value="TUV">Tuvalu</option>--%>
    <%--<option value="UGA">Uganda</option>--%>
    <%--<option value="UKR">Ukraine</option>--%>
    <%--<option value="ARE">United Arab Emirates</option>--%>
    <%--<option value="GBR">United Kingdom</option>--%>
    <%--<option value="USA">United States</option>--%>
    <%--<option value="UMI">United States Minor Outlying Islands</option>--%>
    <%--<option value="URY">Uruguay</option>--%>
    <%--<option value="UZB">Uzbekistan</option>--%>
    <%--<option value="VUT">Vanuatu</option>--%>
    <%--<option value="VEN">Venezuela, Bolivarian Republic of</option>--%>
    <%--<option value="VNM">Viet Nam</option>--%>
    <%--<option value="VGB">Virgin Islands, British</option>--%>
    <%--<option value="VIR">Virgin Islands, U.S.</option>--%>
    <%--<option value="WLF">Wallis and Futuna</option>--%>
    <%--<option value="ESH">Western Sahara</option>--%>
    <%--<option value="YEM">Yemen</option>--%>
    <%--<option value="ZMB">Zambia</option>--%>
    <%--<option value="ZWE">Zimbabwe</option>--%>
    <%--</select>--%>
    <%--</div>--%>
    <%--</div>--%>
</section>
<!-- ============================================================== -->
<!-- End Wrapper -->
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- All Jquery -->
<!-- ============================================================== -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
    $.post('signup', function(name, surname, identityNumber, nationality, maritalStatus, address, addressCountry, addressProvince,
    addressCity, addressTown, addressZipCode, phone, email, password, username) {
    });
</script>
<script src="assets/node_modules/jquery/jquery-3.2.1.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="assets/node_modules/popper/popper.min.js"></script>
<script src="assets/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- slimscrollbar scrollbar JavaScript -->
<script src="propertyadmin/dist/js/perfect-scrollbar.jquery.min.js"></script>
<!--Wave Effects -->
<script src="propertyadmin/dist/js/waves.js"></script>
<!--Menu sidebar -->
<script src="propertyadmin/dist/js/sidebarmenu.js"></script>
<!--stickey kit -->
<script src="assets/node_modules/sticky-kit-master/dist/sticky-kit.min.js"></script>
<script src="assets/node_modules/sparkline/jquery.sparkline.min.js"></script>
<!--Custom JavaScript -->
<script src="propertyadmin/dist/js/custom.min.js"></script>
<script src="assets/node_modules/moment/min/moment.min.js"></script>
<script src="assets/node_modules/wizard/jquery.steps.min.js"></script>
<script src="assets/node_modules/wizard/jquery.validate.min.js"></script>
<!-- Sweet-Alert  -->
<script src="assets/node_modules/sweetalert/sweetalert.min.js"></script>
<script src="assets/node_modules/wizard/steps.js"></script>
<script language="javascript">
    populateCountries("country", "state");
    populateCountries("country2");
</script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
    $(function() {
        $(".preloader").fadeOut();
    });
    $(function() {
        $('[data-toggle="tooltip"]').tooltip()
    });
    // ==============================================================
    // Login and Recover Password
    // ==============================================================
    $('#to-recover').on("click", function() {
        $("#loginform").slideUp();
        $("#recoverform").fadeIn();
    });
</script>
</body>
</html>
