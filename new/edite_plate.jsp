<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form id="editplate"
	action='${basepage}/plate/savePlate.html'>

<input type="hidden" name="id" value="${smsPlate.id}"/>
<p class="p-item">
		<label class="lab-item">所属类别：</label><select name="t_id" class="txt">
			<c:forEach items="${plateTypeList}" var="plateTypeList" varStatus="vs">
				<option value="${plateTypeList.id}"
					${plateTypeList.id==smsPlate.t_id?'selected':''}>${plateTypeList.g_name}</option>
			</c:forEach>
		</select>
	</p>
	<p class="p-item">
		<label class="lab-item"><em class="red">*</em>常用短语内容：</label><textarea
			class="txt" name="content" >${smsPlate.content}</textarea>
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