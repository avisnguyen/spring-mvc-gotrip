<%@ include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:url var="postAPI" value="/api/post"/>
<c:url var="postURL" value="/quan-tri/bai-viet/danh-sach"/>
<c:url var="editPostURL" value="/quan-tri/bai-viet/chinh-sua"/>
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
                    <a href="<c:url value='/quan-tri/bai-viet/danh-sach?page=1&limit=5' />">Bài viết</a>
                </li>
                <c:if test="${not empty model.id}">
                    <li class="active">Chỉnh sửa bài viết</li>
                </c:if>
                <c:if test="${empty model.id}">
                    <li class="active">Thêm bài viết</li>
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
                            <label for="categoryCode" class="col-sm-3 control-label no-padding-right">Thể loại</label>
                            <div class="col-sm-7">
                                <form:select path="categoryCode" id="categoryCode" cssClass="form-control col-xs-12 col-sm-5">
                                    <form:option disabled="true" value="" label="-- Chọn loại bài viết --"/>
                                    <form:options items="${categories}"/>
                                </form:select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"> Tên bài viết </label>
                            <div class="col-sm-7">
                                <form:input path="title" cssClass="form-control col-xs-12 col-sm-5" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" > Link ảnh đại diện </label>
                            <div class="col-sm-7">
                                <form:input path="thumbnail" class="form-control col-xs-12 col-sm-5"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="shortDescription" class="col-sm-3 control-label no-padding-right">Mô tả ngắn</label>
                            <div class="col-sm-7">
                                <form:textarea path="shortDescription" rows="2" cols="2" id="shortDescription" cssClass="form-control col-xs-12 col-sm-5"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="content" class="col-sm-3 control-label no-padding-right">Nội dung</label>
                            <div class="col-sm-7">
                                <textarea name="content" rows="" cols="" id="content" cssClass="form-control col-xs-12 col-sm-5" style="width: 970px; height: 302px">${model.content}</textarea>
                            </div>
                        </div>
                        <form:hidden path="id" id="postId" />
                        <div class="clearfix form-actions">
                            <div class="col-md-offset-3 col-md-9">
                                <c:if test="${not empty model.id}">
                                    <button class="btn btn-sm btn-success" type="button" id="btnAddOrUpdatePost">
                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                        Cập nhật bài viết
                                    </button>
                                </c:if>
                                <c:if test="${empty model.id}">
                                    <button class="btn btn-sm btn-success" type="button" id="btnAddOrUpdatePost">
                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                        Thêm bài viết
                                    </button>
                                </c:if>

                                &nbsp; &nbsp; &nbsp;
                                <c:if test="${not empty message}">
                                    <button class="btn btn-sm" type="button" id="btnCancel" onclick="window.location.href='<c:url value="/quan-tri/bai-viet/danh-sach?page=1&limit=5"/>';">
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
    var editor = ' ';
    $(document).ready(function (){
        editor = CKEDITOR.replace('content');
    })
    $('#btnAddOrUpdatePost').click(function (e) {
        e.preventDefault();//submit chuẩn vào /api-admin-post
        var data = {};
        var formData = $('#formSubmit').serializeArray();
        $.each(formData, function (i, v){
            data["" + v.name + ""] = v.value;
        });
        data["content"] = editor.getData();
        var id = $('#postId').val();
        if(id == ""){
            addPost(data);
        }
        else {
            updatePost(data);
        }
    });
    function addPost(data){
        $.ajax({
            url: '${postAPI}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                window.location.href = "${editPostURL}?id="+result.id+"&message=insert_success";
            },
            error: function (error) {
                window.location.href = "${postURL}?page=1&limit=5&message=error_system";
            }
        });
    }
    function updatePost(data){
        $.ajax({
            url: '${postAPI}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                window.location.href = "${editPostURL}?id="+result.id+"&message=update_success";
            },
            error: function (error) {
                window.location.href = "${postURL}?page=1&limit=5&message=error_system";
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
                window.location.href = "${postURL}?page=1&limit=5"
            }
        })
    }
</script>
</body>
</html>