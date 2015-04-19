
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
        <title>${cl.getClssId() > 0 ? 'Thay đổi thông tin lớp ' : 'Thêm lớp mới'}</title>
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
                            <h3><span class="glyphicon glyphicon-user"></span>${cl.getClssId() > 0 ? 'Thay đổi thông tin lớp ' : 'Thêm lớp mới'}</h3>
                        </div>
                        <div class="panel-body">
                            <form class="form-horizontal" role="form" action="/DO_AN/ClssManager?id=${cl.getClssId()}" method="post">
                                <!-- /.Mã VB -->
                                <div class="form-group">                                    
                                    <div class="col-sm-12" >
                                        <input type="hidden" name="id" value="${cl.getClssId()}" disabled class="form-control" id="inputEmail3" placeholder="Mã Lớp">
                                    </div>
                                </div>
                                <!-- /.tên VB -->
                                <div class="form-group">
                                    <div class="col-sm-12" >
                                        <input type="text" name="clssname" value="${cl.getClssname()}" class="form-control" id="inputEmail3" placeholder="Tên Lớp">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12" >
                                        <select class="form-control" name="yearStart">
                                            <option value="${cl.getYearStart()}">${cl.getYearStart()}</option>
                                            <c:forEach var="i" begin="2009" end="2050" step="1">
                                                <option value="${i}">${i}</option>
                                            </c:forEach>
                                        </select>
                                    </div>  

                                </div>
                                <!-- /.Password -->
                                <div class="form-group">
                                    <div class="col-sm-12" >
                                        <select class="form-control" name="yearfinish">
                                            <option value="${cl.getYearfinish()}">${cl.getYearfinish()}</option>
                                            <c:forEach var="i" begin="2010" end="2050" step="1">
                                                <option value="${i}">${i}</option>
                                            </c:forEach>
                                        </select>
                                    </div>  

                                </div>
                                <!-- /.FullName -->

                                <!-- /.Email -->

                                <!-- /.Phone -->
                                <div class="form-group">
                                    <div class="col-sm-12" >
                                        <textarea name="notes" class="col-md-12 form-control" style="margin-top: 5px" rows="4" id="inputEmail3" placeholder="Ghi chú" >${cl.getNotes()}</textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12" >
                                        <input type="submit" ${cl.getClssId() > 0 ? 'value="Sửa"' : 'value="Thêm mới"'} name="submit" class="btn btn-success"/>
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
    </body>
</html>
