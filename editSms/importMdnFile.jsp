<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form action="" name="userForm" id="importmdn_form" method="post"
	enctype="multipart/form-data">
	<div
		style="width: 100%; height: 100%; background-color: #FFFFFF; text-align: center;">
		<table border="0" cellpadding="0	cellspacing="0">
			<tr class="importfile">
				<td><input type="file" class="input_txt" name="importmdnfiles"
					size="10" id="importmdnfile" /></td>
			</tr>
			<tr class="importfile">
				<td>温馨提醒: <br /> 1、您选择的文件须为CSV、TXT格式. <br />
					2、文件第一列须为手机号码，第一行须为标题， 标题中不能含有除中文，字母，数字及下划线以外的其它字符线以外的其它字符. <br />
					3、文件大小不超过5MB，导入手机号数量不超过10万 <br />
				</td>
				<td>
			</tr>
			<tr>
				<td><a style="color: blue; cursor: pointer;"
					onclick="exportTemplate()">CSV模板下载</a>&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;
					<a style="color: blue; cursor: pointer;"
					   onclick="exportTemplateTxt()">TXT模板下载</a>
				</td>
			</tr>
		</table>
	</div>
</form>
<script type="text/javascript">
 function exportTemplate(){
		document.location = basepage +"/contact/exportTemplate.html?fileName=importMobilePhone.csv";
  }
 function exportTemplateTxt(){
     document.location = basepage +"/contact/exportTemplate.html?fileName=importMobilePhone.txt";
 }
 </script>