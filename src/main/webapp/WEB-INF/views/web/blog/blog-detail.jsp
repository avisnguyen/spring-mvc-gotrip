<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Blog - ${model.title}</title>
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
<section>
    <div class="pageTitle page-image-tour-tag"
         style="background-image:url(<c:url value='/template/web/image/${model.thumbnail}'/>);">
    </div>
    <div class="container" style="position: relative">
        <div class="background-description">
            <h1 class="tour-banner-title">${model.title}</h1>
        </div>
    </div>
</section>
<section class="mainContentSection singlePackage">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div role="tabpanel" class="countryTabs">
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active">
                            <div class="row">
                                <div class="col-sm-9 col-xs-12">
                                    <div class="commonInfo">
                                        <div>
                                            <blockquote>
                                                <p style="margin-left: 22.5pt; text-align: justify;">
                                                    <strong>${model.shortDescription}</strong></p>
                                            </blockquote>

                                            <p style="margin-left: 22.5pt; text-align: justify;">${model.content}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3 col-xs-12 hide-in-mobile">

                                    <aside>
                                        <div role="tabpanel" class="tabArea">
                                            <!-- Nav tabs -->
                                            <ul class="nav nav-tabs nav-justified" role="tablist">
                                                <li role="presentation" class="active">
                                                    <a href="#new" aria-controls="new" role="tab" data-toggle="tab"
                                                       aria-expanded="true">TIN MỚI</a>
                                                </li>
                                            </ul>
                                            <!-- Tab panes -->
                                            <div class="tab-content">
                                                <div role="tabpanel" class="tab-pane active" id="new">

                                                    <c:forEach var="item" items="${newPost}" end="4">
                                                        <c:url var="BlogDetails" value="/blog/${item.categoryCode}">
                                                            <c:param name="id" value="${item.id}"/>
                                                        </c:url>
                                                        <div class="media ">
                                                            <a class="media-left" href="<c:url value="${BlogDetails}"/> ">
                                                                <img class="media-object" style="border-radius: 4px"
                                                                     width="70px" src="<c:url value="/template/web/image/${item.thumbnail}"/> " alt="Image">
                                                            </a>
                                                            <div class="media-body">
                                                                <h4><a href="<c:url value="${BlogDetails}"/>" class="media-heading">${item.title}</a>
                                                                </h4>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </aside>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--<div class="row">
            <div class="col-xs-12">
                <div class="relatedProduct">
                    <h2>Tin mới</h2>
                    <div class="row">
                        <c:forEach var="item" items="${newPost}" end="2">
                            <c:url var="BlogDetails" value="/blog/${item.categoryCode}">
                                <c:param name="id" value="${item.id}"/>
                            </c:url>
                            <div class="col-sm-4 col-xs-12">
                                <div class="relatedItem image-box-relative image-box-3x2 image-box-center">
                                    <img style="border-radius: 5px"
                                         src="<c:url value='/template/web/image/${item.thumbnail}'/> "
                                         width="360" alt="related image">
                                    <div class="maskingInfo">
                                        <h4>${item.title}</h4>
                                        <a href="${BlogDetails}"
                                           class="btn buttonTransparent">Xem thêm</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <br/>
        <br/>--%>
        <div class="row">
            <div class="col-xs-12">
                <div class="relatedProduct">
                    <h2><u>Category: ${model.categoryName}</u></h2>
                    <div class="row">
                        <c:forEach var="item" items="${postOfCate}" end="2">
                            <c:url var="BlogDetails" value="/blog/${item.categoryCode}">
                                <c:param name="id" value="${item.id}"/>
                            </c:url>
                            <div class="col-sm-4 col-xs-12">
                                <div class="relatedItem image-box-relative image-box-3x2 image-box-center">
                                    <img style="border-radius: 5px"
                                         src="<c:url value='/template/web/image/${item.thumbnail}'/> "
                                         width="360" alt="related image">
                                    <div class="maskingInfo">
                                        <h4>${item.title}</h4>
                                        <a href="${BlogDetails}"
                                           class="btn buttonTransparent">Xem thêm</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</section>
</body>
</html>
