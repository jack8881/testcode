<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form id="editeContactInfo"
	action='${basepage}/spDepartment/saveContactInfo.html'>


	<p class="p-item">
		<label class="lab-item">
			<em class="red">*</em> 登&nbsp;&nbsp;录&nbsp;&nbsp;名：</label><input class="txt" name="userName"
			type="text" maxlength="30"/>
	</p>
	<p class="p-item">
		<label class="lab-item">
			<em class="red">*</em> 密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>&nbsp;&nbsp;&nbsp;<input class="txt" name="password"
			type="password"  maxlength="20"/>
	</p>
	<p class="p-item">
		<label class="lab-item">手机号码：</label><input
			class="txt" name="mdn" type="text" maxlength="11"/>
	</p>
	<p class="p-item">
		<label class="lab-item"> 姓
			&nbsp;&nbsp;&nbsp;&nbsp;名：</label><input class="txt" name="name"
			type="text" maxlength="10"/>
	</p>

	<p class="p-item">
		<label class="lab-item"><em class="red">*</em> 短信日发送上限：</label><input class="txt" id="day_limit_num" name="day_limit_num" type="text"/>
	</p>

	<p class="p-item">
		<label class="lab-item"><em class="red">*</em> 短信月发送上限：</label><input class="txt" id="month_limit_num" name="month_limit_num" type="text"/>
	</p>
	<p class="p-item">
		<label class="lab-item"><em class="red">*</em> 彩信日发送上限：</label><input class="txt" id="day_limit_num_mms" name="month_limit_num_mms" type="text"/>
	</p>

	<p class="p-item">
		<label class="lab-item"><em class="red">*</em> 彩信月发送上限：</label><input class="txt" id="month_limit_num_mms" name="month_limit_num_mms" type="text"/>
	</p>
	
	<p class="p-item">
		<label class="lab-item">角&nbsp;&nbsp;&nbsp;&nbsp;色：</label>&nbsp;&nbsp;&nbsp;<select
			name="role_id" class="txt">
			<c:forEach items="${roleList}" var="roleInfo" varStatus="vs">
				<option value="${roleInfo.role_id}">${roleInfo.roleName}</option>
			</c:forEach>
		</select>
	</p>
	<p class="p-item">
		<label class="lab-item">
			部&nbsp;&nbsp;&nbsp;&nbsp;门：</label>
			<%--<select
			name="departmentId" class="txt">
			<c:if test="${groupId==0}">
			<option value="0" >所有部门</option>
			</c:if>
			<c:if test="${groupId>0}">
			<option value="${department.id}"
					${department.id==groupId?'selected':''}>${department.name}</option>
			</c:if>
			</select>--%>
		    <c:choose>
				<c:when test="${groupId==0}">
					<input type="hidden" name="departmentId" value="0" />
					<input readonly="readonly" class="txt" type="text" name="departmentValue" value="所有部门" />
				</c:when>
				<c:otherwise>
					<input type="hidden" name="departmentId" value="${department.id}" />
					<input readonly="readonly" class="txt" type="text" name="departmentValue" value="${department.name}" />
				</c:otherwise>
			</c:choose>
	</p>
	<p class="p-item">
		<label class="lab-item">审&nbsp;核&nbsp;角&nbsp;色：</label>&nbsp;&nbsp;&nbsp;
		<select name="audit_id" class="txt">
			<option value=""></option>
			<c:forEach items="${auditLevelList}" var="audit" varStatus="vs">
				<option value="${audit.id}"> ${audit.auditDesc}</option>
			</c:forEach>
		</select>
	</p>

</form>
