<%-- 
    Document   : LoginSuccess
    Created on : Dec 4, 2014, 9:19:17 PM
    Author     : George Garyfallou
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/photos/favicon.ico" type="image/x-icon" sizes="256x256" />
        <link rel="icon" href="${pageContext.request.contextPath}/photos/favicon.ico" type="image/x-icon" sizes="256x256" />
        
        <title>Success</title>
    </head>
    <body>
            
        <!--allakse ta attributes!!-->
        <%
            if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
        %>
        
        Welcome <%=session.getAttribute("userid")%>
        <a href='logout.jsp'>Log out</a>
        
        <%
            }
        %>
    </body>
</html>
