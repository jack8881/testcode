<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<%@ include file="../common/common.jsp"%>
<script>
var a=["一","二","三","四","五","六"];

</script>
</head>

<div class="subsidy-box">
	
	<table class="grid_table">
				<thead>
					<tr>
					
						<th>序号<i class="sort"><img
								src="${ staticbase }/images/px.gif" /></i></th>
						<th>投票选项</th>
						<th>投票人数</th>
					</tr>
				</thead>
				<tbody id="databody">
                   <c:choose>
							<c:when test="${not empty smsVoteResultList}">
								<c:forEach items="${smsVoteResultList}" var="item" varStatus="vs">
									<tr class="main_info" id="tr_${item.id}">
									    <td>选项${item.ordernum}</td>
										<td>${item.word}</td>
										<td>${item.num}</td>
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
