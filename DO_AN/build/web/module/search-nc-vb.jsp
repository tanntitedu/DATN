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
                    <h5><span class="glyphicon glyphicon-search"></span>&nbsp; TÌM KIẾM VĂN BẢN NÂNG CAO</h5>
                </div>
                <div class="panel-body">
                    <div class="col-sm-2 col-sm-offset-10">
                        <a href="/project1/Page?p=search-cb-vb" class="label label-primary">TÌM KIẾM CƠ BẢN</a>  
                    </div>
                </div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" action="/project1/search?do=tk-vb-nc" method="post">
                        <div class="col-sm-10 col-sm-offset-1">
                            <div class="form-group">
                                <div class="col-sm-2" >
                                    <label class="label label-info">
                                        Tên tài liệu
                                    </label> 
                                </div>
                                <div class="col-sm-10" >
                                    <input type="text" name="tenVB" class="form-control" placeholder="">
                                </div>
                            </div>    
                            <div class="form-group">
                                <div class="col-sm-2" >
                                    <label class="label label-info">
                                        Loại
                                    </label> 
                                </div>
                                <div class="col-sm-10" >
                                    <input type="text" name="loaiVB" class="form-control" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-2" >
                                    <label class="label label-info">
                                        Nơi ban hành
                                    </label> 
                                </div>
                                <div class="col-sm-10" >
                                    <input type="text" name="noiBanHanh" class="form-control" placeholder="">
                                </div>
                            </div>  
                            <div class="form-group">
                                <div class="col-sm-2" >
                                    <label class="label label-info">
                                        Ngày ban hành
                                    </label> 
                                </div>
                                <div class="col-sm-10" >
                                    <input type="text" name="ngayBanHanh" class="form-control" placeholder="">
                                </div>
                            </div>  
                            <div class="form-group">
                                <div class="col-sm-2" >
                                    <label class="label label-info">
                                        Nơi nhận
                                    </label> 
                                </div>
                                <div class="col-sm-10" >
                                    <input type="text" name="noiNhan" class="form-control" placeholder="">
                                </div>
                            </div> 
                            <div class="form-group">
                                <div class="col-sm-2 col-sm-offset-10" >
                                    <button type="submit" class="btn btn-success" name="do">Tìm kiếm</button>

                                </div>    
                            </div>

                        </div>

                    </form>
                </div>
                <div class="panel-body">
                    <!--Kết Quả In ra ở đây-->
                    <div class="panel-body" style="margin:5px">
                        <div class="col-md-12">
                            <div class="panel-body">
                                <c:if test="${vbListNC != null}">
                                    <!--Ma Van Ban-->
                                    <div class="col-md-12" style="background:#28a4c9;font-size:20px">
                                        <div class="col-md-1">
                                            <b  style="font-size:12px;text-transform: uppercase">
                                                Mã 
                                            </b>
                                        </div>
                                        <div class="col-md-2">
                                            <b  style="font-size:12px;text-transform: uppercase">
                                                Ngày ban hành
                                            </b>
                                        </div>
                                        <div class="col-md-2">
                                            <b  style="font-size:12px;text-transform: uppercase">
                                                Loại văn bản
                                            </b>
                                        </div>
                                        <div class="col-md-3">
                                            <b  style="font-size:12px;text-transform: uppercase">
                                                Tên văn bản
                                            </b>
                                        </div>
                                        <div class="col-md-2">
                                            <b  style="font-size:12px;text-transform: uppercase">
                                                Nơi ban hành
                                            </b> 
                                        </div>
                                        <div class="col-md-2">
                                            <b  style="font-size:12px;text-transform: uppercase">
                                                Nơi Nhận
                                            </b>
                                        </div>

                                    </div>
                                    <div class="col-md-12" style="background:#28a4c9;font-size:20px">

                                    </div>

                                    <c:forEach items="${vbListNC}" var="vbList">
                                        <c:if test="${vbList.getActive() == 1}">
                                            <div class="col-md-1">
                                                <b  style="font-size:12px;text-transform: inherit">
                                                    ${vbList.getMaVB()}
                                                </b>
                                            </div>
                                            <div class="col-md-2">
                                                <b  style="font-size:12px;text-transform: inherit">
                                                    ${vbList.getNgayBanHanh()}
                                                </b>
                                            </div>
                                            <div class="col-md-2">
                                                <b  style="font-size:12px;text-transform: inherit">
                                                    ${vbList.getLoaiVB()}
                                                </b>
                                            </div>
                                            <div class="col-md-3">
                                                <b  style="font-size:12px;text-transform: inherit">
                                                    ${vbList.getTenVB()}
                                                </b>
                                            </div>
                                            <div class="col-md-2">
                                                <b  style="font-size:12px;text-transform: inherit">
                                                    ${vbList.getNoiBanHanh()}
                                                </b>
                                            </div>
                                            <div class="col-md-2">
                                                <b  style="font-size:12px;text-transform: inherit">
                                                    ${vbList.getNoiNhan()}
                                                </b>
                                            </div>

                                            <div class="col-md-2 col-md-offset-10">
                                                <a href="/project1/search?type=vbnc&maVB=${vbList.getMaVB()}" class="panel panel-success" style="background:#28a4c9;padding: 2px">Xem thêm...</a>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <c:if test="${vbList == null && currentVB == null}">
                        <div class="col-md-12">
                            <div class="panel panel-group" style="">

                            </div>
                        </div>
                    </c:if>

                    <c:if test="${currentVB != null}">
                        <div class="panel panel-info" style="background-color: #269abc;padding: 5px;color:white">
                            Kết quả tìm kiếm
                        </div>
                        <div class="panel-body">
                            <div class="col-md-2 bg-success" style="padding:5px;font-weight:bold">Tên văn bản:</div>         
                            <div class="col-md-10 bg-info" style="padding:5px;background:">${currentVB.getTenVB()}</div>         

                            <div class="col-md-2 bg-success" style="padding:5px;font-weight:bold">Loại văn bản:</div>         
                            <div class="col-md-10 bg-info" style="padding:5px;background:">${currentVB.getLoaiVB()}</div>         

                            <div class="col-md-2 bg-success" style="padding:5px;font-weight:bold">Ngày ban hành</div>         
                            <div class="col-md-10 bg-info" style="padding:5px;background:">${currentVB.getNgayBanHanh()}</div>         

                            <div class="col-md-2 bg-success" style="padding:5px;font-weight:bold">Nơi ban hành</div>         
                            <div class="col-md-10 bg-info" style="padding:5px;background:">${currentVB.getNoiBanHanh()}</div>         

                            <div class="col-md-12 bg-primary" style="padding:5px;font-weight:bold">Nội dung</div>         
                            <div class="col-md-12 bg-info" style="padding:5px;background:"><p> ${currentVB.getNoiDung()}</p></div>         

                        </div>
                    </c:if>
                </div>

            </div>
        </div>


        <script src="../js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="../js/bootstrap.js" type="text/javascript"></script>
    </body>
</html>
