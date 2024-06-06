<%@page import="org.springframework.http.HttpOutputMessage"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% String path=request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="../common/common.jsp"%>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>任务审核</title>
	<link href="${ staticbase }/css2.0/style.css" rel="stylesheet" type="text/css" />
	<link href="${ staticbase }/web/css/select2.min.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${ staticbase }/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="${ staticbase }/js/select2.min.js"></script>
	<script type="text/javascript" src="${ staticbase }/js/select-ui.min.js"></script>
	<script type="text/javascript" src="${ staticbase }/js/listAuditTask/user_audit_task.js"></script>
    <style type="text/css">
		.taskSpan{
			margin: 30px 50px;
			font-size: 12px;
		}
		.content{
			margin: 10px 50px;
			font-size: 12px;
		}
        .contentTask{
			margin-top: 20px;
		}
	</style>

</head>

<body class="content_body">
	<div class="locate">
		<span class="ico_locate"></span>您当前的位置：<span><a>信息发送</a>&nbsp;>&nbsp;任务审核</span>
	</div>
	<div class="content_wrapper" style="min-height: inherit;margin-top: 20px">

		<div style="margin: 20px 0px;">
			<span class="taskSpan">提交者：${taskInfo.createUsername}</span>
			<span class="taskSpan" id="task_id">任务编号：<span>${taskInfo.task_id}</span></span>
			<span class="taskSpan">提交人数：${taskInfo.total}</span>
		</div>
		<hr/>
		<p class="content">
			<label>短信内容：</label>${taskInfo.content}
		</p>
	</div>
	<div class="content_wrapper contentTask" style="min-height: inherit">
		<div class="content sms_content">
			<form id="sendSmsForm" action="${ basepage }/sendSms/send.html">
				<input type="hidden" name="token" value="${token}" />
				<input type="hidden" name="LongSMSWords" id="LongSMSWords" value="67" />
				<input type="hidden" name="shortSMSWords" id="shortSMSWords" value="70" />
				<input type="hidden" name="signature" id="signature" value="${signature}" />
				<input type="hidden" name="maxSMSWords" id="maxSMSWords" value="300" />
				<input type="hidden" id="importSendObjPathId" name="importFilePath" value="" />
				<input type="hidden" id="importSendObjFileNameId" name="importFileName" value="" />
				<input type="hidden" id="importSendObjGroupName" name="importSendObjGroupName" value="" />
				<input type="hidden" id="selectGroupIds" name="selectGroupIds" value="" />
				<input type="hidden" id="unselectedPhone" name="unselectedPhone" value="" />
				<div>
					<span>审核结果：</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span>
						<div>
								<input type="radio" name="auditResult" checked value="1"/>审核通过&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="auditResult" value="0"/>审核转至&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="auditResult" value="2"/>审核驳回&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

						</div>
						<input type="hidden" id = "auditResult" value="1"/>
				    </span>
				</div>


                <div style="margin-top: 30px">审核意见：</div>
				<div class="textarea_box">
					<div class="textarea">
						<textarea style="font-size: 14px; font-family: arial, 微软雅黑;"
								  name="content" id="content"
								  onkeydown="javascript:userAuditTask.WordsCount();"
								  onkeyup="javascript:userAuditTask.WordsCount();"
								  onfocus="javascript:userAuditTask.WordsCount();"
								  onblur="javascript:userAuditTask.WordsCount();">${task.content}</textarea>
					</div>
					<div class="textarea_footer">
						共<span id="smsContent"> 0</span>条 &nbsp;<span id="txtWordsCount">0</span>/300
						字符
					</div>
				</div>
				<div style="margin-top: 20px">
					<label>审核人：</label>
					<select id="audit_select" multiple="multiple" style="width: 300px">
					</select>
				</div>
				<div style="margin-top: 20px">
					<button class="btn_save" type="button">确认</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="btn_cancel" type="button">取消</button>
				</div>
			</form>
		</div>
	</div>
</body>


</html>
