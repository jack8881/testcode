<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ include file="../common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<base href="<%=basePath%>" />
<title>短信发送</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="${ staticbase }/js/jquery.js"></script>
<script type="text/javascript"
	src="${ staticbase }/js/datePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="${ staticbase }/js/dialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
<script type="text/javascript">
	function checksms() {
		var content = $("#content").val();
		if (content == "") {
			alert("发送不能为空!");
			return false;
		}
		
		
		if ($("#mdn").val() == "") {
			alert("发送手机号码不能为空!");
			return false;
		}
		
		return true;
	}
	
	
	function goback() {
		window.history.go(-1);
	}
	function WordsCount(){
		var words,shortsms,longsms,maxwordCount;
		words = $("#content").val().length;
		shortsms = $("#shortSMSWords").val();
		longsms =  $("#LongSMSWords").val();
		maxwordCount=$("#maxSMSWords").val();
		if(words>parseInt(shortsms)){
			msgs = Math.ceil(words / parseInt(longsms));
		}
		else{
			msgs = 1;
		}
		if(words>maxwordCount){
			 $("#content").val($("#content").val().substring(0,maxwordCount));
		}
		  //alert(msgs);
		 $("#txtWordsCount1").html(words);
		 $("#smsContent").html(msgs);
	}
	
	function UploadMdnFile(){
		//$(".shadow").show();
		 $.dialog({
			title:'导入接收号码',
			id:'import_mdn',
			width:450,
			height:300,
			lock:true,
			background:'#000',
			opacity: 0.5,
			maxBtn:false,
			resize:false,
			content:'url:web/editSms/importMdnFile.jsp',
			/* ok:function(data){
				alert("导入文件不能为空!");
				if($("#importfile").val()==''){
					alert("导入文件不能为空!");
					$("#importfile").focus();
					return false;
				}
				$("#import_mdn").submit();
			}, */
			 ok: function () {
			        /* 这里要注意多层锁屏一定要加parent参数 */
			        $.dialog({content: '再来一个锁屏', lock: true, parent:this});
			        return false;
			    },
			okVal:'上传',
			cancel:true
			});
	}
	
</script>
</head>



<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">信息发送</a></li>
			<li><a href="#">短信发送</a></li>
		</ul>
	</div>

	<div class="formbody">
		<div class="formtitle">
			<span>发送短信</span>
		</div>
		<form action="sendSms/send.html" method="post">
			<input type="hidden" name="token" value="${token}" />
			<input type="hidden" name="LongSMSWords" id="LongSMSWords" value="67" />
			<input type="hidden" name="shortSMSWords" id="shortSMSWords"
				value="70" /> <input type="hidden" name="maxSMSWords"
				id="maxSMSWords" value="1000" />
			<table border="0" cellpadding="0" cellspacing="0">
				<tbody>
					<tr>
						<td width="80" align="right" valign="top">发送内容：</td>
						<td colspan="2"><textarea rows="5" cols="120" name="content"
								id="content" style="width: 70%; height: 150px;"
								class="textinput" onkeydown="javascript:WordsCount();"
								onkeyup="javascript:WordsCount();"
								onfocus="javascript:WordsCount();"
								onblur="javascript:WordsCount();"></textarea>
							<div>
								普通短信 <strong class="red">
									<div id="txtEachSMSWords1" style="display: inline;">70</div>
								</strong>字/条，长短信（超过 <strong class="red">
									<div id="txtEachSMSWords2" style="display: inline;">70</div>
								</strong> 字）按<strong class="red">
									<div id="txtLongSMSWords1" style="display: inline;">67</div>
								</strong>字/条计费<br>最多允许输入 <strong class="red">
									<div id="txtMaxSMSWords1" style="display: inline;">1000</div>
								</strong>个字符，已经输入 <strong class="red">
									<div id="txtWordsCount1" style="display: inline;">
										<b>0</b>
									</div>
								</strong> &nbsp;个字符&nbsp;共 <strong class="red"><div
										id="smsContent" style="display: inline;">
										<b>0</b>
									</div></strong>&nbsp;条
							</div></td>
					</tr>
					<tr>
						<td colspan="2" align="right"><a
							href="javascript:UploadMdnFile();" class="leftBtn">导入接收号码</a></td>
						<td></td>
					</tr>
					<tr>
						<td width="80" align="right" valign="top">发送号码：</td>

						<td colspan="2"><textarea rows="5" cols="120" name="mdn"
								id="mdn" class="textinput"
								style="width: 70%; height: 130px; ime-mode: disabled;"></textarea>

						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">&nbsp;&nbsp;&nbsp;</td>

					</tr>
					<tr>
						<td colspan="2" align="center"><label>&nbsp;&nbsp;&nbsp;&nbsp;</label><input
							name="sub" type="submit" class="btn" value="发&nbsp;送"
							onclick="return checksms()" /> &nbsp;&nbsp;&nbsp; <input
							name="cancel" type="button" class="btn" value="返&nbsp;回"
							onclick="goback()" /></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>


</html>

