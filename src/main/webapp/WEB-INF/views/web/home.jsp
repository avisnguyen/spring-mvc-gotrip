<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Trang chủ</title>
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
                            <a href="<c:url value='/tour?page=1&limit=10'/>" class="dropdown" data-hover="dropdown"
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
<div id="wrap">
    <section class="bannercontainer">
        <div class="fullscreenbanner-container">
            <div class="fullscreenbanner">
                <ul>
                    <li data-transition="parallaxvertical" data-slotamount="5" data-masterspeed="700"
                        data-title="Slide 0">
                        <img src="<c:url value="/template/web/image/home/banner-1.jpg"/>" alt="slidebg0"
                             data-bgfit="cover" style="min-height: 250px" data-bgposition="center center"
                             data-bgrepeat="no-repeat">
                        <div class="slider-caption container">
                            <div class="tp-caption rs-caption-1 sft start" data-hoffset="0" data-x="150" data-y="170"
                                 data-speed="800" data-start="1000" data-easing="Back.easeInOut" data-endspeed="300">
                                GoTrip
                                <span> Happy New Year</span>
                            </div>
                            <div class="tp-caption rs-caption-2 sft" data-hoffset="0" data-x="150" data-y="300"
                                 data-speed="1000" data-start="1500" data-easing="Power4.easeOut" data-endspeed="300"
                                 data-endeasing="Power1.easeIn" data-captionhidden="off">
                                2021
                            </div>
                        </div>
                    </li>
                    <li data-transition="parallaxvertical" data-slotamount="5" data-masterspeed="1000"
                        data-title="Slide 1">
                        <img src="<c:url value="/template/web/image/home/banner-2.jpg"/>" alt="slidebg1"
                             data-bgfit="cover" style="min-height: 250px" data-bgposition="center center"
                             data-bgrepeat="no-repeat">
                        <div class="slider-caption container">
                            <div class="tp-caption rs-caption-1 sft start" data-hoffset="0" data-x="150" data-y="170"
                                 data-speed="800" data-start="1000" data-easing="Back.easeInOut" data-endspeed="300">
                                Christmas
                                <span> 2020</span>
                            </div>
                            <div class="tp-caption rs-caption-2 sft" data-hoffset="0" data-x="150" data-y="300"
                                 data-speed="1000" data-start="1500" data-easing="Power4.easeOut" data-endspeed="300"
                                 data-endeasing="Power1.easeIn" data-captionhidden="off">
                                Coming
                            </div>
                        </div>
                    </li>
                    <li data-transition="parallaxvertical" data-slotamount="5" data-masterspeed="700"
                        data-title="Slide 2">
                        <img src="<c:url value="/template/web/image/home/banner-3.jpg"/>" alt="slidebg2"
                             data-bgfit="cover" style="min-height: 250px" data-bgposition="center center"
                             data-bgrepeat="no-repeat">
                        <div class="slider-caption container">
                            <div class="tp-caption rs-caption-1 sft start" data-hoffset="0" data-x="150" data-y="170"
                                 data-speed="800" data-start="1000" data-easing="Back.easeInOut" data-endspeed="300">
                                GoTrip chuyên cung cấp
                                <span> Tour du lịch trong nước</span>
                            </div>
                            <div class="tp-caption rs-caption-2 sft" data-hoffset="0" data-x="150" data-y="300"
                                 data-speed="1000" data-start="1500" data-easing="Power4.easeOut" data-endspeed="300"
                                 data-endeasing="Power1.easeIn" data-captionhidden="off">
                                đa dạng, giá cả hợp lý
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </section>
    <section class="search-wrapper-kiritm">
        <div class="container">
            <form id="searchFormKiritm" method="get" role="form" action="tour/tim-kiem-tour">
                <div class="search-body-kiritm">
                    <div class="row ">
                        <div class="col-sm-offset-2 col-sm-8 col-xs-12 serch-box-kiritm">
                            <div class="serch-box-kiritm-content" id="searchboxkiritm">
                                <input onkeyup="return showResult(event, this.value)"
                                       onkeypress="return checkSubmitSearch(event)" type="text" name="keyword"
                                       class="input-search-kiritm" id="inputSearchHomepage" autocomplete="off"
                                       placeholder="Tìm kiếm..." aria-describedby="basic-addon2">
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
                                        <input type="text" class="form-control " name="from" autocomplete="off"
                                               placeholder="Từ ngày (DD/MM/YYYY)" value="">
                                        <div class="input-group-addon">
                                            <span class="fa fa-calendar"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-6">
                                    <div id="toDateSearchBox" class="input-group date ed-datepicker filterDate">
                                        <input type="text" class="form-control" name="to" autocomplete="off"
                                               placeholder="Đến ngày (DD/MM/YYYY)" value="">
                                        <div class="input-group-addon">
                                            <span class="fa fa-calendar"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mark-close hidden-cls" id="markclose"></div>
                        </div>

                    </div>
                </div>
                <input type="hidden" value="1" id="page" name="page"/>
                <input type="hidden" value="5" id="limit" name="limit"/>
            </form>
        </div>
    </section>
    <div class="main-wrapper">
        <!-- TOUR Global -->

        <section class="whiteSection">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="sectionTitle">
                            <div class="content-title"><span class="title-tour-new">TOUR HAY</span> <i
                                    class="icon-hot"></i></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="slider-slick slider" style="height: auto">
                        <c:forEach var="item" items="${tripModel.listResult}" end="6">
                            <c:url var="TourDetail" value="/tour/chi-tiet">
                                <c:param name="id" value="${item.id}"/>
                            </c:url>
                            <article class="box isotopeSelector box-kiritm box-tour">
                                <figure>
                                    <a href="${TourDetail}"
                                       class="GAproductClick popup-gallery image-box-relative image-box-3x2"
                                       title="">
                                        <img width="100%" height="250" alt=""
                                             src="<c:url value="/template/web/image/${item.tour.thumbnailUrl}"/>">
                                        <div class="promotion-tour">
                                            <div class="text-promotion-tour" title="">
                                                Tour
                                                <c:forEach var="place" items="${item.tour.places}" varStatus="loop">
                                                    <c:out value="${place.name}"/>
                                                    <c:if test="${!loop.last}"> - </c:if>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </a>
                                </figure>
                                <div class="box-tour-price">
                                    <p class="text">Giá từ</p>
                                    <p class="price"><fmt:formatNumber value="${item.adultPrice}" type="number"
                                                                       maxFractionDigits="3"/></p>
                                    <p class="info">${item.tour.duringTime}</p>
                                </div>
                                <div class="details-kiritm">
                                    <div class="name-tour-detail">
                                        <a href="${TourDetail}" class="GAproductClick" title="">${item.tourName}</a>
                                    </div>
                                    <div class="bottom-detail">
                                        <div class="info-tour">
                                        </div>
                                        <div class="action-tour">
                                            <a href="${TourDetail}" title=""
                                               class="GAproductClick btn btn-kiritm buy-tour">Mua tour</a>
                                        </div>
                                    </div>
                                </div>
                            </article>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </section>
        <!-- home-banner -->

        <section class="home-banner-wrapper" style="margin-top: 30px">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-sm-8 col-xs-12" style="margin-bottom: 18px">
                        <a target="_blank" href="#"
                           class="box-shadow adbanner-image image-box-relative image-box-16x9 ">
                            <img src="<c:url value='/template/web/image/home/giang-sinh.jpg'/> ">
                            <div class="overlay"></div>
                        </a>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-12">
                        <div class="row" style="margin-top: -10px">
                            <div class="col-sm-12 col-xs-6" style="margin: 9px auto">
                                <a target="_blank" href="#"
                                   class="box-shadow adbanner-image image-box-relative image-box-16x9 ">
                                    <img src="<c:url value='/template/web/image/home/tet.jpg'/>">
                                    <div class="overlay"></div>
                                </a>
                            </div>
                            <div class="col-sm-12 col-xs-6" style="margin: 9px auto">
                                <a target="_blank" href="#"
                                   class="box-shadow adbanner-image image-box-relative image-box-16x9 ">
                                    <img src="<c:url value='/template/web/image/home/du-lich.jpg'/>">
                                    <div class="overlay"></div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="whiteSection">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="sectionTitle">
                            <div class="content-title"><span class="title">ĐIỂM ĐẾN ĐANG HOT</span> <i
                                    class="icon-hot"></i></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <c:forEach items="${postModel.listResult}" end="2" var="item">
                        <c:url var="BlogDetails" value="/blog/${item.categoryCode}">
                            <c:param name="id" value="${item.id}"/>
                        </c:url>
                        <c:url var="CateBlog" value="/blog/cat/${item.categoryCode}">
                            <c:param name="cat" value="${item.categoryCode}"/>
                        </c:url>
                        <div class="col-sm-4 col-xs-12">
                            <article class="box isotopeSelector box-kiritm">
                                <figure>
                                    <a href="${BlogDetails}" class="popup-gallery image-box-relative image-box-3x2">
                                        <img width="100%" height="250" alt=""
                                             src="<c:url value='/template/web/image/${item.thumbnail}'/> "></a>
                                    <div class="subject-kiritm">
                                        <div class="subject-kiritm-text">
                                            Du lịch
                                        </div>
                                        <div class="subject-kiritm-title">
                                            Việt Nam
                                        </div>
                                    </div>
                                </figure>
                                <div class="details-kiritm">
                                    <div class="detail-title">
                                        <a class="detail-title-text" href="${CateBlog}"/>
                                            ${item.categoryName}
                                        </a>
                                    </div>
                                    <div class="detail-name">
                                        <a href="${BlogDetails}" class="detail-name-text"
                                           title="${item.title}">${item.title}</a>
                                    </div>
                                </div>
                                <input type="hidden" value="${item.id}">
                            </article>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
        <section class="whiteSection">
            <div class="container commitment">
                <div class="row">
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="commitment-box">
                            <div class="commitment-image">
                                <img width="60px" height="60px" class="icon-commitment"
                                     src="<c:url value='/template/web/image/price.png'/> " alt="image commitment"/>
                            </div>
                            <div class="commitment-content">
                                <span class="commitment-taitle">GIÁ TỐT - NHIỀU ƯU ĐÃI</span>
                                <p class="commitment-description">Ưu đãi và quà tặng hấp dẫn khi mua tour online</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="commitment-box">
                            <div class="commitment-image">
                                <img width="60px" height="60px" class="icon-commitment"
                                     src="<c:url value='/template/web/image/pay.png'/>" alt="image commitment"/>
                            </div>
                            <div class="commitment-content">
                                <span class="commitment-taitle">THANH TOÁN AN TOÀN</span>
                                <p class="commitment-description">Được bảo mật bởi tổ chức quốc tế Global Sign</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="commitment-box">
                            <div class="commitment-image">
                                <img width="60px" height="60px" class="icon-commitment"
                                     src="<c:url value='/template/web/image/promotion.png'/>" alt="image commitment"/>
                            </div>
                            <div class="commitment-content">
                                <span class="commitment-taitle">TƯ VẤN MIỄN PHÍ</span>
                                <p class="commitment-description">Hỗ trợ tư vấn online miễn phí</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="commitment-box">
                            <div class="commitment-image">
                                <img width="60px" height="60px" class="icon-commitment"
                                     src="<c:url value='/template/web/image/star.png'/>" alt="image commitment"/>
                            </div>
                            <div class="commitment-content">
                                <span class="commitment-taitle">THƯƠNG HIỆU UY TÍN</span>
                                <p class="commitment-description">Thương hiệu lữ hành hàng đầu Việt Nam</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
<script>
    function detectmob() {
        if (navigator.userAgent.match(/Android/i) ||
            navigator.userAgent.match(/webOS/i) ||
            navigator.userAgent.match(/iPhone/i) ||
            navigator.userAgent.match(/iPad/i) ||
            navigator.userAgent.match(/iPod/i) ||
            navigator.userAgent.match(/BlackBerry/i) ||
            navigator.userAgent.match(/Windows Phone/i)
        ) {
            return true;
        } else {
            return false;
        }
    }
</script>
<script>
    $(document).on('ready', function () {
        var showItem = 3;
        if (detectmob()) {
            showItem = 1;
        }
        $('.slider-slick').slick({
            dots: true,
            infinite: true,
            slidesToShow: showItem,
            slidesToScroll: 1,
            autoplay: true,
            autoplaySpeed: 5000
        });
        //datepicker searchbox
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

    /*$(".GAproductClick").click(function(e) {
        if (!e.shiftKey && !e.ctrlKey && !e.altKey && !e.metaKey) {
            e.preventDefault();
        }
        var url = $(this).data("url");
        dataLayer.push({
            'event': 'EEproductClick',
            'ecommerce': {
                "currencyCode": "VND",
                'click': {
                    'actionField': {
                        'list': $(this).data("list")
                    }, // Optional list property.
                    'products': [{
                        'name': $(this).data("name"), // Name or ID is required.
                        'id': $(this).data("id"),
                        'price': $(this).data("price"),
                        'brand': $(this).data("brand"),
                        'category': $(this).data("category"),
                        'position': $(this).data("position")
                    }]
                }
            },
            'eventCallback': function() {
                if (!e.shiftKey && !e.ctrlKey && !e.altKey && !e.metaKey) {
                    document.location = url;
                }
            }
        });
    })*/
</script>
</body>
</html>
