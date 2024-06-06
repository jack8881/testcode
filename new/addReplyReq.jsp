<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<form id="addReplyReq">
    <input  name="id" value="${smsContactInfo.id}" type="hidden" />
	<p class="p-item">
		<label class="lab-item"><em class="red">*</em> 关键词：</label><input
			class="txt" id="keyword" name="keyword" type="text" value="${smsContactInfo.keyword}" />
	</p>
	<p class="p-item">
		<label class="lab-item"> 内
			&nbsp;&nbsp;&nbsp;&nbsp;容：</label>
		 <textarea  id="content" name="content" rows="5" cols="30"> </textarea>
			<%-- <input class="txt" name="content"
			type="text" value="${smsContactInfo.contactName}"/> --%>
	</p>
	<p class="p-item">
		<label class="lab-item">生效时间：</label><input id="d12"  name="create_time" type="text" class="Wdate txt"
				value="${smsContactInfo.create_time}"
				onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'d13\')||\'%y-%M\-%d\'}',skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:00',isShowClear:false,readOnly:true})" />
	</p>
	
<p class="p-item">
		<label class="lab-item">失效时间：</label><input id="d13"  name="drop_time" type="text" class="Wdate txt"
				value="${smsContactInfo.drop_time}"
				onfocus="WdatePicker({minDate:'#F{$dp.$D(\'d12\')||\'%y-%M\-%d\'}',skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:00',isShowClear:false,readOnly:true})" />
	</p>
<span id="msg" class="red"></span>
</form>


<script type="text/javascript">
function closeMe(){
	//alert("close");
	parent.$.fancybox.close();
}
</script>