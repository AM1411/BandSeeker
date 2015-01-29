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
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/photos/favicon.ico" type="image/x-icon" />
        <link rel="icon" href="${pageContext.request.contextPath}/photos/favicon.ico" type="image/x-icon" />
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
        <link rel="stylesheet" href="http://s3.amazonaws.com/codecademy-content/courses/ltp/css/bootstrap.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/main.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/login.css" />

        <title>Login</title>
    </head>
    <body> 

        <!--Navigation Bar-->  
        <c:import url="/static/header.jsp"></c:import>
        <!--/Navigation Bar--> 

            
        <%Cookie[] cookies = request.getCookies();
            String name = "", pass = "";
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("cookieLoginUser")) {
                        name = cookie.getValue();
                    }
                    if (cookie.getName().equals("cookieLoginPassword")) {
                        pass = cookie.getValue();
                    }
                }
            }
        %>
            

        <div class="jumbotron">
            <form class="login-form" action="Login" method="POST ">
                <p class="clearfix">
                    <label for="login">Username</label>
                    <input type="text" name="username" id="login" placeholder="Username" value="<%=name%>"  required/>
                </p>
                <p class="clearfix">
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" placeholder="Password" value="<%=pass%>"  required/> 
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
