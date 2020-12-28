<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Tour trong nước</title>
</head>
<body>
<div class="header">
    <div class="container">
        <nav class="navbar navbar-default navbar-main navbar-fixed-top" role="navigation">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse"
                            data-target=".navbar-ex1-collapse">
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
                        <li class="dropdown singleDrop">
                            <a href="<c:url value='/trang-chu'/> ">
                                TRANG CHỦ
                            </a>
                        </li>
                        <li class="dropdown megaDropMenu">
                            <a href="<c:url value='/tour?page=1&limit=5'/>" class="dropdown" data-hover="dropdown"
                               data-delay="300" data-close-others="true" aria-expanded="false">
                                DANH MỤC TOUR
                            </a>
                            <ul class="row dropdown-menu">
                                <li class="col-sm-4 col-xs-12">
                                    <ul class="list-unstyled">
                                        <li>Miền Bắc</li>
                                        <c:forEach var="item" items="${MB}">
                                            <li>
                                                <a href="<c:url value="/tour/dia-danh?placeId=${item.id}&page=1&limit=5"/>">
                                                        ${item.name}
                                                </a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </li>
                                <li class="col-sm-4 col-xs-12">
                                    <ul class="list-unstyled">
                                        <li>Miền Trung</li>
                                        <c:forEach var="item" items="${MT}">
                                            <li>
                                                <a href="<c:url value="/tour/dia-danh?placeId=${item.id}&page=1&limit=5"/>">
                                                        ${item.name}
                                                </a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </li>
                                <li class="col-sm-4 col-xs-12">
                                    <ul class="list-unstyled">
                                        <li>Miền Nam</li>
                                        <c:forEach var="item" items="${MN}">
                                            <li>
                                                <a href="<c:url value="/tour/dia-danh?placeId=${item.id}&page=1&limit=5"/>">
                                                        ${item.name}
                                                </a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown singleDrop">
                            <a href="<c:url value='/blog?page=1&limit=8'/>" class="dropdown-toggle"
                               data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">BLOG</a>
                        </li>
                        <li class="dropdown singleDrop">
                            <a href="#">LIÊN HỆ</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</div>
<div class="modal fade modal-login modal-border-transparent" id="loginModal" tabindex="-1" role="dialog"
     aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <button type="button" class="btn btn-close close" data-dismiss="modal" aria-label="Close">
                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
            </button>
            <div class="clear"></div>
            <div id="modal-login-form-wrapper">
            </div>
        </div>
    </div>
</div>
<form action='<c:url value="/tour/tim-kiem-tour"/> ' id="formSubmit" method="get">
    <div class="main-wrapper">
        <!-- PAGE TITLE -->
        <section>
            <div class="pageTitle page-image-tour-tag" style="background-image:url(<c:url value="/template/web/image/${model.listResult[0].tour.thumbnailUrl}"/>)">
            </div>
        </section>
        <section>
            <div class="container" style="position: relative">
                <div class="background-description">
                    <h1 class="tour-banner-title">Kết quả tìm kiếm cho "${keyword}"</h1>
                    <div class="sticker">
                        <strong>Có ${totalResult} kết quả</strong>
                    </div>
                </div>
            </div>
        </section>
        <section class="search-tour-section search-browser-web" id="sessionSearchWebTour">
            <div class="container">
                <div class="row">
                    <!-- Search Form -->
                    <form id="searchFormKiritmWebTour" method="get" role="form" action="">
                        <div class="col-xs-12">
                            <div class="row">
                                <div class="col-sm-4 col-xs-12">
                                    <div class="searchFilterQuery search-box-web-tour">
                                        <input type="text" class="form-control" name="keyword"
                                               id="inputSearchWebTour"
                                               autocomplete="off"
                                               placeholder="Tìm tour : ..."
                                               value="${keyword}">
                                        <div class="input-group-addon">
                                            <span class="fa fa-search"></span>
                                        </div>
                                        <div id="showSuggestionWebTour" class="suggestions hidden-cls">
                                            <ul id="suggestionSearchWebTour" class="ul-suggestion">
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-xs-12">
                                    <div class="row">
                                        <div class="col-sm-4 col-xs-12">
                                            <div id="fromDateSearchBoxWebTour"
                                                 class="input-group date ed-datepicker filterDate">
                                                <input type="text" class="form-control" name="from"
                                                       placeholder="Từ ngày"
                                                       autocomplete="off"
                                                       value="${from}">
                                                <div class="input-group-addon">
                                                    <span class="fa fa-calendar"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4 col-xs-12">
                                            <div id="toDateSearchBoxWebTour"
                                                 class="input-group date ed-datepicker filterDate">
                                                <input type="text" class="form-control" name="to"
                                                       autocomplete="off"
                                                       placeholder="Đến ngày" value="${to}">
                                                <div class="input-group-addon">
                                                    <span class="fa fa-calendar"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-2 col-xs-12">
                                    <button type="submit" class="btn btn-block buttonCustomPrimary">
                                        Tìm kiếm
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </section>

        <section class="search-wrapper-kiritm search-browser-mobile">
            <div class="container">
                <form id="searchFormKiritm" method="get" role="form"
                      action="">
                    <div class="search-body-kiritm">
                        <div class="row ">
                            <div class="col-sm-offset-2 col-sm-8 col-xs-12 serch-box-kiritm">
                                <div class="serch-box-kiritm-content" id="searchboxkiritm">
                                    <input
                                            onkeyup="return showResult(event, this.value)"
                                            onkeypress="return checkSubmitSearch(event)"
                                            onkeydown="return onkeyDownSearch(event)"
                                            type="text" name="keyword"
                                            class="input-search-kiritm"
                                            id="inputSearchHomepage"
                                            autocomplete="off"
                                            placeholder="Tìm kiếm..."
                                            value="${keyword}"
                                            aria-describedby="basic-addon2">
                                    <i class="fa fa-search fa-kiritm" id="basic-addon2"
                                       onclick="javascript:$(this).parents('form').submit()"></i>
                                </div>
                                <div id="showSuggestion" class="suggestions hidden-cls">
                                    <ul id="suggestionSearchHomePage" class="ul-suggestion">
                                    </ul>
                                </div>
                                <div class="advance-search-kiritm hidden-cls" id="advanceSearchKiritm">
                                    <div class="arrow-advance"></div>
                                    <div class="col-xs-6">
                                        <div id="fromDateSearchBox" class="input-group date filterDate ed-datepicker">
                                            <input type="text" class="form-control " name="from"
                                                   autocomplete="off"
                                                   placeholder="Từ ngày (MM/DD/YYYY)"
                                                   value="${from}">
                                            <div class="input-group-addon">
                                                <span class="fa fa-calendar"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-6">
                                        <div id="toDateSearchBox" class="input-group date ed-datepicker filterDate">
                                            <input type="text" class="form-control" name="to"
                                                   autocomplete="off"
                                                   placeholder="Đến ngày (MM/DD/YYYY)"
                                                   value="${to}">
                                            <div class="input-group-addon">
                                                <span class="fa fa-calendar"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <input type="hidden" name="type" value="0">
                                </div>
                                <div class="mark-close hidden-cls" id="markclose"></div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <section class="mainContentSection packagesSection list-tour-section" id="main-content">
            <div class="container">
                <div class="row">
                    <div class="col-sm-9 col-xs-8">
                        <div class="filter-list-tour">
                            <div  class="filter-text">Sắp xếp :</div>
                            <c:if test="${sortCode == 1}">
                                <div class="filter-tour" >
                                    <a class="filter-div active"   href="#main-content">
                                        [ Giá thấp nhất ]
                                    </a>
                                    <a class="filter-div"
                                       href="<c:url value="/tour/tim-kiem-tour?keyword=${keyword}&from=${from}&to=${to}&page=1&limit=5&_sort=sap-toi#main-content"/>">
                                        [ Ngày gần nhất ]
                                    </a>
                                </div>
                            </c:if>
                            <c:if test="${sortCode == 2}">
                                <div class="filter-tour" >
                                    <a class="filter-div" href="<c:url value="/tour/tim-kiem-tour?keyword=${keyword}&from=${from}&to=${to}&page=1&limit=5&_sort=gia-thap#main-content"/>">
                                        [ Giá thấp nhất ]
                                    </a>
                                    <a class="filter-div active"
                                       href="#main-content">
                                        [ Ngày gần nhất ]
                                    </a>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <!-- Tour List -->
                    <c:forEach var="item" items="${model.listResult}" end="9">
                        <div class="row box-search-tour  ">
                            <c:url var="TourDetail" value="/tour/chi-tiet">
                                <c:param name="id" value="${item.id}"/>
                            </c:url>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <div class="box-search-tour-image">
                                    <a href="${TourDetail}" class="isotopeSelector image-box-relative image-box-3x2">
                                        <img class="tour-image"
                                             src="<c:url value="/template/web/image/${item.tour.thumbnailUrl}"/>"
                                             alt="Image">
                                    </a>
                                </div>
                            </div>
                            <div class="col-md-8 col-sm-8 col-xs-12">
                                <div class="row box-search-tour-info">
                                    <div class="col-md-8 col-sm-8 col-xs-12">
                                        <div class="title-tour">

                                            <a href="${TourDetail}" class="GAproductClick" title="${item.tourName}">
                                                    ${item.tourName}
                                            </a>
                                        </div>
                                        <div class="destination-tour">
                                                ${item.tour.destination} </div>
                                        <div class="detail-tour">
                                                ${item.tour.description}
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-4 col-xs-12">
                                        <div class="row">
                                            <div class="row-box-price col-md-12 col-sm-12 col-xs-6">
                                                <a href="${TourDetail}" class="GAproductClick box-price-tour"
                                                   title="${item.tourName}">
                                                    <span class="text">Giá từ  </span>
                                                    <span class="price"><fmt:formatNumber value="${item.adultPrice}"
                                                                                          type="number"
                                                                                          maxFractionDigits="3"/></span>
                                                </a>
                                            </div>
                                            <div class="row-box-views  col-md-12 col-sm-12 col-xs-6"
                                                 style="display: block">
                                                <div>
                                                    <ul class="list-inline detailsBtn"
                                                        style="display:block;float: none;">
                                                        <li>
                                                    <span class="textInfo">
                                                        <i class="fa fa-calendar" aria-hidden="true"></i>
                                                        <fmt:formatDate value="${item.departureTime}"
                                                                        pattern="dd/MM/yyyy"/>
                                                    </span>
                                                        </li>
                                                        <li>
                                                    <span class="textInfo">
                                                        <i class="fa fa-calendar" aria-hidden="true"></i>
                                                        <fmt:formatDate value="${item.returnTime}"
                                                                        pattern="dd/MM/yyyy"/>
                                                    </span>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <div class="paginationCenter">
                        <ul class="pagination" id="pagination"></ul>
                        <input type="hidden" value="1" id="page" name="page"/>
                        <input type="hidden" value="5" id="limit" name="limit"/>
                    </div>
                </div>
            </div>
        </section>
    </div>
</form>
<script>
    var currentPage = ${model.page};
    var totalPage = ${model.totalPage};
    $(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: totalPage,
            visiblePages: 5,
            startPage: currentPage,
            onPageClick: function (event, page) {
                if (currentPage != page) {
                    $('#limit').val(5);
                    $('#page').val(page);
                    $('#formSubmit').submit();
                }
            }
        })
    });

    String.prototype.format = function () {
        var args = arguments;
        var sprintfRegex = /\{(\d+)\}/g;

        var sprintf = function (match, number) {
            return number in args ? args[number] : match;
        };

        return this.replace(sprintfRegex, sprintf);
    };

    $(document).ready(function () {

        //datepicker searchboxWeb
        $('#toDateSearchBoxWebTour').datepicker({
            format: 'dd/mm/yyyy',
            autoclose: true,
            orientation: 'top auto',
            todayBtn: 'linked',
            todayHighlight: true
        });
        $('#fromDateSearchBoxWebTour').datepicker({
            format: 'dd/mm/yyyy',
            autoclose: true,
            orientation: 'top auto',
            todayBtn: 'linked',
            todayHighlight: true
        }).on('changeDate', function (selected) {
            var minDate = new Date(selected.date.valueOf());
            $('#toDateSearchBoxWebTour').datepicker('setStartDate', minDate);
        });
        //datepicker searchbox mobile
        $('#toDateSearchBox').datepicker({
            format: 'dd/mm/yyyy',
            autoclose: true,
            orientation: 'top auto',
            todayBtn: 'linked',
            todayHighlight: true
        });
        $('#fromDateSearchBox').datepicker({
            format: 'dd/mm/yyyy',
            autoclose: true,
            orientation: 'top auto',
            todayBtn: 'linked',
            todayHighlight: true
        }).on('changeDate', function (selected) {
            console.log(selected.date.valueOf());
            var minDate = new Date(selected.date.valueOf());
            $('#toDateSearchBox').datepicker('setStartDate', minDate);
        });
    });
</script>
</body>
</html>