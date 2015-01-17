<%-- 
    Document   : ChangeProfile
    Created on : Dec 6, 2014, 9:04:40 PM
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
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="http://s3.amazonaws.com/codecademy-content/courses/ltp/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/main.css" />
        <style>
            .container{
                color: #999999;
            }
            #instrument-list{
                width:220px;
            }

        </style>
    </head>
    <body>

        <!--Navigation Bar-->  
        <c:import url="/static/header.jsp"></c:import>
        <!--/Navigation Bar--> 

        <!--jumbotron-->
        <div class="jumbotron">
            <!--container-->
            <div class="container">
                <form method="post" action="${pageContext.request.contextPath}/FileUploader" enctype="multipart/form-data">

                    <input type="file" name="file" value="Select Image" />
                    <button type="submit" class="btn btn-primary">Start Upload</button>

                </form>

                <div id="result">
                    <h3>${requestScope["message"]}</h3>
                </div>

                <sql:setDataSource var="ds" dataSource="jdbc/bandseeker" />
                <sql:query dataSource="${ds}" sql="select * from users where username=?" var="user">
                    <sql:param>${param.change_profile}</sql:param>
                    <!-- username=? is the sql:param, the ${param.change_profile} is from &change_profile=${param.profile} from profile.jsp -->
                </sql:query>
                <c:set scope="page" var="user" value="${user.rows[0]}"></c:set>


                <%--TODO --> create the update servlet--%>
                <form action="Update" method="POST">
                    <fieldset>
                        <br>
                        <div class="from-goup">
                            <!--javascript gia na mpainei to dropdown list ann patisei o xristis tin epilogis BAND-->
                            <label for="instrument">Choose Instrument</label>
                            <select class="form-control" name="instrument-select" id="instrument-list">
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
                            <br>
                            <label for="email">Change email address</label>
                            <input type="text" name="email" value="<c:out value="${user.email}" />" required/>
                            <br>
                            <input type="submit" name="update" class="signup signup-submit" value="Update Account" />
                        </div>
                    </fieldset>
                </form>
            </div>
            <!--/container-->
        </div>
        <!--/jumbotron-->

        <!--footer-->
        <c:import url="/static/footer.jsp"></c:import>
        <!--/footer-->

    </body>
</html>
