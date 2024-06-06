<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="../common/common.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改密码</title>
<link href="${ staticbase }/css2.0/style.css" rel="stylesheet"
	type="text/css" />
<link href="${ staticbase }/css2.0/soboxstyle.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="${ staticbase }/js/sohobox/jquery.sobox.js"></script>
<script type="text/javascript"
	src="${ staticbase }/js/sohobox/sohobox.js"></script>
<script type="text/javascript">
var errInfo = "${msg}";
$(document).ready(function() {
	if (errInfo != "" && errInfo != null) {
		SoDialog.alertSucc(errInfo);
	}
});

function checksp() {
	if ($("#oldpassword").val() == "") {
		alert("请输入原密码!");
		$("#oldpassword").focus();
		return false;
	}
	if ($("#password").val() == "") {//新增
		alert("请输入新密码!");
		$("#password").focus();
		return false;
	}
	if (($("#password").val()).length < 6) {
		alert("密码不能小于6位!");
		$("#password").focus();
		return false;
	}

	if ($("#password").val() != $("#chkpwd").val()) {
		alert("两次密码输入不一致!");
		$("#password").focus();
		return false;
	}

	return true;
}

	function goback() {
		window.history.go(-1);
	}
	
	function submitform(){
		$("#formId").submit();
	}
</script>
</head>

<body class="content_body">
	<div class="content_wrapper">
		<div class="locate">
			<span class="ico_locate"></span>您当前的位置：<span><a>用户管理</a>&nbsp;>&nbsp;修改密码</span>
		</div>
		<div class="content">
			<h3 class="content_title">账号信息</h3>
			<form id='formId' class="form"
				action="${ basepage }/spList/saveSpPwd.html" method="post">
				<ul>
					<li><input type="hidden" name="spid" id="spid"
						value="${SPinfo.spid}" /></li>
				</ul>
				<div>
					<label>企业ID：</label> <input type="text" value="${SPinfo.spid}" readonly="readonly" />
				</div>
				<div>
					<label>企业名称：</label> <input type="text" value="${SPinfo.sp_name}" readonly="readonly"/>
				</div>
				<div>
					<label>用户登录帐号：</label> <input type="text"
						value="${SPinfo.username}" readonly="readonly"/>
				</div>
				<div>
					<label>原密码：</label>&nbsp;&nbsp;&nbsp;&nbsp;<input name="oldpassword" type="password"
						id="oldpassword" style="width:260px;height:26px" />
				</div>
				<div>
					<label>新密码：</label>&nbsp;&nbsp;&nbsp;&nbsp;<input name="password" type="password"
						id="password"  style="width:260px;height:26px"/>
				</div>
				<div>
					<label>确认密码：</label>&nbsp;&nbsp;&nbsp;&nbsp;<input name="chkpwd" type="password"
						id="chkpwd" style="width:260px;height:26px" />
				</div>
			</form>
			<div class="submit_wrap">
				<button class="btn_save" type="button" onclick="submitform()">保&nbsp;&nbsp;存</button>
				<button class="btn_cancel" type="button" onclick="goback()">取&nbsp;&nbsp;消</button>
			</div>


		</div>

	</div>
</body>
</html>
