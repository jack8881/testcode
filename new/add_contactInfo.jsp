<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form id="editeContactInfo"
	action='${basepage}/contact/saveContactInfo.html'>


	<p class="p-item">
		<label class="lab-item"><em class="red">*</em> 手机号码：</label><input
			id="mdn" class="txt" name="mdn" type="text" maxlength="13"/>
	</p>
	<p class="p-item">
		<label class="lab-item"> 姓
			&nbsp;&nbsp;&nbsp;&nbsp;名：</label><input class="txt" name="contactName"
			type="text" maxlength="20"/>
	</p>
	<p class="p-item">
		<label class="lab-item"> 性
			&nbsp;&nbsp;&nbsp;&nbsp;别：</label> <input name="sex" type="radio"
			value="男" checked="checked"/>男 <input name="sex" type="radio" value="女" />女
	</p>
	<p class="p-item">
		<label class="lab-item">
			年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：</label><input class="txt" name="age"
			type="text" maxlength="3"/>
	</p>
	<p class="p-item">
		<label class="lab-item">
			部&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;门：</label><%--<input class="txt" name="department"
			type="text" maxlength="20"/>--%>
		&nbsp;&nbsp;&nbsp;<select name="department" class="txt">
			<c:forEach items="${depList}" var="dep">
				<option value="${dep.name}"  >${dep.name}</option>
			</c:forEach>
		</select>
	</p>
	<p class="p-item">
		<label class="lab-item">出生日期：</label><input style="width: 180px" name="birthday" type="text" class="Wdate"
				value="${smsContactInfo.birthday}"
				onfocus="WdatePicker({maxDate:'\'%y-%M\-%d\'}',skin:'twoer',dateFmt:'yyyy-MM-dd',isShowClear:false,readOnly:true})" />
	</p>
	<p class="p-item">
		<label class="lab-item">所属群组：</label>&nbsp;&nbsp;&nbsp;<select
			name="groupId" class="txt">
			<option value="0">全部客户</option>
			<c:forEach items="${groupList}" var="groupInfo" varStatus="vs">
				<option value="${groupInfo.id}"
					${groupInfo.id==groupId?'selected':''}>${groupInfo.groupName}</option>
			</c:forEach>
		</select>
	</p>




</form>
<!-- 
<script type="text/javascript">
	$(function() {
		var $formA = $('.form-a').soValidate({
			exInputs : '.taxInvoiceBox :input,.drop',
			submit : function(form) {
				window.console && console.log(form.serializeObject());
				alert('success');
			},
			fail : function(form, failInputs) {
				window.console && console.log(failInputs);
				var $failF = $(failInputs[0]);
				$("html,body").stop().animate({
					'scrollTop' : $failF.offset().top
				});//定位到第一个验证失败的对象
				$failF.focus();
			}
		});

		

	});
</script> -->