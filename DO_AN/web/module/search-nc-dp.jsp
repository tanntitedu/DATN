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
                    <h5><span class="glyphicon glyphicon-search"></span>&nbsp; TÌM KIẾM ĐỊA PHƯƠNG NÂNG CAO</h5>
                </div>
                <div class="panel-body">
                    <div class="col-sm-3 col-sm-offset-10">
                        <a href="/project1/Page?p=search-cb-dp" class="label label-primary">TÌM KIẾM CƠ BẢN</a>  
                    </div>
                </div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" action="/project1/search?do=tk-dp-nc" method="post">
                        <div class="col-sm-9 col-sm-offset-1">

                            <div class="form-group">
                                <div class="col-sm-3" >
                                    <label class="label label-info">
                                        Địa phương(*)
                                    </label> 
                                </div>
                                <div class="col-sm-9" >
                                    <input type="text" class="form-control" name="diaPhuong"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-3" >
                                    <label class="label label-info">
                                        Người phụ trách(*)
                                    </label> 
                                </div>
                                <div class="col-sm-9" >
                                    <input type="text" class="form-control" name="nguoiPhuTrach"/>
                                </div>
                            </div>  
                            <div class="form-group">
                                <div class="col-sm-3" >
                                    <label class="label label-info">
                                        Tên tiêu chí(*)
                                    </label> 
                                </div>
                                <div class="col-sm-9" >
                                    <input type="text" class="form-control" name="tieuChi"/>
                                </div>
                            </div>  

                            <div class="form-group">
                                <div class="col-sm-3 col-sm-offset-10" >
                                    <button type="submit" class="btn btn-success" name="do">Tìm kiếm</button>

                                </div>    
                            </div>

                        </div>

                    </form>
                </div>
                <div class="panel-body">
                    <!--                    Kết Quả In ra ở đây-->

                    <c:if test="${dptc == null && dp == null && nptList==null && tcList == null && dptcAllList == null}">
                        <p>No results</p>
                    </c:if>

                    <c:if test="${!(dptc == null && dp == null && nptList==null && tcList && dptcAllList == null)}">
                        <div class="panel panel-info" style="background-color: #269abc;padding: 5px;color:white">
                            Kết quả tìm kiếm
                        </div>
                    </c:if>
                    <c:if test="${dp != null && dptcList == null}">
                        <div class="col-md-3 panel panel-primary">Tên địa phương: </div>
                        <div class="col-md-12 panel panel-primary"><p>${dp.getTenDP()}</p></div>
                                <c:forEach items="${dp.getNptList()}" var="npt">
                            <div class="col-md-3 panel panel-primary">Mã người phụ trách</div>
                            <div class="col-md-9 panel panel-primary">${npt.getMaNPT()}</div>
                            <div class="col-md-3 panel panel-primary">Họ tên</div>
                            <div class="col-md-9 panel panel-primary">${npt.getHoTen()}</div>
                            <div class="col-md-3 panel panel-primary">Chức vụ</div>
                            <div class="col-md-9 panel panel-primary">${npt.getChucVu()}</div>
                            <div class="col-md-3 panel panel-primary">Học vị</div>
                            <div class="col-md-9 panel panel-primary">${npt.getHocVi()}</div>
                        </c:forEach>
                        <c:forEach items="${tcList}" var="tcList">
                            <div class="col-md-3 panel panel-primary"> ${tcList.getTieuChi().getTenTC()}</div>
                            <div class="col-md-12 panel panel-primary"><p>${tcList.getNoiDung()}</p></div>
                                </c:forEach>
                            </c:if>
                            <c:if test="${nptList != null}">
                                <c:forEach items="${nptList}" var="npt">
                            <div class="col-md-3 panel panel-primary">Mã người phụ trách</div>
                            <div class="col-md-9 panel panel-primary">${npt.getMaNPT()}</div>
                            <div class="col-md-3 panel panel-primary">Họ tên</div>
                            <div class="col-md-9 panel panel-primary">${npt.getHoTen()}</div>
                            <div class="col-md-3 panel panel-primary">Chức vụ</div>
                            <div class="col-md-9 panel panel-primary">${npt.getChucVu()}</div>
                            <div class="col-md-3 panel panel-primary">Học vị</div>
                            <div class="col-md-9 panel panel-primary">${npt.getHocVi()}</div>
                            <div class="col-md-3 panel panel-primary">Phụ trách xã</div>
                            <div class="col-md-9 panel panel-primary">${npt.getDiaPhuong().getTenDP()}</div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${dptc != null}">
                        <div class="col-md-3 panel panel-primary"> ${dptc.getTieuChi().getTenTC()}</div>
                        <div class="col-md-12 panel panel-primary"><p>${dptc.getNoiDung()}</p></div>
                    </c:if>
                    <c:if test="${dptc == null && dp == null && nptList==null && tcList == null && dptcAllList != null}">   
                        <c:forEach items="${dptcAllList}" var="dptcAllList">
                            <div class="col-md-3 panel panel-primary"> ${dptcAllList.getDiaPhuong().getTenDP()}</div>
                            <div class="col-md-12 panel panel-primary"><p>${dptcAllList.getNoiDung()}</p></div>
                        </c:forEach>
                    </c:if>
                </div>

            </div>
        </div>


        <script src="../js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="../js/bootstrap.js" type="text/javascript"></script>
    </body>
</html>
