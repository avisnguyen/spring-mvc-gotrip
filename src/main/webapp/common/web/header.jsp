<%@ page import="com.gotrip.util.SecurityUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<header id="header" class="header" style="background-color: rgb(255, 255, 255);">
    <div class="container-fruid top-header navbar-fixed-top">
        <div class="container">
            <div class="row">
                <div class="col-md-6 no-padding">
                    <ul>
                        <li>
                            <a href="mailto:info@gotrip.vn">
                                info@gotrip.com
                            </a>
                        </li>
                        <li>
                            <a class="ticket-hotline" href="tel:1900 1808">
                                Hotline: 1900 1234
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="col-md-6">
                    <ul id="w0" class="login-container">
                        <li>
                            <a href="javascript:void(0)" onclick="javascript:$('#region').modal('show')" class="login-href">Chọn điểm khởi hành</a>
                        </li>
                        <security:authorize access="isAnonymous()">
                        <li>
                            <a href="<c:url value='/dang-nhap'/> ">
                                Đăng nhập
                            </a>
                        </li>
                        </security:authorize>
                        <security:authorize access="isAuthenticated()">
                        <li>
                            <a class="login-href">
                                Xin chào, <%= SecurityUtils.getPrincipal().getFirstName() %>
                            </a>
                        </li>
                            <security:authorize access="hasRole('ADMIN')">
                                <li>
                                    <a class="login-href" href="<c:url value='/quan-tri/trang-chu'/> ">
                                        Trang quản trị
                                    </a>
                                </li>
                            </security:authorize>
                        <li>
                            <a href="<c:url value='/thoat'/> " >Đăng xuất</a>
                        </li>
                        </security:authorize>
                    </ul>
                </div>
            </div>
        </div>
    </div>
   <%-- <div class="container">
        <nav class="navbar navbar-default navbar-main navbar-fixed-top" role="navigation">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="<c:url value='/trang-chu'/> "></a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown searchBox search">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="searchIcon"><i
                                    class="fa fa-search" aria-hidden="true"></i></span></a>
                            <ul class="dropdown-menu dropdown-menu-right">
                                <li>
                                    <form id="searchFormLayoutMobile" method="get" role="form" class="form-search-layout-mobile" action="/tim-kiem-tour">
                                        <div class="serch-box-layout-input-mobile">
                                            <input onkeypress="return checkSubmitSearchLayoutMobile(event)" type="text" name="search" class="input-search-kiritm" id="inputSearchLayoutMobile" autocomplete="off" placeholder="Tìm kiếm..." aria-describedby="basic-addon2">
                                            <i class="fa fa-search fa-kiritm" id="basic-addon2" onclick="javascript:$(this).parents('form').submit()"></i>
                                        </div>
                                        <div id="contentSearchLayoutMobile" class="content-search-layout-mobile hidden-cls">
                                            <div id="fromDateSearchBoxLayoutMobile" class="input-group date filterDate ed-datepicker">
                                                <input type="text" class="form-control " name="from" autocomplete="off" placeholder="Từ ngày (DD/MM/YYYY)" value="">
                                                <div class="input-group-addon">
                                                </div>
                                            </div>

                                            <div id="toDateSearchBoxLayoutMobile" class="input-group date ed-datepicker filterDate">
                                                <input type="text" class="form-control" name="to" autocomplete="off" placeholder="Đến ngày (DD/MM/YYYY)" value="">
                                                <div class="input-group-addon">
                                                    <span class=""></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mark-close hidden-cls" id="markcloseLayoutMobile"></div>
                                    </form>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown singleDrop">
                            <a href="<c:url value='/trang-chu'/> ">
                                TRANG CHỦ
                            </a>
                        </li>
                        <li class="dropdown megaDropMenu">
                            <a href="<c:url value='/tour-trong-nuoc'/>" class="dropdown" data-hover="dropdown" data-delay="300" data-close-others="true" aria-expanded="false">
                                DANH MỤC TOUR
                            </a>
                            <ul class="row dropdown-menu">
                                <li class="col-sm-4 col-xs-12">
                                    <ul class="list-unstyled">
                                        <li>Miền Bắc</li>
                                        <li>
                                            <a href="#">
                                                Hà Nội
                                            </a></li>
                                        <li>
                                            <a href="#">
                                                Hạ Long
                                            </a></li>
                                        <li>
                                            <a href="#">
                                                Sapa
                                            </a></li>
                                        <li>
                                            <a href="#">
                                                Ninh Bình
                                            </a></li>
                                    </ul>
                                </li>
                                <li class="col-sm-4 col-xs-12">
                                    <ul class="list-unstyled">
                                        <li>Miền Trung</li>
                                        <li>
                                            <a href="#">
                                                Phan Thiết
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                Nha Trang
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                Đà Lạt
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                Tây Nguyên
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                Tuy Hoà - Quy Nhơn - Quảng Ngãi
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                Huế - Quảng Bình
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                Nghệ An
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="col-sm-4 col-xs-12">
                                    <ul class="list-unstyled">
                                        <li>Miền Nam</li>
                                        <li>
                                            <a href="#">
                                                Phú Quốc
                                            </a></li>
                                        <li>
                                            <a href="#">
                                                Miền Tây
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                Côn Đảo
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                Hồ Tràm - Vũng Tàu
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                Tour Tp. Hồ Chí Minh
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown singleDrop">
                            <a href="<c:url value='/blog?page=1&limit=8'/>" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">BLOG</a>
                        </li>
                        <li class="dropdown singleDrop">
                            <a href="#">LIÊN HỆ</a>
                        </li>
                        <li class="dropdown searchBox searchBoxLayout">
                            <a href="#" class="dropdown-toggle" id="buttonSearchLayout"><span class="searchIcon"><i
                                    class="fa fa-search" aria-hidden="true"></i></span></a>
                            <div id="contentSearchboxlayout" class="contentSearchboxlayout hidden-cls">
                                <form id="searchFormKiritmLayout" method="get" role="form" action="/tim-kiem-tour">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="serch-box-layout-input">
                                                <input onkeypress="return checkSubmitSearchLayout(event)" type="text" name="search" class="input-search-kiritm" id="inputSearchLayout" autocomplete="off" placeholder="Tìm kiếm..." aria-describedby="basic-addon2">
                                                <i class="fa fa-search fa-kiritm" id="#" onclick="javascript:$(this).parents('form').submit()"></i>
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="input-group date filterDate ed-datepicker">
                                                <input type="text" class="form-control " name="from" autocomplete="off" id="fromDateSearchBoxLayout" placeholder="Từ ngày (DD/MM/YYYY)" value="">
                                                <div class="input-group-addon">
                                                    <span class="fa fa-calendar"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="input-group date ed-datepicker filterDate">
                                                <input type="text" class="form-control" name="to" id="toDateSearchBoxLayout" autocomplete="off" placeholder="Đến ngày (DD/MM/YYYY)" value="">
                                                <div class="input-group-addon">
                                                    <span class="fa fa-calendar"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </form>
                            </div>
                            <div class="mark-close hidden-cls" id="markcloseLayout"></div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>--%>
</header>