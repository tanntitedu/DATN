<%-- 
    Document   : seach-cb
    Created on : Jun 6, 2014, 6:04:42 PM
    Author     : Welcomes
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <div class="col-lg-8 col-sm-8 col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h5><span class="glyphicon glyphicon-search"></span>&nbsp; TÌM KIẾM ĐỊA PHƯƠNG CƠ BẢN</h5>
                </div>
                <div class="panel-body">
                    <div class="col-sm-2 col-sm-offset-10">
                        <a href="/project1/Page?p=search-nc-dp" class="label label-warning">TÌM KIẾM NÂNG CAO</a>  
                    </div>
                </div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" action="/project1/search?do=tk-dp-cb" method="post">
                        <div class="col-sm-10 col-sm-offset-1">
                            <div class="form-group">
                                <div class="col-sm-10" >
                                    <select class="form-control" name="diaphuong">
                                        <c:forEach items="${dpList}" var="dpList">
                                            <option value="${dpList.getTenDP()}">${dpList.getTenDP()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-sm-2" >
                                    <input type="submit" class="btn btn-primary" name="submit" value="Tìm Kiếm">
                                    <input type="text" name="timkiem" value="TKDPCB" hidden/>
                                </div>
                            </div>    
                        </div>
                    </form>
                </div>
                <c:if test="${dp != null}">
                    <div class="panel-body" style="background:#bdbdbe;margin:5px">

                        <div class="col-md-12">
                            <div class="panel-body">

                                <div class="col-md-12">
                                    <b class="label label-default" style="font-size:14px;text-transform: inherit">
                                        Người phụ trách:
                                    </b>
                                </div>
                                <div class="col-md-12">
                                    <div class="panel panel-group" style=" padding: 5px; min-height:40px">
                                        <c:forEach items="${nptList}" var="nptList">${nptList.getHoTen()} - ${nptList.getChucVu()} </c:forEach>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="panel-body">
                                    <div class="col-md-12">
                                        <b class="label label-default" style="font-size:14px;;text-transform: inherit">
                                            Dân số:
                                        </b>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="panel panel-group" style=" padding: 5px; min-height:40px">
                                        ${dp.getSoDan()} <i>người</i>.
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="panel-body">
                                <div class="col-md-12">
                                    <b class="label label-default" style="font-size:14px;;text-transform: inherit">
                                        Diện tích:
                                    </b>
                                </div>
                                <div class="col-md-12">
                                    <div class="panel panel-group" style=" padding: 5px; min-height:40px">
                                        ${dp.getDienTich()} <i>ha</i>.
                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="panel-body">
                                <div class="col-md-12">
                                    <b class="label label-default" style="font-size:14px;;text-transform: inherit">
                                        Nội dung tìm kiếm
                                    </b>
                                </div>
                                <br>
                                <div class="col-md-12 panel panel-default" style=" padding: 5px; min-height:40px">
                                    <!--Start-->
                                    <c:forEach items="${dptcList}" var="dptcList">
                                        <div class="col-md-3" style="font-weight: bolder">
                                            <p>
                                                ${dptcList.getTieuChi().getTenTC()}:
                                            </p>
                                        </div>
                                        <div class="col-md-9">
                                            <p>
                                                ${dptcList.getNoiDung()}

                                            </p>
                                        </div>
                                    </c:forEach>  
                                    <!--End-->

                                </div>
                            </div>
                        </div>

                    </div>
                </c:if>
            </div>

        </div>


        <script src="../js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="../js/bootstrap.js" type="text/javascript"></script>
    </body>
</html>
