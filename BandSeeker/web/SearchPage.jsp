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

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="http://s3.amazonaws.com/codecademy-content/courses/ltp/css/bootstrap.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/main.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/search.css">
        
        <!--jQuery Core-->
        <script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
        
        <style>
            #instrument-list{
                width:220px;
            }
        </style>
    </head>
    <body>

        <!--Navigation Bar-->  
        <c:import url="/static/header.jsp"></c:import>
        <!--/Navigation Bar-->   

            <div class="jumbotron">
                
                <div class="container">
                    
                    <!--Search fields-->
                    <form action="Search" method ="get" role="form" id="search">
                        <div class="row">
                            <div class="form-group">
                                <label for="account-type" style="font-size:250%;">What are you looking for?</label>
                                <div class="account-type">
                                    <input type="radio" name="account-type" value="band" checked/>Band
                                    <input type="radio" name="account-type" value="musician">Musician
                                </div>
                            </div>

                            <div class="form-group" id="musician-type">
                                <label for="musician-type-select">Select Musician</label>
                                <select class="form-control" name="musician-type-select" id="instrument-list">
                                    <option value="null">Don't care</option>
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
                        </div>

                        <center>
                            <!--<input type="submit" value="Search" />-->
                            <button type="submit" class="btn btn-success">Search</button>
                        </center>
                        
                    </form>
                    <!--/Search Fields-->
                </div>
                <!--/container-->
                
            </div>
            <!--/jumbotron-->

        <!--footer-->
        <c:import url="/static/footer.jsp"></c:import>
        <!--/footer-->

        
        
        <!--ShowHide JavaScript-->
        <script src="js/ShowHide.js"></script>
        
        
    </body>
</html>
