<%-- 
    Document   : RegisterPage
    Created on : Dec 1, 2014, 9:35:05 PM
    Author     : George Garyfallou
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/photos/favicon.ico" type="image/x-icon" sizes="256x256" />
        <link rel="icon" href="${pageContext.request.contextPath}/photos/favicon.ico" type="image/x-icon" sizes="256x256" />
        
        <title>Register</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
        <link rel="stylesheet" href="http://s3.amazonaws.com/codecademy-content/courses/ltp/css/bootstrap.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/main.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/register.css" />

        <!--jQuery Core-->
        <script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
    </head>

    <script type="text/javascript">
        function loadXMLDoc()
        {
            var xmlhttp;
            var k = document.getElementById("username").value;
            var urls = "checkusername.jsp?ver=" + k;

            if (window.XMLHttpRequest)
            {
                xmlhttp = new XMLHttpRequest();
            }
            else
            {
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange = function ()
            {
                if (xmlhttp.readyState == 4)
                {
                    document.getElementById("err").innerHTML = xmlhttp.responseText;
                }
            }
            xmlhttp.open("GET", urls, true);
            xmlhttp.send();
        }
    </script>


    <body>

        <!--Navigation Bar-->  
        <c:import url="/static/header.jsp"></c:import>
        <!--/Navigation Bar--> 

        <!--jumbotron--> 
        <div class="jumbotron">
            
            <center>
                <div class="cotainer">

                    <div class="signup-box">

                        <h1>Sign Up</h1><br>

                        <form action="Register" method="POST">
                            <fieldset>
                                <label for="account-type">What type of account would you like?</label>
                                <div class="account-type">
                                    <input type="radio" name="account-type" value="band" checked/>Band
                                    <input type="radio" name="account-type" value="musician">Musician
                                </div>
                                <br>
                                <div class="from-goup">
                                    <div id="musician-type">
                                        <!--javascript gia na mpainei to dropdown list ann patisei o xristis tin epilogis BAND-->
                                        <label for="instrument-select">Choose Instrument</label>
                                        <select class="form-control" name="instrument-select">
                                            <option value="NULL">I don't play anything..</option>
                                            <option value="vocals">Vocals</option>
                                            <option value="guitar">Guitar</option>
                                            <option value="drums">Drums</option>
                                            <option value="bass">Bass</option>
                                            <option value="piano">Piano/Keyboard/Synthesizer</option>
                                            <option value="violin">Violin</option>
                                            <option value="saxophone">Saxophone</option>
                                            <option value="flute">Flute</option>
                                            <option value="trumpet">Trumpet</option>
                                            <option value="accordion">Accordion</option>
                                        </select>
                                    </div>
                                    <br>
                                    <input type="text" name="username" id="username" placeholder="Username" onkeyup="loadXMLDoc()" required/>
                                    <span id="err"></span>
                                    <input type="password" name="password" placeholder="Password" required/>
                                    <input type="password" name="rpassword" placeholder="Retype Password" required/>
                                    <input type="text" name="Fname" placeholder="First Name" required/>
                                    <input type="text" name="Lname" placeholder="Last Name" required/>
                                    <input type="email" name="email" placeholder="Email" required/>
                                    <textarea cols="28" rows="5" name="about" placeholder="Describe what you are looking for.."></textarea>
                                    <input type="submit" name="register" class="signup signup-submit" value="Create Account" />
                                </div>
                            </fieldset>
                        </form>
                        
                    </div>
                    <!--signup-box-->

                </div>
                <!--/container-->
                
            </center>
            
        </div>
        <!--/jumbotron-->

        <!--footer-->
        <c:import url="/static/footer.jsp"></c:import>
        <!--/footer-->

        <!--ShowHide JavaScript-->
        <script src="js/Register.js"></script>
    </body>
</html>

