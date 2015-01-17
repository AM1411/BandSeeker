<%-- 
    Document   : checkusername
    Created on : Jan 15, 2015, 6:44:20 PM
    Author     : George Garyfallou
--%>

<%@ page import="java.io.*,java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String sn = request.getParameter("ver");

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bandseeker", "admin", "admin");
    
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from bandseeker.users where username='" + sn + "'");  // this is for name
    
    if (rs.next()) {
        out.println("<font color=red>");
        out.println("Name already taken");
        out.println("</font>");

    } else {
        out.println("<font color=green>");
        out.println("Available");
        out.println("</font>");

    }
    rs.close();
    st.close();
    con.close();
%> 
