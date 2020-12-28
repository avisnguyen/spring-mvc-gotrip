<%@ include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:url var="placeAPI" value="/api/place"/>
<c:url var="placeURL" value="/quan-tri/dia-diem/danh-sach"/>
<c:url var="editPlaceURL" value="/quan-tri/dia-diem/chinh-sua"/>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa bài viết</title>
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
                    <a href="<c:url value='/quan-tri/dia-diem/danh-sach?page=1&limit=10' />">Địa điểm</a>
                </li>
                <c:if test="${not empty model.id}">
                    <li class="active">Chỉnh sửa địa điểm</li>
                </c:if>
                <c:if test="${empty model.id}">
                    <li class="active">Thêm địa điểm</li>
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
                            <label for="parentPlaceCode" class="col-sm-3 control-label no-padding-right">Khu vực</label>
                            <div class="col-sm-7">
                                <form:select path="parentPlaceCode" id="parentPlaceCode" cssClass="form-control col-xs-12 col-sm-5">
                                    <form:option disabled="true" value="" label="-- Chọn khu vực --"/>
                                    <form:options items="${parentPlaces}"/>
                                </form:select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"> Tên địa điểm </label>
                            <div class="col-sm-7">
                                <form:input path="name" cssClass="form-control col-xs-12 col-sm-5" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" > Link ảnh đại diện </label>
                            <div class="col-sm-7">
                                <form:input path="thumbnailUrl" class="form-control col-xs-12 col-sm-5"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="description" class="col-sm-3 control-label no-padding-right">Mô tả</label>
                            <div class="col-sm-7">
                                <form:textarea path="description" rows="3" cols="2" id="description" cssClass="form-control col-xs-12 col-sm-5"/>
                            </div>
                        </div>
                        <form:hidden path="id" id="placeId" />
                        <div class="clearfix form-actions">
                            <div class="col-md-offset-3 col-md-9">
                                <c:if test="${not empty model.id}">
                                    <button class="btn btn-sm btn-success" type="button" id="btnAddOrUpdatePlace">
                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                        Cập nhật bài viết
                                    </button>
                                </c:if>
                                <c:if test="${empty model.id}">
                                    <button class="btn btn-sm btn-success" type="button" id="btnAddOrUpdatePlace">
                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                        Thêm bài viết
                                    </button>
                                </c:if>

                                &nbsp; &nbsp; &nbsp;
                                <c:if test="${not empty message}">
                                    <button class="btn btn-sm" type="button" id="btnCancel" onclick="window.location.href='<c:url value="/quan-tri/dia-diem/danh-sach?page=1&limit=10"/>';">
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
    $('#btnAddOrUpdatePlace').click(function (e) {
        e.preventDefault();//submit chuẩn vào /api-admin-place
        var data = {};
        var formData = $('#formSubmit').serializeArray();
        $.each(formData, function (i, v){
            data["" + v.name + ""] = v.value;
        });
        var id = $('#placeId').val();
        if(id == ""){
            addPlace(data);
        }
        else {
            updatePlace(data);
        }
    });
    function addPlace(data){
        $.ajax({
            url: '${placeAPI}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                window.location.href = "${editPlaceURL}?id="+result.id+"&message=insert_success";
            },
            error: function (error) {
                window.location.href = "${placeURL}?page=1&limit=10&message=error_system";
            }
        });
    }
    function updatePlace(data){
        $.ajax({
            url: '${placeAPI}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                window.location.href = "${editPlaceURL}?id="+result.id+"&message=update_success";
            },
            error: function (error) {
                window.location.href = "${placeURL}?page=1&limit=10&message=error_system";
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
                window.location.href = "${placeURL}?page=1&limit=10"
            }
        })
    }
</script>
</body>
</html>