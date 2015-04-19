
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
                    <h5 style="color:#2b542c"><b>Danh sách đề thi</b></h5>
                </div>   
                <table class="table">
                    <thead>
                        <tr>
                            <th>Stt</th>
                            <th>Tiêu đề</th>
                            <th>Môn học</th>
                            <th>Thời gian(phút)</th>
                            <th>Số câu</th>
                            <th>Xem</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${qList}" var="qList">
                        <tr>
                            <td>${qList.getQuizId()}</td>
                            <td>${qList.getContent()}</td>
                            <td>${qList.getDisciplines().getDiscipname()}</td>
                            <td>${qList.getTime()}</td>
                            <td>${qList.getTotalques()}</td>
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
