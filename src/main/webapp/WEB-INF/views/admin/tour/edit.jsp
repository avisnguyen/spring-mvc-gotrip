<%@ include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:url var="tourAPI" value="/api/tour"/>
<c:url var="tourURL" value="/quan-tri/tour/danh-sach"/>
<c:url var="editTourURL" value="/quan-tri/tour/chinh-sua"/>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa tour</title>
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
                    <a href="<c:url value='/quan-tri/tour/danh-sach?page=1&limit=5' />">Tour</a>
                </li>
                <c:if test="${not empty model.id}">
                    <li class="active">Chỉnh sửa tour</li>
                </c:if>
                <c:if test="${empty model.id}">
                    <li class="active">Thêm tour</li>
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
                            <label class="col-sm-3 control-label no-padding-right"> Tên tour </label>
                            <div class="col-sm-7">
                                <form:input path="name" cssClass="form-control col-xs-12 col-sm-5" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"> Tiêu đề nhỏ </label>
                            <div class="col-sm-7">
                                <form:input path="subtitle" cssClass="form-control col-xs-12 col-sm-5" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" > Link ảnh đại diện </label>
                            <div class="col-sm-7">
                                <form:input path="thumbnailUrl" class="form-control col-xs-12 col-sm-5"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="placeName" class="col-sm-3 control-label no-padding-right"> Địa danh(*)</label>
                            <div class="col-sm-7">
                                <%--<c:forEach var="i" items="${model.placeName}">
                                    <c:if test="${i != null}">
                                        <c:forEach var="item" items="${place}">
                                        <form:checkbox path="placeName" value="${item.value}" label="${item.value}" checked="checked"/>
                                        </c:forEach>
                                    </c:if>
                                </c:forEach>--%>
                                <%--<c:forEach var="item" items="${place}">
                                    <form:checkbox path="placeName" value="${item.value}" label="${item.value}" checked="checked"/>
                                </c:forEach>--%>
                                <form:checkboxes path="placeName" class="placeName" items="${place}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="departure" class="col-sm-3 control-label no-padding-right">Nơi đi (*) </label>
                            <div class="col-sm-3">
                                <form:select path="departure" id="departure" cssClass="form-control col-xs-12 col-sm-5">
                                    <form:option disabled="true" value="" label="-- Chọn nơi đi --"/>
                                    <form:options items="${place}"/>
                                </form:select>
                            </div>
                            <label for="destination" class="col-sm-1 control-label no-padding-right">Nơi đến (*) </label>
                            <div class="col-sm-3">
                                <form:select path="destination" id="destination" cssClass="form-control col-xs-12 col-sm-5">
                                    <form:option disabled="true" value="" label="-- Chọn nơi đến --"/>
                                    <form:options items="${place}"/>
                                </form:select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"> Thời gian </label>
                            <div class="col-sm-7">
                                <form:input path="duringTime" cssClass="form-control col-xs-12 col-sm-5" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right"> Phương tiện </label>
                            <div class="col-sm-7">
                                <form:input path="transport" cssClass="form-control col-xs-12 col-sm-5" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="shortDescription" class="col-sm-3 control-label no-padding-right">Mô tả</label>
                            <div class="col-sm-7">
                                <form:textarea path="description" rows="2" cols="2" id="shortDescription" cssClass="form-control col-xs-12 col-sm-5"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="itinerary" class="col-sm-3 control-label no-padding-right">Chương trình tour</label>
                            <div class="col-sm-7">
                                <textarea name="itinerary" rows="" cols="" id="itinerary" cssClass="form-control col-xs-12 col-sm-5" style="width: 970px; height: 302px">${model.itinerary}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="termAndCondition" class="col-sm-3 control-label no-padding-right">Chính sách tour</label>
                            <div class="col-sm-7">
                                <textarea name="termAndCondition" rows="" cols="" id="termAndCondition" cssClass="form-control col-xs-12 col-sm-5" style="width: 970px; height: 302px">${model.termAndCondition}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="faq" class="col-sm-3 control-label no-padding-right">Câu hỏi thường gặp</label>
                            <div class="col-sm-7">
                                <textarea name="faq" rows="" cols="" id="faq" cssClass="form-control col-xs-12 col-sm-5" style="width: 970px; height: 302px">${model.faq}</textarea>
                            </div>
                        </div>
                        <form:hidden path="id" id="tourId" />
                        <div class="clearfix form-actions">
                            <div class="col-md-offset-3 col-md-9">
                                <c:if test="${not empty model.id}">
                                    <button class="btn btn-sm btn-success" type="button" id="btnAddOrUpdateTour">
                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                        Cập nhật tour
                                    </button>
                                </c:if>
                                <c:if test="${empty model.id}">
                                    <button class="btn btn-sm btn-success" type="button" id="btnAddOrUpdateTour">
                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                        Thêm tour
                                    </button>
                                </c:if>

                                &nbsp; &nbsp; &nbsp;
                                <c:if test="${not empty message}">
                                    <button class="btn btn-sm" type="button" id="btnCancel" onclick="window.location.href='<c:url value="/quan-tri/tour/danh-sach?page=1&limit=5"/>';">
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
    var editorItinerary = ' ';
    var editorTermAndCondition = ' ';
    var editorFaq = ' ';
    $(document).ready(function (){
        editorItinerary = CKEDITOR.replace('itinerary');
        editorTermAndCondition = CKEDITOR.replace('termAndCondition');
        editorFaq = CKEDITOR.replace('faq');
    })

    var placeName = [];

    [...document.getElementsByClassName("placeName")].forEach(item => {
        item.addEventListener('click', ev => {
            let index = placeName.indexOf(ev.target.getAttribute('value'));
            if (placeName.indexOf(ev.target.getAttribute('value')) === -1)
                placeName.push(ev.target.getAttribute('value'));
            else
                placeName.splice(index, 1);

            console.log(placeName);
        })
    })
    $('#btnAddOrUpdateTour').click(function (e) {
        e.preventDefault();
        var data = {};
        var formData = $('#formSubmit').serializeArray();
        $.each(formData, function (i, v){
            if(v.name != "placeName") {
                data["" + v.name + ""] = v.value;
            }
        });
        data["itinerary"] = editorItinerary.getData();
        data["termAndCondition"] = editorTermAndCondition.getData();
        data["faq"] = editorFaq.getData();
        data["placeName"] = placeName;
        var id = $('#tourId').val();
        if(id == ""){
            addTour(data);
        }
        else {
            updateTour(data);
        }
    });
    function addTour(data){
        $.ajax({
            url: '${tourAPI}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                window.location.href = "${editTourURL}?id="+result.id+"&message=insert_success";
            },
            error: function (error) {
                window.location.href = "${tourURL}?page=1&limit=5&message=error_system";
            }
        });
    }
    function updateTour(data){
        $.ajax({
            url: '${tourAPI}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                window.location.href = "${editTourURL}?id="+result.id+"&message=update_success";
            },
            error: function (error) {
                window.location.href = "${tourURL}?page=1&limit=5&message=error_system";
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
                window.location.href = "${tourURL}?page=1&limit=5"
            }
        })
    }
</script>
</body>
</html>