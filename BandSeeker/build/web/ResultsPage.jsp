<%-- 
    Document   : ResultsPage
    Created on : Nov 22, 2014, 12:37:25 PM
    Author     : George Garyfallou
--%>

<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Results</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="http://s3.amazonaws.com/codecademy-content/courses/ltp/css/bootstrap.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/main.css">
        
        <style>
            #emailto{
                font-size: 13px;
                color: #333;
                font-style: italic;
                line-height: 1.42857143;
                word-wrap: break-word;
            }
        </style>
    </head>
    <body>
        <!--Navigation Bar-->  
        <c:import url="/static/header.jsp"></c:import>
        <!--/Navigation Bar-->  

        <div class="jumbotron">
            <div class="container">
                <a href="SearchPage.jsp" class="btn btn-primary active" role="button"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span> Back to search</a>

                <div id="result">
                    <h3>${sessionScope["message"]}</h3>
                </div>
                <br>

                <c:forEach items="${results}" var="result">
                    <pre style="margin-left: 0px; padding-left: 0px;">
                    <a href="<c:url value="/Controller?action=profile&profile=${result.username}" />"><b><i>Username:</i><c:out value="${result.username}" /></b></a><br />
                    <b><i>First Name:</i><c:out value="${result.Fname}" /></b><br />
                    <b><i>Last Name:</i><c:out value="${result.Lname}" /></b><br />
                    <b><i>Email:</i><a id="emailto" target="_blank" href="mailto:<c:out value="${result.email}" />"><c:out value="${result.email}" /> <span class="glyphicon glyphicon-send" aria-hidden="true"></span></a></b><br />
                    <b><i>Type of Account:</i><c:out value="${result.type}" /></b><br />
                    <b><i>Instrument:</i><c:out value="${result.instrument}" /></b><br />
                    <b><i>About:</i><div style="padding-left: 207px;margin-top: -18px;"><c:out value="${result.about}" /></div></b><br />
                    </pre>
                </c:forEach>

            </div>
            <!--/container-->
                
        </div>
        <!--jumbotron-->

        <!--footer-->
        <c:import url="/static/footer.jsp"></c:import>
        <!--/footer-->

    </body>
</html>
