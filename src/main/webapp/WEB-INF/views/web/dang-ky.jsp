<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp"%>
<html>
<head>
    <title>Đăng ký</title>
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
<div class="member-wrapper">
    <div class="background"></div>
    <div class="member-content">
        <div class="register clearfix">
            <h4 class="text-center title">Đăng Ký</h4>
            <c:if test="${not empty message}">
                <div class="alert alert-${alert}">
                    <button type="button" class="close" data-dismiss="alert">
                        <i class="ace-icon fa fa-times"></i>
                    </button>
                    <b>${message}</b>
                </div>
            </c:if>
            <form:form id="register-form" method="POST" modelAttribute="user" class="has-validation-callback">
                <div class="form-content">
                    <div class="col-md-6 col-xs-12">
                        <div class="form-group label-top">
                            <form:input type="text" class="label-top" required="required" data-validation="required" path="firstName"/>
                            <label>First Name (*)</label>
                            <span class="help-block error"></span>
                        </div>
                        <div class="form-group label-top">
                            <form:input type="email" class="label-top" required="required" data-validation="required email" path="email"/>
                            <label>Địa chỉ email (*)</label>
                            <span class="help-block error"></span>
                        </div>
                        <div class="form-group label-top">
                            <form:password class="label-top" required="required" data-validation="required" path="password"/>
                            <label>Mật khẩu (*)</label>
                            <span class="help-block error"></span>
                        </div>
                        <div class="form-group label-top">
                            <form:input  path="address" name="address" value="" class="label-top"/>
                            <label>Address</label>
                            <span class="help-block error"></span>
                        </div>
                        <div class="form-group label-top">
                            <form:select name="sex" path="sex">
                                <form:option value="" disabled="true" >Giới tính</form:option>
                                <form:option value="Nam">Nam</form:option>
                                <form:option value="Nữ">Nữ</form:option>
                                <form:option value="Khác">Khác</form:option>
                            </form:select>
                        </div>
                    </div>
                    <div class="col-md-6 col-xs-12">
                        <div class="form-group label-top">
                            <form:input path="lastName" value="" class="label-top" required="required" data-validation="required email" style="background-image: url(#) !important; background-repeat: no-repeat; background-size: 20px; background-position: 97% center; cursor: auto;"
                                   data-temp-mail-org="0"/>
                            <label>Last Name (*)</label>
                            <span class="help-block error"></span>
                        </div>
                        <div class="form-group label-top">
                            <form:input path="phone" value="" class="label-top"/>
                            <label>Phone</label>
                            <span class="help-block error"></span>
                        </div>
                        <div class="form-group label-top">
                            <input type="password" name="rePassword" value="" class="label-top" required="required" data-validation="required">
                            <label>Confirm password (*)</label>
                            <span class="help-block error"></span>
                        </div>
                        <div class="form-group label-top">
                            <form:input path="nationality" value="" class="label-top"/>
                            <label>Quốc gia</label>
                            <span class="help-block error"></span>
                        </div>
                        <div class="form-group label-top">
                            <form:input path="passport" value="" class="label-top"/>
                            <label>Passport</label>
                            <span class="help-block error"></span>
                        </div>
                    </div>
                </div>
                <div class="form-footer">
                    <div class="row gap-10">
                        <div class="col-xs-6 col-sm-6 mbot-10">
                            <button type="submit" data-sitekey="" <%--data-callback="onRegisterSubmit"--%> class="btn btn-primary btn-block submit">Đăng Ký</button>
                        </div>
                        <div class="col-xs-6 col-sm-6 mbot-10">
                            <a type="submit" class="btn btn-danger btn-block" data-dismiss="modal" href="<c:url value='/trang-chu'/> ">Hủy
                            </a>
                        </div>
                    </div>
                    <div class="text-left">
                        Đã có tài khoản?
                        <a type="button" href="<c:url value='/dang-nhap'/>" class="btn btn-link">Đăng Nhập</a>
                    </div>
                </div>
            </form:form>
                <!-- <script type="text/javascript">
                    $.validate({
                        modules: 'html5',
                        errorMessageClass: 'error',
                        lang: locale
                    });
                </script> -->
            </div>
        </div>
    </div>
</div>
</body>
</html>
