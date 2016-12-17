<%@page import="Model.News"%>
<%@ page language="java" import="java.util.*, bean.New" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="telephone=no" name="format-detection">
<meta charset="utf-8">
<title>新闻发布系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,user-scalable=0">
<link rel="stylesheet" href="./styles/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="./styles/app.css" type="text/css" />
<link rel="stylesheet" href="./styles/font-awesome.min.css" type="text/css" />
<link rel="stylesheet" href="./styles/weui.min.css" type="text/css" />
</head>

<body>
	<div class="app app-header-fixed app-aside-fixed app-aside-folded" id="app" style="margin-left: 0px;">
		<!-- banner -->
		<div style="background:url(./images/c4.jpg) center center; background-size:cover;">
			<div class="wrapper-lg bg-white-opacity row" style="padding-top: 45px;">
				<div class="col-sm-7">
					<img class="thumb-lg pull-left m-r img-circle" src="./images/logo.jpg" />
					<div class="clear">
						<h3 class="m-b m-t-sm">
							<b>新闻发布系统</b>
						</h3>
						<%
							String username = (String) session.getAttribute("username");
							if (username != null) {
						%>
						<a href="./addNews" class="btn btn-sm btn-success btn-rounded">发布新闻</a>
						<button class="btn btn-sm btn-success btn-rounded" onclick="return Logout();">退出登录</button>
						<%
							} else {
						%>
						<a href="./Login" class="btn btn-sm btn-success btn-rounded">登录</a> <a href="./Signup"
							class="btn btn-sm btn-success btn-rounded">注册</a>
						<%
							}
						%>
					</div>
				</div>
			</div>
		</div>
		<!-- / banner -->
		<!-- navbar -->
		<div class="wrapper bg-white b-b">
			<ul id="type" class="nav nav-pills nav-sm">
				<li class="active"><a href="./">所有新闻</a></li>
			</ul>
		</div>
		<!-- / navbar -->
		<!-- content -->
		<div class="col-sm-9" style="top: 20px;width: 100%;">
			<div class="blog-post">
				<jsp:useBean id="newbean" class="Model.News" />
				<%!int pagenum;
	int type;%>
				<%
					String s_page = (String) request.getParameter("page");
					if (s_page != null)
						pagenum = Integer.parseInt(s_page);
					else
						pagenum = 1;
					if (pagenum <= 0) {
						pagenum = 1;
					}
					String s_type = (String) request.getParameter("Type");
					if (s_type != null)
						type = Integer.parseInt(s_type);
					else
						type = -1;
					List<New> list = newbean.AllNewsPage(pagenum, type);
					request.setAttribute("list", list);
				%>
				<c:forEach items="${list}" var="li">
					<div class="panel">
						<div></div>
						<div class="wrapper-lg">
							<h2 class="m-t-none">
								<a href="./content.jsp?id=${li.id }">${li.title }</a>
							</h2>
							<div>${li.summary }</div>
							<div class="line line-lg b-b b-light"></div>
							<div class="text-muted">
								<i class="fa fa-user text-muted"></i> by <a class="m-r-sm">${li.author }</a> <i class="fa fa-clock-o text-muted"></i>
								${li.posttime } ${li.type }
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="text-center m-t-lg m-b-lg" style="margin-top: 0px;margin-bottom: 40px;">
				<ul class="pagination pagination-md" style="margin-top: 0px;">
					<li><a href="./?page=<%=pagenum - 1%>"><i class="fa fa-chevron-left"></i></a></li>
					<li><a href="./?page=<%=pagenum + 1%>"><i class="fa fa-chevron-right"></i></a></li>
				</ul>
			</div>
		</div>
		<!-- /content -->
		<!-- footer -->
		<div class="app-footer wrapper b-t bg-light" style="margin-left: 0px;height:50px;position:fixed;bottom:0px;left:0px;">
			<span class="pull-right">1.0.1</span>Copyright &copy; 2016 Weijiang
		</div>
		<!-- / footer -->
	</div>
	<script src="./script/jquery.min.js"></script>
	<script type="text/javascript" src="./script/weui.min.js"></script>
	<script type="text/javascript">
		function initTypeList() {
			$.get("./getType", null, function(res) {
				var list = res.List;
				for (i = 0; i < list.length; i++) {
					$('#type').append("<li class=\"active\"><a href=\"./?Type=" + i + "\">" + list[i] + "</a></li>");
				}
			});
		}
		initTypeList();
		function Logout() {
			$.get("./Logout", null, function(res) {
				weui.toast('操作成功', {
					duration : 1000,
					className : 'custom-classname',
					callback : function() {
						window.location.reload(true);
					}
				});
			});
		}
	</script>
</body>

</html>