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
        <title>JSP Page</title>

        <link rel="stylesheet" href="http://s3.amazonaws.com/codecademy-content/courses/ltp/css/bootstrap.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/main.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/register.css">
    </head>
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
                                        <!--tsekare ta inputs me db!!-->
                                        <input type="radio" name="account-type" value="band">Band
                                        <input type="radio" name="account-type" value="musician">Musician
                                    </div>
                                    <br>
                                    <div class="from-goup">
                                        <input type="text" name="username" placeholder="Username" />
                                        <input type="password" name="password" placeholder="Password" />
                                        <input type="password" name="rpassword" placeholder="Retype Password" />
                                        <input type="text" name="Fname" placeholder="First Name" />
                                        <input type="text" name="Lname" placeholder="Last Name" />
                                        <input type="text" name="email" placeholder="Email" />
                                        <input type="submit" name="register" class="signup signup-submit" value="Create Account" />
                                    </div>
                                </fieldset>
                            </form>
                        </div> 
                    </div>
                </center>
            </div>
            <!--/jumbotron-->

            <!--footer-->
        <c:import url="/static/footer.jsp"></c:import>
        <!--/footer-->

    </body>
</html>

