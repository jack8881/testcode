<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>即时任务列表</title>
<script type="text/javascript">
	function submitform() {
		$("#formId").submit();
	}
</script>
</head>

<body class="content_body">
	<div class="content_wrapper">
		<form id='formId' action="${ basepage }/task/BookTaskList.html"
			method="post">
			<div class="locate">
				<span class="ico_locate"></span>您当前的位置：<span><a>信息发送</a>&nbsp;>&nbsp;预约任务列表</span>
			</div>
			<div class="content">
				<div class="search_wrap">
					<label>任务编号：</label> <input type="text" name="task_id" value="${taskInfo.task_id}"/> <label>信息内容：</label> <input
						type="text" /> <label>创建时间：</label> <input id="d12"
						name="createTime" type="text" value="${taskInfo.createTime}"
						type="text"
						onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'d13\')||\'%y-%M-%d\'}',dateFmt:'yyyy-MM-dd',isShowClear:false,readOnly:true})" />--
					<input id="d13" name="createTime1" type="text"
						value="${taskInfo.createTime1}" type="text"
						onfocus="WdatePicker({minDate:'#F{$dp.$D(\'d12\')||\'%y-%M-%d\'}',dateFmt:'yyyy-MM-dd',isShowClear:false,readOnly:true})" />
					<input name="search" class="btn_search" type="button"
						onclick="submitform()" />
				</div>
				<div class="table_wrap">
					<table class="grid_table">
						<thead>
							<tr>
								<th>任务编号<i class="sort"><img
										src="${ staticbase }/images/px.gif" /></i></th>
								<th>发送内容</th>
								<th>发送状态</th>
								<th>任务类型</th>
								<th>总条数/总人数</th>
								<th>成功/失败条数</th>
								<th>提交类型</th>
								<th>提交时间</th>
								<th>预约时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty taskList}">
									<c:forEach items="${taskList}" var="tasklist" varStatus="vs">
										<tr class="main_info" id="tr${tasklist.task_id}">
											<td align="center">${tasklist.task_id}</td>
											<td align="center"><span title="${tasklist.content}">
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
													<td align="center">发送失败</td>
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
											<td align="center">${tasklist.succ}/${tasklist.fail}</td>
											<c:choose>
												<c:when test="${tasklist.send_type=='1000'}">
													<td align="center">接口发送</td>
												</c:when>
												<c:otherwise>
													<td align="center">平台发送</td>
												</c:otherwise>
											</c:choose>
											<td align="center" align="center">${fn:substring(tasklist.createTime,0,fn:length(tasklist.createTime)-2)}</td>
											<td><fmt:formatDate value="${tasklist.book_time}"
													type="both" pattern="yyyy/MM/dd HH:mm:ss" /></td>
											<td align="center">

												<%--<a title="重新发送" style="cursor: pointer;"
												href="${ basepage }/task/taskToReSend.html?task_id=${tasklist.task_id}"><img
													src="${staticbase}/images/xt5.gif" /></a>--%>
												<c:choose>
													<c:when test='${tasklist.dynamicTask eq "1"}'>
														<a title="重新发送"
														   style="cursor: pointer;" href="${ basepage }/dynamicMessage.html?task_id=${tasklist.task_id}"><img
																src="${staticbase}/images/xt5.gif" />
														</a>
													</c:when>
													<c:otherwise>
														<a title="重新发送"
														   style="cursor: pointer;" href="${ basepage }/task/taskToReSend.html?task_id=${tasklist.task_id}"><img
																src="${staticbase}/images/xt5.gif" />
														</a>
													</c:otherwise>
												</c:choose>

												<c:choose>
													<c:when test="${tasklist.status=='0'}">
														<a title="取消预约任务" style="cursor: pointer;"
															<%-- href="javascript:delBookSms(${tasklist.task_id})"> --%>
															 href="${ basepage }/task/cancelBookTask.html?id=${tasklist.task_id}">
															<img src="${staticbase}/images/cross.gif" /></a>
													</c:when>
													<c:when test="${tasklist.status=='1'}">
														<a title="取消预约任务" style="cursor: pointer;"
															<%-- href="javascript:delBookSms(${tasklist.task_id})"> --%>
															 href="${ basepage }/task/cancelBookTask.html?id=${tasklist.task_id}">
															<img src="${staticbase}/images/cross.gif" /></a>
													</c:when>
												</c:choose></td>
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
						<tfoot>

						</tfoot>
					</table>
					<div class="page_and_btn">${taskInfo.page.pageStr}</div>
				</div>
			</div>
		</form>

	</div>

	<script type="text/javascript">
		function delBookSms(task_id) {
			if(confirm("确定要删除该记录？")){
				//alert(taskId);
				var url = basepage + "/task/cancelBookTask.html?id="+task_id;
				//alert(url);
				$.get(url, function(data) {
					if (data.returnCode == "200") {
					   alert('删除成功');
					   window.location.reload();
					} else {
						alert(data.msg);
					}
				});
			}
		}
	</script>

</body>
</html>
