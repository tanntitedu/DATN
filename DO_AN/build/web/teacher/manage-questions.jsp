<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý câu hỏi</title>
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
            <table id="abc" class="display" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th>Number</th>
                        <th>Nội dung câu hỏi</th>
                        <th>Lựa chọn 1</th>
                        <th>Lựa chọn 2</th>
                        <th>Lựa chọn 3</th>
                        <th>Lựa chọn 4</th>
                        <th>Đáp án</th>
                        <th>Sửa | Xóa</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${qtList}" var="dpList">
                        <tr>
                            <td>${dpList.getQuestionsId()}</td>
                            <td>${dpList.getContent()}</td>
                            <td>${dpList.getChooseA()}</td>
                            <td>${dpList.getChooseB()}</td>
                            <td>${dpList.getChooseC()}</td>
                            <td>${dpList.getChooseD()}</td>
                            <td>${dpList.getAnswer()}</td>
                            <td>
                                <a href="/DO_AN/QuizManager?do=editqus&qsid=${dpList.getQuestionsId()}&qid=${qu.getQuizId()}" class="btn btn-primary btn-sm" >
                                    <span class="glyphicon glyphicon-edit"></span>
                                </a>

                                <a href="/DO_AN/QuizManager?do=del&qsid=${dpList.getQuestionsId()}&qid=${qu.getQuizId()}" onclick="return confirm('Bạn thực sự muốn xóa: ${dpList.getContent()}?')" class="btn btn-primary btn-sm" role="button">
                                    <span class="glyphicon glyphicon-trash"></span>
                                </a>   
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>          

        </div>
    </body>
</html>
