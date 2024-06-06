<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<%@ include file="../common/common.jsp"%>
</head>


<form id='formId_plate' action="" method="post">
			<table class="grid_table">
				<thead>
					<tr>
						<th>点击选中</th>
						<th>投票标题</th>
					</tr>
				</thead>
				<tbody id="databody">
                   <c:choose>
							<c:when test="${not empty voteConfigList}">
								<c:forEach items="${voteConfigList}" var="voteConfig" varStatus="vs">
									<tr class="main_info" id="tr_${voteConfig.id}">
									<td><input type="radio" name="plateradio" value="${voteConfig.id}" id="${voteConfig.id}"/>&nbsp;${voteConfig.id}
									<input type="hidden"  value="${voteConfig.type}" id="type${voteConfig.id}"/>
									</td>
										<td id="title${voteConfig.id}">${voteConfig.title}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr class="main_info">
									<td colspan="2" align="center">没有相关数据</td>
								</tr>
							</c:otherwise>
						</c:choose> 
				</tbody>
			</table>
		<div class="page_and_btn">${smsVoteConfig.page.pageStr}
		 
		</div>
</form>
