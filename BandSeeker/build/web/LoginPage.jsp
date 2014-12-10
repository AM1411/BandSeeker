<%-- 
    Document   : LoginPage
    Created on : Nov 19, 2014, 8:57:15 PM
    Author     : George
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="http://s3.amazonaws.com/codecademy-content/courses/ltp/css/bootstrap.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/main.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/login.css">

        <title>Login Page</title>
    </head>
    <body> 
        
        <!--Navigation Bar-->  
        <c:import url="/static/header.jsp"></c:import>
        <!--/Navigation Bar-->    
        
        <div class="jumbotron">
            <form class="login-form" action="Login" method="POST ">
                <p class="clearfix">
                    <label for="login">Username</label>
                    <input type="text" name="username" id="login" placeholder="Username">
                </p>
                <p class="clearfix">
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" placeholder="Password"> 
                </p>
                <p class="clearfix">
                    <input type="checkbox" name="remember" id="remember">
                    <label for="remember">Remember me</label>
                </p>
                <p class="clearfix">
                    <input type="submit" name="submit" value="Sign in">
                </p>       
            </form>
        </div>
        
        <!--footer-->
        <c:import url="/static/footer.jsp"></c:import>
        <!--/footer-->

    </body>

</html>
