<%@ include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:url var="userAPI" value="/api/user"/>
<c:url var="userURL" value="/quan-tri/nguoi-dung/danh-sach"/>
<c:url var="editUserURL" value="/quan-tri/nguoi-dung/chinh-sua"/>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa người dùng</title>
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
                    <a href="<c:url value='/quan-tri/nguoi-dung/danh-sach?page=1&limit=10' />">Người dùng</a>
                </li>
                <c:if test="${not empty model.id}">
                    <li class="active">Chỉnh sửa người dùng</li>
                </c:if>
                <c:if test="${empty model.id}">
                    <li class="active">Thêm người dùng</li>
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
                                <label for="roleCode" class="col-sm-3 control-label no-padding-right">Quyền(*)</label>
                                <div class="col-sm-7">
                                    <form:checkboxes path="roleCode" class="roleCode" items="${role}" checked=""/>
                                </div>
                            </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"> First Name (*) </label>
                            <div class="col-sm-7">
                                <form:input path="firstName" cssClass="form-control col-xs-12 col-sm-5" required="required"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"> Last Name (*)</label>
                            <div class="col-sm-7">
                                <form:input path="lastName" cssClass="form-control col-xs-12 col-sm-5" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" > Email (*)</label>
                            <div class="col-sm-7">
                                <form:input path="email" class="form-control col-xs-12 col-sm-5" readonly="${model.id != null ? 'true' : 'false'}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" > SĐT </label>
                            <div class="col-sm-7">
                                <form:input path="phone" class="form-control col-xs-12 col-sm-5"/>
                            </div>
                        </div>
                        <c:if test="${empty model.id}">
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Mật khẩu (*)</label>
                                <div class="col-sm-7">
                                    <form:password path="password" cssClass="form-control col-xs-12 col-sm-5"/>
                                </div>
                            </div>
                        </c:if>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Giới tính (*)</label>
                            <div class="col-sm-7">
                                <form:select path="sex" cssClass="form-control col-xs-12 col-sm-5">
                                    <form:option disabled="true" value="" label="-- Giới tính --"/>
                                    <form:option value="Nam" label="Nam"/>
                                    <form:option value="Nữ" label="Nữ"/>
                                    <form:option value="Khác" label="Khác"/>
                                </form:select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Địa chỉ</label>
                            <div class="col-sm-7">
                                <form:input path="address" cssClass="form-control col-xs-12 col-sm-5"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Quốc tịch</label>
                            <div class="col-sm-7">
                                <form:input path="nationality" cssClass="form-control col-xs-12 col-sm-5"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Passport</label>
                            <div class="col-sm-7">
                                <form:input path="passport" cssClass="form-control col-xs-12 col-sm-5"/>
                            </div>
                        </div>
                        <form:hidden path="id" id="userId" />
                        <form:hidden path="status" />
                        <div class="clearfix form-actions">
                            <div class="col-md-offset-3 col-md-9">
                                <c:if test="${not empty model.id}">
                                    <button class="btn btn-sm btn-success" type="button" id="btnAddOrUpdateUser">
                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                        Cập nhật người dùng
                                    </button>
                                </c:if>
                                <c:if test="${empty model.id}">
                                    <button class="btn btn-sm btn-success" type="button" id="btnAddOrUpdateUser">
                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                        Thêm người dùng
                                    </button>
                                </c:if>

                                &nbsp; &nbsp; &nbsp;
                                <c:if test="${not empty message}">
                                    <button class="btn btn-sm" type="button" id="btnCancel" onclick="window.location.href='<c:url value="/quan-tri/nguoi-dung/danh-sach?page=1&limit=10"/>';">
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
    var roleCode = [];

    [...document.getElementsByClassName("roleCode")].forEach(item => {
        item.addEventListener('click', ev => {
            let index = roleCode.indexOf(ev.target.getAttribute('value'));
            if (roleCode.indexOf(ev.target.getAttribute('value')) === -1)
                roleCode.push(ev.target.getAttribute('value'));
            else
                roleCode.splice(index, 1);

            console.log(roleCode);
        })
    })
    $('#btnAddOrUpdateUser').click(function (e) {
        e.preventDefault();//submit chuẩn vào /api-admin-user
        var data = {};
        var formData = $('#formSubmit').serializeArray();
        $.each(formData, function (i, v){
            if(v.name != "roleCode"){
                data["" + v.name + ""] = v.value;
            }
        });
        data["roleCode"] = roleCode;
        var id = $('#userId').val();
        if(id == ""){
            addUser(data);
        }
        else {
            updateUser(data);
        }
    });
    function addUser(data){
        $.ajax({
            url: '${userAPI}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                window.location.href = "${editUserURL}?id="+result.id+"&message=insert_success";
            },
            error: function (error) {
                window.location.href = "${userURL}?page=1&limit=10&message=error_system";
            }
        });
    }
    function updateUser(data){
        $.ajax({
            url: '${userAPI}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                window.location.href = "${editUserURL}?id="+result.id+"&message=update_success";
                /*console.log(data);*/
            },
            error: function (error) {
                window.location.href = "${userURL}?page=1&limit=10&message=error_system";
                /*console.log(data);*/
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
                window.location.href = "${userURL}?page=1&limit=10"
            }
        })
    }
</script>
</body>
</html>