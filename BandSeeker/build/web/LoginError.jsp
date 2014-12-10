<%-- 
    Document   : Error
    Created on : Nov 19, 2014, 8:59:02 PM
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

        <title>Error Page</title>
    </head>
    <body>

        <!--Navigation Bar-->  
        <c:import url="/static/header.jsp"></c:import>
        <!--/Navigation Bar-->  
        
        
        <div class="jumbotron">
            <center>
                <h1>An Error came up,Please try again later...</h1>
            </center>
        </div>

        <!--footer-->
        <c:import url="/static/footer.jsp"></c:import>
        <!--/footer-->
        
    </body>
</html>
