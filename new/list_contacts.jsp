<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>客户通讯录</title>
<link href="${ staticbase }/css2.0/soboxstyle.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
		src="${ staticbase }/js/dialog/lhgdialog.min.js"></script>
<script type="text/javascript"
		src="${ staticbase }/js/sohobox/jquery.sobox.js"></script>
<script type="text/javascript"
	src="${ staticbase }/js/contact/contactList.js"></script>
<script type="text/javascript"
	src="${ staticbase }/js/sohobox/sohobox.js"></script>

<script type="text/javascript"
	src="${ staticbase }/js/pager/jquery.pager.zh-CN.js"></script>
<script type="text/javascript"
	src="${ staticbase }/js/pager/jquery.pagination.js"></script>
<script type="text/javascript"
	src="${ staticbase }/js/sovalidate/jquery.soValidate.min.js"></script>
<link href="${ staticbase }/js/pager/pager.css" rel="stylesheet"
	type="text/css" />
<link href="${ staticbase }/css/boxy.css" rel="stylesheet"
	type="text/css" />
<link href="${ staticbase }/js/pager/pagination.css" rel="stylesheet"
	type="text/css" />

<script type="text/javascript">
	$(document).ready(function() {
		$(".click").click(function() {
			$(".tip").fadeIn(200);
		});

		$(".tiptop a").click(function() {
			$(".tip").fadeOut(200);
		});

		$(".sure").click(function() {
			$(".tip").fadeOut(100);
		});

		$(".cancel").click(function() {
			$(".tip").fadeOut(100);
		});

	});
</script>
</head>

<body class="content_body">
	<div class="sidebar">
		<h3>客户通讯录</h3>
		<div class="sidebar_content">
			<ul id="contactTree" class="ztree"></ul>
		</div>
	</div>
	<div class="content_wrapper right_content">
		<div class="locate">
			<span class="ico_locate"></span>您当前的位置：<span><a>客户管理</a>&nbsp;>&nbsp;客户通讯录</span>
		</div>
		<div class="content">
			<input id="groupId" name="groupId" value="${groupId}" type="hidden" />
			<div class="search_wrap">
				<label>关键字:</label> <select id="keyword">
					<option value="0">不限</option>
					<option value="name">姓名</option>
					<option value="mdn">手机号</option>
				</select> <input type="text" id="selectedString" /> <label>性别:</label> <select
					id="sex">
					<option value="0">不限</option>
					<option value="男">男</option>
					<option value="女">女</option>
				</select> <label>所属运营商:</label> <select id="type">
					<option value="0">不限</option>
					<option value="2">移动</option>
					<option value="3">电信</option>
					<option value="1">联通</option>
				</select> <input type="button" class="btn_search"
					onclick="contactList.submitform()" />
			</div>
			<div class="table_wrap">
				<div class="gridBtnList">
					<!-- <span class="ico_add"></span><input name="addcontact"
						class="btn_grid" type="button"
						onclick="contactList.addContactInfo()" value="添加" /> -->
					<button class="btn_grid" onclick="contactList.addContactInfo()">
						<span class="ico_add"></span>新增
					</button>
					<button class="btn_grid"
						onclick="contactList.batchdelContactInfo()">
						<span class="ico_del"></span>批量删除
					</button>
					<button class="btn_grid"
						onclick="contactList.exportContactInfoPage()">
						<span class="ico_export"></span>导出
					</button>
					<button class="btn_grid"
						onclick="contactList.ImportContactInfoPage()">
						<span class="ico_import"></span>导入
					</button>
				</div>
				<table class="grid_table">
					<thead>
						<tr>
							<th width="30"><input type="checkbox" id="sltAll"
								onclick="sltAllUser()" /></th>
							<th>序号</th>
							<th>手机号码</th>
							<th>姓名</th>
							<th>性别</th>
							<th>年龄</th>
							<th>生日</th>
							<th>所属运营商</th>
							<th>部门</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="databody">

					</tbody>
					<tfoot>
					</tfoot>
				</table>
			</div>
			<div class="page_and_btn" id="page_and_btn"></div>
		</div>
	</div>



</body>
</html>
