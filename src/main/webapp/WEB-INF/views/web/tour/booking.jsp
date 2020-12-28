<%@ page import="com.gotrip.util.SecurityUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Đặt tour</title>
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
<div class="main-wrapper">

    <!-- PAGE TITLE -->
    <section>
        <div class="pageTitle page-image-tour-tag"
             style="background-image:url(<c:url value='/template/web/image/booking.jpg'/>)">
        </div>
    </section>
    <section>
        <div class="container" style="position: relative">
            <div class="background-description">
                <h1 class="tour-banner-title">Đặt tour</h1>
            </div>
        </div>
    </section>
    <!-- PAGE CONTENT -->
    <section class="mainContentSection booking-container">
        <div class="container">
            <br/>
            <div class="row">
                <div class="col-md-8 col-sm-12 col-xs-12">
                    <div class="payment-wrap bookingForm">
                        <form:form role="form" method="post" class="form" id="info-form" novalidate="" modelAttribute="bookingModel">
                            <div class="no-padding">
                                <div class="title">
                                    <h3>1. SỐ LƯỢNG HÀNH KHÁCH</h3>
                                </div>
                                <div class="row">
                                    <div class="col-md-5 col-sm-5 col-xs-12 no-padding">
                                        <div class="form-group">
                                            <label>Người lớn (*)</label>
                                            <form:input path="adultQuantity" type="number" placeholder=""
                                                        class="form-control has-value " required="required" min="0"
                                                        pattern="^\d+$" data-validation="required"/>
                                            <span class="error"></span>
                                        </div>
                                    </div>
                                    <div class="col-md-7 col-sm-7 col-xs-12 no-padding">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-5 col-sm-5 col-xs-12 no-padding">
                                        <div class="form-group">
                                            <label>Trẻ em </label>
                                            <form:input path="childQuantity" type="number" placeholder=""
                                                        class="form-control" min="0" pattern="^\d+$"
                                                        data-validation="required" required="required"/>
                                            <span class="error"></span>
                                        </div>

                                    </div>
                                    <div class="col-md-7 col-sm-7 col-xs-12 no-padding">
                                        <ul class="highlight-text">
                                            <li>Áp dụng từ 6 đến 11 tuổi</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-5 col-sm-5 col-xs-12 no-padding">
                                        <div class="form-group">
                                            <label>Em bé </label>
                                            <form:input path="infantQuantity" type="number" placeholder=""
                                                        class="form-control" min="0" pattern="^\d+$"
                                                        data-validation="required" required="required"/>
                                            <span class="error"></span>
                                        </div>
                                    </div>
                                    <div class="col-md-7 col-sm-7 col-xs-12 no-padding">
                                        <ul class="highlight-text">
                                            <li>Áp dụng từ 2 đến 5 tuổi</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="no-padding">
                                <div class="title">
                                    <h3>2. THÔNG TIN LIÊN HỆ</h3>
                                </div>
                                <security:authorize access="isAuthenticated()">
                                    <div class="row">
                                        <div class="form-group col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>First Name (*)</label>
                                                <form:input path="firstName" type="text" placeholder=""
                                                            value="<%= SecurityUtils.getPrincipal().getFirstName()%>"
                                                            class="form-control" required="required"
                                                            data-validation="required"/>
                                                <span class="error"></span>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Last Name (*)</label>
                                                <form:input path="lastName" type="text" placeholder=""
                                                            value="<%= SecurityUtils.getPrincipal().getLastName()%>"
                                                            class="form-control" required="required"
                                                            data-validation="required"/>
                                                <span class="error"></span>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="form-group col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Số điện thoại (*)</label>
                                                <form:input path="phone" type="text" placeholder=""
                                                            value="<%= SecurityUtils.getPrincipal().getPhone()%>"
                                                            class="form-control" required="required" pattern="^(\d{8,})$"
                                                            maxlength="15" data-validation="required custom length"
                                                            data-validation-regexp="^(\d{8,})$"
                                                            data-validation-length="max15"/>
                                                <span class="error"></span>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Email (*)</label>
                                                <form:input path="email" type="email" placeholder=""
                                                            value="<%= SecurityUtils.getPrincipal().getEmail()%>"
                                                            class="form-control" required="required"
                                                            data-validation="required email"/>
                                                <span class="error"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Địa chỉ </label>
                                                <form:input path="address" type="text"  placeholder=""
                                                            value="<%= SecurityUtils.getPrincipal().getAddress()%>"
                                                            class="form-control"/>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Quốc gia</label>
                                                <form:input path="nationality" type="text" placeholder=""
                                                            value="<%= SecurityUtils.getPrincipal().getNationality()%>"
                                                            class="form-control"/>
                                            </div>
                                        </div>
                                    </div>

                                    <form:input path="userId" type="hidden" value="<%= SecurityUtils.getPrincipal().getId()%>"/>
                                </security:authorize>
                                <security:authorize access="isAnonymous()">
                                    <div class="row">
                                        <div class="form-group col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>First Name (*)</label>
                                                <input type="text" name="contact[firstName]" placeholder="" value=""
                                                       class="form-control" required="required"
                                                       data-validation="required">
                                                <span class="error"></span>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Last Name (*)</label>
                                                <input type="text" name="contact[lastName]" placeholder="" value=""
                                                       class="form-control" required="required"
                                                       data-validation="required">
                                                <span class="error"></span>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="form-group col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Số điện thoại (*)</label>
                                                <input type="text" name="contact[phone]" placeholder="" value=""
                                                       class="form-control" required="required" pattern="^(\d{8,})$"
                                                       maxlength="15" data-validation="required custom length"
                                                       data-validation-regexp="^(\d{8,})$"
                                                       data-validation-length="max15">
                                                <span class="error"></span>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Email (*)</label>
                                                <input type="email" name="contact[email]" placeholder="" value=""
                                                       class="form-control" required="required"
                                                       data-validation="required email">
                                                <span class="error"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Địa chỉ </label>
                                                <input type="text" name="contact[address]" placeholder="" value=""
                                                       class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Quốc gia</label>
                                                <input type="text" name="contact[nationality]" placeholder="" value=""
                                                       class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                </security:authorize>
                            </div>
                            <div class="no-padding">
                                <div class="title">
                                    <h3>3. THANH TOÁN</h3><br/>
                                    <p><b>Chọn một trong các phương thức sau:</b></p>
                                    <div class="methods">
                                        <div class="method" >
                                            <input value="2"
                                                   style="display: none" type="radio" id="pament-method0"
                                                   class="payment-method" name="method">
                                            <div class="method-content">
                                                <label class="title" toggle="Bank"
                                                       for="pament-method0">
                                                    <h4 style="margin: 0 0 10px;">Thanh toán chuyển khoản qua ngân
                                                        hàng</h4>
                                                    <div class="description">Sau khi đặt vé thành công và chuyển khoản
                                                        qua tài khoản GoTrip, nhân viên sẽ gửi liên hệ Quý khách
                                                        qua email/SĐT.
                                                    </div>
                                                    <i class="fa fa-chevron-down"></i>
                                                    <i class="fa fa-check"></i>
                                                </label>
                                                <div class="content" id="Bank">
                                                    <h2>Thông tin chuyển khoản của GoTrip:</h2>
                                                    <ul>
                                                        <li>
                                                            <p>
                                                                <b>1. Ngân hàng TMCP Ngoại Thương Việt Nam (Vietcombank):</b><br/>
                                                                STK : <b>9999.9999.9999.9999</b> - Tên Tài Khoản: <b> Công ty TNHH Du Lịch Việt GoTrip</b> - Chi Nhánh: <b>Bắc Sài Gòn</b>  <br/>
                                                            </p>
                                                        </li>
                                                        <li>
                                                            <p>
                                                                <b>2. Ngân hàng TMCP Công Thương Việt Nam (Vietcombank):</b><br/>
                                                                STK : <b>6969.6969.6969.6969</b> - Tên Tài Khoản: <b> Công ty TNHH Du Lịch Việt GoTrip</b> - Chi Nhánh: <b>Nam Sài Gòn</b>  <br/>
                                                            </p>
                                                        </li>
                                                        <li>
                                                            <p>
                                                                <b>3. Ngân hàng TMCP Kỹ thương Việt Nam (Vietinbank):</b><br/>
                                                                STK : <b>1234.5678.9999</b> - Tên Tài Khoản: <b> Công ty TNHH Du Lịch Việt GoTrip</b> - Chi Nhánh: <b>Phú Mỹ Hưng</b>  <br/>
                                                            </p>
                                                        </li>
                                                    </ul>
                                                    <p><br/>
                                                        <strong>Lưu ý khi chuyển khoản:</strong></p>

                                                    <ul>
                                                        <li>Khi chuyển khoản, quý khách vui lòng nhập nội dung chuyển khoản là:
                                                        </li>
                                                    </ul>

                                                    <p><strong><em>"MT MaTour, Họ tên, Tổng tiền</em></strong><br/>
                                                        Ví dụ: MT HN-VN, Nguyen Van A , 9.000.000<br/>
                                                        Để việc thanh toán được chính xác. Xin cảm ơn quý khách!</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="method">
                                            <input value="5"
                                                   style="display: none" type="radio" id="payment-method1"
                                                   class="payment-method" name="method">
                                            <div class="method-content">
                                                <label class="title" toggle="vi-dien-tu"
                                                       for="payment-method1">
                                                    <h4 style="margin: 0 0 10px;">Thanh toán bằng ví điện tử</h4>
                                                    <div class="description">Sau khi đặt vé và thanh toán thành công, GoTrip sẽ gửi vé của Quý khách thông qua SĐT/email.
                                                    </div>
                                                    <i class="fa fa-chevron-down"></i>
                                                    <i class="fa fa-check"></i>
                                                </label>
                                                <div class="content" id="vi-dien-tu">
                                                    <h2>Thông tin ví điện tử của GoTrip:</h2>
                                                    <ul>
                                                        <li>
                                                            <p>
                                                                <b>1. Ví MoMo:</b><br/>
                                                                SĐT : <b>0989.89.89.89</b> - Tên Tài Khoản: <b> Công ty TNHH Du Lịch Việt GoTrip</b><br/>
                                                            </p>
                                                        </li>
                                                        <li>
                                                            <p>
                                                                <b>2. Ví ZaloPay:</b><br/>
                                                                SĐT : <b>0989.89.89.89</b> - Tên Tài Khoản: <b> Công ty TNHH Du Lịch Việt GoTrip</b><br/>
                                                            </p>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12">
                                <div class="buttonArea galleryBtnArea">
                                    <ul class="list-inline">
                                        <li>
                                            <a href="<c:url value="/tour/chi-tiet?id=${model.id}"/> "
                                               class="btn buttonTransparent">Trở về</a>
                                        </li>
                                        <li class="pull-right">
                                            <button type="submit" data-callback="validate" id="submit-button" class="btn buttonTransparent">Tiếp tục</button>
                                                <%--<a href="<c:url value="/tour/dat-tour/thanh-cong"/> "
                                                   class="btn buttonTransparent">Tiếp tục</a>--%>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <script type="text/javascript">
                                document.getElementById('submit-button').onclick = ev => {
                                    ev.preventDefault();
                                    document.getElementById('info-form').submit();
                                }

                                $.validate({modules: 'html5', errorMessageClass: 'error', lang: 'vi'});
                            </script>
                            <form:input path="adultPrice" type="hidden" value="${model.adultPrice}"/>
                            <form:input path="childPrice" type="hidden" value="${model.childPrice}"/>
                            <form:input path="infantPrice" type="hidden" value="${model.infantPrice}"/>
                            <form:input path="tripId" type="hidden" value="${model.id}"/>
                            <form:input path="duringTime" type="hidden" value="${model.tour.duringTime}"/>
                            <form:input path="returnTime" type="hidden" value="${model.returnTime}"/>
                            <form:input path="departurePlace" type="hidden" value="${model.departurePlace}"/>
                            <form:input path="transport" type="hidden" value="${model.tour.transport}"/>
                            <form:input path="departureTime" type="hidden" value="${model.departureTime}"/>
                        </form:form>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12 col-xs-12">
                    <aside>
                        <a style="display: block" class="infoTitle-kiritm" href="tel:1900 1808">
                            <span>Hỗ trợ giao dịch <strong>1900 1900</strong></span>
                        </a>
                        <div class="bookDetailsInfo">
                            <img src="<c:url value="/template/web/image/${model.tour.thumbnailUrl}"/> " alt="image">
                            <div class="infoArea">
                                <h3><a target="_blank"
                                       href="<c:url value="/tour/chi-tiet?id=${model.id}"/> ">${model.tour.name}</a>
                                </h3>
                                <ul class="list-unstyled">
                                    <li>
                                        <i class="fa fa-barcode" aria-hidden="true"></i>
                                        Code:
                                        <span>${model.code}</span></li>
                                    <li>
                                        <i class="fa fa-calendar-minus-o" aria-hidden="true"></i>
                                        </i>Ngày đi:
                                        <span><fmt:formatDate value="${model.departureTime}"
                                                              pattern="dd-MM-yyyy"/></span></li>
                                    <li>
                                        <i class="fa fa-calendar-plus-o" aria-hidden="true"></i>
                                        </i>Ngày về:
                                        <span><fmt:formatDate value="${model.returnTime}" pattern="dd-MM-yyyy"/> </span>
                                    </li>
                                    <li>
                                        <i class="fa fa-calendar" aria-hidden="true"></i>
                                        </i>Thời gian:
                                        <span>${model.tour.duringTime}</span>
                                    </li>
                                    <li id="liAdult" class="display-hidden">
                                        <i class="fa fa-user-secret" aria-hidden="true"></i>
                                        Giá Người lớn :
                                        <span>
                                            <strong><fmt:formatNumber value="${model.adultPrice}" type="number"
                                                                      maxFractionDigits="3"/></strong> đ
                                        </span>
                                        <span id="adult"></span></li>
                                    <li id="liChild" class="display-hidden"><i class="fa fa-child"
                                                                               aria-hidden="true"></i>
                                        Giá trẻ em :
                                        <span>
                                            <strong><fmt:formatNumber value="${model.childPrice}" type="number"
                                                                      maxFractionDigits="3"/></strong> đ
                                        </span>
                                        <span id="child"></span></li>
                                    <li id="liInfant" class="display-hidden"><i class="fa fa-user-times"
                                                                                aria-hidden="true"></i>
                                        Giá em bé:
                                        <span>
                                            <strong><fmt:formatNumber value="${model.infantPrice}" type="number"
                                                                      maxFractionDigits="3"/></strong> đ
                                        </span>
                                        <span id="infant"></span>
                                    </li>
                                </ul>
                                <div class="priceTotal">
                                    <h2>Tổng: <span id="total-price">0</span>
                                        <span style="font-size: 16px;
                                        color: #000;
                                        font-weight: 500;
                                        line-height: 21px;
                                        text-transform: lowercase;"> đ</span>
                                    </h2>
                                </div>
                            </div>
                        </div>
                    </aside>
                </div>
            </div>
        </div>
    </section>
</div>
<script type="text/javascript">
    var adultPrice = ${model.adultPrice};
    var childPrice = ${model.childPrice};
    var infantPrice = ${model.infantPrice};
    var totalPrice = 0;

    function updateAmount() {
        var adult = $("input[name=adultQuantity]").val();
        var child = $("input[name=childQuantity]").val();
        var infant = $("input[name=infantQuantity]").val();
        if (adult > 0) {
            $("#liAdult").show();
        } else {
            $("#liAdult").hide();
        }
        if (child > 0) {
            $("#liChild").show();
        } else {
            $("#liChild").hide();
        }
        if (infant > 0) {
            $("#liInfant").show();
        } else {
            $("#liInfant").hide();
        }
        $("#adult").html(adult > 0 ? " X " + adult : "");
        $("#child").html(child > 0 ? " X " + child : "");
        $("#infant").html(infant > 0 ? " X " + infant : "");

        totalPrice = adult * adultPrice + child * childPrice + infant * infantPrice;
        console.log(totalPrice);
        $("#total-price").html(totalPrice.currencyFormat());
    }

    $(document).on('ready', function () {
        $("body").on('input', 'input[name=adultQuantity],input[name=childQuantity],input[name=infantQuantity]', function () {
            updateAmount();
        });
    })

    /*function validate(token) {
        if ($('#info-form input[name=method]:checked').length === 0) {
            notify('Bạn phải chọn phương thức thanh toán');
            return;
        }
        submitFunction(token);
    }
    function notify(message, key) {
        $.notify(message, {
            delay: 7000,
            type: key || 'danger',
            icon: 'glyphicon glyphicon-warning-sign',
            offset: {x: 30, y: 80},
            placement: {from: 'top', 'align': 'right'},
            mouse_over: 'pause'
        });
    }


    function onload() {
        var element = document.getElementById('submit-button');
        element.onclick = validate;
    }*/

</script>
</body>
</html>