<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Teacher Page</title>
        <link href="css/bootstrap-theme.min.css" rel="stylesheet"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <link href="css/bootstrap.min.css" rel="stylesheet"/>
        <link rel="stylesheet" type="text/css" href="media/css/jquery.dataTables.css">	
        <style type="text/css" class="init">
        </style>
        <script type="text/javascript" language="javascript" src="media/js/jquery.js"></script>
        <script type="text/javascript" language="javascript" src="media/js/jquery.dataTables.js"></script>	
        <script type="text/javascript" language="javascript" class="init">
            $(document).ready(function() {
                $('#example').DataTable({
                    dom: 'T<"clear">lfrtip'
                });
            });
        </script>
        
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
                <c:if test="${p == 'msqus'}">
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


        <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
    </body>
</html>
