<%@ page language="java" import="java.util.*,bean.New" pageEncoding="UTF-8"%>
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
			<div class="blog-post" style="margin-bottom: 70px;">
				<div class="panel">
					<div class="wrapper-lg">

						<jsp:useBean id="nesmodel" class="Model.News" />
						<%
							String pagenum = (String) request.getParameter("id");
							if (pagenum != null) {
								int id = Integer.parseInt(pagenum);
								New OneNew = nesmodel.getOneNews(id);
						%>
						<h2 class="m-t-none" style="text-align: center;">
							<%
								out.println(OneNew.getTitle());
							%>
						</h2>
						<div>
							<%
								out.println(OneNew.getContent());
							%>
						</div>
						<div class="line line-lg b-b b-light"></div>
						<div class="text-muted">
							<i class="fa fa-user text-muted"></i> by <a href="" class="m-r-sm"> <%
 	out.println(OneNew.getAuthor());
 %></a> <i class="fa fa-clock-o text-muted"></i>
							<%
								out.println(OneNew.getPosttime());
							%>
							<button type="reset" class="btn btn-sm btn-info" style="float: right;" onclick="return Delete();">删除</button>
							
							<button type="reset" class="btn btn-sm btn-info" style="float: right;margin-right: 10px;">编辑</button>
													</div>
						<%
							} else {
								out.println("找不到该新闻，可能已被删除");
							}
						%>
					</div>
				</div>
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
		function postDelete() {
			data = {
				newid : <%=request.getParameter("id")%>
			};
			$.post("./deleteNews", data, function(res) {
				if (res.errmsg === 'ok') {
					weui.toast('操作成功', {
						duration : 1000,
						className : 'custom-classname',
						callback : function() {
							window.location.href = "./";
							;
						}
					});
				} else {
				    var reason;
					if (res.reason != null) {
						reason = res.reason;
					} else {
						reason = "系统错误";
					}
					weui.alert(reason, function() {
						console.log('error');
					}, {
						title : '错误'
					});
				}
			});
		}
		function Delete() {
			weui.dialog({
				title : '提示',
				content : '确定删除该新闻？',
				className : 'custom-classname',
				buttons : [ {
					label : '取消',
					type : 'default',
					onClick : function() {
					}
				}, {
					label : '确定',
					type : 'primary',
					onClick : function() {
						postDelete()
					}
				} ]
			});
		}
		;
	</script>
</body>

</html>