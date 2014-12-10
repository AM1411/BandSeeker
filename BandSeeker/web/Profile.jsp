<%-- 
    Document   : Profile
    Created on : Dec 6, 2014, 8:41:03 PM
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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/main.css" />
    </head>
    <body>
        
        <!--Navigation Bar-->  
        <c:import url="/static/header.jsp"></c:import>
        <!--/Navigation Bar--> 
        
        <!--jumbotron-->
        <div class="jumbotron">
            <!--container-->
            <div class="container">
                <a href="ChangeProfile.jsp">Update Profile Info</a>
            </div>
            <!--/container-->
        </div>
        <!--/jumbotron-->
        
        <!--footer-->
        <c:import url="/static/footer.jsp"></c:import>
        <!--/footer-->
        
    </body>
</html>
