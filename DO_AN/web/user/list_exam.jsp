
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh sách đề thi</title>
    </head>
    <body>
        <div class="col-lg-9 col-sm-9 col-md-9">
            <div class="panel panel-default">
                <div class="panel panel-heading">
                    <h5 style="color:#2b542c"><b>QUY HOẠCH NÔNG THÔN MỚI</b></h5>
                </div>   
                <table id="abc" class="display" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>Number</th>
                            <th>Tiêu đề</th>
                            <th>Môn học</th>
                            <th>Đóng/Mở</th>
                            <th>Xem/Khóa</th>
                            <th>Chi tiết</th>
                            
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
                                <a href="/DO_AN/QuizManager?do=infor&qid=${qList.getQuizId()}" class="btn btn-primary btn-sm" >
                                    <span class="glyphicon glyphicon-wrench"></span>
                                </a>
                            </td>
                            
                        </tr>
                    </c:forEach>
                    </tbody>
                </table> 
            </div>            
        </div>
    </body>
</html>
