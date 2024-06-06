<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="../common/common.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>回复列表</title>
<script type="text/javascript">
function submitform(){
	$("#formId").submit();
}

function delSmsReply(id){
if (confirm("确定要删除该记录？")) {
	var url = basepage + "/sendSms/deletesmsReplyById.html?id=" + id;
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
	var url = basepage + "/sendSms/batchDeletesmsReplyById.html?ids=" + str;
    
	$.ajax({
    	url : url, 
    	async : false,
    	type : 'POST', 
    	dataType : 'json',
    	success : function(data) {
    		if (data.returnCode == "200") {
    			alert("批量删除成功！");
                window.location.href = basepage + "/sendSms/replyList.html";
    		} else {
    			alert(data);
    		}
        }, 
        error : function(xhr) {
        	alert('错误\n' + xhr.response.Text);
        }
    })
	
}
}

function exportSmsReply(){
    if (confirm("确认导出"))  {
        var createTime=$("#d12").val();
        var createTime1=$("#d13").val();
        var url = basepage + "/sendSms/exportSmsReply.html?createtime=" + createTime+"&endTime="+createTime1;
        //	alert(url);
        window.open(url);
        //alert(window.location.href);
        alert('导出成功');
    }
}

</script>

</head>

<body class="content_body">
	<div class="content_wrapper">
		<form id='formId' action="${ basepage }/sendSms/replyList.html"
			method="post">
			<div class="locate">
				<span class="ico_locate"></span>您当前的位置：<span><a>短信回复</a>&nbsp;>&nbsp;回复列表</span>
			</div>
			<div class="content">
				<div class="search_wrap">
					<label>手机号码：</label> <input type="text" name="mobile" value="${smsReplyRecord.mobile}"/> <label>回复时间：</label> <input
						id="d12" name="createtime" type="text" class="Wdate" 
						value="${smsReplyRecord.createtime}" type="text"
						onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'d13\')||\'%y-%M-%d\'}',skin:'twoer',dateFmt:'yyyy-MM-dd',isShowClear:false,readOnly:true})" />--
					<input id="d13" name="endTime" type="text" class="Wdate" 
						value="${smsReplyRecord.endTime}" type="text"
						onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'d13\')||\'%y-%M-%d\'}',skin:'twoer',dateFmt:'yyyy-MM-dd',isShowClear:false,readOnly:true})" />
					<input name="search" class="btn_search" type="button"
						onclick="submitform()" />
					<button style="margin-left: 10px" class="btn_grid" onclick="exportSmsReply()">
						<span class="ico_export"></span>导出
					</button>
				</div>
				<div class="table_wrap">
					<div class="gridBtnList">
						<button class="btn_grid"  onclick="javascript:batchdelSmsReply();"><span class="ico_del"></span>批量删除
                        </button>
					</div>
					<table class="grid_table">
						<thead>
							<tr>
								<th><input id="sltAll" name="sltAll" type="checkbox"
									value="" onclick="sltAllUser()" /></th>
								<th>序号<i class="sort"><img
										src="${ staticbase }/images/px.gif" /></i></th>
								<th>回复时间</th>
								<th>通道号码</th>
								<th>手机号码</th>
								<th>是否被获取状态</th>
								<th>上行内容</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>

							<c:choose>
								<c:when test="${not empty replyList}">
									<c:forEach items="${replyList}" var="replylist" varStatus="vs">
										<tr class="main_info" id="tr${replylist.id }">
											<td><input name="replyds" type="checkbox"
												value="${replylist.id }" /></td>
											<td>${vs.index+1}</td>
											<td><fmt:formatDate value="${replylist.reply_time}"
													type="both" pattern="yyyy/MM/dd HH:mm:ss" /></td>
											<td>${replylist.callmdn}</td>
											<td>${replylist.mobile}</td>
											<c:choose>
												<c:when test="${replylist.status=='0'}">
													<td>否</td>
												</c:when>
												<c:otherwise>
													<td>是</td>
												</c:otherwise>
											</c:choose>
											<td><span title="${replylist.content}"> <c:if
														test="${fn:length(replylist.content)>15}">
														<div>${fn:substring(replylist.content,0,15)}...</div>
													</c:if> <c:if test="${fn:length(replylist.content)<=15}">
					                                   ${replylist.content}
				</c:if>
											</span></td>
											<td><a class="tablelink"
												href="javascript:delSmsReply(${replylist.id});">删除</a></td>
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
				<div class="page_and_btn">${smsReplyRecord.page.pageStr}</div>
			</div>
		</form>
	</div>


</body>
</html>
