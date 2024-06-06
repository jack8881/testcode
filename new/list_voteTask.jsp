<%@ page language="java" import="java.util.*"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="../common/common.jsp"%>
<link href="${ staticbase }/css2.0/soboxstyle.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="${ staticbase }/js/sohobox/jquery.sobox.js"></script>
<script type="text/javascript"
	src="${ staticbase }/js/sohobox/sohobox.js"></script>
	<script type="text/javascript"
	src="${ staticbase }/js/dialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>投票结果列表</title>
<script>

	function submitform() {
		$("#formId_plate").submit();
	}
	
    function getResult(id){
	   	 $.dialog({
	 			title:'投票结果',
	 			id:'getResult',
	 			width:550,
	 			height:350,
	 			background:'#000',
	 			opacity: 0.5,
	 			maxBtn:false,
	 			lock:true,
	 			resize:true,
	 			content:'url:vote/getVoteResult.html?id='+id,
	 			cancel:true
	 			});
  }
    
    function getDetail(id){
	   	 $.dialog({
	 			title:'投票详情',
	 			id:'getDetail',
	 			width:750,
	 			height:450,
	 			background:'#000',
	 			opacity: 0.5,
	 			maxBtn:false,
	 			lock:true,
	 			resize:true,
	 			content:'url:vote/getVoteDetail.html?relationid='+id,
	 			cancel:true
	 			});
  }
	
  </script>
</head>

<body class="content_body">
	<div class="content_wrapper">

		<div class="locate">
			<span class="ico_locate"></span>您当前的位置：<span><a>信息回复</a>&nbsp;>&nbsp;投票任务列表</span>
		</div>
		<form id='formId_plate' action="${ basepage }/voteTaskList.html"
			method="post">


			<div class="search_wrap">
				<label>投票标题：</label> <input type="text" name="title" value="${smsVoteTask.title}"/> <label>创建时间：</label> <input
						id="d12" name="createtime" type="text" class="Wdate" 
						value="${smsVoteTask.createtime}" type="text"
						onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'d13\')||\'%y-%M-%d\'}',skin:'twoer',dateFmt:'yyyy-MM-dd',isShowClear:false,readOnly:true})" />--
					<input id="d13" name="endTime" type="text" class="Wdate" 
						value="${smsVoteTask.endTime}" type="text"
						onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'d13\')||\'%y-%M-%d\'}',skin:'twoer',dateFmt:'yyyy-MM-dd',isShowClear:false,readOnly:true})" />
					<input name="search" class="btn_search" type="button"
						onclick="submitform()" />
			</div>
		</form>
		<div class="table_wrap">
			
			<table class="grid_table">
				<thead>
					<tr>
					
						<th>序号<i class="sort"><img
								src="${ staticbase }/images/px.gif" /></i></th>
						<th>投票标题</th>
						<th>任务内容</th>
						<th>创建时间</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="databody">
                   <c:choose>
							<c:when test="${not empty voteTaskList}">
								<c:forEach items="${voteTaskList}" var="voteTask" varStatus="vs">
									<tr class="main_info" id="tr_${voteTask.id}">
									    <td>${voteTask.id}</td>
										<td>${voteTask.title}</td>
										<td>${voteTask.content}</td>
										<td>${voteTask.createtime}</td>
										<td>
										<a href="#" class= "tablelink" onclick="getResult(${voteTask.configid})">投票结果</a>
										<a href="#" class= "tablelink" onclick="getDetail(${voteTask.id})">投票详情</a>
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
		<div class="page_and_btn">${smsVoteTask.page.pageStr}
		 
		</div>

	</div>



</body>
</html>
