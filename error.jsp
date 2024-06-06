<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="./common/common.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<base href="<%=basePath%>" />
<title>应用程序错误页面</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>

<script language="javascript">
	$(function(){
    $('.error').css({'position':'absolute','left':($(window).width()-490)/2});
	$(window).resize(function(){  
    $('.error').css({'position':'absolute','left':($(window).width()-490)/2});
    });
});  
</script>

<script type="text/javascript">
  function showErr(){
  	document.getElementById("err").style.display = "";
  }
  </script>
</head>


<body class="content_body">
	<div class="content_wrapper">

	<div class="locate">
				<span class="ico_locate"></span>您当前的位置：<span><a>错误页面</a>&nbsp;>&nbsp;应用程序错误</span>
			</div>

	<div class="error">

		<h2>非常遗憾，您访问的页面不存在！</h2>
		<p>看到这个提示，请联系管理员，谢谢!</p>
		<div class="reindex">
			<a href="javascript:showErr();" target="_parent">查看详情</a>
		</div>
		<div class="reindexfl">
			<a href="javascript:history.back(-1)" target="_parent">返回上一页</a>
		</div>

	</div>
	<div style="display: none; text-align: left;" id="err">${exception}</div>
	</div>
</body>

</html>
