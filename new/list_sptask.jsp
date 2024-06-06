<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="../common/common.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>企业每日发送统计（按提交计费）</title>

<script type="text/javascript">
function submitform(){
	$("#formId").submit();
}


/* $(function(){
	
}) */
</script>
</head>

<body class="content_body">
	<div class="content_wrapper">
		<form id='formId' action="${ basepage }/task/sptaskList.html" method="post">
			<div class="locate">
				<span class="ico_locate"></span>您当前的位置：<span><a>发送统计</a>&nbsp;>&nbsp;每日发送统计</span>
			</div>
			<div class="content">

				<div class="search_wrap">

					<label>任务编号:</label> <input name="task_id" type="text"
						value="${taskInfo.task_id}" maxlength="18"/> <label>提交时间:</label> <input
						id="d12" name="createTime" type="text"
						value="${taskInfo.createTime}" type="text"
						onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'d13\')||\'%y-%M-%d\'}',dateFmt:'yyyy-MM-dd',isShowClear:false,readOnly:true})" />--
					<input id="d13" name="createTime1" type="text"
						value="${taskInfo.createTime1}" type="text"
						onfocus="WdatePicker({minDate:'#F{$dp.$D(\'d12\')||\'%y-%M-%d\'}',dateFmt:'yyyy-MM-dd',isShowClear:false,readOnly:true})" />


					<label>&nbsp;</label><input name="search" type="button"
						class="btn_search" onclick="submitform()" /> &nbsp;&nbsp;
					<button class="btn_grid" onclick="exportSpTaskCount()">
						<span class="ico_export"></span>导出
					</button>

					<ul>
						<li><span>&nbsp;&nbsp;&nbsp;&nbsp; 总计发送条数: <c:if
									test="${taskcount.allnumber==null}">0</c:if> <c:if
									test="${taskcount.allnumber!=0}">${taskcount.allnumber}</c:if>
								条&nbsp;&nbsp;发送人数: <c:if test="${taskcount.total==null}">0</c:if>
								<c:if test="${taskcount.total!=null}">${taskcount.total}</c:if>人&nbsp;&nbsp;成功条数:
								<c:if test="${taskcount.succ==null}">0</c:if> <c:if
									test="${taskcount.succ!=null}">${taskcount.succ}</c:if>
								&nbsp;&nbsp;失败条数<c:if test="${taskcount.fail==null}">&nbsp;&nbsp;0</c:if>
								<c:if test="${taskcount.fail!=null}">${taskcount.fail}</c:if>
						</span></li>
					</ul>
				</div>
<div class="table_wrap">
				<table class="grid_table">
					<thead>
						<tr>
							<th>任务编号<i class="sort"><img
									src="${ staticbase }/images/px.gif" /></i></th>
							<th>发送状态</th>
							<th>总条数</th>
							<th>总人数</th>
							<th>成功条数</th>
							<th>失败条数</th>
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
										<td>
											${fn:substring(tasklist.createTime,0,fn:length(tasklist.createTime)-2)}
										</td>
										<td><fmt:formatDate value="${tasklist.endTime}"
												type="both" pattern="yyyy/MM/dd HH:mm:ss" /></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr class="main_info" align="center">
									<td colspan="8" >没有相关数据</td>
								</tr>
							</c:otherwise>
						</c:choose> 
					</tbody>
				
				</table>
				</div>
				</div>
		<div class="page_and_btn">${taskInfo.page.pageStr}</div>
		</form>
		</div>
		
	<script type="text/javascript">
	function exportSpTaskCount(){
 		if (confirm("确认导出"))  {  
			var createTime=$("#d12").val();
		 	var createTime1=$("#d13").val();
			var url = basepage + "/task/exportSpTaskList.html?createTime=" + createTime+"&createTime1="+createTime1;
		   	window.open(url);
		
		}
  }
	</script>

</body>
</html>
