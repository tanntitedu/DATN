<%-- 
    Document   : menu_nav
    Created on : Jun 3, 2014, 4:23:55 PM
    Author     : Welcomes
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu nav</title>
        <link href="../css/bootstrap-theme.css" rel="stylesheet"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <link href="../css/bootstrap.css" rel="stylesheet"/>
        <link href="../css/blog.css" rel="stylesheet"/>
    </head>
    <body>
        <div class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <div class="navbar-collapse collapse">
                    <div class="col-md-12">
                        <ul class="nav navbar-nav">

                            <li class="active"><a href="/DO_AN/home.jsp">Trang chủ</a></li>
                            <li><a href="/DO_AN/QuizManager?p=list-quiz">Đề thi</a></li>
                            <li>
                                <a href="/DO_AN/#" >Góp ý <b class=""></b></a>

                            </li>

                            <li><a href="/DO_AN/#">Liên Hệ</a></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">

                            <c:if test="${currentUser == null}">
                                <li><a href="/DO_AN/login.jsp">Đăng nhập</a></li>
                                </c:if>
                                <c:if test="${currentUser != null}">
                                    <c:if test="${currentUser.getRole().getRoleId() ==1}">
                                    <li><a href="/DO_AN/UserManager?p=manage">Quản trị</a></li>
                                    </c:if>
                                    <c:if test="${currentUser.getRole().getRoleId() ==2}">
                                    <li><a href="/DO_AN/QuizManager?p=manage">Giáo viên</a></li>
                                    </c:if>
                                <li><a href="login?do=logout">Thoát</a></li>
                                </c:if>
                        </ul>
                    </div>
                </div><!--/.nav-collapse -->
            </div><!--/.container-fluid -->
        </div>
        <script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="../js/bootstrap.min.js"></script>
    </body>
</html>
