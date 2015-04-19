
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/bootstrap-theme.min.css" rel="stylesheet"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <link href="../css/bootstrap.min.css" rel="stylesheet"/>
        <link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
        <link href="../css/jquery-ui.min.css" rel="stylesheet"/>
        <title>Thêm người dùng</title>
        <style>
            body{
                padding:70px 0px;
            }
        </style>

    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-offset-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3><span class="glyphicon glyphicon-user"></span>${us.getUserId() > 0 ? 'Thay đổi thông tin tài khoản' : 'Thêm mới tài khoản'}</h3>
                        </div>
                        <div class="panel-body">
                            <form class="form-horizontal" role="form" action="/DO_AN/UserManager?id=${us.getUserId()}" method="post">
                                <!-- /.UserName -->
                                <div class="form-group">                                    
                                    <div class="col-sm-12" >
                                        <input type="hidden" name="id" value="${us.getUserId()}" disabled class="form-control" id="inputEmail3">
                                    </div>
                                </div>
                                <!-- /.UserName -->
                                <div class="form-group">

                                    <div class="col-sm-12" >
                                        <input type="text" name="username" value="${us.getUsername()}" ${us.getUserId() > 0 ? 'disabled' : ''} class="form-control" id="inputEmail3" placeholder="Tên tài khoản">
                                    </div>
                                </div>
                                <!-- /.Password -->
                                <div class="form-group">

                                    <div class="col-sm-12" >
                                        <input type="password" name="pass" value="${us.getPassword()}" class="form-control" id="inputEmail3" placeholder="Mật khẩu">
                                    </div>
                                </div>
                                <!-- /.FullName -->
                                <div class="form-group">

                                    <div class="col-sm-12" >
                                        <input type="text" name="firstname" value="${us.getFirstname()}" class="form-control" id="inputEmail3" placeholder="Họ và tên">
                                    </div>
                                </div>
                                <!-- /.Email -->
                                <div class="form-group">

                                    <div class="col-sm-12" >
                                        <input type="text" name="lastname" value="${us.getLastname()}" class="form-control" id="inputEmail3" placeholder="Email">
                                    </div>
                                </div>
                                <div class="form-group">

                                    <div class="col-sm-12" >
                                        <input type="date" name="date" value="${us.getBirthday()}" class="form-control" id="dp" />
                                    </div>
                                </div>
                                <!-- /.Phone -->
                                <div class="form-group">
                                    <div class="col-sm-12" >
                                        <select class="form-control" name="role">
                                            <option value="${us.getRole().getRoleId()}">${us.getRole().getRolename()}</option>
                                            <c:forEach items="${rlList}" var="abList">
                                                <c:if test="${abList.getRoleId() != us.getRole().getRoleId()}">
                                                    <option value="${abList.getRoleId()}">${abList.getRolename()}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>  

                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12" >
                                        <select class="form-control" name="clss">
                                            <option value="${us.getClss().getClssId()}">${us.getClss().getClssname()}</option>
                                            <c:forEach items="${clList}" var="acList">
                                                <c:if test="${acList.getClssId() != us.getClss().getClssId()}">
                                                    <option value="${acList.getClssId()}">${acList.getClssname()}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>  
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-12" >
                                        <input type="submit" ${us.getUserId() > 0 ? 'value="Sửa"' : 'value="Thêm mới"'} name="submit" class="btn btn-success"/>
                                        &nbsp;
                                        <button type="reset" class="btn btn-warning">Clear</button>
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    <script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="../js/jquery.min.js"></script>

</body>
</html>
