<%@page import="org.springframework.http.HttpOutputMessage"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% String path=request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="../common/common.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>满意度调查(投票)</title>
<link href="${ staticbase }/css2.0/style.css" rel="stylesheet" type="text/css" />
<link href="${ staticbase }/css2.0/soboxstyle.css" rel="stylesheet" type="text/css" />
<link href="${ staticbase }/web/css/select2.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ staticbase }/js/sohobox/jquery.sobox.js"></script>
<script type="text/javascript" src="${ staticbase }/js/sohobox/sohobox.js"></script>
<script type="text/javascript" src="${ staticbase }/js/select2.min.js"></script>
<script type="text/javascript" src="${ staticbase }/js/select-ui.min.js"></script>
<script type="text/javascript"
	src="${ staticbase }/js/dialog/lhgdialog.min.js"></script>
<script type="text/javascript" src="${ staticbase }/js/editSms/editSms.js"></script>
<script type="text/javascript">
var tips = '手机号码/群组名，多个请用[;]隔开。最多只能输入1000个号码或群组，多于1000请采用导入方式';

String.prototype.startWith=function(str){     
	  var reg=new RegExp("^"+str);     
	  return reg.test(this);        
	};

 $(function(){
//     var $jq = $.noConflict()
	var message ="${errMsg}";
        if(message != null && message !=''){
        	alert(message);
    }
        
        $("#booksend :radio").change(function (){
			var bischecked = $("input[name='birthdaySend']:checked").val();
			
        if(bischecked == "2"){
    	    	$("#importTitle").hide();
    	       $("#mdn").empty();
  	               $('#mdn').attr("readonly","readonly");
    	    }
   		
    	    else{
    	    	$("#importTitle").show();
   	        $('#mdn').removeAttr("readonly");
    	    }
   		
   		
       })

		
	
});
//jquery 1.10
$(function () {
    //  初始化审核人员列表
    if ($('#audit_select').length>0){
        $('#audit_select').select2({
            placeholder: "请选择",
            language: "zh-CN",
            multiple:"multiple"
        });
    }
});
function clearMdntip(){
	var s = $('#mdn').val();
	if(s.startWith('手机号码')){
		$('#mdn').empty();
	}
	
	}
	function addMdntip(){
		var s = $('#mdn').val();
		
		if(s==""){
			$('#mdn').html(tips);
		}
			
		}
	
	function addVote(){
		
				$.dialog({
		  			title:'选择投票选项',
		  			id:'selectVoteConfig',
		  			width:450,
		  			height:250,
		  			background:'#000',
		  			opacity: 0.5,
		  			maxBtn:false,
		  			lock:true,
		  			resize:true,
		  			content:'url:vote/selectVote.html',
		  			 ok: function (me) {
		  			var id=	 $("input[name=plateradio]:checked",this.content.document).val();
		  			$('#vote').val(id);
		  			var plateContent = $('#title'+id,this.content.document).text();
		  			var type = $('#type'+id,this.content.document).val();
		  			$.post(basepage+"/vote/getVoteMsg.html",
		  				  {
		  				    id:id,
		  				    content:plateContent,
		  				    type:type
		  				  },
		  				  function(data,status){
		  					 // alert(data.msg);
		  					 $('#content').empty();
				  			 $('#content').val(data.msg);		  				    
		  				  });
		  			    },
		  			okVal:'添加',
		  			cancel:true
		  			});
				
		
	}

</script>

</head>


<body class="content_body">
	<div class="sidebar">
		<h3>选择接收人</h3>
		<div class="sidebar_content">
			<div class="search_input">
				<input id="phonenumber" type="text" style="width:200px"/> <a class="icoBtn_search"></a>
			</div>
			<div class="wrap_contactTree">
				<ul id="contactTree1" class="ztree"></ul>
			</div>
		</div>
	</div>
	<div class="content_wrapper right_content">
		<div class="locate">
			<span class="ico_locate"></span>您当前的位置：<span><a>信息发送</a>&nbsp;>&nbsp;满意度调查(投票)</span>
		</div>
		<div class="content sms_content">
			<form id="sendSmsForm" action="${ basepage }/sendSms/send.html"
				method="post">
				<input type="hidden" name="token" value="${token}" />
				<input type="hidden" name="voteId" value="" id ="vote"/>
				<input type="hidden" name="LongSMSWords" id="LongSMSWords" value="67" /> 
				<input type="hidden" name="shortSMSWords" id="shortSMSWords" value="70" /> 
				<input type="hidden" name="signature" id="signature"value="${sessionScope.sessionEpUser.signature}" />
			    <input type="hidden" name="maxSMSWords" id="maxSMSWords" value="1000" />
				<input type="hidden" id="importSendObjPathId" name="importFilePath" value="" /> 
				<input type="hidden" id="importSendObjFileNameId" name="importFileName" value="" /> 
				<input type="hidden" id="importSendObjGroupName" name="importSendObjGroupName" value="" />
				<input type="hidden" id="selectGroupIds" name="selectGroupIds" value="" /> 
				<input type="hidden" id="unselectedPhone" name="unselectedPhone" value="" />
				
				<h3 style="display : inline">请输入短信内容：</h3>&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
				<a href="javascript:addVote()"
						style="text-decoration: none; color: #2d63b5; vertical-align: middle"><span
						id="inserPlate">选择投票选项</span></a>
				<div class="textarea_box">
					<div class="textarea">
						<textarea style="font-size: 14px; font-family: arial, 微软雅黑;"
							name="content" id="content"
							onkeydown="javascript:editSms.WordsCount();"
							onkeyup="javascript:editSms.WordsCount();"
							onfocus="javascript:editSms.WordsCount();"
							onblur="javascript:editSms.WordsCount();">${task.content}</textarea>
					</div>
					<div class="textarea_footer">
						共<span id="smsContent"> 0</span>条 &nbsp;<span id="txtWordsCount">0</span>/1000
						字符(包含企业签名)
						<c:if
							test="${sessionScope.sessionEpUser.signature!=''and sessionScope.sessionEpUser.signature!=null }">
	                             &nbsp; &nbsp; &nbsp;   企业签名:${sessionScope.sessionEpUser.signature} </c:if>
					</div>
				</div>
				<%-- <div class="book_send">
					<input id="sltAll" name="booksend" type="checkbox" value="on"
						onclick="javascript:editSms.showBookTime()" /> <label
						for="sltAll">预约发送</label>
					<div style="display: none;" id="booksend">
					   <input type = "radio" name="birthdaySend" class="radioItem" value="1" checked="checked" /> 预约时间: <input type="text" name="booksendTime" value="${book_time}"
							id="booksendTime" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:00',minDate: '%y-%M-%d-',skin:'twoer',isShowClear:false})" />
						
						<input  name="birthdaySend" class="radioItem" id="birthdaysend" type="radio" value="2"/>生日发送	
							
					</div>
				</div> --%>
				
					<!-- <div class="birthday_send" style="margin-left: 300px;margin-top: -15px">
					
					
				</div> -->
				<div> <h3 style="display : inline">请输入短信接收号码：</h3>  &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; 
					<a href="javascript:editSms.toImportMdnFile();"
						style="text-decoration: none; color: #2d63b5; vertical-align: middle"><span
						id="importTitle">导入接收号码</span></a>
		        </div>
				<div class="textarea_box">
					<textarea name="sendMobiles" id="mdn" 
							 onclick="clearMdntip()" onmouseout="addMdntip()"   style="height: 80px;"></textarea>
			
				</div>
				<c:if test="${userAuditInfoList!=null && fn:length(userAuditInfoList) > 0}">
					<div style="margin-top: 20px">
						<label>审核人：</label>
						<select id="audit_select" multiple="multiple" style="width: 300px">
							<c:forEach items="${userAuditInfoList}" var="user" varStatus="vs">
								<option value="${user.id}">${user.userName}</option>
							</c:forEach>
						</select>
					</div>
				</c:if>

				<input type="hidden" name="userInfoAuditIds"/>
				<div style="margin-top: 20px;">
					<button class="btn_save" type="button" onclick="return editSms.checkVoteSms()">发&nbsp;&nbsp;送</button>
					<button class="btn_cancel" type="reset" >重&nbsp;&nbsp;置</button>
				</div>
			</form>
		</div>
	</div>

	<script type="text/javascript">
 	
       function test(){
    	   var isbookSend = $("#sltAll").val();
    	   var booksendtype = $('input[name="birthdaySend"]:checked').val();
    	   var booksendtime = $("#booksendTime").val();
    	   alert(isbookSend);
    	   alert(booksendtype);
    	   alert(booksendtime);
       }
       
		function submitform() {

			$('#sendSmsForm').submit();
		}
		
		
		
			$('.icoBtn_search').click(function() {
				
				 var phonenumber = $("#phonenumber").val();
				 var phone;
				 var mobilereg =/^1[358][0-9]{9}|10648{8}$/;
					if(!phonenumber.match(mobilereg)){
						alert("请输入正确的手机号码!");
						return false;
					}  else{
						phone = phonenumber+";"
					}
				
				var values = $('#mdn').val();
				var index = values.indexOf('手机');
				if(index==0){
					$('#mdn').empty();
				}else{
					$('#mdn').val(values+phone);
				}
			
				//alert(phonenumber); */
			}); 
		
	</script>
</body>


</html>
