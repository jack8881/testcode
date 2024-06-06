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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>常用短语管理</title>
<script>

	function submitform() {
		$("#formId_plate").submit();
	}
	
	
    function addType(){
    	SoDialog.ajaxOpen("smsPlate/addPlateType.html",
    			"添加常用短语类别", function(me) {
    				return doAddType(me);
    			});
    }
    
    function doAddType(me){
    	submitForm('addplateType', 'plate/savePlateType.html', function(
	   			data) {
	   		if (data && data.returnCode == '200') {
	   			// 加载函数
	   			SoDialog.alertSucc(data.msg);
	   			document.location.reload();
	   		}

	   	}, function(data) {
	   		if (data && data.returnCode == '201') {
	   			SoDialog.alertSucc(data.msg);
	   			document.location.reload();
	   		}
	   	});
    }
    
    function del(id){
    	$.sobox.confirm('提示', '你确定此操作吗？', function() {
    		var url = basepage + "/smsPlate/delete.html?id="
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
    
    function editPlate(id){
    	SoDialog.ajaxOpen("smsPlate/editPlate.html?id="+id,
    			"修改常用短语", function(me) {
    				return doEdite(me);
    			});
    }
    
    function sendPlate(id){
    	window.location.href='${ basepage }/task/plateSend.html?plateId=' + id;
    }
    
    function doEdite(me){
    	 submitForm('editplate', 'plate/savePlate.html', function(
    	   			data) {
    	   		if (data && data.returnCode == '200') {
    	   			// 加载函数
    	   			SoDialog.alertSucc(data.msg);
    	   			document.location.reload();
    	   		}

    	   	}, function(data) {
    	   		if (data && data.returnCode == '201') {
    	   			SoDialog.alertSucc(data.msg);
    	   			document.location.reload();
    	   		}
    	   	});
    }
    
    function addPlate(){
    	SoDialog.ajaxOpen("smsPlate/addPlate.html",
    			"添加常用短语", function(me) {
    				return save(me);
    			});
    }
    
   function save(me) {
    	
	   submitForm('addplate', 'plate/savePlate.html', function(
   			data) {
   		if (data && data.returnCode == '200') {
   			// 加载函数
   			SoDialog.alertSucc(data.msg);
   			document.location.reload();
   		}

   	}, function(data) {
   		if (data && data.returnCode == '201') {
   			SoDialog.alertSucc(data.msg);
   			document.location.reload();
   		}
   	});
    	
    };

    

  /* $(function(){
	  var str='';
	  $.ajax({
			url: "showPlateType.html",
			type: "post",
			success: function(data){
				
				 
			       $.each(data.data, function (index) {  
			            
			            str+="<option value="+ data.data[index].id +">";
			            str+=data.data[index].package_name+"</option>";
			        });  
			       
					  $('#plate_type').append(str);
			}
		   });
	  
	  $('#plate_type').change(function(){
		  
	  })
	   
  })
  */

  </script>
</head>

<body class="content_body">
	<div class="content_wrapper">

		<div class="locate">
			<span class="ico_locate"></span>您当前的位置：<span><a>信息发送</a>&nbsp;>&nbsp;常用短语管理</span>
		</div>
		<form id='formId_plate' action="${ basepage }/listPlate.html"
			method="post">


			<div class="search_wrap">
 
				<label>常用短语内容:</label> <input name="content" type="text"
					value="${smsPlate.content}" /> 
					<label>常用短语类别:</label> 
			<select id="plate_type" name="t_id" >
								<option value="-1">---请选择类别--</option>
								<c:forEach items="${plateTypeList}" var="plateTypeList" varStatus="vs">
								<option value="${plateTypeList.id}" <c:if test="${smsPlate.t_id==plateTypeList.id}">selected</c:if>>${plateTypeList.g_name}</option>
								</c:forEach>
								
			</select>		
			<input class="btn_search" type="button" onclick="submitform()" />

			</div>
		</form>
		<div class="table_wrap">
			<div class="gridBtnList">

				<button class="btn_grid" onclick="addPlate()">
					<span class="ico_add"></span>新增
				</button>
				
				<button class="btn_grid" onclick="addType()">
					<span class="ico_add"></span>新增常用短语类别
				</button>

			</div>
			<table class="grid_table">
				<thead>
					<tr>
					
						<th>序号<i class="sort"><img
								src="${ staticbase }/images/px.gif" /></i></th>
						<th>常用短语内容</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="databody">
                   <c:choose>
							<c:when test="${not empty smsPlateList}">
								<c:forEach items="${smsPlateList}" var="smsPlateList" varStatus="vs">
									<tr class="main_info" id="tr_${smsPlateList.id}">
									    <td>${smsPlateList.id}</td>
										<td>${smsPlateList.content}</td>
										<td>
										<a href="#" class= "tablelink" onclick="editPlate(${smsPlateList.id})">修改</a>
										<a href="#" class= "tablelink" onclick="del(${smsPlateList.id})">删除</a>
										<a href="#" class= "tablelink" onclick="sendPlate(${smsPlateList.id})">发送</a>
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
		<div class="page_and_btn">${smsPlate.page.pageStr}
		 
		</div>

	</div>



</body>
</html>
