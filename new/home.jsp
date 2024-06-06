
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>统一短信平台</title>
<%@ include file="../common/common.jsp"%>
<link href="${ staticbase }/css2.0/style.css" rel="stylesheet"
	type="text/css" />
<script src="${ staticbase }/js/jquery-1.10.2.min.js"></script>
</head>

<body class="content_body">
	<div class="content_wrapper">
		<div class="locate">
			<span class="ico_locate"></span>您当前的位置：<span>我的首页</span>
		</div>
		<div class="content">
			<h3 class="content_title">用户信息</h3>
			<div class="info_wrap">
				<p>
					<label>公司名称：</label> <span>${sessionScope.sessionEpUser.sp_name}</span>
					<label class="mleft40">平台账号：</label> <span>${sessionScope.sessionEpUser.username}</span><span
						class="mleft40">[<a href="${ staticbase }/spList/EditSpPwd.html">修改密码</a>]
					</span>
				</p>
				<p>
				<span class="ico_msg"></span> <label>您的剩余可发送短信条数：</label> <b>${sessionScope.spCharge.leftover_num==null?0:sessionScope.spCharge.leftover_num}</b>条
			    </p>
			</div>
			<ul class="shortcut">
				<li onclick="window.location.href='${ basepage }/sendSms/init.html'"><span class="shortcut_send" ></span>短信发送</li>
				<li onclick="window.location.href='${ basepage }/task/sptaskList.html'"><span class="shortcut_stat" ></span>发送统计</li>
				<li onclick="window.location.href='${ basepage }/consumerManager/contactList.html'"><span class="shortcut_addr" ></span>通讯录</li>
				<li><span class="shortcut_msg" onclick="alert('公告')"></span>我的公告</li>
			</ul>
		</div>
	</div>
</body>
</html>
