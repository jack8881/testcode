<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form id="ImportContact" method="post" enctype="multipart/form-data">
	<ul class="forminfo">
		<li><label>导入文件:</label> <input name="contactFile" type="file"
			id=contactFile /></li>
		<li><label>模版下载:</label><a style="color: blue; cursor: pointer;"
			onclick="exportTemplate()">模版下载</a></li>
		<li>• 请上传包含客户信息的文件，上传文件格式可以点击对应的“模板下载按钮获得<br /> <br /> •
			请严格按照系统提供的数据模板格式填写客户信息
		</li>
	</ul>
</form>
<script type="text/javascript">
 function exportTemplate(){
		document.location = basepage +"/contact/exportTemplate.html?fileName=importMobilePhone.csv";
	}  
 </script>