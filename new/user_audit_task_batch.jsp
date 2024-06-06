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
	<script type="text/javascript" src="${ staticbase }/js/listAuditTask/user_audit_task_batch.js"></script>
    <style type="text/css">
		.content{
			width:280px;
			font-size: 12px;
			margin-left: auto;
			margin-right: auto;
		}
        .contentTask{
			margin-top: 20px;
		}
	</style>

</head>

<body class="content_body">

	<div class="content_wrapper contentTask" style="min-height: inherit">
		<div>
			<c:choose>
				<c:when test="${auditResult ==1}">
					<h1 style="text-align: center;font-size: 16px">批量通过</h1>
				</c:when>
				<c:when test="${auditResult ==0}">
					<h1 style="text-align: center;font-size: 16px">批量转至</h1>
				</c:when>
				<c:when test="${auditResult ==-1}">
					<h1 style="text-align: center;font-size: 16px">批量驳回</h1>
				</c:when>
			</c:choose>
		</div>


		<div class="content sms_content">
			<form id="sendSmsForm" action="${ basepage }/sendSms/send.html">
				<input type="hidden" name="token" value="${token}" />
				<input type="hidden" name="LongSMSWords" id="LongSMSWords" value="67" />
				<input type="hidden" name="shortSMSWords" id="shortSMSWords" value="70" />
				<input type="hidden" name="signature" id="signature" value="${signature}" />
				<input type="hidden" name="maxSMSWords" id="maxSMSWords" value="1000" />
				<input type="hidden" id="importSendObjPathId" name="importFilePath" value="" />
				<input type="hidden" id="importSendObjFileNameId" name="importFileName" value="" />
				<input type="hidden" id="importSendObjGroupName" name="importSendObjGroupName" value="" />
				<input type="hidden" id="selectGroupIds" name="selectGroupIds" value="" />
				<input type="hidden" id="unselectedPhone" name="unselectedPhone" value="" />
				<%--审核结果--%>
                <input type="hidden" name="auditResult" value="${auditResult}"/>
				<%--批量审核任务ids--%>
				<input type="hidden" name="taskIds" value="${taskIds}"/>
                <div style="margin-top: 30px">原因/备注：</div>
				<div class="textarea_box" style="width: 300px">
					<div class="textarea" style="width: 300px">
						<textarea style="font-size: 14px; font-family: arial, 微软雅黑;width: 300px"
								  name="content" id="content"
								  onkeydown="javascript:userAuditTask.WordsCount();"
								  onkeyup="javascript:userAuditTask.WordsCount();"
								  onfocus="javascript:userAuditTask.WordsCount();"
								  onblur="javascript:userAuditTask.WordsCount();">${task.content}</textarea>
					</div>
					<div class="textarea_footer" style="width: 280px">
						共<span id="smsContent"> 0</span>条 &nbsp;<span id="txtWordsCount">0</span>/100
						字符
					</div>
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
			</form>
		</div>
	</div>
</body>


</html>
