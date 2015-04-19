
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông tin</title>
    </head>
    <body>
        <div class="col-lg-9 col-sm-9 col-md-9">
            <div class="panel panel-default">
                <div style="padding-left: 10px;" class="panel panel-heading">
                    <h4 style="color:#2b542c"><b>Thông tin đề thi</b></h4>
                </div>
                <div style="padding-left: 20px;">
                    <h5 style="color:#006dcc">Đề Thi:</h5>${qu.getContent()}                    
                    <hr>
                    <table class="table">
                        <thead>
                            <tr>
                                <th> Môn</th>
                                <th> Tổng Số câu</th>
                                <th> Thời gian</th>                                
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>${qu.getDisciplines().getDiscipname()}</td>
                                <td></td>
                                <td>Phút</td>                                
                            </tr>
                        </tbody>
                    </table>
                    <hr>
                    <a style="margin: 15px;" href="/DO_AN/QuizManager?do=exam&qid=${qu.getQuizId()}" class="btn btn-success ">Bắt đầu làm bài</a>
                </div>
            </div>
        </div>
    </body>
</html>
