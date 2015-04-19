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
        <title>Thêm đề thi</title>
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
                            <h3><span class="glyphicon glyphicon-user"></span>${qu.getQuizId() > 0 ? 'Thay đổi thông tin tài khoản' : 'Thêm mới tài khoản'}</h3>
                        </div>
                        <div class="panel-body">
                            <form class="form-horizontal" role="form" action="/DO_AN/QuizManager?qid=${qu.getQuizId()}" method="post">
                                <!-- /.UserName -->
                                <div class="form-group">                                    
                                    <div class="col-sm-12" >
                                        <input type="text" name="id" value="${qu.getQuizId()}" disabled class="form-control" id="inputEmail3">
                                    </div>
                                </div>
                                <!-- /.UserName -->
                                <div class="form-group">
                                    <div class="col-sm-12" >
                                        <textarea name="content" class="col-md-12 form-control" style="margin-top: 5px" rows="4" id="inputEmail3" placeholder="Ghi chú" >${qu.getContent()}</textarea>
                                    </div>
                                </div>
                                <!-- /.Password -->
                               
                                <!-- /.Phone -->
                               
                                <div class="form-group">
                                    <div class="col-sm-12" >
                                        <select class="form-control" name="discip">
                                            <option value="${qu.getDisciplines().getDisciplinesId()}">${qu.getDisciplines().getDiscipname()}</option>
                                            <c:forEach items="${ddList}" var="dList">
                                                <c:if test="${dList.getDisciplinesId() != qu.getDisciplines().getDisciplinesId()}">
                                                    <option value="${dList.getDisciplinesId()}">${dList.getDiscipname()}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>  
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-12" >
                                        <input type="submit" ${qu.getQuizId() > 0 ? 'value="Sửa"' : 'value="Thêm mới"'} name="submit" class="btn btn-success"/>
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
