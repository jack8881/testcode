<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">

$(function(){
	
})
	function check(id){
		if(id==0){
			
			$(".show").hide();
		}else{
			$(".show").show();
		}
	}
</script>
<form id="addplateType" action='${basepage}/plate/savePlateType.html'>
    
	<p class="p-item">
		<label class="lab-item"><em class="red">*</em>常用短语种类：</label>
		<input type = "radio" name="type" id="type" value="0" onclick="check(0)" >主类型
		<input type = "radio" name="type" id="type" value="1" onclick="check(1)" checked="checked">子类型
	</p>


<p class="p-item show">
		<label class="lab-item">所属主类型：</label>&nbsp;&nbsp;&nbsp;
		<select id="parentid" name="parent" class="txt plate">
		<c:forEach items="${plateTypeList}" var="plateTypeList" varStatus="vs">
				<option value="${plateTypeList.id}">${plateTypeList.g_name}</option>
		</c:forEach> 
		</select>
	</p>
	<p class="p-item">
		<label class="lab-item">类型名称：</label>&nbsp;&nbsp;&nbsp;
		<input name="g_name" id="g_name" class="txt">
	</p> 




</form>

