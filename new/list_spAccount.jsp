<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="../common/common.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>企业每月发送统计（按提交计费）</title>
<link href="${ staticbase }/css2.0/style.css" rel="stylesheet"
	type="text/css" />
<link href="${ staticbase }/css/main.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript">
function submitform(){
	$("#formId").submit();
}

</script>
</head>

<body class="content_body">
	<div class="content_wrapper">
		<form id='formId' action="${ basepage }/task/spAccountList.html"
			method="post">
			<div class="locate">
				<span class="ico_locate"></span>您当前的位置：<span><a>发送统计</a>&nbsp;>&nbsp;月发送统计</span>
			</div>
			<div class="content">

				<div class="search_wrap">

					<label>选择月份:</label> <input id="d12" name="month" type="text"
						value="${taskInfo.month}" type="text"
						onfocus="WdatePicker({maxDate:'\'%y-%M\'}',skin:'twoer',dateFmt:'yyyy-MM',isShowClear:false,readOnly:true})" />



					<label>&nbsp;</label><input name="search" type="button"
						class="btn_search" onclick="submitform()" /> &nbsp;&nbsp;
					<button class="btn_grid" onclick="exportSpAccount()">
						<span class="ico_export"></span>导出
					</button>

				</div>
<div class="table_wrap">
				<table class="grid_table">
					<thead>
						<tr>
							<th>序号<i class="sort"><img
									src="${ staticbase }/images/px.gif" /></i></th>
							<!-- <th>企业ID</th>
							<th>企业名称</th> -->
							<th>发送总数</th>
							<th>提交成功总数</th>
							<th>提交失败总数</th>
							<th>成功率</th>
							<th>日期</th>
						</tr>
					</thead>
					<tbody>


						<c:choose>
							<c:when test="${not empty spAccountList}">
								<c:forEach items="${spAccountList}" var="tasklist"
									varStatus="vs">
									<tr class="main_info" align="center">
										<td>${vs.index+1}</td>
										<%-- <td>${tasklist.sp_id}</td>
										<td>${tasklist.sp_name}</td> --%>
										<td>${tasklist.allnumber}</td>
										<td>${tasklist.succ}</td>
										<td>${tasklist.fail}</td>
										<td><fmt:formatNumber
												value="${tasklist.succ/tasklist.allnumber*100}"
												pattern="#.00" />%</td>
										<td>${tasklist.time}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr class="main_info" align="center">
									<td colspan="11">没有相关数据</td>
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
		$(document).ready(function(){
			$(".main_info:even").addClass("main_table_even");
		});
		
		
		function exportSpAccount()
		{
				if (confirm("确认导出"))  {  
					var month=$("#d12").val();
					var url = basepage + "/task/exportSpAccount.html?month=" + month;
					window.open(url);
				}
		};
	</script>

</body>
</html>
