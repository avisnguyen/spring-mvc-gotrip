<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<html>
<head>
    <title>Đăng nhập</title>
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
        <div class="login clearfix">
            <h4 class="text-center title">Đăng Nhập</h4>
            <c:if test="${param.incorrectAccount != null}">
                <div class="alert alert-danger">
                    <button type="button" class="close" data-dismiss="alert">
                        <i class="ace-icon fa fa-times"></i>
                    </button>
                    <b>Email hoặc mật khẩu không chính xác.</b>
                </div>
            </c:if>
            <c:if test="${param.accessDenied != null}">
                <div class="alert alert-danger">
                    <button type="button" class="close" data-dismiss="alert">
                        <i class="ace-icon fa fa-times"></i>
                    </button>
                    <b>Bạn không có quyền truy cập</b>
                </div>
            </c:if>
            <c:if test="${not empty message}">
                <div class="alert alert-${alert}">
                    <button type="button" class="close" data-dismiss="alert">
                        <i class="ace-icon fa fa-times"></i>
                    </button>
                    <b>${message}</b>
                </div>
            </c:if>
            <div class="col-md-12 col-xs-12">
                <form id="login-form" action="j_spring_security_check" method="post" id="formLogin" novalidate class="has-validation-callback">
                    <div class="form-content">
                        <div class="form-group label-top">
                            <input class="label-top" type="email" name="j_email" id="user_name" required="required" data-validation="required" value="${user.email}">
                            <label for="user_name">Địa chỉ email</label>
                        </div>
                        <div class="form-group label-top">
                            <input id="login_password" class="label-top" type="password" name="j_password" required="required" data-validation="required" value="${user.password}">
                            <label for="login_password">Mật khẩu</label>
                            <span class="error"></span>
                        </div>
                        <div class="form-group">
                            <div class="row gap-5">
                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <div class="checkbox-block font-icon-checkbox">
                                        <input name="_spring_security_remember_me" class="checkbox" value="1" type="checkbox" id="remember-me">
                                        <label class="" for="remember-me">Ghi nhớ</label>
                                    </div>
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                    <a type="button" href="#" class="btn btn-link">Quên mật khẩu?</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-footer">
                        <div class="row gap-10">
                            <div class="col-xs-6 col-sm-6 mbot-10">
                                <button type="submit" data-sitekey="" data-callback="onLoginSubmit" class="btn btn-primary btn-block submit">Đăng Nhập</button>
                            </div>
                            <div class="col-xs-6 col-sm-6 mbot-10">
                                <a type="submit" class="btn btn-danger btn-block" href="<c:url value='/trang-chu'/> " data-dismiss="modal">Hủy
                                </a>
                            </div>
                        </div>
                        <div class="text-left">
                            Chưa có tài khoản?
                            <a type="button" href="<c:url value='/dang-ky'/> " class="btn btn-link">Đăng Ký</a>
                        </div>
                    </div>
                </form>
                <%--<script type="text/javascript">
                    $.validate({
                        modules: 'html5',
                        errorMessageClass: 'error',
                        lang: locale
                    });
                </script>--%>
            </div>
        </div>
    </div>
</div>
</body>
</html>
