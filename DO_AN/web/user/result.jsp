

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kết quả</title>
    </head>
    <body>
        <div class="col-lg-9 col-sm-9 col-md-9">
            <div class="panel panel-default">
                <div style="padding-left: 10px;" class="panel panel-heading">
                    <h4 style="color:#2b542c"><b>Kết quả thi</b></h4>
                </div>
                <div style="padding-left: 20px;">
                    <h5 style="color:#006dcc">Đề Thi:</h5>${quiz.getContent()}
                    <h5 style="color:#006dcc">Môn:</h5>${quiz.getDisciplines().getDiscipname()}
                    <hr>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Tổng số câu</th>
                                <th>Đã trả lời</th>
                                <th>Chưa trả lời</th>
                                <th>Số câu đúng</th>
                                <th>tỷ lệ</th>
                                <th>Điểm</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>${t}</td>
                                <td>${dtl}</td>
                                <td>${ctl}</td>
                                <td>${point}</td>
                                <td>${tl}</td>
                                <td>${diem}</td>
                            </tr>
                        </tbody>
                    </table>
                    <hr>
                    <a style="margin: 15px;" href="#" class="btn btn-success ">Xong</a>
                </div>
            </div>
        </div>
    </body>
</html>
