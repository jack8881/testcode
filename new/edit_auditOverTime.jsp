<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1>提醒配置</h1>
<form id="editeAuditOverTime" class="form" action="${ basepage }/auditUserManage/updateAuditUserOverTime.html" method="post">
    <input  name="userId" value="${userInfo.id}" type="hidden" />
    <div>
		姓名：${userInfo.userName}
	</div>

    <div>
		<input type="checkbox"  name="checkbox" <c:if test="${userInfo.audit_overtime_status == 1}">checked="checked"</c:if> />
		启用短信审核提醒（提醒产生费用将由企业承担）
	</div>
    <input value="1" name="auditOvertimeStatus" type="hidden">
	<div>
	等待审核超出&nbsp;<input name="auditOvertime" type="number" value="${userInfo.audit_overtime}" style="width: 60px" maxlength="3"  />
		分钟短信提醒
	</div>
</form>
