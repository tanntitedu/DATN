
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="navbar navbar-fixed-top navbar-inverse" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                </div>
                <div class="col-md-12">
                    <ul class="nav navbar-nav">
                        <li><a  class="active" href="/DO_AN/QuizManager?p=manage">Administrator</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Quản lý <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="/DO_AN/StudentMamager?p=manage-user">Quản lý tài khoản</a></li>
                                <li class="divider"></li>
                                <li><a href="/DO_AN/QuizManager?p=manage-quiz">Quản lý</a></li>
                                <li class="divider"></li>
                                
                            </ul>
                        </li>
                        
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="active"><a href="/DO_AN/home.jsp">Trang chủ</a></li>
                        <li><a href="/DO_AN/login?do=logout"><span class="glyphicon glyphicon-th-large"  >Đăng xuất</span></a></li>
                    </ul>
                </div>
            </div><!-- /.container -->
        </div><!-- /.navbar -->
    </body>
</html>
