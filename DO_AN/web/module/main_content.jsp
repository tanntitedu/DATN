<%-- 
    Document   : main_containt
    Created on : Jun 3, 2014, 4:18:36 PM
    Author     : Welcomes
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Containt</title>
        <link href="../css/bootstrap-theme.css" rel="stylesheet"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <link href="../css/bootstrap.css" rel="stylesheet"/>
        <link href="../css/blog.css" rel="stylesheet"/>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <c:if test="${msgResult != null}">
                    <p style="color: red; font-weight: bold">${msgResult}</p>
                </c:if>
                <c:if test="${msgSuccess != null}">
                    <p style="color: blue; font-weight: bold">${msgSuccess}</p>
                </c:if>    
                <c:if test="${p == 'list_quiz'}">                        
                    <%@include file="../user/list_exam.jsp" %>
                </c:if>
                <c:if test="${p == 'infor_quiz'}">                        
                    <%@include file="../user/infor.jsp" %>
                </c:if>
                <c:if test="${p == 'exams'}">                        
                    <%@include file="../user/exams.jsp" %>
                </c:if>
                <c:if test="${p == 'result'}">                        
                    <%@include file="../user/result.jsp" %>
                </c:if>    
                <c:otherwise>
                   <%@include file="../module/about.jsp" %> 
                </c:otherwise>
            </div>
        </div>

        
                
          


        <script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="../js/bootstrap.min.js"></script>
    </body>
</html>
