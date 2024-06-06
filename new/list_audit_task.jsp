<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>任务审核</title>
	<link href="${ staticbase }/css2.0/soboxstyle.css" rel="stylesheet"
		  type="text/css" />
	<link href="${ staticbase }/css/boxy.css" rel="stylesheet"
		  type="text/css" />
	<script type="text/javascript"
			src="${ staticbase }/js/sohobox/jquery.sobox.js"></script>
	<script type="text/javascript"
			src="${ staticbase }/js/sohobox/sohobox.js"></script>
	<script type="text/javascript"
			src="${ staticbase }/js/listAuditTask/list_audit_task.js"></script>
</head>

<body class="content_body">
	<div class="content_wrapper">
	<form id='formId' action="${ basepage }/userAuditTask/userAuditTaskList.html"
		method="post">
		<div class="locate">
			<span class="ico_locate"></span>您当前的位置：<span><a>信息发送</a>&nbsp;>&nbsp;任务审核</span>
		</div>
		<div class="search_wrap">
			<label>任务编号：</label> <input name="task_id" type="text"
				value="${taskInfo.task_id}" /> <label>创建者：</label> <input
				name="createUsername" type="text" value="${taskInfo.createUsername}" />
			<input name="search" class="btn_search" type="button"
				onclick="submitform()" />
		</div>
		<%--onclick="listAuditTask.batchAudit()"--%>
		<div class="gridBtnList" style="margin-left: 25px">
			<button type="button" class="btn_grid" onclick="listAuditTask.batchAudit(1)" >批量通过</button>
			<button type="button" class="btn_grid" onclick="listAuditTask.batchAudit(2)">批量驳回</button>
			<button type="button" class="btn_grid" onclick="listAuditTask.batchAudit(0)">批量转至</button>
		</div>
		<div class="table_wrap">
			<table class="grid_table">
				<thead>
					<tr>
						<th width="30"><input type="checkbox" id="sltAll"
											  onclick="sltAllUser()"/></th>
						<th>序号</th>
						<th>任务编号<i class="sort"><img
								src="${ staticbase }/images/px.gif" /></i></th>
						<th>发送内容</th>
						<th>发送状态</th>
						<th>任务类型</th>
						<th>总条数/总人数</th>
						<th>提交类型</th>
						<th>创建者</th>
						<th>提交时间</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>

					<c:choose>
						<c:when test="${not empty taskList}">
							<c:forEach items="${taskList}" var="tasklist" varStatus="vs">
								<tr class="main_info" id="tr${tasklist.task_id}">
									<td><input type="checkbox" name="taskId" value="${tasklist.task_id}" /></td>
									<td>${vs.index+1}</td>
									<td align="center">${tasklist.task_id}</td>
									<td align="center" title="${tasklist.content}" class="contentTD"><span title="${tasklist.content}">
											<c:if test="${fn:length(tasklist.content)>10}">
												<div>${fn:substring(tasklist.content,0,10)}...</div>
											</c:if> <c:if test="${fn:length(tasklist.content)<=10}">
					                        ${tasklist.content}
				                    </c:if>
									</span></td>
									<c:choose>
										<c:when test="${tasklist.status=='0'}">
											<td align="center">待发送</td>
										</c:when>
										<c:when test="${tasklist.status=='1'}">
											<td align="center">待审核</td>
										</c:when>
										<c:when test="${tasklist.status=='2'}">
											<td align="center">
											<span title="${tasklist.descption}">
											发送失败/${tasklist.descption}
									       </span>
											</td>
										</c:when>
										<c:when test="${tasklist.status=='3'}">
											<td align="center">发送中</td>
										</c:when>
										<c:when test="${tasklist.status=='4'}">
											<td align="center">发送完成</td>
										</c:when>
									</c:choose>
									<c:choose>
										<c:when test="${tasklist.task_type=='1'}">
											<td align="center">即时发送</td>
										</c:when>
										<c:when test="${tasklist.task_type=='2'}">
											<td align="center">预约发送</td>
										</c:when>
									</c:choose>
									<td align="center">${tasklist.allnumber}/${tasklist.total}</td>
									<c:choose>
										<c:when test="${tasklist.send_type=='1000'}">
											<td align="center">接口发送</td>
										</c:when>
										<c:otherwise>
											<td align="center">平台发送</td>
										</c:otherwise>
									</c:choose>
									<td align="center">${tasklist.createUsername}</td>
									<td align="center" align="center">${fn:substring(tasklist.createTime,0,fn:length(tasklist.createTime)-2)}</td>
									<td align="center">
										<a title="审核" class="tablelink"
										    href="${ basepage }/userAuditTask/userAuditTaskSingle.html?task_id=${tasklist.task_id}">审核</a>
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
			<div class="page_and_btn">${taskInfo.page.pageStr}</div>
		</div>
	</form>
	 </div>

</body>
</html>
