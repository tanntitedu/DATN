<%-- 
    Document   : contact
    Created on : Jun 3, 2014, 1:54:36 PM
    Author     : Welcomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Liên hệ</title>
        <link href="../css/bootstrap-theme.css" rel="stylesheet"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <link href="../css/bootstrap.css"rel="stylesheet"/>
        <link href="../css/blog.css"rel="stylesheet"/>
        <style>
            body{
           
            }
        </style>
    </head>
    <body>
        <div class="col-lg-8 col-sm-8 col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h5><span class="glyphicon glyphicon-check"></span>&nbsp; Liên hệ</h5>
                </div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" action="/project1/contact" method="post">
                        <div class="col-sm-10 col-sm-offset-1">
                            <div class="form-group">

                                <div class="col-sm-2" >
                                    <label>Họ Tên(*)</label>
                                </div>
                                <div class="col-sm-10" >
                                    <input type="text" name="fullName" class="form-control" id="inputEmail3" placeholder="Tên người gửi">
                                </div>
                            </div>    
                            <div class="form-group">
                                <div class="col-sm-2" >
                                    <label>Email(*)</label>
                                </div>
                                <div class="col-sm-10" >
                                    <input type="email" name="email" class="form-control" id="inputEmail3" placeholder="Địa chỉ Email">
                                </div>
                            </div>   
                            <div class="form-group">
                                <div class="col-sm-2" >
                                    <label>Tiêu đề(*)</label>
                                </div>
                                <div class="col-sm-10" >
                                    <input type="text" name="title" class="form-control" id="inputEmail3" placeholder="Tiêu đề">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-2" >
                                    <label>Nội dung(*)</label>
                                </div>
                                <div class="col-sm-10" >
                                    <textarea class="form-control"  name="content" rows="3" placeholder="Nội dung cần gửi"></textarea>

                                </div>
                            </div> 
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-push-8" >
                                    <button type="submit" class="btn btn-primary" name="do">Gửi</button>
                                    &nbsp;
                                    <button type="reset" class="btn btn-default">Làm lại</button>
                                </div>
                            </div>
                        </div>

                    </form>
                </div>

            </div>
        </div>

        <script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="../js/bootstrap.min.js"></script>
    </body>
</html>
