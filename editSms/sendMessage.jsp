<%@page import="org.springframework.http.HttpOutputMessage"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="../common/common.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>短信发送</title>
<link href="${ staticbase }/css2.0/style.css" rel="stylesheet" type="text/css" />
<link href="${ staticbase }/css2.0/soboxstyle.css" rel="stylesheet" type="text/css" />
<link href="${ staticbase }/web/css/select2.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ staticbase }/js/sohobox/jquery.sobox.js"></script>
<script type="text/javascript" src="${ staticbase }/js/sohobox/sohobox.js"></script>
<script type="text/javascript" src="${ staticbase }/js/select2.min.js"></script>
<script type="text/javascript" src="${ staticbase }/js/select-ui.min.js"></script>
<script type="text/javascript" src="${ staticbase }/js/editSms/editSms.js?d=${rand}"></script>

</head>


<body class="content_body">
	<div class="sidebar">
		<h3>选择接收人</h3>
		<div class="sidebar_content">
			<div class="search_input">
				<input id="phonenumber" type="text" /> <a class="icoBtn_search" onclick="addphone()"></a>
			</div>
			<div class="wrap_contactTree">
				<ul id="contactTree1" class="ztree"></ul>
			</div>
		</div>
	</div>
	<div class="content_wrapper right_content">
		<div class="locate">
			<span class="ico_locate"></span>您当前的位置：<span><a>信息发送</a>&nbsp;>&nbsp;短信发送</span>
		</div>
		<div class="content sms_content">
			<form id="sendSmsForm" action="${ basepage }/sendSms/send.html"
				method="post">
				<input type="hidden" name="plateId" id="plateId" value="${plateId}" />
				<input type="hidden" name="token" value="${token}" />
				<input type="hidden" name="LongSMSWords" id="LongSMSWords"
					value="67" /> <input type="hidden" name="shortSMSWords"
					id="shortSMSWords" value="70" /> <input type="hidden"
					name="signature" id="signature"
					value="${sessionScope.sessionEpUser.signature}" /> <input
					type="hidden" name="maxSMSWords" id="maxSMSWords" value="1000" />
				<input type="hidden" id="importSendObjPathId" name="importFilePath"
					value="${importFilePath}" /> <input type="hidden" id="importSendObjFileNameId"
					name="importFileName" value="${importFileName}" /> <input type="hidden"
					id="importSendObjGroupName" name="importSendObjGroupName" value="" />
				<input type="hidden" id="selectGroupIds" name="selectGroupIds"
					value="" /> <input type="hidden" id="unselectedPhone"
					name="unselectedPhone" value="" />
				<h3>请输入短信内容：</h3>
				<div class="textarea_box">
					<div class="textarea">
						<textarea style="font-size: 14px; font-family: arial, 微软雅黑;"
							name="content" id="content"
							onkeydown="javascript:editSms.WordsCount();"
							onkeyup="javascript:editSms.WordsCount();"
							onfocus="javascript:editSms.WordsCount();"
							onblur="javascript:editSms.WordsCount();" >${task.content}</textarea>
					</div>
					<div class="textarea_footer">
						共<span id="smsContent"> 0</span>条 &nbsp;<span id="txtWordsCount">0</span>/1000
						字符(包含企业签名)
						<c:if
							test="${sessionScope.sessionEpUser.signature!=''and sessionScope.sessionEpUser.signature!=null }">
	                             &nbsp; &nbsp; &nbsp;   企业签名:${sessionScope.sessionEpUser.signature} </c:if>
					</div>
				</div>
				<div class="book_send">
					<input id="sltAll" name="booksend" type="checkbox" value="on"
						onclick="javascript:editSms.showBookTime()" /> <label
						for="sltAll">预约发送</label>
					<div style="display: none;" id="booksend">
						预约时间: <input type="text" name="booksendTime" readonly="readonly"
							id="booksendTime" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:00',minDate: '%y-%M-%d-',skin:'twoer',isShowClear:false})" 
								
							/>
					</div>
				</div>
				<div> <h3 style="display : inline">请输入短信接收号码：</h3>  &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; 
					<a href="javascript:editSms.toImportMdnFile();"
						style="text-decoration: none; color: #2d63b5; vertical-align: middle"><span
						id="importTitle">导入接收号码</span></a>
		        </div>
				<div class="textarea_box">
					<textarea name="sendMobiles" id="mdn" onclick="clearMdntip()"
							onblur="clearMdntip()" style="height: 80px;" ><c:if test="${fn:contains(sendMdnObject,'RESEND_PHONES')}">${sendMdnObject}</c:if></textarea>
			
				</div>
				<c:if test="${userAuditInfoList!=null && fn:length(userAuditInfoList) > 0}">
					<div style="margin-top: 20px">
						<label>审核人：</label>
						<select id="audit_select" multiple="multiple" style="width: 300px">
							<c:forEach items="${userAuditInfoList}" var="user" varStatus="vs">
								<option value="${user.id}">${user.userName}</option>
							</c:forEach>
						</select>
					</div>
				</c:if>
				<input type="hidden" name="userInfoAuditIds"/>
				<div style="margin-top: 20px;">
					<button class="btn_save" type="button" onclick="return editSms.checksms()">发&nbsp;&nbsp;送</button>
					<button class="btn_cancel" type="reset" >重&nbsp;&nbsp;置</button>
				</div>
			</form>
		</div>
	</div>

	<script type="text/javascript">
/* 	$(document).ready(function(){
		
		var str = "123(wang)"
			var str1 = str.indexOf("(");
			alert(str1);
			var str2 = str.indexOf(")");
			alert(str2);
		  alert(str.substring(str1+1,str2));
	}) */
	

		function clearMdntip() {
			var s = $('#mdn').val();
			if (s.indexOf('手机号码') == 0) {
				$('#mdn').empty();
			}

		}

		function submitform() {

			$('#sendSmsForm').submit();
		}
		function addphone() {
			var phonenumber = $("#phonenumber").val();
			var phone;
			var mobilereg = /^1\d{10}$/;
			if (!isNaN(phonenumber) && !phonenumber.match(mobilereg)) {
				alert("请输入正确的手机号码!");
				return false;
			} else {
				phone = phonenumber + ";"
			}

			var values = $('#mdn').val();
			$('.icoBtn_search').click(function() {
				$('#mdn').val(values + phone);
				//alert(phonenumber);
			});
		}
	</script>
</body>


</html>
