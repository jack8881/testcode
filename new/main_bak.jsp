
<%@ page language="java" import="java.util.*,cn.com.app.bo.Notice" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="../common/common.jsp"%>
<% 

List<Notice> listNotice = (List)session.getAttribute("noticeList");
StringBuffer bf = new StringBuffer();
if(listNotice.size()>0){
for(Notice notice:listNotice){
	bf.append(notice.getContent());
}
}

String s = bf.toString();
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>企业信息发送平台</title>
<link href="${ staticbase }/css2.0/style.css" rel="stylesheet"
	type="text/css" />
<script src="${ staticbase }/js/jquery-1.10.2.min.js"></script>
<script>

	$(function() {
		$(".menu ul li").click(function() {
		
			$(this).siblings().removeClass("active");
			var x = $(this).addClass("active");
			$(this).parents().siblings().click(function(){
				x.removeClass("active");
				x.siblings().first().addClass("active");
			})
			
		});
		$(".menu>li").click(function() {
		
			$(".menu>li").removeClass("active");
			$(".menu ul").hide();
			$(this).addClass("active");
			$(this).find("ul").show();
		});
	
	});
	function frameH() {
		var frameH = $("#content_frame").contents().find("body").height() + 20;
		$("#content_frame").height(frameH);
	}
	function locate(url) {
		$("#content_frame").attr("src", url);
	}

	function logout() {
		if (confirm("确定要退出吗？")) {
			document.location = basepage + "/logout.html";
		}
	}
	
	
	 $(document).ready(function(){

         $(".suspend").mouseover(function() {
        $(this).stop();
        $(this).animate({width: 160}, 400);
    })

    $(".suspend").mouseout(function() {
        $(this).stop();
        $(this).animate({width: 40}, 400);
    });

});
</script>
<style type="text/css">
*{margin:0;padding:0;list-style-type:none;}
a,img{border:0;}
/* suspend */
.suspend{width:40px;height:198px;position:fixed;top:200px;right:0;overflow:hidden;z-index:9999;}
.suspend dl{width:120px;height:198px;border-radius:25px 0 0 25px;padding-left:40px;box-shadow:0 0 5px #e4e8ec;}
.suspend dl dt{width:40px;height:198px;background:url(images/suspend.png);position:absolute;top:0;left:0;cursor:pointer;}
.suspend dl dd.suspendQQ{width:120px;height:85px;background:#ffffff;}
.suspend dl dd.suspendQQ a{width:120px;height:85px;display:block;background:url(images/suspend.png) -40px 0;overflow:hidden;}
.suspend dl dd.suspendTel{width:120px;height:112px;background:#ffffff;border-top:1px solid #e4e8ec;}
.suspend dl dd.suspendTel a{width:120px;height:112px;display:block;background:url(images/suspend.png) -40px -86px;overflow:hidden;}
* html .suspend{position:absolute;left:expression(eval(document.documentElement.scrollRight));top:expression(eval
 (document.documentElement.scrollTop+200))}
html {
        overflow-y: scroll;
}
</style>
</head>

<body class="main_body">
	<div class="wrapper">
		<div id="header">
			<img  src="${ staticbase }/images/logo.png"  class="logo" /> <span
				class="user_info"><span class="ico_user"></span>欢迎您，${sessionScope.sessionEpUser.username}</span><!-- <span
				class="ico_msg mleft20"></span><a onclick="alert('暂时不提供该功能')">您的消息</a>（<b>10</b></span> -->
				
			   	<marquee scrollAmount=2 width=400 style="color:red;size:10"><%=s %></marquee>
				
			<ul class="sys_menu">
				<li onclick="locate('web/new/home.jsp')"><span class="ico_home"></span>首页</li>
				<li onclick="alert('暂时不提供该功能')"><span class="ico_pwd"></span>帮助</li>
				<li onclick="locate('${ basepage }/spList/EditSpPwd.html')"><span
					class="ico_help"></span>修改密码</li>
				<li onclick="javascript:logout()"><span class="ico_exit"></span>退出平台</li>
			</ul>
		</div>
		<div id="nav">
			<div>
				<div>
					<ul class="menu">
						<li class="active"><a onclick="locate('web/new/home.jsp')">我的首页</a>
						</li>
						<li><a onclick="locate('${ basepage }/sendSms/init.html')" >信息发送</a>
							<ul>
								<li class="active"
									onclick="locate('${ basepage }/sendSms/init.html')">短信发送</li>
								<li onclick="locate('${ basepage }/task/taskList.html')">即时任务列表</li>
								<li onclick="locate('${ basepage }/task/BookTaskList.html')">预约任务列表</li>
						
								 <li onclick="locate('${ basepage }/dynamicMessage.html')">动态短信</li>
								 <li onclick="locate('${ basepage }/birthdayBook.html')">生日预约查询</li>
								 <li onclick="locate('${ basepage }/listPlate.html')">常用短语</li>
							</ul></li>
						<li><a
							onclick="locate('${ basepage }/sendSms/replyList.html')" >短信回复</a>
							<ul>
								<li class="active"
									onclick="locate('${ basepage }/sendSms/replyList.html')">回复列表</li>
							</ul></li>
						<li><a
							onclick="locate('${ basepage }/spList/spChargeRecord.html')" >财务管理</a>
							<ul>
								<li class="active"
									onclick="locate('${ basepage }/spList/spChargeRecord.html')" >充值记录</li>
							</ul></li>
						<li><a onclick="locate('${ basepage }/task/sptaskList.html')" >发送统计</a>
							<ul>
								<c:if test="${sessionScope.sessionEpUser.return_type==1}">
									<!-- 按提交计费 -->
									<li class="active"
										onclick="locate('${ basepage }/task/sptaskList.html')">日发送统计</li>
									<li onclick="locate('${ basepage }/task/spAccountList.html')">月发送统计</li>
									<%-- <li onclick="locate('${ basepage }/taskDetail.html')">状态查询</li> --%>
								</c:if>
								<c:if test="${sessionScope.sessionEpUser.return_type==0}">
									<!-- 按到达计费 -->
									<li class="active"
										onclick="locate('${ basepage }/task/sptaskListByArrive.html')">日发送统计</li>
									<li
										onclick="locate('${ basepage }/task/spAccountListByArrive.html')">月发送统计</li>
										
									<li onclick="locate('${ basepage }/taskDetail.html')">状态查询</li>
								</c:if>
							</ul></li>
						<li><a
							onclick="locate('${ basepage }/consumerManager/contactList.html')" >客户管理</a>
							<ul>
								<li class="active"
									onclick="locate('${ basepage }/consumerManager/contactList.html')">客户通讯录</li>
								<li onclick="locate('${ basepage }/blackObject.html')">黑名单管理</li>
							</ul></li>
						<li class="last"><a
							onclick="locate('${ basepage }/spList/editSpInfo.html')" >账户管理</a>
							<ul>
								<li class="active"
									onclick="locate('${ basepage }/spList/editSpInfo.html')">账户信息</li>
								<li onclick="locate('${ basepage }/spList/EditSpPwd.html')">修改密码</li>
							</ul></li>
					</ul>
				</div>
			</div>
		</div>
		<iframe id="content_frame" src="web/new/home.jsp" frameborder="0" onload="frameH()"></iframe>
	</div>
	<div class="suspend">
        <dl>
                <dt class="IE6PNG"></dt>
                <dd class="suspendQQ"><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=2881018230&site=qq&menu=yes"></a></dd>
                <dd class="suspendTel"><a href="javascript:void(0);"></a></dd>
        </dl>
</div>
	<div id="footer"></div>
</body>
</html>
