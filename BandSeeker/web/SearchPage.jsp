<%-- 
    Document   : SearchPage
    Created on : Nov 22, 2014, 3:35:33 PM
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
        <title>Search</title>
        
        <link rel="stylesheet" href="http://s3.amazonaws.com/codecademy-content/courses/ltp/css/bootstrap.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/main.css">
    </head>
    <body>
       
        <!--Navigation Bar-->  
        <c:import url="/static/header.jsp"></c:import>
        <!--/Navigation Bar-->   

        <div class="jumbotron">
            <div class="container">
                <h1>Search fields go here</h1>
            </div>
        </div> 

        <!--footer-->
        <c:import url="/static/footer.jsp"></c:import>
        <!--/footer-->
        
    </body>
</html>
