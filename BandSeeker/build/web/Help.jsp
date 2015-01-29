<%-- 
    Document   : Help
    Created on : Dec 1, 2014, 9:34:55 PM
    Author     : George Garyfallou
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/photos/favicon.ico" type="image/x-icon" />
        <link rel="icon" href="${pageContext.request.contextPath}/photos/favicon.ico" type="image/x-icon" />

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
        <link rel="stylesheet" href="http://s3.amazonaws.com/codecademy-content/courses/ltp/css/bootstrap.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/main.css" />
        
        <style>
            #help{
                color: #999999;
            } 
        </style>
        <title>Help</title>
    </head>
    <body>
        <!--Navigation Bar-->  
        <c:import url="/static/header.jsp"></c:import>
        <!--/Navigation Bar--> 
        
            <div class="jumbotron">

                <div class="container">
                    <div id="help">
                    
                        <h2>In BANDSEEKER it's easy to find musicians and start Jumming!</h2>
                    
                        <p>Just follow these easy steps</p>
                        <ol>
                            <li>Click on "Sign up" button and create an account for free</li>
                            <li>Fill in your details and click "Create Account" button</li>
                            <li>Now other musicians can find you in BandSeeker</li>
                        </ol>
                        
                        <p>...Or you can just click the "Search" button and find the band or musician you want!</p>
                    </div>
                        
                </div><!--/container-->

            </div><!--/jumbotron-->


        <!--footer-->
        <c:import url="/static/footer.jsp"></c:import>
        <!--/footer-->

    </body>
</html>
