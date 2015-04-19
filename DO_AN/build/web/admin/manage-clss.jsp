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
    </head>
    <body>
        <div class="alert alert-danger" style="text-align: center"><b>QUẢN LÝ LỚP </b></div>
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">
                <a href="/DO_AN/ClssManager?do=add" class="btn btn-primary btn-sm" >
                    Tạo lớp mới.
                </a>               
                
            </div>
            <table id="abc" class="display" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th>Number</th>
                        <th>Tên Lớp</th>
                        <th>Năm Bắt Đầu</th>
                        <th>Năm Kết Thúc</th>
                        <th>Ghi chú</th>
                        <th>Sửa | Xóa</th>                        
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${clList}" var="clList">
                        <tr>
                            <td>${clList.getClssId()}</td>
                            <td>${clList.getClssname()}</td>
                            <td>${clList.getYearStart()}</td>
                            <td>${clList.getYearfinish()}</td>
                            <td>${clList.getNotes()}</td>
                            <td>
                                <a href="/DO_AN/ClssManager?do=edit&id=${clList.getClssId()}" class="btn btn-primary btn-sm" >
                                    <span class="glyphicon glyphicon-wrench"></span>
                                </a>
                            
                                <a href="/DO_AN/ClssManager?do=del&id=${clList.getClssId()}" onclick="return confirm('Bạn thực sự muốn xóa: ?')" class="btn btn-primary btn-sm" role="button">
                                    <span class="glyphicon glyphicon-trash"></span>
                                </a>
                            </td>                            
                        </tr>
                    </c:forEach>
                </tbody>
            </table>         


            <script src="../js/bootstrap.js" type="text/javascript"></script>
            <script src="../js/jquery-1.11.1.min.js" type="text/javascript"></script>

        </div>

    </body>
</html>
