<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<html>
<head>
    <!-- SITE TITTLE -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="fb:app_id" content="859491851234128" />
    <title>Blog
    </title>
    <!-- css -->
    <!-- PLUGINS CSS STYLE -->
    <link href="<c:url value='/template/web/css/jquery-ui.css'/>" rel="stylesheet">
    <link href="<c:url value='/template/web/css/bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/template/web/css/font-awesome.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/template/web/css/bootstrap-social.css'/>" rel="stylesheet">
    <link href="<c:url value='/template/web/css/select2.css'/>" rel="stylesheet">

    <link href="<c:url value='/template/web/css/slick.css'/>" rel="stylesheet">
    <link href="<c:url value='/template/web/css/slick-theme.css'/>" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="<c:url value='/template/web/css/settings.css'/>" media="screen">
    <link rel="stylesheet" type="text/css" href="<c:url value='/template/web/css/select_option1.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/template/web/css/datepicker.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/template/web/css/jquery.fancybox.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/template/web/css/isotope.css'/>">

    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;subset=vietnamese" rel="stylesheet">

    <!-- CUSTOM CSS -->

    <link href="<c:url value='/template/web/css/font.css'/>" rel="stylesheet">
    <link href="<c:url value='/template/web/css/style.css?v=20'/>" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/template/web/css/default.css'/>" id="option_color">

    <!-- FAVICON -->
    <link rel="shortcut icon" type="image/png" href="#" />
    <style>
        .map-vietnam {
            text-align: center;
        }

        .map-vietnam ul.region-content {
            margin: 0 auto;
            width: 300px;
        }

        .map-vietnam ul.region-content>li.region {
            float: left;
            height: 45px;
            width: 100%;
            margin: 15px 0;
        }

        .map-vietnam ul.region-content>li.region>.btn {
            line-height: 45px;
            height: 45px;
            width: 100%;
            padding: 0;
            text-align: center;
        }

        .mainContentSection,
        .whiteSection,
        .lightSection {
            padding-top: 30px;
        }
    </style>
    <link rel="stylesheet" href="<c:url value='/template/web/css/12195e8.css?v=20'/>" />

    <link href="<c:url value='/template/web/css/custom-style.css'/>" rel="stylesheet">

    <link rel="stylesheet" href="<c:url value='/template/web/css/f1d475a.css'/>" />
    <style>
        .buttonCustomPrimary {
            height: 34px !important;
            line-height: 34px !important;
        }

        @media (max-width: 480px) {
            .buttonCustomPrimary {
                height: 28px !important;
                line-height: 28px !important;
                font-size: 12px !important;
                width: 120px !important;
            }
            .tp-bullets.preview4 {
                display: none !important;
            }
        }
    </style>


    <!-- Google Tag Manager -->
    <script>
        (function(w, d, s, l, i) {
            w[l] = w[l] || [];
            w[l].push({
                'gtm.start': new Date().getTime(),
                event: 'gtm.js'
            });
            var f = d.getElementsByTagName(s)[0],
                j = d.createElement(s),
                dl = l != 'dataLayer' ? '&l=' + l : '';
            j.async = true;
            j.src =
                'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
            f.parentNode.insertBefore(j, f);
        })(window, document, 'script', 'dataLayer', 'GTM-WK3SZH6');
    </script>
    <!-- End Google Tag Manager -->



    <!-- JAVASCRIPTS -->
    <script src="<c:url value='/template/web/js/jquery.min.js'/>"></script>
    <script src="<c:url value='/template/web/js/jquery-ui.js'/>"></script>
    <script src="<c:url value='/template/web/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/template/web/js/jquery.themepunch.tools.min.js'/>"></script>
    <script src="<c:url value='/template/web/js/jquery.themepunch.revolution.min.js'/>"></script>

    <script src="<c:url value='/template/web/js/slick.js'/>"></script>

    <script src="<c:url value='/template/web/js/jquery.selectbox-0.1.3.min.js'/>"></script>
    <script src="<c:url value='/template/web/js/select2.full.js'/>"></script>
    <script src="<c:url value='/template/web/js/bootstrap-datepicker.js'/>"></script>
    <script src="<c:url value='/template/web/js/waypoints.min.js'/>"></script>
    <script src="<c:url value='/template/web/js/jquery.counterup.min.js'/>"></script>
    <script src="<c:url value='/template/web/js/isotope.min.js'/>"></script>
    <script src="<c:url value='/template/web/js/bootstrap-notify.min.js'/>"></script>
    <script src="<c:url value='/template/web/js/jquery.fancybox.pack.js'/>"></script>
    <script src="<c:url value='/template/web/js/isotope-triger.js'/>"></script>
    <script src="<c:url value='/template/web/js/jquery.syotimer.js'/>"></script>
    <script src="<c:url value='/template/web/js/SmoothScroll.js'/>"></script>
    <%--<script src="js/custom.js?v=20"></script>--%>
    <script src="<c:url value='/template/web/js/custom.js'/>"></script>
    <script src="<c:url value='/template/web/js/jquery.form-validator.min.js'/>"></script>


    <%--<script src='js/api.js?hl=vi'></script>--%>
    <script src='<c:url value='/template/web/js/api.js'/>'></script>

    <script src="<c:url value='/template/web/js/b9d3555.js'/>"></script>
    <script src="<c:url value='/template/web/paging/jquery.twbsPagination.js'/>"></script>

</head>
<body class="changeHeader">
<%@ include file="/common/web/header.jsp" %>

<dec:body/>

<%@ include file="/common/web/footer.jsp" %>
</body>
</html>

