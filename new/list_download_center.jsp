<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="../common/common.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link href="${ staticbase }/css2.0/soboxstyle.css" rel="stylesheet"
          type="text/css"/>
    <script type="text/javascript"
            src="${ staticbase }/js/sohobox/jquery.sobox.js"></script>
    <script type="text/javascript"
            src="${ staticbase }/js/sohobox/sohobox.js"></script>
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
		<form id='formId' action="${ basepage }/downLoad/listExcelFile.html"
			method="post">
			<div class="locate">
				<span class="ico_locate"></span>您当前的位置：<span><a>下载中心</a>&nbsp;>&nbsp;下载中心</span>
			</div>
			<div class="content">
				<div class="search_wrap">
	
                    <label>导出名称:</label>
                    <input name="path" type="text" value="${excelPathStatus.path}" id="path" />

                    <label>提交时间:</label>
                    <input id="d12" name="create_time" type="text" class="Wdate"
                           type="text" value="${excelPathStatus.create_time}"
                           onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'d13\')||\'%y-%M-%d\'}',skin:'twoer',dateFmt:'yyyy-MM-dd',isShowClear:false,readOnly:true})"/>--
                    <input id="d13" name="result_time" type="text" class="Wdate"
                           type="text" value="${excelPathStatus.result_time}"
                           onfocus="WdatePicker({minDate:'#F{$dp.$D(\'d12\',{d:0});}',maxDate:'%y-%M-%d',skin:'twoer',dateFmt:'yyyy-MM-dd',isShowClear:false,readOnly:true})"/>
                    <button name="search" type="submit" class="btn_search"/>

                </div>
				<div class="table_wrap">
					
					<table class="grid_table">
						<thead>
							<tr>
								<th>序号</th>
								<th>导出类型</th>
								<th>导出内容</th>
								<th>提交任务时间</th>
								<th>生成成功时间</th>
								<th>处理状态</th>
								<th>管理操作</th>
							</tr>
						</thead>
						<tbody>

							<c:choose>
								<c:when test="${not empty excelList}">
									<c:forEach items="${excelList}" var="excellist" varStatus="vs">
										<tr class="main_info" id="tr${excellist.id }">
											<td>${excellist.id}</td>
											<td>${excellist.operate_type}</td>
											<td>${excellist.path}</td>
											<td>${excellist.create_time}</td>
											<td>${excellist.result_time}</td>
											<td value="222">
											<c:if test="${excellist.status == '0' }">
												正在生成
											</c:if>
											<c:if test="${excellist.status == '1'}">
											
												生成成功
											</c:if>
											<c:if test="${excellist.status == '2'}">
												生成失败
											</c:if>
											</td>
											<td>
												<c:if test="${not empty excellist.result_time}">
													<a target="_blank" href="downLoadExcel.html?path=${excellist.path}">下载</a>
												</c:if>
												<c:if test="${excellist.result_time == null}">
													请等待
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="11" align="center">没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>

						</tbody>
			
					</table>
				</div>
			<div class="page_and_btn">${excelPathStatus.page.pageStr}</div>
			</div>
		</form>
	</div>


</body>
</html>
