<%-- 
    Document   : homepage
    Created on : Dec 1, 2014, 6:25:20 PM
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
        <title>BandSeeker</title>
        
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/photos/favicon.ico" type="image/x-icon" sizes="256x256" />
        <link rel="icon" href="${pageContext.request.contextPath}/photos/favicon.ico" type="image/x-icon" sizes="256x256" />
       
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
        <link rel="stylesheet" href="http://s3.amazonaws.com/codecademy-content/courses/ltp/css/bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/main.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/home.css" />
        
        <script>
            navigator.browserInfo= (function(){
                var ua= navigator.userAgent, tem, 
                M= ua.match(/(opera|chrome|safari|firefox|msie|trident(?=\/))\/?\s*(\d+)/i) || [];
                if(/trident/i.test(M[1])){
                    tem=  /\brv[ :]+(\d+)/g.exec(ua) || [];
                    return 'IE '+(tem[1] || '');
                }
                if(M[1]=== 'Chrome'){
                    tem= ua.match(/\bOPR\/(\d+)/)
                    if(tem!= null) return 'Opera '+tem[1];
                }
                M= M[2]? [M[1], M[2]]: [navigator.appName, navigator.appVersion, '-?'];
                if((tem= ua.match(/version\/(\d+)/i))!= null) M.splice(1, 1, tem[1]);
                return M.join(' ');
            })();
            
        </script>
    </head>
    <body>

        <!--Navigation Bar-->  
        <c:import url="/static/header.jsp"></c:import>
        <!--/Navigation Bar--> 

        <!--jumbotron-->
        <div class="jumbotron">
            
            <div class="container">
                
                <h1>Find musicians in Greece and start making music</h1>

                <div class="samples"><!--samples apo kataxwriseis-->

                    <sql:setDataSource var="ds" dataSource="jdbc/bandseeker" />
                    <!-- this is from context.xml and web.xml in Configurations files, we take the code from here: http://tomcat.apache.org/tomcat-7.0-doc/jndi-datasource-examples-howto.html -->

                    <sql:query dataSource="${ds}" sql="select * from images order by rand() limit 25" var="results" /><!--querry to show images in random order -->
                    <!-- ${ds} is from var="ds" from sql:setDataSource -->

                    <table class="images">

                        <c:set var="tablewidth" value="5" /> <!-- 5 images in each row -->

                        <c:forEach var="image" items="${results.rows}" varStatus="row"> <!-- the results is from sql var="results", varStatus gives you a lot of info about what is happening in the loop -->
                            <!-- with var="image" we can gain access to every image attribute we have in the database  -->
                            <c:if test="${row.index % tablewidth == 0}">
                                <!-- row.index is gonna be the index of the image within the sequence, here I test if the index of the image is divisible by 5 -->
                                <tr class="img-list">
                            </c:if>

                            <c:set scope="page" var="imgname" value="${image.stem}.${image.image_extension}"></c:set><!--stem and image_extension are DB rows!!-->
                                    <!-- set a variable name imgname a value of an image name and .extension of the pics folder we got from the query in the database -->

                            <td>
                                <div class="pic">
                                    <a href="<c:url value="/Controller?action=profile&profile=${image.owner}" />"><!-- if user clicks on the image go to Controller (Controller) with action=profile -->
                                        <img width="200" src="${pageContext.request.contextPath}/UploadedImages/${imgname}" class="img-responsive img-rounded" />
                                        <span class="text-content"><span>${image.owner}</span></span>
                                    </a>
                                </div>
                            </td>

                            <c:if test="${row.index + 1 % tablewidth == 0}">
                            </tr>
                            </c:if>

                        </c:forEach>

                    </table>
                        
                </div>
                <!--/samples-->
                        
            </div>
            <!--/container-->
                        
        </div> 
        <!--/jumbotron-->

        <!--footer-->
        <c:import url="/static/footer.jsp"></c:import>
        <!--/footer-->

    </body>
</html>
