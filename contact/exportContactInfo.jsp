<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form id=exportContact method="post">
	<ul class="forminfo">
		<li><label>所属群组:</label> <select name="groupId" id="select1">
				<c:forEach items="${groupList}" var="groupInfo" varStatus="vs">
					<option value="${groupInfo.id}">${groupInfo.groupName}</option>
				</c:forEach>
				<option value="0">全部客户</option>
		</select></li>
		<li>• 因导出通讯录全部号码会影响系统性能，所以每次最多只能导出1万个号码，如需更多请联系客服处理<br />
		</li>
	</ul>
</form>
