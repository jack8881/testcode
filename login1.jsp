<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<c:set var="basepage"><%=request.getContextPath() %></c:set>
<%-- 静态资源 如:image, css等等, 前加上 --%>
<c:set var="staticbase"><%=request.getContextPath() %></c:set>
<script type="text/javascript">
var basepage = '<%=request.getContextPath() %>';
var staticbase = '<%=request.getContextPath() %>';
</script>
<link href="${ staticbase }/web/css/H-ui.login.css" rel="stylesheet" type="text/css" />
<link href="${ staticbase }/web/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="${ staticbase }/web/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="${ staticbase }/web/css/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />

<title>企业信息发送平台</title>
<meta name="keywords" content="企业信息发送平台">
<meta name="description" content="企业信息发送平台">
</head>
<body>
<input type="hidden" id="TenantId" name="TenantId" value="" />
<div class="header"></div>
<div class="loginWraper">
  <div id="loginform" class="loginBox">
    <form class="form form-horizontal" action="${basepage}/login.html" method="post">
     <input type="hidden" name="remember" id="rem" value='no'/>
      <div class="row cl">
        <label class="form-label col-3"><i class="Hui-iconfont">&#xe60d;</i></label>
         
        <div class="formControls col-8">
          <input id="spid" name="spid" type="text" placeholder="企业ID" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-3"><i class="Hui-iconfont">&#xe60d;</i></label>
         
        <div class="formControls col-8">
          <input id="userName" name="userName" type="text" placeholder="账户" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-3"><i class="Hui-iconfont">&#xe60e;</i></label>
        <div class="formControls col-8">
          <input id="password" name="password" type="password" placeholder="密码" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-8 col-offset-3">
          <input id="ecode" name="ecode" class="input-text size-L" type="text" placeholder="验证码"  onclick="if(this.value=='验证码:'){this.value='';}" value="" style="width:150px;">
          <img id="codeImg" src="${ staticbase }/web/images/code.jpg"> <a id="kanbuq" href="javascript:;">看不清，换一张</a> </div>
      </div>
      <div class="row">
        <div class="formControls col-8 col-offset-3">
          <label for="online">
            <input type="checkbox" name="aaa" id="aaa" value="">
            使我保持登录状态</label>
        </div>
      </div>
      <div class="row">
        <div class="formControls col-8 col-offset-3">
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input name="" type="submit" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input name="" type="reset"  class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
        </div>
      </div>
    </form>
  </div>
</div>
<div class="footer">建议使用IE8以上浏览器</div>
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script> 
<script type="text/javascript" src="js/H-ui.js"></script> 
<script type="text/javascript" src="js/jquery.cookie.js"></script> 
<script>

function sub() {
			if ($("#spid").val() == "") {
				alert("企业ID不能空!");
				return ;
			}
			if ($("#userName").val() == "") {
				alert("用户名不能空!");
				return ;
			}
			if ($("#password").val() == "") {
				alert("密码不能空!");
				return ;
			}
			if ($("#ecode").val() == "") {
				alert("验证码不能空!");
				return ;
			}
			$("#loginfo").submit();

		}
		
		

		var errInfo = "${errInfo}";
		$(document).ready(function() {
			var spid = $.cookie("CookiEpSPID");
			var userName = $.cookie("CookiEpUser");
			var password = $.cookie("CookiEpPwd");
			var v_rem = $.cookie("CookiEpRem");
			if(v_rem!=null&&v_rem!=""){
				$("#rem").val(v_rem);
			}
			if (userName != "" && password != ""&&v_rem=="on") {
				$("#spid").val(spid);
				$("#userName").val(userName);
				$("#password").val(password);
				$("#aaa").prop("checked",true);//
			}else{
				$("#spid").val("");
				$("#userName").val("");
				$("#password").val("");
			}
			
			changeCode();
			$("#kanbuq").bind("click", changeCode);
			if (errInfo != "") {
				if (errInfo.indexOf("验证码") > -1) {
					alert(errInfo);
					$("#ecode").focus();
				} else {
					alert(errInfo);
				}
			}
			$("#userName").focus();
		});

		function genTimestamp() {
			var time = new Date();
			return time.getTime();
		}

		$(function(){
			$("#aaa").click(function(){
				if($(this).prop("checked")==true){
					$("#rem").val("on");
				}
				  else {
					  $("#rem").val("no");
				  }
				var v_rem = $("#rem").val();
				});
			});
		
		function changeCode() {
			$("#codeImg").attr("src", "code.html?t=" + genTimestamp());
		}

</script>
</body>
</html>