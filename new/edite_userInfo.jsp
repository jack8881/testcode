<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<form id="editeContactInfo" action="${ basepage }/contact/saveContactInfo.html" method="post">
    <input  name="id" value="${userInfo.id}" type="hidden" />
	<input name="departmentId" value="${userInfo.departmentId}" type = "hidden">
	
	<p class="p-item">
		<label class="lab-item">
			<em class="red">*</em> 登&nbsp;&nbsp;录&nbsp;&nbsp;名：</label><label>
		${userInfo.userName}
		<input type="hidden" name="userName" value="${userInfo.userName}" />
	</label>
	</p>
	<p class="p-item">
		<label class="lab-item">
			<em class="red">*</em> 密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>&nbsp;&nbsp;&nbsp;<input class="txt" name="password"
			type="password"  maxlength="20" />
	</p>
	
	<p class="p-item">
		<label class="lab-item"> 手机号码：</label><input
			class="txt" name="mdn" type="text" value="${userInfo.mdn}" maxlength="11"/>
	</p>
	<p class="p-item">
		<label class="lab-item"> 姓
			&nbsp;&nbsp;&nbsp;&nbsp;名：</label><input class="txt" name="name"
			type="text" value="${userInfo.name}" maxlength="10"/>
	</p>
	<p class="p-item">
		<label class="lab-item"><em class="red">*</em> 短信日发送上限：</label>
		<input class="txt" id="day_limit_num" name="day_limit_num" type="text" value="${userInfo.day_limit_num}"/>
	</p>

	<p class="p-item">
		<label class="lab-item"><em class="red">*</em> 短信月发送上限：</label>
		<input class="txt" id="month_limit_num" name="month_limit_num" type="text" value="${userInfo.month_limit_num}"/>
	</p>
	<p class="p-item">
		<label class="lab-item"><em class="red">*</em> 彩信日发送上限：</label>
		<input class="txt" id="day_limit_num_mms" name="day_limit_num_mms" type="text" value="${userInfo.day_limit_num_mms}"/>
	</p>

	<p class="p-item">
		<label class="lab-item"><em class="red">*</em> 彩信月发送上限：</label>
		<input class="txt" id="month_limit_num_mms" name="month_limit_num_mms" type="text" value="${userInfo.month_limit_num_mms}"/>
	</p>
	
	
	<p class="p-item">
		<label class="lab-item">角&nbsp;&nbsp;&nbsp;&nbsp;色：</label>&nbsp;&nbsp;&nbsp;<select
			name="role_id" class="txt">
			<c:forEach items="${roleList}" var="roleInfo" varStatus="vs">
				<option value="${roleInfo.role_id}"
					${roleInfo.role_id==userInfo.roleInfo.role_id?'selected':''}>${roleInfo.roleName}</option>
			</c:forEach>
		</select>
	</p>
	<p class="p-item">
		<label class="lab-item">审&nbsp;核&nbsp;角&nbsp;色：</label>&nbsp;&nbsp;&nbsp;<select
			name="audit_id" class="txt">
		<option value=""></option>
		<c:forEach items="${auditLevelList}" var="audit" varStatus="vs">
			<option value="${audit.id}"
				${audit.id==userInfo.audit_id?'selected':''}>${audit.auditDesc}</option>
		</c:forEach>
	</select>
	</p>
	<p class="p-item">
		<label class="lab-item">所属部门：</label>&nbsp;&nbsp;&nbsp;
		<label>${userInfo.department}</label>
	</p>
	

</form>



<script type="text/javascript">
function closeMe(){
	//alert("close");
	parent.$.fancybox.close();
}
function submitFormContact(){
	var groupId = $('groupId').val();
	var mdn=$('#mdn').val();
	var name=$('#contactName').val();
	
	if(!isMobile(mdn)){
		alert("请输入正确的手机号码");
		$('#mdn').focus();
		return false;
	}
    
		  //$('#contactform').submit();
		
	
}



</script>