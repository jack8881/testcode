<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="../common/common.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>企业每月发送统计（按到达计费）</title>
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
		<form id='formId'
			action="${ basepage }/task/spAccountListByArrive.html" method="post">
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

					<li><span>
							&nbsp;&nbsp;&nbsp;&nbsp;<b style="color: red;">本页</b>总计发送条数: ${spTotal.allnumber==null?0:spTotal.allnumber}条
							&nbsp;&nbsp;发送成功:${spTotal.succ==null?0:spTotal.succ}条
							&nbsp;&nbsp;发送失败:${spTotal.fail==null?0:spTotal.fail}条
                            <c:if test="${'1' == isShowReceipt}">
								&nbsp;&nbsp;到达成功:${spTotal.arrive_succ==null?0:spTotal.arrive_succ}条
								&nbsp;&nbsp;到达失败:${spTotal.arrive_fail==null?0:spTotal.arrive_fail}条
								&nbsp;&nbsp;成功率:
								<c:choose>
									<c:when test="${spTotal.succ != 0}">
										<fmt:formatNumber
												value="${spTotal.arrive_succ/spTotal.succ*100}"
												pattern="0.00" />%
									</c:when>
									<c:otherwise>
										<fmt:formatNumber
												value="0"
												pattern="0.00" />%
									</c:otherwise>
								</c:choose>
							</c:if>
                        </span></li>
                    </ul>

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
							<c:if test="${'1' == isShowReceipt}">
								<th>到达成功总数</th>
								<th>到达失败总数</th>
								<th>未收回执总数</th>
							</c:if>
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
										<c:if test="${'1' == isShowReceipt}">
											<td>${tasklist.arrive_succ}</td>
											<td>${tasklist.arrive_fail}</td>
											<td>${tasklist.allnumber-tasklist.arrive_succ-tasklist.arrive_fail}</td>
											<td>
												<c:choose>
													<c:when test="${tasklist.succ != 0}">
														<fmt:formatNumber
																value="${tasklist.arrive_succ/tasklist.succ*100}"
																pattern="0.00" />%
													</c:when>
													<c:otherwise>
														<fmt:formatNumber
																value="0"
																pattern="0.00" />%
													</c:otherwise>
												</c:choose>
											</td>
										</c:if>
										<td>${tasklist.time}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr class="main_info" align="center">
									<td colspan="13">没有相关数据</td>
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
      function exportSpAccount()
		{
			if (confirm("确认导出"))  {  
				var month=$("#d12").val();
				var url = basepage + "/task/exportSpAccountByArrive.html?month=" + month;
				window.open(url);
				//document.location= url;
					alert('导出成功');
				}else{ 
			};
		};
	</script>

</body>
</html>
