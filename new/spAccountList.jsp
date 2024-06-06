<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>企业对账单</title>
<link href="${ staticbase }/css/main.css" rel="stylesheet"
	type="text/css" />
<link href="${ staticbase }/css/style.css" rel="stylesheet"
	type="text/css" />

<script type="text/javascript">
$(document).ready(function(){
  $(".click").click(function(){
  $(".tip").fadeIn(200);
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

});
</script>


</head>


<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="javascript:void(0);">首页</a></li>
			<li><a href="javascript:void(0);">发送统计</a></li>
			<li><a href="javascript:void(0);">月发送统计</a></li>
		</ul>
	</div>

	<div class="mainindex">
		<form action="${basepage}/task/spAccountList.html" method="post">


			<div class="tools">

				<ul class="seachform">

					<li><label>选择月份:</label> <input id="d12" name="month"
						type="text" value="${taskInfo.month}" class="Wdate" type="text"
						onfocus="WdatePicker({maxDate:'\'%y-%M\'}',skin:'twoer',dateFmt:'yyyy-MM',isShowClear:false,readOnly:true})" />
					</li>

					<li><label>&nbsp;</label><input name="search" type="submit"
						onclick="return serachsp()" class="scbtn" value="查询" /></li>
					<li><label>&nbsp;</label><input name="search" type="button"
						onclick="exportSpAccount()" class="scbtn" value="导出" /></li>

				</ul>

			</div>
			<table class="tablelist">
				<thead>
					<tr>
						<th>序号<i class="sort"><img
								src="${ staticbase }/images/px.gif" /></i></th>
						<th>企业ID</th>
				<!-- 		<th>企业名称</th>
						<th>发送总数</th> -->
						<th>提交成功总数</th>
						<th>提交失败总数</th>
						<th>成功率</th>
						<th>日期</th>
					</tr>
				</thead>

				<tbody>

					<c:choose>
						<c:when test="${not empty spAccountList}">
							<c:forEach items="${spAccountList}" var="tasklist" varStatus="vs">
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


			<div class="page_and_btn">${taskInfo.page.pageStr}</div>



		</form>


	</div>

	<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>

	<script type="text/javascript">
		$(document).ready(function(){
			$(".main_info:even").addClass("main_table_even");
		});
		
		function serachsp(){
			  return true;
		}
		
		
		
		function exportSpAccount()
		{
				if (confirm("确认导出"))  {  
					var month=$("#d12").val();
					var url = basepage + "/task/exportSpAccount.html?month=" + month;
					window.open(url);
				alert('导出成功');
					}else{ 
				};
		};
	</script>

</body>

</html>