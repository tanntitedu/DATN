<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link href="css/bootstrap-theme.css" rel="stylesheet"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <link href="css/bootstrap.css" rel="stylesheet"/>
        <link href="css/blog.css" rel="stylesheet"/>
        <style>
            body{

            }
        </style>
    </head>
    <body>
        <div class="navbar-wrapper">

            <!--Banner-->
            <div class="container">
                <div class="row">
                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <!-- <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                             <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                             <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            -->
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner">
                            <!--image1-->
                            <div class="item active">
                                <img src="images/slideshow/1.png" data-src="holder.js/1170x200/auto/#777:#555/text:First slide" alt="Nông Thôn Mới">
                            </div>
                            <!--image2-->
                            <div class="item">
                                <img src="images/slideshow/2.png" data-src="holder.js/1170x200/auto/#777:#555/text:First slide" alt="Mới Nông Thôn">
                            </div>
                            <!--image3-->
                            <div class="item">
                                <img src="images/slideshow/3.png" data-src="holder.js/1170x200/auto/#777:#555/text:First slide" alt="Nông Mới Thôn">
                            </div>
                             <div class="item">
                                <img src="images/slideshow/4.png" data-src="holder.js/1170x200/auto/#777:#555/text:First slide" alt="Nông Mới Thôn">
                            </div>



                        </div>

                        <!-- Controls -->
                        <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                        </a>
                    </div>
                </div>
            </div>
            <!--Menu-->
            <div class="container">
                <div class="row">
                    <%@include file="module/menu_nav.jsp" %>
                </div>
            </div>

        </div>
        <!--SUM CONTAIN-->
        <div class="container">
            <div class="row" id="content">

                <!---------------------------LEFT--------------------------------->
                <%@include file="module/left_content.jsp" %>
                <!-----------------------------CONTENT----------------------------->
                <c:if test="${p == 'about'}">
                    <%@include file="module/about.jsp" %>
                </c:if>

                <c:if test="${p == 'search-cb-vb'}">
                    <%@include file="module/search-cb-vb.jsp" %>
                </c:if>
                <c:if test="${p == 'search-nc-vb'}">
                    <%@include file="module/search-nc-vb.jsp" %>
                </c:if>


                <c:if test="${p == 'search-cb-dp'}">
                    <%@include file="module/search-cb-dp.jsp" %>
                </c:if>
                <c:if test="${p == 'search-nc-dp'}">
                    <%@include file="module/search-nc-dp.jsp" %>
                </c:if>


                <c:if test="${p == 'contact'}">
                    <%@include file="module/contact.jsp" %>
                </c:if>
                <c:if test="${p ==null}">
                    <%@include file="module/main_content.jsp" %>
                </c:if>

                <!------------------------------------------RIGHT------------------------------------------------->
                <%@include file="module/right_content.jsp" %>

            </div><!--End Row-->
            <!-----------------------------FOOTER----------------------------->
            <footer>
                <p class="panel panel-footer">&copy; Company 2014 &ReverseEquilibrium;Design by JuDi Team</p>
            </footer>

        </div><!--End Container-->
        <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
    </body>
</html>
