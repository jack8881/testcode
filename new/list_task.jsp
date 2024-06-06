<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>即时任务列表</title>
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
function reSendMessage(taskid) {
    SoDialog.ajaxOpenSave("${ staticbase }/task/failReSendPage.html?taskid=" + taskid, "补发重发",
        function(me) {
	    	taskfail = {};
	        var submittype=$('input:radio[name="submittype"]:checked').val();

	        /** 重新发送 */
	        taskfail.ReSend = function(me) {
	            window.location="${ staticbase }/task/taskToReSend.html?submittype="+submittype+"&task_id="+taskid;
	        };
            return taskfail.ReSend(me);
        });
}
</script>
</head>

<body class="content_body">
	<div class="content_wrapper">
	<form id='formId' action="${ basepage }/task/taskList.html"
		method="post">
		<div class="locate">
			<span class="ico_locate"></span>您当前的位置：<span><a>信息发送</a>&nbsp;>&nbsp;即时任务列表</span>
		</div>
		<div class="search_wrap">
			<label>任务编号：</label> <input name="task_id" type="text"
				value="${taskInfo.task_id}" maxlength="18"/> <label>信息内容：</label> <input
				name="content" type="text" value="${taskInfo.content}" /> <label>创建时间：</label>
			<input id="d12" name="createTime" type="text"
				value="${taskInfo.createTime}" type="text"
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
						<th>移动/联通/电信条数</th>
						<th>提交类型</th>
						<th>提交时间</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>

					<c:choose>
						<c:when test="${not empty taskList}">
							<c:forEach items="${taskList}" var="tasklist" varStatus="vs">
								<tr class="main_info" id="tr${tasklist.task_id}">
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
									<td align="center">${tasklist.succ}/${tasklist.fail}</td>
									<td align="center">${tasklist.mobilenumber}/${tasklist.unicomnumber}/${tasklist.telecomnumber}</td>
									<c:choose>
										<c:when test="${tasklist.send_type=='1000'}">
											<td align="center">接口发送</td>
										</c:when>
										<c:when test="${tasklist.send_type=='10000'}">
                                            <td align="center">平台发送</td>
                                        </c:when>
										<c:otherwise>
											<td align="center">平台彩信发送</td>
										</c:otherwise>
									</c:choose>
									<td align="center" align="center">${fn:substring(tasklist.createTime,0,fn:length(tasklist.createTime)-2)}</td>
									<td align="center">
										<c:choose>
											<c:when test='${tasklist.dynamicTask eq "1" }'>
												<a title="重新发送"
												   style="cursor: pointer;" href="${ basepage }/dynamicMessage.html?task_id=${tasklist.task_id}"><img
														src="${staticbase}/images/xt5.gif" />
												</a>

											</c:when>
											<c:otherwise>
												<a title="重新发送"
												   style="cursor: pointer;" href="#" onclick="reSendMessage('${tasklist.task_id}')"><img
														src="${staticbase}/images/xt5.gif" />
												</a>
											</c:otherwise>
										</c:choose>
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
	 <script type="text/javascript">
 $('.contentTD').dblclick(function(){
		var copycontent = $(this).attr('title');
		Dialog.alertSucc(copycontent);
	}); 
</script>
</body>
</html>
