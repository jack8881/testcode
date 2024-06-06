<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<form id="ImportContact" method="post" enctype="multipart/form-data">
	<!--<input name="groupId" value="${groupId}" type="hidden" />  -->
	<ul class="forminfo">
		<li><label>导入文件:</label> <input name="contactFile" type="file"
			id=contactFile /></li>
		<li>
			<label>模版下载:</label>
			<a style="color: blue; cursor: pointer;"  onclick="exportTemplateXlsx()" title="点击下载模版">XLSX模版下载</a>
			<a style="color: blue; cursor: pointer;" onclick="exportTemplateTxt()" title="点击下载模版">TXT模版下载</a>
			<a style="color: blue; cursor: pointer;" onclick="exportTemplate()" title="点击下载模版">CSV模版下载</a>
		</li>
		<li>•上传文件格式可以点击对应的"模板下载"按钮获得(支持.csv,.txt,.xlsx)<br /> <br />
		    •请严格按照系统提供的数据模板格式填写客户信息<br />
		</li>
		<li>
			
		<label >所属群组：</label>&nbsp;&nbsp;&nbsp;<select
			name="groupId" class="txt">
			<option value="0">全部客户</option>
			<c:forEach items="${groupList}" var="groupInfo" varStatus="vs">
				<option value="${groupInfo.id}"
					${groupInfo.id==smsContactInfo.groupId?'selected':''}>${groupInfo.groupName}</option>
			</c:forEach>
		</select>
		</li>
	</ul>
</form>
<script type="text/javascript">
 function exportTemplate(){
		document.location = basepage +"/contact/exportTemplate.html?fileName=importContact.csv";
	}
 function exportTemplateTxt(){
     document.location = basepage +"/contact/exportTemplate.html?fileName=importContact.txt";
 }
 function exportTemplateXlsx(){
     document.location = basepage +"/contact/exportTemplate.html?fileName=importContact.xlsx";
 }
</script>