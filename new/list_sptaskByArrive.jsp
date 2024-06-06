<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="../common/common.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>企业每日发送统计（按到达计费）</title>
<link href="${ staticbase }/css2.0/style.css" rel="stylesheet"
	type="text/css" />
<link href="${ staticbase }/css/main.css" rel="stylesheet"
	type="text/css" />
	<script type="text/javascript"
			src="${ staticbase }/js/dialog/lhgdialog.min.js"></script>
	<script type="text/javascript"
			src="${ staticbase }/js/sohobox/jquery.sobox.js"></script>
	<script type="text/javascript"
			src="${ staticbase }/js/sohobox/sohobox.js"></script>
	<script type="text/javascript"
			src="${ staticbase }/js/sovalidate/jquery.soValidate.min.js"></script>
<script type="text/javascript">
function submitform(){
	$("#formId").submit();
}

</script>
</head>

<body class="content_body">
	<div class="content_wrapper">
		<form id='formId' action="${ basepage }/task/sptaskListByArrive.html"
			method="post">
			<div class="locate">
				<span class="ico_locate"></span>您当前的位置：<span><a>发送统计</a>&nbsp;>&nbsp;每日发送统计</span>
			</div>
			<div class="content">

				<div class="search_wrap">

					<label>任务编号:</label> <input name="task_id" type="text"
						value="${taskInfo.task_id}" /> <label>提交时间:</label> <input
						id="d12" name="createTime" type="text"
						value="${taskInfo.createTime}" type="text"
						onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'d13\')||\'%y-%M-%d\'}',dateFmt:'yyyy-MM-dd',isShowClear:false,readOnly:true})" />--
					<input id="d13" name="createTime1" type="text"
						value="${taskInfo.createTime1}" type="text"
						onfocus="WdatePicker({minDate:'#F{$dp.$D(\'d12\',{d:0});}',maxDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd',isShowClear:false,readOnly:true})" />
					
             	 	<label>发送类型：</label>
              		<select id="send_type" name="send_type" class="form_control form_white">
									<option value="10000" <c:if test="${taskInfo.send_type=='10000' }">selected</c:if>>平台发送</option>
									<option value="1000" <c:if test="${taskInfo.send_type=='1000' }">selected</c:if>>接口发送</option>
									<option value="" <c:if test="${taskInfo.send_type=='' }">selected</c:if>>不限</option>
					</select>

					<label>&nbsp;</label><input name="search" type="button"
						class="btn_search" onclick="submitform()" /> &nbsp;&nbsp;
					<!-- <button class="btn_grid" onclick="exportSpTaskCount()">
						<span class="ico_export"></span>导出
					</button> -->
					
				</div>
			<div class="table_wrap">
				<table class="grid_table">
					<thead>
						<tr>
							<th>任务编号<i class="sort"><img
									src="${ staticbase }/images/px.gif" /></i></th>
							<th>发送内容</th>
							<th>发送状态</th>
							<th>总条数</th>
							<th>总人数</th>
							<th>提交成功条数</th>
							<th>提交失败条数</th>
							<c:if test="${'1' == isShowReceipt}">
								<th>到达成功条数</th>
								<th>到达失败条数</th>
								<th>未收回执条数</th>
							</c:if>
							<th>提交时间</th>
							<th>完成时间</th>
						</tr>
					</thead>
					<tbody>


						<c:choose>
							<c:when test="${not empty taskList}">
								<c:forEach items="${taskList}" var="tasklist" varStatus="vs">
									<tr class="main_info" id="tr${tasklist.task_id}">
										<td>${tasklist.task_id}</td>
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
												<td align="center">发送失败</td>
											</c:when>
											<c:when test="${tasklist.status=='3'}">
												<td align="center">发送中</td>
											</c:when>
											<c:when test="${tasklist.status=='4'}">
												<td align="center">发送完成</td>
											</c:when>
										</c:choose>
										<td><span>${tasklist.allnumber}</span></td>
										<td>${tasklist.total}</td>
										<td>${tasklist.succ}</td>
										<td>${tasklist.fail}</td>
										<c:if test="${'1' == isShowReceipt}">
											<td>${tasklist.arrive_succ}</td>
											<td>${tasklist.arrive_fail}</td>
											<td>
											<c:if test="${tasklist.status=='4'||tasklist.status=='2'}">
												${tasklist.allnumber-tasklist.arrive_succ-tasklist.arrive_fail}
											</c:if>
											</td>
										</c:if>
										<td>
											${tasklist.createTime}
										</td>
										<td>
											<c:if test="${tasklist.status=='4'||tasklist.status=='2'}">
												<fmt:formatDate value="${tasklist.endTime}"
																type="both" pattern="yyyy/MM/dd HH:mm:ss" />
											</c:if>
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr class="main_info" align="center">
								<c:if test="${'1' == isShowReceipt}">
									<td colspan="12">没有相关数据</td>
								</c:if>
								<c:if test="${'1' != isShowReceipt}">
									<td colspan="10">没有相关数据</td>
								</c:if>
								</tr>
							</c:otherwise>
						</c:choose>


					</tbody>

				</table>
			</div>
			</div>
			<div class="page_and_btn">
				<div class="page_and_btn">${taskInfo.page.pageStr}</div>

			</div>
		</form>
	</div>
	<script type="text/javascript">
	  function exportSpTaskCount(){
			if (confirm("确认导出"))  {  
				var createTime=$("#d12").val();
			 	var createTime1=$("#d13").val();
				var url = basepage + "/task/exportSpTaskListByArrive.html?createTime=" + createTime+"&createTime1="+createTime1;
				//document.location= url;
				window.open(url);
				alert('导出成功');
			}else{ 
		};
	};
	 $('.contentTD').dblclick(function(){
			var copycontent = $(this).attr('title');
			Dialog.alertSucc(copycontent);
		}); 
	</script>
 
</body>
</html>
