
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập</title>
        <link href="../css/bootstrap-theme.min.css" rel="stylesheet"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <link href="../css/bootstrap.min.css" rel="stylesheet"/>
        <style>
            body{
                padding:140px 0px;

            }
        </style>
    </head>
    <body>
         <div class="container">            
            <div class="col-lg-6 col-md-offset-3">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <span class="glyphicon glyphicon-lock"></span>
                        Đăng nhập hệ thống!
                    </div>
                    <div class="panel-body">
                        <form class="form-horizontal" method="post" action="/DO_AN/login" role="form">

                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-3 control-label">
                                    Tên tài khoản: </label>
                                <div class="col-sm-9" >
                                    <input type="text" name="tenTK" class="form-control" id="inputEmail3" placeholder="Username">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-3 control-label">
                                    Mật khẩu: </label>
                                <div class="col-sm-9">
                                    <input type="password" name="matkhau" class="form-control" id="inputPassword3" placeholder="Password">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="remember"> Ghi nhớ tài khoản và mật khẩu?
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <input type="submit" class="btn btn-default" name="do" value="Đăng Nhập" />
                                </div>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div><!-- /.container -->

        <script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="../js/bootstrap.min.js"></script>
    </body>
</html>
