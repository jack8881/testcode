<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>短信模版列表</title>
<%-- <link href="${ staticbase }/css2.0/soboxstyle.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="${ staticbase }/js/sohobox/jquery.sobox.js"></script>
	<script  type="text/javascript">
var jqeury  = jQuery.noConflict(true);
</script>
<script type="text/javascript"
	src="${ staticbase }/js/sohobox/sohobox.js"></script>
<script type="text/javascript"> --%>
	<link href="${ staticbase }/css2.0/soboxstyle.css" rel="stylesheet"
		  type="text/css" />
	<script type="text/javascript"
			src="${ staticbase }/js/dialog/lhgdialog.min.js"></script>
	<script type="text/javascript"
			src="${ staticbase }/js/sohobox/jquery.sobox.js"></script>
	<script type="text/javascript"
			src="${ staticbase }/js/sohobox/sohobox.js"></script>
	<script type="text/javascript"
			src="${ staticbase }/js/sovalidate/jquery.soValidate.min.js"></script>
	<link href="${ staticbase }/js/pager/pager.css" rel="stylesheet"
		  type="text/css" />
	<link href="${ staticbase }/css/boxy.css" rel="stylesheet"
		  type="text/css" />


<script type="text/javascript">
	function submitform(){
		$("#formId").submit();
	}
    function sendSendTemplate(id) {
        window.location.href = "../sendPms/init.html?id="+id;
    }

</script>
</head>

<body class="content_body">
	<div class="content_wrapper">
	<form id='formId' action="${ basepage }/sendPms/list.html"
		method="post">
		<div class="locate">
			<span class="ico_locate"></span>您当前的位置：<span><a>信息发送</a>&nbsp;>&nbsp;即时任务列表</span>
		</div>
		<div class="search_wrap">
			<label>模板内容：</label>
			<input name="content" type="text" value="${smsSendTemplate.content}" />
			<input name="search" class="btn_search" type="button" onclick="submitform()" />
		</div>
		<div class="table_wrap">
			<table class="grid_table">
				<thead>
					<tr>
						<th>模版ID<i class="sort"><img
								src="${ staticbase }/images/px.gif" /></i></th>
						<th>模版名称</th>
						<th>模版内容</th>
						<%--<th>字数</th>--%>
						<th>发送时间</th>
						<th>发送日期</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>

					<c:choose>
						<c:when test="${not empty smsSendTemplateList}">
							<c:forEach items="${smsSendTemplateList}" var="sendTemplate" varStatus="vs">
								<tr class="main_info">
									<td>${sendTemplate.id}</td>
									<td>${sendTemplate.name}</td>
									<td>${sendTemplate.content}</td>
									<%--<td>${sendTemplate.length}</td>--%>
									<td>每天${sendTemplate.startTime}--${sendTemplate.endTime}</td>
									<%--<td>${sendTemplate.startDate}--${sendTemplate.endDate}</td>--%>
									<td>每月${fn:substring(sendTemplate.startDate,8,10)}号--${fn:substring(sendTemplate.endDate,8,10)}号</td>
									<td>
										<a title="使用模板发送" class= "tablelink" href="#" onclick="sendSendTemplate('${sendTemplate.id}','update');">
											使用模板
										</a>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr class="main_info">
								<td colspan="11" align="center">没有相关数据</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
				
			</table>
			<div class="page_and_btn">${smsSendTemplate.page.pageStr}</div>
		</div>
	</form>
	 </div>

</body>
</html>
