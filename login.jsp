<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>${systemTitle}</title>
<c:set var="basepage"><%=request.getContextPath()%></c:set>
<%-- 静态资源 如:image, css等等, 前加上 --%>
<c:set var="staticbase"><%=request.getContextPath()%></c:set>
<script type="text/javascript">
var basepage = '<%=request.getContextPath()%>';
var staticbase = '<%=request.getContextPath()%>';
</script>

<link href="${ staticbase }/web/css/bootstrap2.css" rel="stylesheet"
	type="text/css" />
<link href="${ staticbase }/web/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<link href="${ staticbase }/web/css/login.css" rel="stylesheet"
	type="text/css" />
<link href="${ staticbase }/web/css/select2.min.css" rel="stylesheet"
	type="text/css" />
<!--[if lte IE 9]>
<script src="js/respond.min.js"></script>
<script src="js/html5shiv.js"></script>
<![endif]-->
</head>
<body>
	<div class=""
		style="left: 0px; top: 0px; visibility: hidden; position: absolute;">
		<table class="ui_border">
			<tbody>
				<tr>
					<td class="ui_lt"></td>
					<td class="ui_t"></td>
					<td class="ui_rt"></td>
				</tr>
				<tr>
					<td class="ui_l"></td>
					<td class="ui_c"><div class="ui_inner">
							<table class="ui_dialog">
								<tbody>
									<tr>
										<td colspan="2"><div class="ui_title_bar">
												<div class="ui_title" unselectable="on"
													style="cursor: move;"></div>
												<div class="ui_title_buttons">
													<a class="ui_min" href="javascript:void(0);" title="最小化"
														style="display: inline-block;"><b class="ui_min_b"></b></a><a
														class="ui_max" href="javascript:void(0);" title="最大化"
														style="display: inline-block;"><b class="ui_max_b"></b></a><a
														class="ui_res" href="javascript:void(0);" title="还原"><b
														class="ui_res_b"></b><b class="ui_res_t"></b></a><a
														class="ui_close" href="javascript:void(0);"
														title="关闭(esc键)" style="display: inline-block;">×</a>
												</div>
											</div></td>
									</tr>
									<tr>
										<td class="ui_icon" style="display: none;"></td>
										<td class="ui_main" style="width: auto; height: auto;"><div
												class="ui_content" style="padding: 10px;"></div></td>
									</tr>
									<tr>
										<td colspan="2"><div class="ui_buttons"
												style="display: none;"></div></td>
									</tr>
								</tbody>
							</table>
						</div></td>
					<td class="ui_r"></td>
				</tr>
				<tr>
					<td class="ui_lb"></td>
					<td class="ui_b"></td>
					<td class="ui_rb" style="cursor: se-resize;"></td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- 	NAVBAR -->
	<div class="navbar-wrapper">
		<div class="container">
			<div class="container container_02">
				<div class="row row_01">
					<div class="col-sm-6">
						<div class="navbar-header">
						<img  src="${staticbase}/images/${app_logo_path}" style="height:50px;width:50px" />
							<span id="companyTitle"
								  style="font-size: 23px;">${systemTitle}</span>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="link_way">
							<ul class="nav navbar-nav">
								<li><font>客服电话：</font><span><font>888-888-8888</font></span></li>
								<!-- <li class="nav_li"><font>传真：</font><span><font>888-888-8888</font></span></li> -->
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container_01" >
		<div class="container">
			<div class="row">
				<div class="col-sm-8">
					<img alt="" src="${basepage}/images/banner.png">
				</div>
				<div class="col-sm-4">

					<form class="form-signin" id="myform"
						action="${basepage}/login.html" method="post">
						<p style="padding-left: 85px;">登录</p>
						<div>
							<i class="fa fa-envelope"></i> 
							<input type="hidden" name="remember" id="remember" value='no'/>
							<input type="text" id="spid" name="spid" value="" autocomplete="off" class="form-control" placeholder="企业ID"/> 
							<input type="text" id="userName" name="userName" value="" autocomplete="off" class="form-control" placeholder="登录名"/> 
							<input type="password"
								placeholder="密码" class="form-control" autocomplete="off"
								id="password" name="password" value=""> 
								<input
								type="text" placeholder="验证码" class="form-control"
								autocomplete="off" name="ecode" id="ecode">
							<div class="vcode_img">
								<img id="codeImg" onclick="changeLoginCode()" src="${ staticbase }/web/images/code.jpg"">
							</div>
							<!-- 			        <div id="phones" style="padding-left:35px;"><button type="button"  class="btn btn-sm" onclick="getPhones()">获取账户手机</button></div>
				            <input type="text" class="form-control" id="yCode" name="yCode"   autocomplete="off" placeholder="短信验证码" /> -->
							<!--          <div class="vcode_img"><input type="button" class="btn btn-sm"   style="height: 30px;margin-right: 30px;"  id="smsSend" onclick="getSendLoginYCode()" value="获取" /></div> -->
						</div>
						<div style="margin-left: 45px;">

							<span style="color: red;" id="errMsg"></span><br> 

							 <!--<span><input type="checkbox" value="1" id="remPwd" name="remPwd">记住密码</span>
				           <a class="link_for" href="javascript:findPassWord();">忘记密码？</a> -->
						</div>
						<button style="margin-top: 10px;" type="button" class="btn btn-sm"
							onclick="commit()">登录</button>
						<input type="hidden" value="1" name="noPicuter">
						<input type="hidden" name="aaa" id="aaa" value="">
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="marketing">
		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<div class="button_img div1">
						<img src="images/icon-1.png" class="img-circle">
					</div>
					<div class="title_button div1">更安全的体验</div>
					<div class="des_title div1">
						<p>提供企业级、多层级权限管理；敏感信息加密存储；支持跨区域数据同步和异地容灾机制.</p>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="button_img div1">
						<img src="images/icon-2.png" class="img-circle">
					</div>
					<div class="title_button div1">更好的支持</div>
					<div class="des_title div1">
						<p>提供可定制的模块化集成，规模可扩展，不影响服务；支持智能化全信息监控及7×24小时全天候运维服务.</p>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="button_img div1">
						<img src="images/icon-3.png" class="img-circle">
					</div>
					<div class="title_button div1">更快的服务</div>
					<div class="des_title div1">
						<p>提供快速的上线部署服务，高效率、智能化的信息传输控制，支持亿级别数据，秒间发送，信息即时可达。</p>
					</div>
				</div>
			</div>
			<hr class="featurette-divider">
		</div>
	</div>
	
	<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
	<script src="js/select2.min.js"></script>
	<script type="text/javascript" src="js/ls.js"></script>
	<script type="text/javascript" src="js/jquery.cookie.js"></script> 
	<script src="js/dialog/lhgdialog.min.js"></script>

	<script type="text/javascript">
		if (window != top) {
			top.location.href = location.href;
		}
		var errInfo = "${errInfo}";
		
		$(function() {

			var flag = '';
			if (flag == 1) {
				$("#remPwd").prop("checked", true);
			}
			changeLoginCode();
			if (errInfo != "") {
				if (errInfo.indexOf("验证码") > -1) {
					$("#errMsg").text(errInfo);
					$("#ecode").focus();
				} else {
					$("#errMsg").text(errInfo);
				}
			}
		});
	</script>
	<script type="text/javascript">
	
	
		function commit() {
			var spid = $("#spid").val();
			var ival = parseInt(spid);
			if(isNaN(ival)){
				$.dialog.tips("企业ID格式不正确");
                return false;
			}
			var acu = new String($("#userName").val());
			var newprd = $("#password").val();
			var yFindCode = new String($("#ecode").val());
			if (spid == "" || spid.length <= 0) {
				$.dialog.tips("企业ID不能为空");
                return false;
			}
			if (acu == "" || acu.length <= 0) {
				$.dialog.tips("登录名不能为空");
				return false;
			}
			if (newprd == "" || newprd.length <= 0) {
				$.dialog.tips("密码不能为空");
				return false;
			}
			if (yFindCode == "" || yFindCode.length <= 0) {
				$.dialog.tips("验证码不能为空");
				return false;
			}
			//var newprd = $("#password").val();
			//newprd = encode64(newprd);
			//$("#password").val(newprd);
			$("#myform").submit();
		}

		function genTimestamp() {
			var time = new Date();
			return time.getTime();
		}
		
		function changeLoginCode() {
			$("#codeImg").attr("src", "code.html?t=" + genTimestamp());
		}

		function findPassWord() {
			var url = path + "/retrievePassword";
			window.location.href = url;
		}

		//获取手机号列表
		function getPhones() {
			var acu = new String($("#account").val());
			var newprd = encode64($("#pwd").val());
			var yFindCode = new String($("#yFindCode").val());
			if (acu == "" || acu.length == 0) {
				$.dialog.tips("登录名不能为空");
				return false;
			}
			if (yFindCode == "" || yFindCode.length == 0) {
				$.dialog.tips("验证码不能为空");
				return false;
			}
			if (newprd == "" || newprd.length == 0) {
				$.dialog.tips("密码不能为空");
				return false;
			}
			$
					.ajax({
						type : "POST",
						url : path + "/getMobileUser",
						data : {
							acu : acu,
							yFindCode : yFindCode,
							prd : newprd
						},
						dataType : "json",
						cache : false,
						success : function(data) {
							if (data.errorCode > 0) {
								var datas = data.errorContent;
								var str = "<select  id='phoneUser' style='width:150px;'  class='js-example-basic-single'>";
								for (var i = 0; i < datas.length; i++) {
									str += "<option value="+i+">"
											+ datas[i].mobile + "</option>";
								}
								str += "</select>";
								$("#phones").html(str);
								$(".js-example-basic-single").select2();
							} else {
								$.dialog.tips(data.errorContent);
							}
						}
					});
		}
	</script>

</body>
</html>