<%@ include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:url var="tripAPI" value="/api/trip"/>
<c:url var="tripURL" value="/quan-tri/trip/danh-sach"/>
<c:url var="editTripURL" value="/quan-tri/trip/chinh-sua"/>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa </title>
</head>

<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs ace-save-state" id="breadcrumbs">
            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="<c:url value='/quan-tri/trang-chu' /> ">Trang chủ</a>
                </li>

                <li>
                    <a href="<c:url value='/quan-tri/trip/danh-sach?page=1&limit=5' />">Trip</a>
                </li>
                <c:if test="${not empty model.id}">
                    <li class="active">Chỉnh sửa </li>
                </c:if>
                <c:if test="${empty model.id}">
                    <li class="active">Thêm </li>
                </c:if>
            </ul>
        </div>
        <div class="page-content">
            <div class="row">
                <div class="col-xs-12">
                    <c:if test="${not empty message}">
                        <div class="alert alert-${alert}">
                            <button type="button" class="close" data-dismiss="alert">
                                <i class="ace-icon fa fa-times"></i>
                            </button>
                            <strong>${message}</strong>
                        </div>
                    </c:if>
                    <form:form class="form-horizontal" role="form" id="formSubmit" modelAttribute="model">
                        <div class="form-group">
                            <label for="tourName" class="col-sm-3 control-label no-padding-right">Tour</label>
                            <div class="col-sm-7">
                                <form:select path="tourName" id="tourName" cssClass="form-control col-xs-12 col-sm-5">
                                    <form:option disabled="true" value="" label="-- Chọn tour  --"/>
                                    <form:options items="${tours}"/>
                                </form:select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"> Code  </label>
                            <div class="col-sm-7">
                                <form:input path="code" cssClass="form-control col-xs-12 col-sm-5" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="departurePlace" class="col-sm-3 control-label no-padding-right" > Điểm xuất phát </label>
                            <div class="col-sm-7">
                                <form:select path="departurePlace" id="departurePlace" cssClass="form-control col-xs-12 col-sm-5">
                                    <form:option disabled="true" value="" label="-- Chọn điểm xuất phát --"/>
                                    <form:options items="${place}"/>
                                </form:select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"> Ngày đi </label>
                            <div class="col-sm-3">
                                <form:input cssClass="form-control date-picker" path="departureTime" type="date" data-date-format="dd-mm-yyyy" required="required"/>
                            </div>
                            <label class="col-sm-1 control-label no-padding-right"> Ngày về </label>
                            <div class="col-sm-3">
                                <form:input cssClass="form-control date-picker" path="returnTime" type="date" data-date-format="dd-mm-yyyy" required="required"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"> Giá người lớn </label>
                            <div class="col-sm-7">
                                <form:input path="adultPrice" cssClass="form-control col-xs-12 col-sm-5"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"> Giá trẻ em </label>
                            <div class="col-sm-7">
                                <form:input path="childPrice" cssClass="form-control col-xs-12 col-sm-5"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"> Giá trẻ sơ sinh </label>
                            <div class="col-sm-7">
                                <form:input path="infantPrice" cssClass="form-control col-xs-12 col-sm-5"/>
                            </div>
                        </div>
                        <form:hidden path="id" id="tripId" />
                        <div class="clearfix form-actions">
                            <div class="col-md-offset-3 col-md-9">
                                <c:if test="${not empty model.id}">
                                    <button class="btn btn-sm btn-success" type="button" id="btnAddOrUpdateTrip">
                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                        Cập nhật 
                                    </button>
                                </c:if>
                                <c:if test="${empty model.id}">
                                    <button class="btn btn-sm btn-success" type="button" id="btnAddOrUpdateTrip">
                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                        Thêm 
                                    </button>
                                </c:if>

                                &nbsp; &nbsp; &nbsp;
                                <c:if test="${not empty message}">
                                    <button class="btn btn-sm" type="button" id="btnCancel" onclick="window.location.href='<c:url value="/quan-tri/trip/danh-sach?page=1&limit=5"/>';">
                                        <i class="ace-icon fa fa-undo bigger-110"></i>
                                        Trở về
                                    </button>
                                </c:if>
                                <c:if test="${empty message}">
                                    <button class="btn btn-sm btn-danger" type="button" id="btnCancel" onclick="warningBeforeCancel()">
                                        <i class="ace-icon fa fa-times red2 bigger-110"></i>
                                        Hủy
                                    </button>
                                </c:if>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $('#btnAddOrUpdateTrip').click(function (e) {
        e.preventDefault();//submit chuẩn vào /api-admin-trip
        var data = {};
        var formData = $('#formSubmit').serializeArray();
        $.each(formData, function (i, v){
            data["" + v.name + ""] = v.value;
        });
        var id = $('#tripId').val();
        if(id == ""){
            addTrip(data);
        }
        else {
            updateTrip(data);
        }
    });
    function addTrip(data){
        $.ajax({
            url: '${tripAPI}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                window.location.href = "${editTripURL}?id="+result.id+"&message=insert_success";
            },
            error: function (error) {
                window.location.href = "${tripURL}?page=1&limit=5&message=error_system";
            }
        });
    }
    function updateTrip(data){
        $.ajax({
            url: '${tripAPI}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                window.location.href = "${editTripURL}?id="+result.id+"&message=update_success";
            },
            error: function (error) {
                window.location.href = "${tripURL}?page=1&limit=5&message=error_system";
            }
        });
    }
    function warningBeforeCancel(){
        swal({
            title: "Xác nhận",
            text: "Bạn có chắc muốn hủy bỏ thao tác này không?",
            icon: "warning",
            showCancelButton: true,
            confirmButtonClass: "btn-success",
            cancelButtonClass: "btn-danger",
            confirmButtonText: "Xác nhận",
            cancelButtonText: "Hủy",
        }).then((isConfirm) => {
            if(isConfirm.dismiss){
            }
            else {
                window.location.href = "${tripURL}?page=1&limit=5"
            }
        })
    }
</script>
</body>
</html>