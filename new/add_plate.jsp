<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form id="addplate" action='${basepage}/plate/savePlate.html'>

	<p class="p-item">
		<label class="lab-item">所属类别：</label><select id="t_id"name="t_id" class="txt">
			<c:forEach items="${plateTypeList}" var="plateTypeList" varStatus="vs">
				<option value="${plateTypeList.id}"
					${plateTypeList.id==smsPlate.t_id?'selected':''}>${plateTypeList.g_name}</option>
			</c:forEach>
		</select>
		<a onclick="delType()" class="btn_grid" > 删除</a>
	</p>

	<p class="p-item">
		<label class="lab-item"><em class="red">*</em>常用短语内容：</label><textarea
			class="txt" name="content" ></textarea>
	</p>





</form>
<script type="text/javascript">
function delType(){
	if(confirm("确定要删除该模板类型吗？")){
		var id=$('#t_id').val();
		//alert(taskId);
		var url = basepage + "/smsPlate/delType.html?id="+id;
		//alert(url);
		$.get(url, function(data) {
			if (data.returnCode == "200") {
			   alert('删除成功');
			   window.location.reload();
			} else {
				alert(data.msg);
			}
		});
	}
}
	
</script>
