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
        <title>Thêm câu hỏi</title>
        

    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-offset-2">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3><span class="glyphicon glyphicon-th"></span>${qs.getQuestionsId() > 0 ? 'Thay đổi thông tin tài khoản' : 'Thêm mới tài khoản'}</h3>
                        </div>
                        <div class="panel-body">
                            <form class="form-horizontal" role="form" action="/DO_AN/QuizManager" method="post">
                                <!--Địa phương-->                                           
                                <div class="form-group">
                                    <div class="col-sm-2" >
                                        <label class="label label-info" style="padding: 5px;font-size:13px">Nội dung</label>
                                    </div>
                                    <div class="col-sm-10" >
                                        <textarea name="content" class="col-md-12 form-control" style="margin-top: 5px" rows="4" id="inputEmail3" placeholder="Ghi chú" >${qs.getContent()}</textarea>
                                    </div>
                                </div>    
                                <div class="form-group">
                                    <div class="col-sm-2" >
                                        <label class="label label-info" style="padding: 5px;font-size:13px">Lua chon 1</label>
                                    </div>
                                    <div class="col-sm-10" >
                                        <input type="text" name="choose1" value="${qs.getChooseA()}"  class="form-control" id="inputEmail3">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-2" >
                                        <label class="label label-info" style="padding: 5px;font-size:13px">Lua chon 2</label>
                                    </div>
                                    <div class="col-sm-10" >
                                        <input type="text" name="choose2" value="${qs.getChooseB()}"  class="form-control" id="inputEmail3">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-2" >
                                        <label class="label label-info" style="padding: 5px;font-size:13px">Lua chon 3</label>
                                    </div>
                                    <div class="col-sm-10" >
                                        <input type="text" name="choose3" value="${qs.getChooseC()}"  class="form-control" id="inputEmail3">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-2" >
                                        <label class="label label-info" style="padding: 5px;font-size:13px">Lua chon 4</label>
                                    </div>
                                    <div class="col-sm-10" >
                                        <input type="text" name="choose4" value="${qs.getChooseD()}"  class="form-control" id="inputEmail3">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-2" >
                                        <label class="label label-info" style="padding: 5px;font-size:13px">Dap an</label>
                                    </div>
                                    <div class="col-sm-10" >
                                        <input type="text" name="answer" value="${qs.getAnswer()}"  class="form-control" id="inputEmail3">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-6 col-sm-offset-2" >
                                        <input type="submit" ${qs.getQuestionsId() > 0 ? 'value="Sửa Câu Hỏi"' : 'value="Thêm Câu Hỏi"'} name="submit" class="btn btn-success"/>
                                        &nbsp;
                                        <button type="reset" class="btn btn-warning">Clear</button>
                                    </div>
                                </div>
<input type="hidden" name="quiz" value="${aa}" >
<input type="hidden" name="qsid" value="${qs.getQuestionsId()}" >
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
