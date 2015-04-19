<%-- 
    Document   : register
    Created on : Dec 25, 2014, 4:26:04 PM
    Author     : trongtanpanda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- BOOTSTRAP CORE STYLE CSS -->
        <link href="../css/bootstrap.css" rel="stylesheet" />
        <!-- FONTAWESOME STYLE CSS -->
        <link href="../css/font-awesome.min.css" rel="stylesheet" />
        <!-- CUSTOM STYLE CSS -->
        <link href="../css/style.css" rel="stylesheet" />    
        <!-- GOOGLE FONT -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    </head>
    <body>
        <div class="container">           
            <div class="row  pad-top">

                <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <strong>   Register Yourself </strong>  
                        </div>
                        <div class="panel-body">
                            <form role="form">
                                <br/>
                                <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"  ></i></span>
                                    <input type="text" class="form-control" placeholder="Your Name" />
                                </div>
                                <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-tag"  ></i></span>
                                    <input type="text" class="form-control" placeholder="Desired Username" />
                                </div>
                                <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-tag"  ></i></span>
                                    <input type="text" class="form-control" placeholder="Desired Username" />
                                </div>
                                <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-time"  ></i></span>
                                    <input type="date" name="date" value="" class="form-control" id="dp" />
                                </div>
                                
                                <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-adjust"  ></i></span>
                                    <select class="form-control" name="gender">
                                        <option value="1">Nam</option>
                                        <option value="0">Nữ</option>
                                    </select>
                                </div>
                                <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-bookmark"  ></i></span>
                                    <select class="form-control" name="clss">
                                        <option value="1">10b1</option>
                                        <option value="0">Nữ</option>
                                    </select>
                                </div>
                                <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-home"  ></i></span>
                                    <input type="text" class="form-control" placeholder="dia chi" />
                                </div>
                                <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"  ></i></span>
                                    <input type="password" class="form-control" placeholder="Enter Password" />
                                </div>
                                <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"  ></i></span>
                                    <input type="password" class="form-control" placeholder="Retype Password" />
                                </div>

                                <a href="#" class="btn btn-success ">Register Me</a>
                                <hr />
                                Already Registered ?  <a href="#" >Login here</a>
                            </form>
                        </div>

                    </div>
                </div>


            </div>
        </div>

    </body>
</html>
