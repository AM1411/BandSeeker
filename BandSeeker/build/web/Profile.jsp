<%-- 
    Document   : Profile
    Created on : Dec 6, 2014, 8:41:03 PM
    Author     : George Garyfallou
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="ps" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/photos/favicon.ico" type="image/x-icon" />
        <link rel="icon" href="${pageContext.request.contextPath}/photos/favicon.ico" type="image/x-icon" />
        
        <title>Profile</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
        <link rel="stylesheet" href="http://s3.amazonaws.com/codecademy-content/courses/ltp/css/bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/main.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/profile.css" />
        
        <style>
            #emailto{
                font-size: 15px;
                color: grey; 
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

                <%-- Fetch the image data --%>

                <sql:setDataSource var="ds" dataSource="jdbc/bandseeker" />
                
                <sql:query dataSource="${ds}" sql="select * from images where owner=? limit 5" var="results">
                    <sql:param>${param.profile}</sql:param>
                    <!-- owner=? is the sql:param, the ${param.profile} is from &profile=${image.owner} from index.jsp -->
                </sql:query>

                <c:set scope="page" var="image" value="${results.rows[0]}"></c:set>
                <c:set scope="page" var="username" value="${image.owner}"></c:set>

                <sql:query dataSource="${ds}" sql="select * from users where username=?" var="user">
                    <%--<sql:param>${username}</sql:param>--%>
                    <sql:param>${param.profile}</sql:param>
                </sql:query>

                <c:set scope="page" var="user" value="${user.rows[0]}"></c:set>

                <c:set scope="page" var="useremail" value="${user.email}"></c:set>
                <c:set scope="page" var="usercheck" value="${user.username}"></c:set>
                <%
                    if (request.getSession().getAttribute("username")!=null && request.getSession().getAttribute("username").equals(pageContext.getAttribute("usercheck"))) {%>
                       <%--out.write("<a href=\"ChangeProfile.jsp\">Update Profile Info</a>");--%>
                       <a href="<c:url value="/Controller?action=change_profile&change_profile=${param.profile}" />">Update Profile Info</a>
                       <%
                    }
                %>


                <%-- Show the title, first letter capitalised --%>
                <H2>
                    <c:out
                        value="${fn:toUpperCase(fn:substring(user.username, 0, 1))}${fn:toLowerCase(fn:substring(user.username, 1, -1))}" />
                    <!-- print the name with the first letter capital and the other lower case with a jstl function -->
                </H2>
                <!-- fmt is for formatting numbers in jstl, here we format decimal numbers, here to have only one digit after the comma -->

                <table class="images">

                    <c:set var="tablewidth" value="5" /> <!-- 5 images in each row -->

                    <c:forEach var="image" items="${results.rows}" varStatus="row"> 

                        <c:if test="${row.index % tablewidth == 0}">

                            <tr>
                            </c:if>

                            <c:set scope="page" var="imgname" value="${image.stem}.${image.image_extension}"></c:set>
                                <td>
                                <ps:image width="200" stem="${image.stem}" extension="${image.image_extension}"/>
                                </a>
                            </td>

                            <c:if test="${row.index + 1 % tablewidth == 0}">
                            </tr>
                        </c:if>
                    </c:forEach>

                </table>

                <!--edw ektupwnontai ta info tou kathe xristi-->
                <div id="info">

                    <!--onoma-->
                    <b><i>First Name: </i><c:out value="${user.Fname}" /></b>
                    <br />

                    <!--epomumo-->
                    <b><i>Last Name: </i><c:out value="${user.Lname}" /></b>
                    <br />

                    <!--email-->
                    <b><i>Email: </i><a target="_blank" id="emailto" href="mailto:<c:out value="${user.email}" />"><c:out value="${user.email}" /> <span class="glyphicon glyphicon-send" aria-hidden="true"></span></a> </b>
                    <br />

                    <!--account type-->
                    <b><i>Account Type: </i> <c:out value="${user.type}" /></b>
                    <br />

                    <!--mousiko organo-->
                    <b><i>Instrument: </i> <c:out value="${user.instrument}" /></b>
                    <br />


                    <!--ti psaxnei(text)-->
                    <b><i>About Me: </i><pre style="width: 400px;"> <c:out value="${user.about}" /> </pre></b>
                    <br />

                </div>

            </div>
            <!--/container-->
        </div>
        <!--/jumbotron-->

        <!--footer-->
        <c:import url="/static/footer.jsp"></c:import>
        <!--/footer-->

    </body>
</html>
