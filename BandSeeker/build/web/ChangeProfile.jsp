<%-- 
    Document   : ChangeProfile
    Created on : Dec 6, 2014, 9:04:40 PM
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

        <form method="post" action="${pageContext.request.contextPath}/FileUploader" enctype="multipart/form-data">
            <input type="file" name="file" value="Select Image" />

            <input type="submit" value="Start upload" />
        </form>

        <div id="result">

            <h3>${requestScope["message"]}</h3>

        </div>


    </body>
</html>
