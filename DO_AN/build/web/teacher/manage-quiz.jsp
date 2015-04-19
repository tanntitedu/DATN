<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý đề thi</title>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>

    </head>

    <body>
        <div class="alert alert-danger" style="text-align: center"><b>QUẢN LÝ ĐỀ THI </b></div>
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel panel-heading">
                <a href="/DO_AN/QuizManager?do=add" class="btn btn-primary btn-sm" >
                    Tạo đề thi mới
                </a>               
                
            </div><!-- /.col-lg-6 -->



            <table id="abc" class="display" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th>Number</th>
                        <th>Tiêu đề</th>
                        <th>Môn học</th>
                        <th>Đóng/Mở</th>
                        <th>Xem/Khóa</th>
                        <th>Chi tiết</th>
                        <th>Sửa | Xóa</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${qList}" var="qList">
                        <tr>
                            <td>${qList.getQuizId()}</td>
                            <td>${qList.getContent()}</td>
                            <td>${qList.getDisciplines().getDiscipname()}</td>
                            <td>${qList.getActive()}</td>
                            <td>${qList.getIsview()}</td>
                            <td>
                                <a href="/DO_AN/QuizManager?do=view&qid=${qList.getQuizId()}" class="btn btn-primary btn-sm" >
                                    <span class="glyphicon glyphicon-wrench"></span>
                                </a>
                            </td>
                            <td>
                                <a href="/DO_AN/QuizManager?do=edit&qid=${qList.getQuizId()}" class="btn btn-primary btn-sm" >
                                    <span class="glyphicon glyphicon-wrench"></span>
                                </a>                            
                                <a href="/DO_AN/QuizManager?do=del&qid=${qList.getQuizId()}" onclick="return confirm('Bạn thực sự muốn xóa: ${qList.getContent()}?')" class="btn btn-primary btn-sm" role="button">
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
