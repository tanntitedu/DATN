<%-- 
    Document   : right
    Created on : Jun 3, 2014, 4:16:59 PM
    Author     : Welcomes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Right</title>
        <link href="../css/bootstrap-theme.css" rel="stylesheet"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <link href="../css/bootstrap.css" rel="stylesheet"/>
        <link href="../css/blog.css" rel="stylesheet"/>
    </head>
    <body>
        <div class="col-lg-3 col-sm-3 col-md-3">

            <div class="panel panel-default">
                <div class="panel panel-collapse" style="background:#269abc;color:white ">
                    <h5 style="color:white"><b><span class="glyphicon glyphicon-th-list"></span>&nbsp;Thông tin</b></h5>
                </div>   
                <div class="panel panel-body">
                    ${currentUser.getUsername()}
                    ${currentUser.getLastname()}
                    ${currentUser.getBirthday()}
                    <img src="images/right/dfus.jpg" style="margin-left: 60px;"  class="img-thumbnail" alt="Cinque Terre" width="150" height="150" ><br>
                    <div class="col-lg-4">
                        <span class="label label-success">Họ tên:</span>
                        <span class="label label-info">Lớp:</span>
                        <span class="label label-primary">Khóa:</span> 
                        <span class="label label-danger">Giới tính:</span>
                        <span class="label label-warning">Ngày sinh:</span>
                    </div>
                    <div class="col-lg-8">
                        Nguyễn Trọng Tân<br>
                        12B1<br>
                        2012-2015<br>
                        Nam<br>
                        16/05/1991<br>
                    </div>
                </div>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
                <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
            </div>

            <div class="panel panel-default">
                <div class="panel panel-collapse" style="background:#269abc;color:white ">
                    <h5 style="color:white">&nbsp;<b><span class="glyphicon glyphicon-th-list"></span>&nbsp;Liên kết website</b></h5>
                </div> 
                <div class="panel-body">
                    <form role="form">
                        <br/>
                        <div class="form-group input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"  ></i></span>
                            <input type="text" class="form-control" placeholder="Your Name" />
                        </div>
                        
                        <div class="form-group input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"  ></i></span>
                            <input type="password" class="form-control" placeholder="Enter Password" />
                        </div>                        

                        <a href="#" class="btn btn-success ">Register Me</a>
                        <hr />
                        Already Registered ?  <a href="#" >Login here</a>
                    </form>
                </div>

            </div>
        </div>


        <script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="../js/bootstrap.min.js"></script>
    </body>
</html>
