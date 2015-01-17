<%-- 
    Document   : header
    Created on : Dec 1, 2014, 6:18:12 PM
    Author     : George Garyfallou
--%>

<!--
tsekare an o allos exei kanei login
-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!--Navigation Bar--> 
<div class="nav navbar-inverse">
    <div class="container">
        <ul class="pull-left nav nav-pills">
            <li><a href="index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span><b> BandSeeker</b></a></li>
            <!--<li><a href="index.jsp"><img src="${pageContext.request.contextPath}/photos/logo.png" /></a></li>-->
            
            <%
                if (request.getSession().getAttribute("username") != null) {%>
                    <li><a href="<c:url value="/Controller?action=profile&profile=${sessionScope.username}" />">My Account</a></li>
                    <%
                }
            %>
        </ul>
        <ul class="pull-right nav nav-pills">

            <%
                String myname = (String) session.getAttribute("username");

                if (myname != null) {
                    out.write("<li><a >Hi  " + myname + "</a></li>");
                    out.write("<li><a href=\"Logout\"accesskey=\"q\">Logout</a></li>");
                } else {
            %>
            <li><a href="LoginPage.jsp">Log In</a></li>
            <li><a href="RegisterPage.jsp">Sign Up</a></li>

            <%
                }
            %>

            <li><a href="SearchPage.jsp">Search</a></li>

        </ul>
    </div>
</div>
<!--/Navigation Bar--> 
