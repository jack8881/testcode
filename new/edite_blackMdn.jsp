<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form id="editeBlackMdn"  method="post">
	
		<input name="id" name="id" value="${blackObject.id}" type="hidden" />
			<p class="p-item">
		<label class="lab-item"><em class="red">*</em>手机号码:</label><input
			class="txt" name="mdn" type="text" value="${blackObject.mdn}" />
	    </p>
	    
	    
	    <p class="p-item">
		<label class="lab-item">添加备注:</label><input class="txt" name="descption" type="text" value="${blackObject.descption}"/>
	     </p>
	
		<p class="p-item">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;温馨提醒:&nbsp;&nbsp;添加黑名单后，该号码将不能收到企业短信！
		
       </p>
		

</form>

