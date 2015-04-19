<%-- 
    Document   : manage-users
    Created on : Jun 9, 2014, 10:20:07 AM
    Author     : Welcomes
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script>
            $(Document).ready(function() {
                $('#myTable').DataTable();
            });
        </script>
    </head>
    <body>
        <div class="alert alert-danger" style="text-align: center"><b>QUẢN LÝ TÀI KHOẢN NGƯỜI SỬ DỤNG </b></div>
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">
                <a href="/DO_AN/UserManager?do=add" class="btn btn-primary btn-sm" >
                    Tạo mới tài khoản
                </a>               
                
            </div><!-- /.col-lg-6 -->




            <table id="abc" class="display" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th>Number</th>
                        <th>Tên tài khoản</th>
                        <th>Họ và tên</th>
                        <th>Loại tài khoản</th>
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
                            <td>${usList.getRole().getRolename()}</td>
                            <td>${usList.getBirthday()}</td>
                            <td>${usList.getClss().getClssname()}</td>
                            <td><a href="/DO_AN/UserManager?do=edit&id=${usList.getUserId()}" class="btn btn-primary btn-sm" >
                                    <span class="glyphicon glyphicon-wrench"></span>
                                </a>
                            
                                <a href="/DO_AN/UserManager?do=del&id=${usList.getUserId()}" onclick="return confirm('Bạn thực sự muốn xóa: ${usList.getFirstname()}?')" class="btn btn-primary btn-sm" role="button">
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
