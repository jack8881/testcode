<%@ page language="java" import="java.util.*"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="../common/common.jsp"%>
<link href="${ staticbase }/css2.0/soboxstyle.css" rel="stylesheet"
	type="text/css" />
	<script type="text/javascript"
	src="${ staticbase }/js/dialog/lhgdialog.min.js"></script>
	<script type="text/javascript"
	src="${ staticbase }/js/sohobox/jquery.sobox.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>投票配置列表</title>
<script>

	function submitform() {
		$("#formId_plate").submit();
	}
	
 
    
    function del(id){
    	$.sobox.confirm('提示', '你确定此操作吗？', function() {
    		var url = basepage + "/vote/deleteVoteConfig.html?id="
    				+ id;
    		// alert(url);
    		$.post(url, function(data) {
    			if (data.msg == "success") {
    				$.sobox.alert('提示', '删除成功');
    				document.location.reload();
    			} else {
    				$.sobox.alert('提示', data.msg);
    				document.location.reload();
    			}
    		});

    	});
    	
    }
    
    
    function getItem(id){
	   	 $.dialog({
	 			title:'投票选型',
	 			id:'getItem',
	 			width:350,
	 			height:300,
	 			background:'#000',
	 			opacity: 0.5,
	 			maxBtn:false,
	 			lock:true,
	 			resize:true,
	 			content:'url:vote/getVoteItem.html?id='+id,
	 			cancel:true
	 			});
   }
    
    function addVote(){
    	 $.dialog({
  			title:'添加投票',
  			id:'addVoteConfig',
  			width:450,
  			height:330,
  			background:'#000',
  			opacity: 0.5,
  			maxBtn:false,
  			lock:true,
  			resize:true,
  			content:'url:vote/addVoteConfig.html',
  			 ok: function (me) {
  				var form = $("#addVoteConfigForm",this.content.document);
  				var title = $("#title",this.content.document).val();
  				if (title==''){
  					Dialog.alertError("请输入主题!");
  					return false;
  				}
  				var deadtime = $("#deadtime",this.content.document).val();
  				if (deadtime==''){
  					Dialog.alertError("请输入截止时间!");
  					return false;
  				}
  				
  				var return_v = 0;
  				$('input[id^="item"]',this.content.document).each(function(index){
  					var item = $(this).val();
  	  				if (item==''){
  	  					return_v=(index+1);
  	  					return false;
  	  				}
  				}
  				);
  				if(return_v>0){
  					Dialog.alertError("请输入选项:"+return_v);
  					return false;
  				}
  				$.ajax({  
                    url:form.attr('action'),  
                    type:'post',  
                    data:form.serialize(),  
                    dataType:"json",  
                    success:function(data){
                       alert("成功,新增投票编号："+data.id);
                       window.location.reload();
                    },  
                    error:function(data){  
                        alert("出错了哦");
                        window.location.reload();
                    }  
                });
  			    },
  			okVal:'添加',
  			cancel:true
  			});
    	
    }
    

  </script>
</head>

<body class="content_body">
	<div class="content_wrapper">

		<div class="locate">
			<span class="ico_locate"></span>您当前的位置：<span><a>信息回复</a>&nbsp;>&nbsp;投票配置列表</span>
		</div>
		<form id='formId_plate' action="${ basepage }/voteConfigList.html"
			method="post">


			<div class="search_wrap">
				<label>投票标题：</label> <input type="text" name="title" value="${smsVoteConfig.title}"/> <label>创建时间：</label> <input
						id="d12" name="createtime" type="text" class="Wdate" 
						value="${smsVoteConfig.createtime}" type="text"
						onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'d13\')||\'%y-%M-%d\'}',skin:'twoer',dateFmt:'yyyy-MM-dd',isShowClear:false,readOnly:true})" />--
					<input id="d13" name="endTime" type="text" class="Wdate" 
						value="${smsVoteConfig.endTime}" type="text"
						onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'d13\')||\'%y-%M-%d\'}',skin:'twoer',dateFmt:'yyyy-MM-dd',isShowClear:false,readOnly:true})" />
					<input name="search" class="btn_search" type="button"
						onclick="submitform()" />
			</div>
		</form>
		<div class="table_wrap">
			<div class="gridBtnList">

				<button class="btn_grid" onclick="addVote()">
					<span class="ico_add"></span>新增
				</button>

			</div>
			<table class="grid_table">
				<thead>
					<tr>
					
						<th>序号<i class="sort"><img
								src="${ staticbase }/images/px.gif" /></i></th>
						<th>投票标题</th>
						<th>截止时间</th>
						<th>创建时间</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="databody">
                   <c:choose>
							<c:when test="${not empty voteConfigList}">
								<c:forEach items="${voteConfigList}" var="voteConfig" varStatus="vs">
									<tr class="main_info" id="tr_${voteConfig.id}">
									    <td>${voteConfig.id}</td>
										<td>${voteConfig.title}</td>
										<td>${voteConfig.deadtime}</td>
										<td>${voteConfig.createtime}</td>
										<td>
										<a href="#" class= "tablelink" onclick="getItem(${voteConfig.id})">详情</a>
										<a href="#" class= "tablelink" onclick="del(${voteConfig.id})">删除</a>
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
		<div class="page_and_btn">${smsVoteConfig.page.pageStr}
		 
		</div>

	</div>



</body>
</html>
