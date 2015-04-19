<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="../media/css/jquery.dataTables.css">	
        <style type="text/css" class="init">
        </style>
        <script type="text/javascript" language="javascript" src="../media/js/jquery.js"></script>
        <script type="text/javascript" language="javascript" src="../media/js/jquery.dataTables.js"></script>	
        <script type="text/javascript" language="javascript" class="init">
            $(document).ready(function() {
                $('#example').DataTable({
                    dom: 'T<"clear">lfrtip'
                });
            });
        </script>
    </head>
    <body>
        <div class="alert alert-info" style="text-align: center"><b>Đề Thi: ${qu.getContent()} </b></div>
        <div class="panel panel-default">
            <!-- Default panel contents -->

            <div class="panel panel-heading">
                <a href="/DO_AN/QuizManager?do=addqus&qid=${qu.getQuizId()}" class="btn btn-primary btn-sm" >
                    Thêm câu hỏi
                </a>               

            </div><!-- /.col-lg-6 -->

            <!---Ket qua -->
            <form class="form-horizontal" role="form" action="/DO_AN/QuizManager" method="post">
                <!-- TÊN XÃ --> 
                <c:forEach items="${qtList}" var="dpList" varStatus="stt">
                    <p><b>Câu: ${stt.count}</b> IE8 supports the outline properties only if a !DOCTYPE is specified.</p>
                    <input type="hidden" name="${stt.index}.id" value="${dpList.getQuestionsId()}" >
                    <input type="hidden" name="qid" value="${qu.getQuizId()}" >
                    A:  <input type="radio" name="${stt.index}" value="${dpList.getChooseA()}">${dpList.getChooseA()} <br>
                    B:  <input type="radio" name="${stt.index}" value="${dpList.getChooseB()}">${dpList.getChooseB()}<br>
                    C:  <input type="radio" name="${stt.index}" value="${dpList.getChooseC()}">${dpList.getChooseC()}<br>
                    D:  <input type="radio" name="${stt.index}" value="${dpList.getChooseD()}">${dpList.getChooseD()} <br>
                    ${stt.index}
                   <input type="hidden" name="1.id" value="${dpList.getQuestionsId()}" >
                    D:  <input type="radio" name="1" value="${dpList.getChooseD()}">${dpList.getChooseD()} <br>
                </c:forEach>
                    <div class="form-group">
                        <div class="col-sm-6 col-sm-offset-6" >
                            <input type="submit" value="Nộp bài" name="submit" class="btn btn-primary"/>
                            &nbsp;
                            <button type="reset" class="btn btn-warning">Clear</button>
                        </div>
                    </div>
            </form>           

        </div>
    </body>
</html>
