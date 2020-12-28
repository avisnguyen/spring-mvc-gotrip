<%@ include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:url var="parentPlaceAPI" value="/api/parentPalce"/>
<c:url var="parentPlaceURL" value="/quan-tri/khu-vuc/danh-sach"/>
<c:url var="editParentPlaceURL" value="/quan-tri/khu-vuc/chinh-sua"/>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa</title>
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
                    <a href="<c:url value='/quan-tri/khu-vuc/danh-sach?page=1&limit=10' />">Khu vực</a>
                </li>
                <c:if test="${not empty model.id}">
                    <li class="active">Chỉnh sửa</li>
                </c:if>
                <c:if test="${empty model.id}">
                    <li class="active">Thêm</li>
                </c:if>
            </ul><!-- /.breadcrumb -->
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
                            <label class="col-sm-3 control-label no-padding-right">Tên</label>
                            <div class="col-sm-7">
                                <form:input path="name" cssClass="form-control col-xs-12 col-sm-5" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"> Code </label>
                            <div class="col-sm-7">
                                <form:input path="code" cssClass="form-control col-xs-12 col-sm-5" />
                            </div>
                        </div>
                        <form:hidden path="id" id="parentPlaceId" />
                        <div class="clearfix form-actions">
                            <div class="col-md-offset-3 col-md-9">
                                <c:if test="${not empty model.id}">
                                    <button class="btn btn-sm btn-success" type="button" id="btnAddOrUpdateParentPlace">
                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                        Cập nhật
                                    </button>
                                </c:if>
                                <c:if test="${empty model.id}">
                                    <button class="btn btn-sm btn-success" type="button" id="btnAddOrUpdateParentPlace">
                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                        Thêm
                                    </button>
                                </c:if>

                                &nbsp; &nbsp; &nbsp;
                                <c:if test="${not empty message}">
                                    <button class="btn btn-sm" type="button" id="btnCancel" onclick="window.location.href='<c:url value="/quan-tri/khu-vuc/danh-sach?page=1&limit=10"/>';">
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
    $('#btnAddOrUpdateParentPlace').click(function (e) {
        e.preventDefault();
        var data = {};
        var formData = $('#formSubmit').serializeArray();
        $.each(formData, function (i, v){
            data["" + v.name + ""] = v.value;
        });
        var id = $('#parentPlaceId').val();
        if(id == ""){
            addCate(data);
        }
        else {
            updateCate(data);
        }
    });
    function addCate(data){
        $.ajax({
            url: '${parentPlaceAPI}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                window.location.href = "${editParentPlaceURL}?id="+result.id+"&message=insert_success";
            },
            error: function (error) {
                window.location.href = "${parentPlaceURL}?page=1&limit=10&message=error_system";
            }
        });
    }
    function updateCate(data){
        $.ajax({
            url: '${parentPlaceAPI}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                window.location.href = "${editParentPlaceURL}?id="+result.id+"&message=update_success";
            },
            error: function (error) {
                window.location.href = "${parentPlaceURL}?page=1&limit=10&message=error_system";
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
                window.location.href = "${parentPlaceURL}?page=1&limit=10"
            }
        })
    }
</script>
</body>

</html>