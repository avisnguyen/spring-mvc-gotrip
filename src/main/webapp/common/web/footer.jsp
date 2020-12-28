<%--
  Created by IntelliJ IDEA.
  User: Jstit'sPC
  Date: 09/17/2020
  Time: 10:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<footer>
    <div class="footer clearfix">
        <div class="container">
            <div class="row">
                <div class="col-md-5 col-sm-4 col-xs-12">
                    <div class="info-sgt-box">
                        <div class="info-sgt-logo">
                            <img class="image-info-footer" src="<c:url value='/template/web/image/logo2_footer.png'/>" alt="image commitment" />
                        </div>
                        <div class="info-sgt-title">
                            Lữ hành GoTrip, quảng bá tour du lịch
                        </div>
                    </div>
                </div>
                <div class="col-md-7 col-sm-8 col-xs-12">
                    <div class="row">
                        <div class="col-sm-4 col-xs-12">
                            <div class="footerContent info-sgt-box">
                                <h5>DỊCH VỤ</h5>
                                <ul>
                                    <li><a class="link-level4-light" href="#">Tour trong nước</a></li>
                                    <li><a class="link-level4-light" href="#">Tour nước ngoài</a></li>
                                    <li><a class="link-level4-light" href="#">Vé máy bay</a></li>
                                </ul>
                            </div>
                            <div class="footerContent info-sgt-box">
                                <h5>CHĂM SÓC KHÁCH HÀNG</h5>
                                <ul>
                                    <li><a class="link-level4-light" href="#">Ý kiến khách hàng </a></li>
                                    <li><a class="link-level4-light" href="#">Phiếu góp ý</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-4 col-xs-12">
                            <div class="footerContent info-sgt-box">
                                <h5>LIÊN HỆ</h5>
                                <ul>
                                    <li><a class="link-level4-light" href="#">Tổng đài: 1900 1234</a></li>
                                    <li><a class="link-level4-light" href="#">Email: info@gotrip.com</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal View Region-->

    <div class="modal fade" id="region" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                        <span class="sr-only">Close</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel" style="font-family: 'Lato Light'; text-transform: none">
                        Bạn ở khu vực?
                    </h4>
                </div>
                <!-- Modal Body -->
                <div class="modal-body region" style="display: table; width: 100%">
                    <div class="map-vietnam">
                        <ul class="region-content">
                            <li class="region">
                                <button class="btn btn-success" onclick="updateRegion(2)">Miền Nam
                                </button>
                            </li>
                            <li class="region">
                                <button class="btn btn-success" onclick="updateRegion(5)">Miền Bắc
                                </button>
                            </li>
                            <li class="region">
                                <button class="btn btn-success" onclick="updateRegion(6)">Miền Tây
                                </button>
                            </li>
                            <li class="region">
                                <button class="btn btn-success" onclick="updateRegion(7)">Miền Trung
                                </button>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<%--<script type="text/javascript">
    $("#region").modal('show');
</script>--%>

<script type="text/javascript">
    function onLoginSubmit(token) {
        document.getElementById("login-form").submit();
    }

    function onRegisterSubmit(token) {
        document.getElementById("register-form").submit();
    }

    function updateRegion(id) {
        $.ajax({
            type: "POST",
            url: '/update-region',
            data: {
                'id': id
            },
            success: function(data) {
                $("#region").modal('hide');
                location.reload();
            },
            error: function() {
                alert('Hệ thống đang bận vui lòng thử lại sau ít phút!');
            }
        });
    }

    $("#submit-recive").click(function() {
        $("#form-recive-email").submit();
    });
    $(".navbar-right .singleDrop, .navbar-right .megaDropMenu").click(function(e) {
        e.stopPropagation();
    });

    // search tour kiritm

    // suggestion
    function showResult(e, str) {}

    var delay = (function() {
        var timer = 0;
        return function(callback, ms) {
            clearTimeout(timer);
            timer = setTimeout(callback, ms);
        };
    })();

    function checkSubmitSearch(e) {
        //See notes about 'which' and 'key'
        if (e.keyCode == 13) {
            $('#searchFormKiritm').submit();
        }
    }

    function onkeyDownSearch(e) {
        //close suggestion
        if (e.keyCode == 9) {
            $('#showSuggestion').addClass('hidden-cls');
        }
    }

    //============================== Event search =========================
    var markClose = jQuery("#markclose");
    var advanceSearch = jQuery("#advanceSearchKiritm");
    jQuery("#searchboxkiritm").click(function() {
        if (markClose.hasClass("hidden-cls")) {
            markClose.removeClass("hidden-cls");
        }
        if (advanceSearch.hasClass("hidden-cls")) {
            advanceSearch.removeClass("hidden-cls");
        }
    });
    jQuery("#markclose").click(function() {
        if (!markClose.hasClass("hidden-cls")) {
            markClose.addClass("hidden-cls");
        }
        if (!advanceSearch.hasClass("hidden-cls")) {
            advanceSearch.addClass("hidden-cls");
        }
        $('#showSuggestion').addClass('hidden-cls');
    });


    //layout website


    var markCloseLayout = jQuery("#markcloseLayout");
    var advanceSearchLayout = jQuery("#contentSearchboxlayout");
    jQuery("#buttonSearchLayout").click(function() {
        if (markCloseLayout.hasClass("hidden-cls")) {
            markCloseLayout.removeClass("hidden-cls");
        }
        if (advanceSearchLayout.hasClass("hidden-cls")) {
            advanceSearchLayout.removeClass("hidden-cls");
        }
    });
    jQuery("#markcloseLayout").click(function() {
        if (!markCloseLayout.hasClass("hidden-cls")) {
            markCloseLayout.addClass("hidden-cls");
        }
        if (!advanceSearchLayout.hasClass("hidden-cls")) {
            advanceSearchLayout.addClass("hidden-cls");
        }
    });

    function checkSubmitSearchLayout(e) {
        //See notes about 'which' and 'key'
        if (e.keyCode == 13) {
            $('#searchFormKiritmLayout').submit();
        }
    }

    //datepicker searchbox
    $('#toDateSearchBoxLayout').datepicker({
        format: 'dd/mm/yyyy',
        autoclose: true,
        orientation: 'top auto',
        todayBtn: 'linked',
        todayHighlight: true
    });
    $('#fromDateSearchBoxLayout').datepicker({
        format: 'dd/mm/yyyy',
        autoclose: true,
        orientation: 'top auto',
        todayBtn: 'linked',
        todayHighlight: true
    }).on('changeDate', function(selected) {
        var minDate = new Date(selected.date.valueOf());
        $('#toDateSearchBoxLayout').datepicker('setStartDate', minDate);
    });


    //layout mobile


    var markCloseLayoutMobile = jQuery("#markcloseLayoutMobile");
    var advanceSearchLayoutMobile = jQuery("#contentSearchLayoutMobile");
    jQuery("#inputSearchLayoutMobile").click(function() {
        if (markCloseLayoutMobile.hasClass("hidden-cls")) {
            markCloseLayoutMobile.removeClass("hidden-cls");
        }
        if (advanceSearchLayoutMobile.hasClass("hidden-cls")) {
            advanceSearchLayoutMobile.removeClass("hidden-cls");
        }
    });
    jQuery("#markcloseLayoutMobile").click(function() {
        if (!markCloseLayoutMobile.hasClass("hidden-cls")) {
            markCloseLayoutMobile.addClass("hidden-cls");
        }
        if (!advanceSearchLayoutMobile.hasClass("hidden-cls")) {
            advanceSearchLayoutMobile.addClass("hidden-cls");
        }
    });

    function checkSubmitSearchLayoutMobile(e) {
        //See notes about 'which' and 'key'
        if (e.keyCode == 13) {
            $('#searchFormLayoutMobile').submit();
        }
    }

    //datepicker searchbox
    $('#toDateSearchBoxLayoutMobile').datepicker({
        format: 'dd/mm/yyyy',
        autoclose: true,
        orientation: 'top auto',
        todayBtn: 'linked',
        todayHighlight: true
    });
    $('#fromDateSearchBoxLayoutMobile').datepicker({
        format: 'dd/mm/yyyy',
        autoclose: true,
        orientation: 'top auto',
        todayBtn: 'linked',
        todayHighlight: true
    }).on('changeDate', function(selected) {
        var minDate = new Date(selected.date.valueOf());
        $('#toDateSearchBoxLayoutMobile').datepicker('setStartDate', minDate);
    });
</script>
