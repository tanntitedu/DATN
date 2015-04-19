<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="shortcut icon" type="image/ico" href="images/right/icon.jpg">
        <meta name="viewport" content="initial-scale=1.0, maximum-scale=2.0">

        <title>TableTools example - Defaults</title>
        <link rel="stylesheet" type="text/css" href="media/css/jquery.dataTables.css">	
        <link href="css/bootstrap-theme.min.css" rel="stylesheet"/>
        <link href="css/bootstrap.min.css" rel="stylesheet"/>
        <style type="text/css" class="init">
        </style>
        <script type="text/javascript" language="javascript" src="media/js/jquery.js"></script>
        <script type="text/javascript" language="javascript" src="media/js/jquery.dataTables.js"></script>
              <script type="text/javascript" language="javascript" class="init">
            $(document).ready(function() {
                $('#abc').DataTable({
                    dom: 'T<"clear">lfrtip',
                    destroy: true
                  
                });
            });
        </script>
        <style>
            body{
                padding:70px 0px;
            }
        </style>
    </head>

    <body>

        <div class="container">
            <div class="row">
                <c:if test="${msgResult != null}">
                    <p style="color: red; font-weight: bold">${msgResult}</p>
                </c:if>
                <c:if test="${p == 'manage'}">
                    <%@include file="teacher/nav-admin.jsp" %>    
                    <%@include file="teacher/manage.jsp" %>
                </c:if>
                <c:if test="${p == 'adduser'}">
                    <%@include file="teacher/nav-admin.jsp" %>
                    <%@include file="teacher/adduser.jsp" %>
                </c:if>

                <c:if test="${p == 'manage-user'}">
                    <%@include file="teacher/nav-admin.jsp" %>
                    <%@include file="teacher/manage-users.jsp" %>
                </c:if>
                <c:if test="${p == 'manage-quiz'}">
                    <%@include file="teacher/nav-admin.jsp" %>
                    <%@include file="teacher/manage-quiz.jsp" %>
                </c:if>
                <c:if test="${p == 'addquiz'}">
                    <%@include file="teacher/nav-admin.jsp" %>
                    <%@include file="teacher/addquiz.jsp" %>
                </c:if>
                <c:if test="${p == 'questions'}">
                    <%@include file="teacher/nav-admin.jsp" %>
                    <%@include file="teacher/manage-questions.jsp" %>
                </c:if>
                <c:if test="${p == 'addqus'}">
                    <%@include file="teacher/nav-admin.jsp" %>
                    <%@include file="teacher/addquestions.jsp" %>
                </c:if>
                <c:if test="${p == 'dt'}">
                    <%@include file="teacher/nav-admin.jsp" %>
                    <%@include file="teacher/defaults.jsp" %>
                </c:if>
            </div>
        </div>

 


    </body>
</html>