<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<%@ include file="../common/common.jsp"%>
<script>
var a=["一","二","三","四","五","六"];

</script>
</head>

<div class="subsidy-box">
	<c:forEach items="${smsVoteItemList}" var="item" varStatus="vs">
		<p class="p-item">
		<label class="lab-item">选项${item.ordernum}：</label><input type="text" id="item${item.ordernum}" name="item${item.ordernum}" value="${item.word}" maxlength="20" readonly="readonly"/>
		</p>
	</c:forEach>
	
</div>
