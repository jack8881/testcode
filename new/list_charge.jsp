<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="../common/common.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>充值记录</title>

<script type="text/javascript">
function submitform(){
	$("#formId").submit();
}

</script>
</head>

<body class="content_body">
	<div class="content_wrapper">
		<form id='formId' action="${ basepage }/spList/spChargeRecord.html"
			method="post">
			<div class="locate">
				<span class="ico_locate"></span>您当前的位置：<span><a>财务管理</a>&nbsp;>&nbsp;充值记录</span>
			</div>
			<div class="content">
				<div class="search_wrap">
					<label>查询月份:</label> <input class="Wdate" id="d12" type="text" name="month" 
						value="${chargeRecord.month}" 
						onfocus="WdatePicker({maxDate:'\'%y-%M\'}',skin:'twoer',dateFmt:'yyyy-MM',isShowClear:false,readOnly:true})" />
						&nbsp;<input name="search" class="btn_search" type="button"
						onclick="submitform()" />
                
				</div>
				
				
				<div class="table_wrap">

					<table class="grid_table">
						<thead>
							<tr>
								<th>序号</th>
								<th>充值条数</th>
								<th>操作员</th>
								<th>充值时间</th>
								<th>备注</th>
							</tr>
						</thead>
						<tbody>


							<c:choose>
								<c:when test="${not empty spChargeRecordList}">
									<c:forEach items="${spChargeRecordList}" var="chargeRecordList"
										varStatus="vs">
										<tr class="main_info" id="tr${chargeRecordList.sp_id}">
											<td>${vs.index+1}</td>
											<td>${chargeRecordList.chargeNum}</td>
											<td>${chargeRecordList.operator}</td>
											<td><fmt:formatDate
													value="${chargeRecordList.charge_time}" type="both"
													pattern="yyyy/MM/dd HH:mm:ss" /></td>
											<td>${chargeRecordList.descption}</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="9" align="center">没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>


						</tbody>

					</table>
				</div>
				<div class="page_and_btn">${chargeRecord.page.pageStr}</div>
			</div>
		</form>
	</div>
</body>
</html>
