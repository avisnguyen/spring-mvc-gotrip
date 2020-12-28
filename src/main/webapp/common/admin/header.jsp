<%@ page import="com.gotrip.util.SecurityUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<div id="navbar" class="navbar navbar-default          ace-save-state">
	<div class="navbar-container ace-save-state" id="navbar-container">
			<div class="navbar-header pull-left">
				<a href="<c:url value='/quan-tri/trang-chu' />" class="navbar-brand">
					<small>
						<i class="fa fa-leaf"></i>
						Trang quản trị
					</small>
				</a>
			</div>
		<div class="navbar-buttons navbar-header pull-right" role="navigation">
			<ul class="nav ace-nav">
				<li class="light-blue dropdown-modal">
					<a href="#" title="<%=SecurityUtils.getPrincipal().getFirstName()%>">
						<i class="ace-icon fa fa-user"></i>
						Xin chào, <%= SecurityUtils.getPrincipal().getFirstName() %>
					</a>
				</li>
				<li class="light-blue">
					<a href="<c:url value='/trang-chu' />" title="Trang chủ Website">
						<i class="ace-icon fa fa-home"></i>
						Trang chủ Website
					</a>
				</li>
				<li class="light-blue dropdown-modal">
						<a href="<c:url value="/thoat"/> " title="Đăng xuất">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<i class="ace-icon fa fa-power-off"></i>
							Thoát
						</a>
				</li>
			</ul>
		</div>
	</div>
</div>