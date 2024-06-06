<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>审核管理</title>
<link href="${ staticbase }/css2.0/soboxstyle.css" rel="stylesheet"
	type="text/css" />
<link href="${ staticbase }/css/audit_user_manage.css" rel="stylesheet"
	type="text/css" />
<link href="${ staticbase }/js/pager/pager.css" rel="stylesheet"
	  type="text/css" />
<link href="${ staticbase }/css/boxy.css" rel="stylesheet"
	  type="text/css" />
<link href="${ staticbase }/js/pager/pagination.css" rel="stylesheet"
	  type="text/css" />

	<script type="text/javascript"
			src="${ staticbase }/js/dialog/lhgdialog.min.js"></script>
<script type="text/javascript"
	src="${ staticbase }/js/userAuditManage/auditUserManage.js"></script>
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
		<div>
			<h3>
				<span class ="user_audit_add">审核流程配置</span>
				<span class="ico_add audit_deal" onclick="auditUserManage.addAuditLevel()"></span>
			</h3>
		</div>

		<div class="sidebar_content" id = "audit_level">
			     <%--<h3 class ="audit_user audit_user_select">--%>
			         <%--<span name ="1" class ="user_audit_del" >一级审核人员</span>--%>
			         <%--<span class="ico_del audit_deal" ></span>--%>
			     <%--</h3>--%>
		</div>
	</div>
	<div class="content_wrapper right_content">
		<div class="locate">
			<span class="ico_locate"></span>您当前的位置：<span><a>用户管理</a>&nbsp;>&nbsp;审核管理</span>
		</div>
		<h3 class= "content_title">审核流程组管理</h3>
		<div class="content">
			<input id="groupId" name="groupId" value="${groupId}" type="hidden" />
			<div class="table_wrap">
				<div class="gridBtnList">
					<!-- <span class="ico_add"></span><input name="addcontact"
						class="btn_grid" type="button"
						onclick="contactList.addContactInfo()" value="添加" /> -->
					<%--<button class="btn_grid" onclick="auditUserManage.addUser()">--%>
						<%--<span class="ico_add"></span>增加成员--%>
					<%--</button>--%>
					<button class="btn_grid"
						onclick="auditUserManage.batchdelUserAudit()">
						<span class="ico_del"></span>批量删除
					</button>
				</div>
				<table class="grid_table">
					<thead>
						<tr>
							<th width="30"><input type="checkbox" id="sltAll"
								onclick="sltAllUser()" /></th>
							<th>序号</th>
							<th>姓名</th>
							<th>所属部门</th>
							<th>是否提醒</th>
							<th>提醒时间(分钟)</th>
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
