<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<%@ include file="../common/common.jsp"%>
<script>
var a=["一","二","三","四","五","六"];
function submitform() {
	$("#formId_detail").submit();
}
</script>
</head>

<div class="subsidy-box">
	<form id='formId_detail' action="${ basepage }/vote/getVoteDetail.html"
			method="post">
			<input type="hidden" name="relationid" value="${smsVoteDetail.relationid}"/>

			<div class="search_wrap">
				<label>手机号码：</label> <input type="text" name="phone" value="${smsVoteDetail.phone}"/> <label>投票时间：</label> <input
						id="d12" name="createtime" type="text" class="Wdate" 
						value="${smsVoteDetail.createtime}" type="text"
						onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'d13\')||\'%y-%M-%d\'}',skin:'twoer',dateFmt:'yyyy-MM-dd',isShowClear:false,readOnly:true})" />--
					<input id="d13" name="endTime" type="text" class="Wdate" 
						value="${smsVoteDetail.endTime}" type="text"
						onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'d13\')||\'%y-%M-%d\'}',skin:'twoer',dateFmt:'yyyy-MM-dd',isShowClear:false,readOnly:true})" />
					<input name="search" class="btn_search" type="button"
						onclick="submitform()" />
			</div>
		</form>
	<table class="grid_table" >
				<thead>
					<tr>
					
						<th>序号<i class="sort"><img
								src="${ staticbase }/images/px.gif" /></i></th>
						<th>手机号码</th>
						<th>投票选项</th>
						<th>投票时间</th>
					</tr>
				</thead>
				<tbody id="databody">
                   <c:choose>
							<c:when test="${not empty smsVoteDetailList}">
								<c:forEach items="${smsVoteDetailList}" var="item" varStatus="vs">
									<tr class="main_info" id="tr_${item.id}">
									    <td>${item.id}</td>
										<td>${item.phone}</td>
										<td>${item.word}</td>
										<td>${item.createtime}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr class="main_info">
									<td colspan="8" align="center">没有相关数据</td>
								</tr>
							</c:otherwise>
						</c:choose> 
				</tbody>
			</table>
</div>
<div class="page_and_btn">${smsVoteDetail.page.pageStr}</div>