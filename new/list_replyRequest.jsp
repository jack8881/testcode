<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="../common/common.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>点播服务</title>
<link href="${ staticbase }/css2.0/soboxstyle.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="${ staticbase }/js/sohobox/jquery.sobox.js"></script>
<script type="text/javascript"
	src="${ staticbase }/js/sohobox/sohobox.js"></script>
<script type="text/javascript"
	src="${ staticbase }/js/replyReq/replyReq.js?d=${rand}"></script>
	
<script type="text/javascript">
function submitform(){
	$("#formId").submit();
}

function delSmsReply(id){
if (confirm("确定要删除该记录？")) {
	var url = basepage + "/sendSms/deleteReplyRequestById.html?id=" + id;
	$.post(url, function(data) {
		if (data.returnCode == "200") {
			alert("删除成功！");
			window.location.reload();
		} else {
			alert(data);
		}
	});
}
}

function sltAllUser(){
if($("#sltAll").attr("checked")){
	$("input[name='replyds']").attr("checked",true);
}else{
	$("input[name='replyds']").attr("checked",false);
}
}

function batchdelSmsReply(){
 var str="";
$("input[name='replyds']:checkbox").each(function(){ 
    if($(this).attr("checked")){
        str += $(this).val()+",";
    }
});
if(str==''){
	 alert('请勾选一个选项!');
	 return
}
if (confirm("确定要批量删除吗？")) {
	var url = basepage + "/sendSms/BatchDeleteReplyRequestById.html?ids=" + str;
	$.post(url, function(data) {
		if (data.returnCode == "200") {
			alert("批量删除成功！");
			window.location.reload();
		} else {
			alert(data.msg);
		}
	});
}
}


</script>

</head>

<body class="content_body">
	<div class="content_wrapper">
		<form id='formId' action="${ basepage }/sendSms/replyRequestList.html"
			method="post">
			<div class="locate">
				<span class="ico_locate"></span>您当前的位置：<span><a>短信回复</a>&nbsp;>&nbsp;点播服务</span>
			</div>
			<div class="content">
				<div class= "search_wrap">
					<label>关键字：</label> <input type="text" name="keyword" value="${replyRequest.keyword}"/>
                    <label>回复内容：</label> <input type="text" name="content" value="${replyRequest.content}"/>
					<input name="search" class="btn_search" type="button" onclick="submitform()" />
				</div>
				<div class="table_wrap">

					<div class="gridBtnList">
				<a  class="btn_grid" onclick="replyRequest.addReplyReq()"> <span class="ico_add"></span>新 增</a>	
				<a  class="btn_grid" onclick="batchdelSmsReply()"> <span class="ico_del"></span>删 除</a>	
				
			<!-- 	<button class="btn_grid" name="addRe" onclick="replyRequest.hello()"><span class="ico_add"></span>新增</button> -->
				<!-- <button class="btn_grid" name="delRe"   onclick="batchdelSmsReply()"><span class="ico_del"></span>删除 </button> -->
					</div>
					<table class="grid_table">
						<thead>
							<tr>
								<th><input id="sltAll" name="sltAll" type="checkbox"
									value="" onclick="sltAllUser()" /></th>
								<th>序号<i class="sort"><img
										src="${ staticbase }/images/px.gif" /></i></th>
								<th>关键字</th>
								<th>回复内容</th>
								<th>生效时间</th>
								<th>失效时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>

							<c:choose>
								<c:when test="${not empty replyReqList}">
									<c:forEach items="${replyReqList}" var="replyReq" varStatus="vs">
										<tr class="main_info" id="tr${replyReq.id }">
											<td><input name="replyds" type="checkbox"
												value="${replyReq.id }" /></td>
											<td>${vs.index+1}</td>
											<td>${replyReq.keyword}</td>
											<td><span title="${replyReq.content}"> <c:if
														test="${fn:length(replyReq.content)>15}">
														<div>${fn:substring(replyReq.content,0,15)}...</div>
													</c:if> <c:if test="${fn:length(replyReq.content)<=15}">
					                                   ${replyReq.content}
				</c:if>
											</span></td>
											<td>
											<fmt:formatDate value="${replyReq.create_time}"
													type="both" pattern="yyyy/MM/dd HH:mm:ss" />
											</td>
											<td>
											<fmt:formatDate value="${replyReq.drop_time}"
													type="both" pattern="yyyy/MM/dd HH:mm:ss" />
											</td>
											<td><a class="tablelink"
												href="javascript:delSmsReply(${replyReq.id});">删除</a></td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="7" align="center">没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>

						</tbody>
			
					</table>
				</div>
				<div class="page_and_btn">${replyRequest.page.pageStr}</div>
			</div>
		</form>
	</div>


</body>
</html>
