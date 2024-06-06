<%@page import="net.sf.json.JsonConfig"%>
<%@page import="net.sf.json.JSONArray"%>
<%@ page language="java" import="java.util.*"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="../common/common.jsp"%>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>黑名单管理</title>
<link href="${ staticbase }/css2.0/soboxstyle.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="${ staticbase }/js/blackObject/blackObject.js"></script>

<script type="text/javascript"
	src="${ staticbase }/js/sohobox/jquery.sobox.js"></script>
<script type="text/javascript"
	src="${ staticbase }/js/sohobox/sohobox.js"></script>
<script type="text/javascript">

	function submitform() {
		$("#formId_black").submit();
	}
</script>

</head>

<body class="content_body">
	<div class="content_wrapper">

		<div class="locate">
			<span class="ico_locate"></span>您当前的位置：<span><a>客户管理</a>&nbsp;>&nbsp;黑名单管理</span>
		</div>
		<form id='formId_black' action="${ basepage }/blackObject.html"
			method="post">


			<div class="search_wrap">

				<label>黑名单号码:</label> <input name="mdn" type="text"
					value="${sessionScope.blackObject.mdn}" /> <input
					class="btn_search" type="button" onclick="submitform()" />


			</div>
		</form>
		<div class="table_wrap">
			<div class="gridBtnList">

				<button class="btn_grid" onclick="blackObject.addBlackPage()">
					<span class="ico_add"></span>新增
				</button>
				<button class="btn_grid" onclick="blackObject.batchdelBlack()">
					<span class="ico_del"></span>批量删除
				</button>
				<button class="btn_grid" onclick="blackObject.doexportContactInfo()">
					<span class="ico_export"></span>导出
				</button>
				<button class="btn_grid" onclick="javascript:blackObject.import()">
					<span class="ico_import"></span>导入
				</button>

			</div>
			<table class="grid_table">
				<thead>
					<tr>
						<th><input id="sltAll" name="sltAll" type="checkbox" value=""
							onclick="blackObject.sltAllUser()" /></th>
						<th>序号<i class="sort"><img
								src="${ staticbase }/images/px.gif" /></i></th>
						<th>手机号码</th>
						<th>备注</th>
						<th>创建时间</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="databody">
                   <c:choose>
							<c:when test="${not empty sessionScope.blackList}">
								<c:forEach items="${sessionScope.blackList}" var="blackList" varStatus="vs">
									<tr class="main_info" id="tr_${blackList.id}">
									    <td><input type="checkbox" name="blackds" value="${ blackList.id}"  /></td>
										<td>${blackList.id}</td>
										<td><span>${blackList.mdn}</span></td>
										<td>${blackList.descption}</td>
										<td><fmt:formatDate value="${blackList.createtime}"
															type="both" pattern="yyyy/MM/dd HH:mm:ss" /></td>
										<td>
										<a href="#" class= "tablelink" onclick="blackObject.delblackObject(${ blackList.id},${blackList.mdn})">删除</a>
										<a href="#" class= "tablelink" onclick="blackObject.editBlack(${ blackList.id})">修改</a>
										</td>
										
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr class="main_info">
									<td colspan="8" align="center">没有相关数据</td>
								</tr>
							</c:otherwise>
						</c:choose> 
				</tbody>
			</table>
		</div>
		<div class="page_and_btn">${sessionScope.blackObject.page.pageStr}
		
		</div>

	</div>



</body>
</html>
