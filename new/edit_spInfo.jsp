<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="../common/common.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>账号信息</title>
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
		
		if ($("#spid").val() == "") {
			$("#spid").val(0);
		}

		return true;
	}
	function goback() {
		window.history.go(-1);
	}
	function submitform(){
        var mobilereg =/^1[0-9]{10}$/;
        var phone=$("input[name='spContact_mdn']").val();
        if(!mobilereg.test(phone)){
            alert("请输入正确的手机号码!");
            return false;
        }
		$("#formId").submit();
	}
</script>
</head>

<body class="content_body">
	<div class="content_wrapper">
		<div class="locate">
			<span class="ico_locate"></span>您当前的位置：<span><a>用户管理</a>&nbsp;>&nbsp;用户信息</span>
		</div>
		<div class="content">
			<h3 class="content_title">账号信息</h3>
			<form id='formId' class="form"
				action="${ basepage }/spList/saveSp.html" method="post">
				<ul>
					<li><input type="hidden" name="spid" id="spid"
						value="${SPinfo.spid}" /></li>
				</ul>
				<div>
					<label>企业ID：</label> <span><b>${SPinfo.spid}</b></span>
				</div>
				<div>
					<label>企业名称：</label> <span><b>${SPinfo.sp_name}</b></span>
				</div>
				<div>
					<label>绑定IP地址：</label><span>${SPinfo.ip}</span>
				</div>
				<div>
					<label>用户登录帐号：</label><span>${SPinfo.username}</span>
				</div>
				
			<%-- 	<div>
					<label>销售经理：</label> <span>${SPinfo.sp_saler}</span>
				</div>
				<div>
					<label>销售经理电话：</label><span>${SPinfo.sp_saler_mdn}</span>
				</div>
				<div>
					<label>回执地址：</label> <input type="text" name="report_url"
						value="${SPinfo.report_url}" />
				</div>
				<div>
					<label>上行地址：</label> <input type="text" name="reply_url"
						value="${SPinfo.reply_url}" />
				</div> --%>
				
				<div>
					<label>联系人：</label> <input type="text" name="spContact_name"
						value="${SPinfo.spContact_name}" />
				</div>
				<div>
					<label>联系人电话：</label> <input type="text" name="spContact_mdn"
						value="${SPinfo.spContact_mdn}" />
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
