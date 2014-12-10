<%-- 
    Document   : header
    Created on : Dec 1, 2014, 6:18:12 PM
    Author     : George Garyfallou
--%>

<!--
tsekare an o allos exei kanei login
-->

<!--Navigation Bar--> 
<div class="nav">
    <div class="container">
        <ul class="pull-left">
            <li><a href="index.jsp"><b>BandSeeker</b></a></li>
            <%
                

                if (request.getSession().getAttribute("username") != null) {
                    out.write("<li><a href=\"Profile.jsp\"accesskey=\"a\">My Account</a></li>");
                }
            %>
        </ul>
        <ul class="pull-right nav-pills">

            <%
                String myname = (String) session.getAttribute("username");

                if (myname != null) {
                    out.write("<li>Hi  " + myname + "</li>");
                    out.write("<li><a href=\"Logout\"accesskey=\"q\">Logout</a></li>");
                } else {
            %>
            <li><a href="LoginPage.jsp">Log In</a></li>
            <li><a href="RegisterPage.jsp">Sign Up</a></li>

            <%
                }
            %>

            <li><a href="Help.jsp">Help</a></li>


        </ul>
    </div>
</div>
<!--/Navigation Bar--> 
