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
                    <h5><span class="glyphicon glyphicon-search"></span>&nbsp; TÌM KIẾM VĂN BẢN CƠ BẢN</h5>
                </div>
                <div class="panel-body">
                    <div class="col-sm-2 col-sm-offset-10">
                        <a href="/project1/Page?p=search-nc-vb" class="label label-warning">TÌM KIẾM NÂNG CAO</a>  
                    </div>
                </div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" action="/project1/search?do=tk-vb-cb" method="post">
                        <div class="col-sm-10 col-sm-offset-1">
                            <div class="form-group">
                                <div class="col-sm-10" >
                                    <input type="text" name="tenVB" class="form-control" placeholder="Hãy nhập tên tài liệu cần tìm kiếm...">
                                </div>
                                <div class="col-sm-2" >
                                    <button type="submit" class="btn btn-primary" name="do">Tìm kiếm</button>
                                    <input type="text" name="timkiem" value="TKVBCB" hidden/>
                                </div>
                            </div>    
                        </div>
                    </form>
                </div>
                <div class="panel-body">

                    <div class="panel-body">
                        <div class="col-md-12">
                            <div class="panel-body">
                                <c:if test="${vbList != null}">
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
                                    <c:forEach items="${vbList}" var="vbList">
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
                                                <a href="/project1/search?type=vbcb&maVB=${vbList.getMaVB()}" class="panel panel-success" style="background:#28a4c9;padding: 2px">Xem thêm...</a>
                                            </div>

                                        </c:if>
                                        <c:if test="${vbList.getActive() == 0}">
                                            <p>Văn bản không tồn tại</p>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>  

                        <!--End if-->
                        <c:if test="${vbList == null && currentVB == null}">
                            <div class="col-md-12">
                                <div class="panel-body">
                                    <p>Chúc bạn một ngày tốt lành! Hãy nhập từ khóa muốn tìm kiếm</p>
                                </div>
                            </div>

                        </c:if>
                        <c:if test="${currentVB != null}">
                            <div class="panel panel-info" style="background-color: #269abc;padding: 5px;color:white">
                            Kết quả tìm kiếm
                        </div>
                        <div class="panel-body">
                            <div class="col-md-2 bg-success"style="padding:5px;font-weight:bold">Tên văn bản:</div>         
                            <div class="col-md-10 bg-info"style="padding:5px;background:">${currentVB.getTenVB()}</div>         

                            <div class="col-md-2 bg-success"style="padding:5px;font-weight:bold">Loại văn bản:</div>         
                            <div class="col-md-10 bg-info"style="padding:5px;background:">${currentVB.getLoaiVB()}</div>         

                            <div class="col-md-2 bg-success"style="padding:5px;font-weight:bold">Ngày ban hành</div>         
                            <div class="col-md-10 bg-info"style="padding:5px;background:">${currentVB.getNgayBanHanh()}</div>         

                            <div class="col-md-2 bg-success"style="padding:5px;font-weight:bold">Nơi ban hành</div>         
                            <div class="col-md-10 bg-info"style="padding:5px;background:">${currentVB.getNoiBanHanh()}</div>         

                            <div class="col-md-12 bg-primary"style="padding:5px;font-weight:bold">Nội dung</div>         
                            <div class="col-md-12 bg-info"style="padding:5px;background:"><p> ${currentVB.getNoiDung()}</p></div>         

                        </div>
                        </c:if>
                    </div>

                </div>
            </div>
        </div>



        <script src="../js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="../js/bootstrap.js" type="text/javascript"></script>
    </body>
</html>
