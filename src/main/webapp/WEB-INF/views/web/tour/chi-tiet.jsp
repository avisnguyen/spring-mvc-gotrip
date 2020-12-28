<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Chi tiết</title>
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
<div class="main-wrapper">

    <!-- PAGE TITLE -->
    <section>
        <div class="pageTitle page-image-tour-tag"
             style="background-image:url(<c:url value='/template/web/image/${model.tour.thumbnailUrl}'/>)">
        </div>
    </section>
    <section>
        <div class="container" style="position: relative">
            <div class="background-description">
                <h1 class="tour-banner-title">${model.tourName}</h1>
            </div>
        </div>
    </section>
    <!-- PAGE CONTENT -->

    <!-- PAGE CONTENT -->
    <section class="mainContentSection singlePackage">
        <div class="container detail-tour-kiritm">
            <div class="row">
                <div class="col-md-9 col-sm-12 col-xs-12">
                    <div class="info-tour">
                        <div class="row-info">
                            <div class="row">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <span class="text-uppercase">Thời gian:</span>
                                    <span class="text-strong">${model.tour.duringTime}</span>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <span class="text-uppercase">Phương tiện:</span>
                                    <span class="text-strong">
                                        ${model.tour.transport}
                                    </span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <span class="text-uppercase">Điểm xuất phát:</span>
                                    <span class="text-strong">${model.departurePlace} </span>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <span class="text-uppercase">Điểm đến:</span>
                                    <span class="text-strong">${model.tour.destination}</span>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="list-tour-detail">
                        <div class="row ">
                            <div class="col-md-12 col-xs-12 tour-detail-title-information tour-detail-header-col">
                                <div class="row">
                                    <div class="col-md-2 col-sm-3 col-xs-12">
                                        Khởi hành
                                    </div>
                                    <div class="col-md-2 col-sm-3 col-xs-12">
                                        Mã Tour
                                    </div>
                                    <div class="col-sm-2 col-xs-12">
                                        Giá người lớn
                                    </div>
                                    <div class="col-sm-2 col-xs-12">
                                        Giá trẻ em
                                    </div>
                                    <div class="col-sm-2 col-xs-12">
                                        Giá em bé
                                    </div>
                                    <div class="col-md-2 col-sm-12 col-xs-12">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 col-sm-12 col-xs-12 tour-detail-content-col">
                                <div class="list-inline">
                                    <div class="row">
                                        <div class=" col-xs-12">
                                            <h5>Thông tin tour chi tiết thứ #1</h5>
                                        </div>
                                        <div class="col-md-2 col-sm-3 col-xs-12">
                                            <label>Ngày khởi hành</label>
                                            <strong>${model.departureTime}</strong>
                                        </div>
                                        <div class="col-md-2 col-sm-3 col-xs-12">
                                            <label>Mã Tour</label>
                                            <strong style="margin-left: -30px;">${model.code}</strong>
                                        </div>
                                        <div class="col-md-2 col-sm-2 col-xs-12 price">
                                            <label>Giá người lớn</label>
                                            <strong><fmt:formatNumber value="${model.adultPrice}" type="number"
                                                                      maxFractionDigits="3"/></strong>
                                        </div>
                                        <div class="col-md-2 col-sm-2 col-xs-12 price">
                                            <label>Giá trẻ em</label>
                                            <strong><fmt:formatNumber value="${model.childPrice}" type="number"
                                                                      maxFractionDigits="3"/></strong>
                                        </div>
                                        <div class="col-md-2 col-sm-2 col-xs-12 price">
                                            <label>Giá trẻ sơ sinh</label>
                                            <strong><fmt:formatNumber value="${model.infantPrice}" type="number"
                                                                      maxFractionDigits="3"/></strong>
                                        </div>
                                        <div class="col-md-2 col-sm-2 col-xs-12 packageInfo">
                                            <label>Đặt/Mua ngay</label>
                                            <div class="action-book" style="height: auto">
                                                <a class="btn btn-buy-tour"
                                                   href="<c:url value="/tour/dat-tour?trip_id=${model.id}"/> ">Đặt
                                                    ngay</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row-description">
                        <div class="title-description">Tour này có gì hay</div>
                        <div class="content-description">${model.tour.description}
                        </div>
                    </div>
                    <div class="row row-image-box isdesktop">
                    </div>
                    <div class="row-info-tour">
                        <div role="tabpanel" class="">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="active">
                                    <a href="#tour-program" role="tab" data-toggle="tab">
                                        Chương trình Tour
                                    </a>
                                </li>
                                <li role="presentation">
                                    <a href="#tour-term" role="tab" data-toggle="tab">
                                        Chính sách Tour
                                    </a>
                                </li>
                                <li role="presentation">
                                    <a href="#tour-question" role="tab" data-toggle="tab">
                                        Câu hỏi thường gặp
                                    </a>
                                </li>
                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane active" id="tour-program">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="commonInfo">
                                                <p>
                                                    ${model.tour.itinerary}
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="tour-term">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="commonInfo">
                                                ${model.tour.termAndCondition}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="tour-question">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="commonInfo">
                                                ${model.tour.faq}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-12 col-xs-12">
                    <div class="row">
                        <div class="col-md-12 col-sm-4 col-xs-12">
                            <div class="right-detail-tour-box" id="boxInfoSuportSgt">
                                <div class="title">Hỗ trợ khách hàng</div>
                                <ul class="list-rows">
                                    <li class="item">
                                        <a class="item-line" href="tel:1900 1234">
                                            <span class="text">Hotline: 1900 1234</span>
                                        </a>
                                    </li>
                                    <li class="item">
                                        <a class="item-line" href="mailto:info@gotrip.com">
                                            <span class="text">Email: info@gotrip.com</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-4 col-xs-12">
                            <div class="right-detail-tour-box">
                                <div class="title">Vì sao nên mua tour online?</div>

                                <ul class="list-rows">
                                    <li class="item"><span class="text">An toàn - Bảo mật</span> </a>
                                    </li>
                                    <li class="item"><span class="text">Tiện lợi, tiết kiệm thời gian</span> </a>
                                    </li>
                                    <li class="item"><span class="text">Không tính phí giao dịch</span> </a>
                                    </li>
                                    <li class="item"><span class="text">Giao dịch bảo đảm</span> </a>
                                    </li>
                                    <li class="item"><span class="text">Nhận thêm ưu đãi</span> </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br/>
        <div class="container more-info-tour">
            <div class="row">
                <div class="col-xs-12">
                    <div class="relatedProduct">
                        <h2>Tour liên quan</h2>
                        <div class="row"><c:forEach var="item" items="${relationTrip.listResult}" end="2">
                            <div class="col-md-4 col-sm-6 col-xs-12">
                                <article class="box isotopeSelector box-kiritm box-tour">
                                    <figure>
                                        <a href="<c:url value="/tour/chi-tiet?id=${item.id}"/>"
                                           class="popup-gallery image-box-relative image-box-3x2">
                                            <img width="100%" height="250"
                                                 alt="${item.tour.subtitle}"
                                                 src="<c:url value="/template/web/image/${item.tour.thumbnailUrl}"/>">
                                        </a>
                                    </figure>
                                    <div class="box-tour-price">
                                        <p class="text">Giá từ</p>
                                        <p class="price">${item.adultPrice}</p>
                                        <p class="info">${item.tour.duringTime}</p>
                                    </div>
                                    <div class="details-kiritm">
                                        <div class="name-tour-detail">
                                            <a href="<c:url value="/tour/chi-tiet?id=${item.id}"/>"
                                               class="GAproductClick"
                                               title="${item.tourName}">
                                                    ${item.tourName}
                                            </a>
                                        </div>
                                        <div class="bottom-detail">
                                            <div class="info-tour">
                                                    ${item.tour.departure} - <c:forEach var="i"
                                                                                        items="${item.tour.places}"
                                                                                        varStatus="loop">
                                                <c:out value="${i.name}"/>
                                                <c:if test="${!loop.last}"> | </c:if>
                                            </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                            </div>
                        </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</div>

<div class="modal fade modal-login modal-border-transparent" id="callMeBackModal" tabindex="-1" role="dialog"
     aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-dialog-call-me-back">
        <div class="modal-content">
            <button type="button" class="btn btn-close close" data-dismiss="modal" aria-label="Close">
                <span class="fa fa-times" aria-hidden="true"></span>
            </button>
            <div class="clear"></div>
            <h4 class="modal-title">
                Dịch vụ hỗ trợ tư vấn miễn phí
            </h4>
            <div id="modal-call-me-back-form-wrapper">
                <div class="call-back-form">
                    <form action="" method="POST" id="call_back_form">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <img src="#">
                                <p class="title">
                                    Du lịch Hà Nội - Lào Cai - Sapa - Hạ Long<br> [ Hà Nội - Hạ Long - Sapa ]
                                </p>
                            </div>
                            <div class="col-md-8 col-sm-8 col-xs-12">
                                <p id="_message_success" class="message-success"></p>
                                <div class="form-group">
                                    <input type="hidden" name="tour_id" class="form-control" id="tour_id"
                                           placeholder="Tour" value="3837">
                                </div>
                                <div class="form-group">
                                    <input type="text" name="name" class="form-control" id="name"
                                           placeholder="Họ & tên">
                                </div>
                                <div class="form-group">
                                    <input type="email" name="email" class="form-control" id="email"
                                           placeholder="Email">
                                </div>
                                <div class="form-group">
                                    <input type="text" name="phone" class="form-control" id="phone" placeholder="Phone">
                                </div>
                                <div class="form-group">
                                    <textarea name="message" class="form-control" id="message"
                                              placeholder="Nội dung"></textarea>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn buttonCustomPrimary" data-backdrop="static"
                                        data-keyboard="false">
                                    Gửi thông tin
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
