<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<form id="editeContactInfo" action="${ basepage }/contact/saveContactInfo.html" method="post">
    <input  name="id" value="${smsContactInfo.id}" type="hidden" />
	<p class="p-item">
		<label class="lab-item"><em class="red">*</em> 手机号码：</label><input
			class="txt" id="mdn" name="mdn" type="text" value="${smsContactInfo.mdn}" />
	</p>
	<p class="p-item">
		<label class="lab-item"> 姓
			&nbsp;&nbsp;&nbsp;&nbsp;名：</label><input class="txt" name="contactName"
			type="text" value="${smsContactInfo.contactName}"/>
	</p>
	<p class="p-item">
		<label class="lab-item"> 性
			&nbsp;&nbsp;&nbsp;&nbsp;别：</label> <input name="sex" type="radio"
			value="男" ${smsContactInfo.sex=='男'?'checked="checked"':''} />男 
			<input name="sex" type="radio" value="女" ${smsContactInfo.sex=='女'?'checked="checked"':''}/>女
	</p>
	<p class="p-item">
		<label class="lab-item">
			年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：</label><input class="txt" name="age"
			type="text" value="${smsContactInfo.age}"/>
	</p>
	<p class="p-item">
		<label class="lab-item">
			部&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;门：</label>&nbsp;&nbsp;
		<%--<input class="txt" name="department"
			type="text" value="${smsContactInfo.department}" />--%>
		<select name="department" class="txt">
			<c:forEach items="${depList}" var="dep">
                  <option value="${dep.name}" ${smsContactInfo.department == dep.name ? 'selected':''} >${dep.name}</option>
			</c:forEach>
		</select>
	</p>
	<p class="p-item">
		<label class="lab-item">出生日期：</label><input name="birthday" type="text" class="Wdate txt"
				value="${smsContactInfo.birthday}"
				onfocus="WdatePicker({maxDate:'\'%y-%M\-%d\'}',skin:'twoer',dateFmt:'yyyy-MM-dd',isShowClear:false,readOnly:true})" />
	</p>
	<p class="p-item">
		<label class="lab-item">所属群组：</label>&nbsp;&nbsp;&nbsp;<select
			name="groupId" class="txt">
			<option value="0">全部客户</option>
			<c:forEach items="${groupList}" var="groupInfo" varStatus="vs">
				<option value="${groupInfo.id}"
					${groupInfo.id==smsContactInfo.groupId?'selected':''}>${groupInfo.groupName}</option>
			</c:forEach>
		</select>
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