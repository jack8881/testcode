<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信息查询详情</title>
<%@ include file="../common/common.jsp"%>
<link href="${ staticbase }/css2.0/soboxstyle.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="${ staticbase }/js/sohobox/jquery.sobox.js"></script>
<script type="text/javascript"
	src="${ staticbase }/js/sohobox/sohobox.js"></script>

</head>
<body>
	<table class="grid_table">
		<thead>
			<tr>
				<th>手机号码</th>
				<th>发送内容</th>

			</tr>
		</thead>
		<tbody id="databody">
			<tr>
				<c:choose>
					<c:when test="${not empty show}">
						<c:forEach items="${show}" var="title" varStatus="vs">
							<tr>
								<td>${title.mdn}</td>
								<td>${title.content}</td>
							</tr>
						</c:forEach>
					</c:when>

				</c:choose>
			</tr>
		</tbody>
		<tfoot>
		</tfoot>
	</table>


</body>
</html>