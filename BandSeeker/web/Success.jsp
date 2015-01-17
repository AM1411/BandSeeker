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
        <title>JSP Page</title>
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
