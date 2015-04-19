<%-- 
    Document   : abc
    Created on : Jun 2, 2014, 10:47:30 PM
    Author     : Welcomes
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <meta charset="utf-8">
       <link rel="shortcut icon" type="image/ico" href="images/right/icon.jpg">
        <meta name="viewport" content="initial-scale=1.0, maximum-scale=2.0">

        <title>NNN</title>
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
                <c:if test="${msgSuccess != null}">
                    <p style="color: blue; font-weight: bold">${msgSuccess}</p>
                </c:if>    
                <c:if test="${p == 'manage'}">
                    <%@include file="admin/nav-admin.jsp" %>    
                    <%@include file="admin/manage.jsp" %>
                </c:if>
                <c:if test="${p == 'adduser'}">
                    <%@include file="admin/nav-admin.jsp" %>
                    <%@include file="admin/adduser.jsp" %>

                </c:if>
                <c:if test="${p == 'adddp'}">
                    <%@include file="admin/nav-admin.jsp" %>    
                    <%--<%@include file="admin/update_diaphuong.jsp" %>--%>

                </c:if>
                <c:if test="${p == 'addclss'}">
                    <%@include file="admin/nav-admin.jsp" %>
                    <%@include file="admin/addclss.jsp" %>
                </c:if>
                <c:if test="${p == 'add-npt'}">
                    <%@include file="admin/nav-admin.jsp" %>
                    <%--<%@include file="admin/add-npt.jsp" %>--%>
                </c:if>
                <c:if test="${p == 'manage-user'}">
                    <%@include file="admin/nav-admin.jsp" %>
                    <%@include file="admin/manage-users.jsp" %>
                </c:if>
                <c:if test="${p == 'manage-diaphuong'}">
                    <%@include file="admin/nav-admin.jsp" %>
                    <%--<%@include file="admin/manage-diaphuong.jsp" %>--%>
                </c:if>
                <c:if test="${p == 'manage-clss'}">
                    <%@include file="admin/nav-admin.jsp" %>
                    <%@include file="admin/manage-clss.jsp" %>
                </c:if>
                <c:if test="${p == 'manage-npt'}">
                    <%@include file="admin/nav-admin.jsp" %>
                    <%--<%@include file="admin/manage-npt.jsp" %>--%>
                </c:if>
                <c:if test="${p == 'login' || p == null}">
                    <%@include file="admin/login.jsp" %>
                </c:if>
            </div>
        </div>

        
        
    </body>
</html>
