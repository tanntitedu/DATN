<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý người dùng</title>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        
    </head>
    
    <body>
        <div class="alert alert-danger" style="text-align: center"><b>QUẢN LÝ HỌC SINH </b></div>
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel panel-heading">
                <a href="/DO_AN/StudentManager?do=add" class="btn btn-primary btn-sm" >
                    Thêm học sinh
                </a>               
                
            </div><!-- /.col-lg-6 -->
        




        <table id="abc" class="display" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th>Number</th>
                        <th>Tên tài khoản</th>
                        <th>Họ và tên</th>                        
                        <th>Ngày sinh</th>
                        <th>Lớp</th>
                        <th>Sửa | Xóa</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${usList}" var="usList">
                        <tr>
                            <td>${usList.getUserId()}</td>
                            <td>${usList.getUsername()}</td>
                            <td>${usList.getFirstname()} ${usList.getLastname()}</td>                            
                            <td>${usList.getBirthday()}</td>
                            <td>${usList.getClss().getClssname()}</td>
                            <td><a href="/DO_AN/StudentManager?do=edit&id=${usList.getUserId()}" class="btn btn-primary btn-sm" >
                                    <span class="glyphicon glyphicon-wrench"></span>
                                </a>
                            
                                <a href="/DO_AN/StudentManager?do=del&id=${usList.getUserId()}" onclick="return confirm('Bạn thực sự muốn xóa: ${usList.getFirstname()}?')" class="btn btn-primary btn-sm" role="button">
                                    <span class="glyphicon glyphicon-trash"></span>
                                </a>                               
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>        

</div><!-- /.row -->
        <script src="../js/bootstrap.js" type="text/javascript"></script>
        <script src="../js/jquery-1.11.1.min.js" type="text/javascript"></script>
    </body>
</html>
