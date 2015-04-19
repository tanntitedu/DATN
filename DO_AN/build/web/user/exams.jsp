
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Làm bài</title>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="../media/css/jquery.dataTables.css">	
        <style type="text/css" class="init">
        </style>
        <script type="text/javascript" language="javascript" src="../media/js/jquery.js"></script>
        <script type="text/javascript" language="javascript" src="../media/js/jquery.dataTables.js"></script>	
    </head>
    <body>
        <div class="col-lg-9 col-sm-9 col-md-9">
            <div class="panel panel-default">
                <div class="panel panel-heading">
                    <h5 style="color:#2b542c"><b>Thi || Môn Vật Lý || Đề thi: Kiểm tra 45 phút</b></h5>
                </div>
                <!---Ket qua -->
                <form style="padding-left: 15px;" class="form-horizontal" role="form" action="/DO_AN/QuizManager" method="post">
                    <!-- TÊN XÃ --> 
                    <c:forEach items="${qtList}" var="dpList" varStatus="stt">
                        <p><b>Câu: ${stt.count}</b> ${dpList.getContent()}.</p>
                        <div class="col-lg-12">
                            <div class="col-lg-6" style="margin-bottom: 5px">A:  <input type="radio" name="${stt.count}" value="${dpList.getChooseA()}">${dpList.getChooseA()}</div>
                            <div class="col-lg-6" style="margin-bottom: 5px">B:  <input type="radio" name="${stt.count}" value="${dpList.getChooseB()}">${dpList.getChooseB()}</div>
                            <div class="col-lg-6" style="margin-bottom: 5px">C:  <input type="radio" name="${stt.count}" value="${dpList.getChooseC()}">${dpList.getChooseC()}</div>
                            <div class="col-lg-6" style="margin-bottom: 5px">D:  <input type="radio" name="${stt.count}" value="${dpList.getChooseD()}">${dpList.getChooseD()}</div>
                        </div>
                        <br>
                        <br>
                        <input type="hidden" name="${stt.count}.id" value="${dpList.getQuestionsId()}" >
                        <input type="hidden" name="qid" value="${qu.getQuizId()}" >
                        <hr>
                    </c:forEach>
                    <div class="form-group">
                        <div class="col-sm-6 col-sm-offset-6" >
                            <input type="submit" value="Nộp bài" name="submit" class="btn btn-primary"/>                           
                        </div>
                    </div>
                </form>           

            </div>
        </div>
    </body>
</html>
