<%@ page import="com.gotrip.util.SecurityUtils" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs ace-save-state" id="breadcrumbs">
            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="<c:url value='/quan-tri/trang-chu'/>">Trang chủ</a>
                </li>
            </ul><!-- /.breadcrumb -->
        </div>
        <div class="page-content">
            <div class="page-header">
                <h1>
                    Dashboard
                    <small>
                        <i class="ace-icon fa fa-angle-double-right"></i>
                        Thống kê
                    </small>
                </h1>
            </div><!-- /.page-header -->
            <div class="row">
                <div class="col-xs-12">
                    <!-- PAGE CONTENT BEGINS -->
                    <div class="alert alert-block alert-info center">
                        <%-- <button type="button" class="close" data-dismiss="alert">
                             <i class="ace-icon fa fa-times"></i>
                         </button>--%>
                        <h4>
                            <i class="ace-icon fa fa-check green"></i>
                            Xin chào
                            <strong class="green">
                                <%= SecurityUtils.getPrincipal().getFirstName() %> <%= SecurityUtils.getPrincipal().getLastName() %>
                            </strong>
                        </h4>
                        <%
                            Date dNow = new Date();
                            SimpleDateFormat ft =
                                    new SimpleDateFormat("E dd.MM.yyyy 'at' hh:mm:ss a");
                            out.print("<h5>" + ft.format(dNow) + "</h5>");
                        %>
                    </div>

                    <div class="row">
                        <div class="space-6"></div>
                        <div class="col-sm-3"></div>
                        <div class="col-sm-7">
                            <div class="col-sm-12 infobox-container">
                                <div class="infobox infobox-green">
                                    <div class="infobox-icon">
                                        <i class="ace-icon fa fa-comments"></i>
                                    </div>

                                    <div class="infobox-data">
                                        <span class="infobox-data-number">${totalPost}</span>
                                        <div class="infobox-content">bài viết</div>
                                    </div>

                                    <div class="stat stat-success">8%</div>
                                </div>

                                <div class="infobox infobox-blue">
                                    <div class="infobox-icon">
                                        <i class="ace-icon fa fa-twitter"></i>
                                    </div>

                                    <div class="infobox-data">
                                        <span class="infobox-data-number">${totalUser}</span>
                                        <div class="infobox-content">thành viên mới</div>
                                    </div>

                                    <div class="badge badge-success">
                                        +32%
                                        <i class="ace-icon fa fa-arrow-up"></i>
                                    </div>
                                </div>

                                <div class="infobox infobox-pink">
                                    <div class="infobox-icon">
                                        <i class="ace-icon fa fa-shopping-cart"></i>
                                    </div>

                                    <div class="infobox-data">
                                        <span class="infobox-data-number">${totalTour}</span>
                                        <div class="infobox-content">tour</div>
                                    </div>
                                    <div class="stat stat-important">4%</div>
                                </div>

                                <div class="infobox infobox-red">
                                    <div class="infobox-icon">
                                        <i class="ace-icon fa fa-flask"></i>
                                    </div>

                                    <div class="infobox-data">
                                        <span class="infobox-data-number">${totalTrip}</span>
                                        <div class="infobox-content">chuyến đi</div>
                                    </div>
                                </div>

                                <div class="infobox infobox-orange2">
                                    <div class="infobox-chart">
                                        <span class="sparkline" data-values="196,128,202,177,154,94,100,170,224"><canvas
                                                width="44" height="33"
                                                style="display: inline-block; width: 44px; height: 33px; vertical-align: top;"></canvas></span>
                                    </div>

                                    <div class="infobox-data">
                                        <span class="infobox-data-number">6,251</span>
                                        <div class="infobox-content">lượt xem</div>
                                    </div>

                                    <div class="badge badge-success">
                                        7.2%
                                        <i class="ace-icon fa fa-arrow-up"></i>
                                    </div>
                                </div>

                                <div class="infobox infobox-blue2">
                                    <div class="infobox-progress">
                                        <div class="easy-pie-chart percentage" data-percent="42" data-size="46"
                                             style="height: 46px; width: 46px; line-height: 45px;">
                                            <span class="percent">42</span>%
                                            <canvas height="57" width="57" style="height: 46px; width: 46px;"></canvas>
                                        </div>
                                    </div>

                                    <div class="infobox-data">
                                        <span class="infobox-text">chọn đặt tour</span>

<%--                                        <div class="infobox-content">--%>
<%--                                            <span class="bigger-110">~</span>--%>
<%--                                            58GB remaining--%>
<%--                                        </div>--%>
                                    </div>
                                </div>

                                <div class="space-6"></div>

                                <div class="infobox infobox-green infobox-small infobox-dark">
                                    <div class="infobox-progress">
                                        <div class="easy-pie-chart percentage" data-percent="61" data-size="39"
                                             style="height: 39px; width: 39px; line-height: 38px;">
                                            <span class="percent">35</span>
                                            <canvas height="48" width="48" style="height: 39px; width: 39px;"></canvas>
                                        </div>
                                    </div>

                                    <div class="infobox-data">
                                        <div class="infobox-content">Vé</div>
                                        <div class="infobox-content">Được đặt</div>
                                    </div>
                                </div>

                                <div class="infobox infobox-blue infobox-small infobox-dark">
                                    <div class="infobox-chart">
                                        <span class="sparkline" data-values="3,4,2,3,4,4,2,2"><canvas width="50"
                                                                                                      height="19"
                                                                                                      style="display: inline-block; width: 39px; height: 19px; vertical-align: top;"></canvas></span>
                                    </div>

                                    <div class="infobox-data">
                                        <div class="infobox-content">$$</div>
                                        <div class="infobox-content">128.355.000đ</div>
                                    </div>
                                </div>

                                <div class="infobox infobox-grey infobox-small infobox-dark">
                                    <div class="infobox-icon">
                                        <i class="ace-icon fa fa-download"></i>
                                    </div>

                                    <div class="infobox-data">
                                        <div class="infobox-content">137</div>
                                        <div class="infobox-content">KH</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!-- /.row -->

                </div><!-- /.col -->
            </div><!-- /.row -->
        </div>
    </div>
</div><!-- main content -->
</body>
</html>