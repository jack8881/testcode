<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<c:set var="staticbase"><%=request.getContextPath() %></c:set>
<script type="text/javascript"
	src="${ staticbase }/js/zTree/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="${ staticbase }/js/sohobox/jquery.sobox.js"></script>
<script type="text/javascript" src="${ staticbase }/js/sohobox/sohobox.js"></script>

<link href="${ staticbase }/css2.0/soboxstyle.css" rel="stylesheet" type="text/css" />

</head>

<body>
<form  action="getTitleWithFile.html" id="import_form" method="post"
	enctype="multipart/form-data">
	<div
		style="width: 100%; height: 100%; background-color: #FFFFFF; text-align: center;">
		<table>
			<tr class="importfile">
				<td><input type="file" class="input_txt" name="file"
					size="10" id="importmdnfile" /></td>
			</tr>
			<tr class="importfile">
				<td>温馨提醒: <br /> 1、您选择的文件须为CSV格式或者txt格式用逗号分隔各个字段. <br />
					2、文件第一列须为手机号码，第一行须为标题 <br />
					3、文件大小不超过5MB，导入手机号数量不超过10万 <br />
				</td>
			</tr>
			<tr>
				<td><a style="color: blue; cursor: pointer;"
					onclick="exportTemplate()">模板下载</a></td>
			</tr>
		
		</table>
		         <div style="margin-top: 20px;">
					<button class="btn_save"  onclick="return checkFile()">上&nbsp;&nbsp;传</button>
				</div>
	</div>
	<script type="text/javascript">

</script>
</form>
</body>
</html>
