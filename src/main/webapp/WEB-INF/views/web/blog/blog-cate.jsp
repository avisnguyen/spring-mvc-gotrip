<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<html>
<head>
    <title>Blog</title>
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
<form action='<c:url value="/blog"/>' id="formSubmit" method="get">
    <section class="pageTitle" style="background-image:url(<c:url value="/template/web/image/${categoryModel.thumbnailUrl}"/> );">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="titleTable">
                        <div class="titleTableInner">
                            <div class="pageTitleInfo">
                                <h1>${categoryModel.name}</h1>
                                <div class="under-border"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- WHITE SECTION FILTER-->
    <section class="mainContentSection">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="media blogPostListItem" style="overflow: hidden">
                        <div class="media-body">
                            <p> Danh sách bài viết: ${categoryModel.name}</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row marginExten">
                <div class="container">
                    <div class="row marginExten">
                        <c:forEach var="item" items="${model.listResult}">
                            <div class="col-sm-3 col-xs-6">
                                <div class="thumbnail citiesContent country-destination">
                                    <c:url var="BlogDetails" value="/blog/${item.categoryCode}">
                                        <c:param name="id" value="${item.id}"/>
                                    </c:url>
                                    <div class="caption">
                                        <div class="media item-destination">
                                            <a class="media-left image-box-relative image-box-3x2 image-box-center" href="${BlogDetails}" style="padding-right: 0 !important;">
                                                <img class="media-object" src="<c:url value='/template/web/image/${item.thumbnail}'/>" style="border-radius: 3px;" alt="Image">
                                            </a>
                                            <div class="media-body info-destination">
                                                <a href="${BlogDetails}" class="media-heading title-destination">${item.title}</a>
                                                <p class="content-destination">
                                                        ${item.shortDescription}
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <div class="row marginExten"></div>
                    </div>
                </div>
                <%--<div class="row">
                    <div class="col-xs-12">
                        <div class="paginationCenter">
                            <ul class="pagination" id="pagination"></ul>
                            <input type="hidden" value="" id="page" name="page"/>
                            <input type="hidden" value="" id="limit" name="limit"/>
                        </div>
                    </div>
                </div>--%>
            </div>
        </div>
    </section>
</form>
<%--<script>
    var currentPage = ${model.page};
    var totalPage = ${model.totalPage};
    $(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: totalPage,
            visiblePages: 5,
            startPage: currentPage,
            onPageClick: function (event, page) {
                if (currentPage != page) {
                    $('#limit').val(8);
                    $('#page').val(page);
                    $('#formSubmit').submit();
                }
            }
        })
    });
</script>--%>
</body>
</html>
