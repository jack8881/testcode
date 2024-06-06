<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>部门成员管理</title>
<link href="${ staticbase }/css2.0/soboxstyle.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
			src="${ staticbase }/js/dialog/lhgdialog.min.js"></script>
<script type="text/javascript"
	src="${ staticbase }/js/department/departmentList.js"></script>
<script type="text/javascript"
	src="${ staticbase }/js/sohobox/jquery.sobox.js"></script>
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
		<h3>部门列表</h3>
		<div class="sidebar_content">
			<ul id="departmentTree" class="ztree"></ul>
		</div>
	</div>
	<div class="content_wrapper right_content">
		<div class="locate">
			<span class="ico_locate"></span>您当前的位置：<span><a>用户管理</a>&nbsp;>&nbsp;部门与用户管理</span>
		</div>
		<div class="content">
			<input id="groupId" name="groupId" value="${groupId}" type="hidden" />
			<div class="table_wrap">
				<div class="gridBtnList">
					<!-- <span class="ico_add"></span><input name="addcontact"
						class="btn_grid" type="button"
						onclick="contactList.addContactInfo()" value="添加" /> -->
					<button class="btn_grid" onclick="contactList.addContactInfo1()">
						<span class="ico_add"></span>新增
					</button>
					<button class="btn_grid"
						onclick="contactList.batchdelContactInfo()">
						<span class="ico_del"></span>批量删除
					</button>
					<label>审核角色：</label>
					<select id="audit_id" onchange="contactList.auditChange(this)">
						<option value="">全部</option>
						<c:forEach items="${auditLevelList}" var="audit" varStatus="vs">
							<option value="${audit.id}">${audit.auditDesc}</option>
						</c:forEach>
					</select>
				</div>
				<table class="grid_table">
					<thead>
						<tr>
							<th width="30"><input type="checkbox" id="sltAll"
								onclick="sltAllUser()" /></th>
							<th>序号</th>
							<th>登录名</th>
							<th>手机号码</th>
							<th>姓名</th>
							<th>短信日发送上限</th>
							<th>短信月发送上限</th>
							<%--<th>彩信日发送上限</th>--%>
							<%--<th>彩信月发送上限</th>--%>
							<th>角色</th>
							<th>部门</th>
							<th>审核角色</th>
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
