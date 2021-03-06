﻿<%@ page language="java" import="java.util.*,bean.New" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="telephone=no" name="format-detection">
<meta charset="utf-8" />
<title>新闻发布系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,user-scalable=0" />
<link rel="stylesheet" href="./styles/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="./styles/app.css" type="text/css" />
<link rel="stylesheet" href="./styles/font-awesome.min.css" type="text/css" />
<link rel="stylesheet" href="./styles/weui.min.css" type="text/css" />
<style type="text/css">
body {
	font-family: "Source Sans Pro", "Helvetica Neue", Helvetica, Arial,
		sans-serif;
}
</style>
</head>

<body>
	<div class="app app-header-fixed app-aside-fixed app-aside-folded" id="app" style="margin-left: 0px;">
		<div id="page">
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
					<li><a href="./">所有新闻</a></li>
				</ul>
			</div>
			<!-- / navbar -->
			<!-- content -->
			<div class="panel panel-default" style="padding-bottom: 50px;">
				<div class="panel-heading font-bold">编辑新闻</div>
				<div class="panel-body">
					<jsp:useBean id="nesmodel" class="Model.News" />
					<%
						int news_id = 0;
						New OneNew = new New();
						String s_news_id = (String) request.getParameter("newid");
						if (s_news_id != null) {
							news_id = Integer.parseInt(s_news_id);
							OneNew = nesmodel.getOneNews(news_id);
						}
					%>
					<form role="form" action="" method="post">
						<div class="form-group">
							<label>新闻标题</label> <input id='title' maxlength="30" type="text" class="form-control" placeholder=""
								value="<%=OneNew.getTitle()%>" required />
						</div>
						<div class="form-group">
							<label>新闻内容</label>
							<div class="btn-toolbar m-b-sm btn-editor" data-role="editor-toolbar" data-target="#editor">
								<div class="btn-group dropdown" dropdown>
									<a class="btn btn-default" dropdown-toggle tooltip="Font"><i class="fa fa-font"></i><b class="caret"></b></a>
									<ul class="dropdown-menu">
										<li><a href data-edit="fontName Serif" style="font-family:'Serif'">Serif</a></li>
										<li><a href data-edit="fontName Sans" style="font-family:'Sans'">Sans</a></li>
										<li><a href data-edit="fontName Arial" style="font-family:'Arial'">Arial</a></li>
									</ul>
								</div>
								<div class="btn-group dropdown" dropdown>
									<a class="btn btn-default" dropdown-toggle data-toggle="dropdown" tooltip="Font Size"><i
										class="fa fa-text-height"></i>&nbsp;<b class="caret"></b></a>
									<ul class="dropdown-menu">
										<li><a href data-edit="fontSize 5" style="font-size:24px">Huge</a></li>
										<li><a href data-edit="fontSize 3" style="font-size:18px">Normal</a></li>
										<li><a href data-edit="fontSize 1" style="font-size:14px">Small</a></li>
									</ul>
								</div>
								<div class="btn-group">
									<a class="btn btn-default" data-edit="bold" tooltip="Bold (Ctrl/Cmd+B)"><i class="fa fa-bold"></i></a> <a
										class="btn btn-default" data-edit="italic" tooltip="Italic (Ctrl/Cmd+I)"><i class="fa fa-italic"></i></a> <a
										class="btn btn-default" data-edit="strikethrough" tooltip="Strikethrough"><i class="fa fa-strikethrough"></i></a>
									<a class="btn btn-default" data-edit="underline" tooltip="Underline (Ctrl/Cmd+U)"><i
										class="fa fa-underline"></i></a>
								</div>
								<div class="btn-group">
									<a class="btn btn-default" data-edit="insertunorderedlist" tooltip="Bullet list"><i class="fa fa-list-ul"></i></a>
									<a class="btn btn-default" data-edit="insertorderedlist" tooltip="Number list"><i class="fa fa-list-ol"></i></a>
									<a class="btn btn-default" data-edit="outdent" tooltip="Reduce indent (Shift+Tab)"><i class="fa fa-dedent"></i></a>
									<a class="btn btn-default" data-edit="indent" tooltip="Indent (Tab)"><i class="fa fa-indent"></i></a>
								</div>
								<div class="btn-group">
									<a class="btn btn-default" data-edit="justifyleft" tooltip="Align Left (Ctrl/Cmd+L)"><i
										class="fa fa-align-left"></i></a> <a class="btn btn-default" data-edit="justifycenter"
										tooltip="Center (Ctrl/Cmd+E)"><i class="fa fa-align-center"></i></a> <a class="btn btn-default"
										data-edit="justifyright" tooltip="Align Right (Ctrl/Cmd+R)"><i class="fa fa-align-right"></i></a> <a
										class="btn btn-default" data-edit="justifyfull" tooltip="Justify (Ctrl/Cmd+J)"><i
										class="fa fa-align-justify"></i></a>
								</div>
								<div class="btn-group dropdown" dropdown="">
									<a class="btn btn-default" dropdown-toggle="" tooltip="Hyperlink" aria-haspopup="true" aria-expanded="false"><i
										class="fa fa-link"></i></a>
									<div class="dropdown-menu">
										<div class="input-group m-l-xs m-r-xs">
											<input class="form-control input-sm" id="LinkInput" placeholder="URL" type="text" data-edit="createLink">
											<div class="input-group-btn">
												<button class="btn btn-sm btn-default" type="button">Add</button>
											</div>
										</div>
									</div>
									<a class="btn btn-default" data-edit="unlink" tooltip="Remove Hyperlink"><i class="fa fa-cut"></i></a>
								</div>

								<div class="btn-group">
									<a class="btn btn-default" tooltip="Insert picture (or just drag &amp; drop)" id="pictureBtn"><i
										class="fa fa-picture-o"></i></a> <input type="file" data-edit="insertImage"
										style="position:absolute; opacity:0; width:41px; height:34px">
								</div>
								<div class="btn-group">
									<a class="btn btn-default" data-edit="undo" tooltip="Undo (Ctrl/Cmd+Z)"><i class="fa fa-undo"></i></a> <a
										class="btn btn-default" data-edit="redo" tooltip="Redo (Ctrl/Cmd+Y)"><i class="fa fa-repeat"></i></a>
								</div>
							</div>
							<div id="editor" class="form-control" style="overflow:scroll;height:200px;max-height:200px"
								contenteditable="true"><%=OneNew.getContent()%></div>
							<div class="form-group">
								<label>新闻分类</label> <select id="listtype" class="form-control">
								</select>
							</div>
						</div>
						<button id="submit" class="btn btn-sm btn-info" onclick="return postData();">提交</button>
						<button type="reset" class="btn btn-sm btn-info" onclick="return cleanEdit();">重置</button>
					</form>
				</div>
			</div>
			<!-- /content -->
			<!-- footer -->
			<div class="app-footer wrapper b-t bg-light" style="margin-left: 0px;">
				<span class="pull-right">1.0.1</span>Copyright &copy; 2012-2016 GxgkTeam
			</div>
			<!-- / footer -->
		</div>
	</div>
	<script src="./script/jquery.min.js"></script>
	<script src="./script/bootstrap.min.js"></script>
	<script src="./script/bootstrap-wysiwyg.js"></script>
	<script src="./script/jquery.hotkeys.js"></script>
	<script type="text/javascript" src="./script/weui.min.js"></script>
	<script type="text/javascript">
		$('#editor').wysiwyg();
		function initTypeList() {
			$.get("./getType", null, function(res) {
				var list = res.List;
				for (i = 0; i < list.length; i++) {
					if(list[i] == '<%=OneNew.getType()%>'){
					    $('#type').append("<li class=\"active\"><a href=\"./?Type=" + i + "\">" + list[i] + "</a></li>");
					    $('#listtype').append("<option selected value='" + i + "'>" + list[i] + "</option>");
					    }
					else{
					    $('#type').append("<li><a href=\"./?Type=" + i + "\">" + list[i] + "</a></li>");
					    $('#listtype').append("<option value='" + i + "'>" + list[i] + "</option>");
					    }
				}
			});
		}
		initTypeList();
		function cleanEdit() {
			$('#title').val("");
			$('#editor').text("");
		}
		function postData() {
			var title = $('#title').val().replace(/\s+/g, '');
			var content = $('#editor').cleanHtml();
			var type = $('#listtype').val();
			var reason;
			//验证表单合法性
			if (!title) {
				return;
			} else if (content.length < 5) {
				weui.alert("请输入新闻内容", function() {
					console.log('ok');
				}, {
					title : '错误'
				});
				return false;
			}
			var loading = weui.loading('请稍后...');
			data = {
			    newid : <%=news_id%>,
				title : title,
				content : content,
				type : type,
			};
			$.post("./editNews", data, function(res) {
				loading.hide();
				if (res.errmsg === 'ok') {
					weui.alert(res.reason, function() {
						console.log('ok');
					}, {
						title : '提示'
					});
					return false;
				} else if (res.errmsg === 'error') {
					if (res.reason != null) {
						reason = res.reason;
					} else {
						reason = "系统错误";
					}
				} else {
					// 失败，显示后端信息
					reason = "系统错误";
				}
				weui.alert(reason, function() {
					console.log('error');
				}, {
					title : '错误'
				});
			});
			return false;
		}
		function Logout() {
			$.get("./Logout", null, function(res) {
				weui.toast('操作成功', {
					duration : 1000,
					className : 'custom-classname',
					callback : function() {
						window.location.href = "./";;
					}
				});
			});
		}
	</script>
</body>

</html>