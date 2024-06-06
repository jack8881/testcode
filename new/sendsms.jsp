<%@page import="org.springframework.http.HttpOutputMessage"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% String path=request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="../common/common.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>短信发送</title>
<link href="${ staticbase }/css2.0/style.css" rel="stylesheet" type="text/css" />
<link href="${ staticbase }/css2.0/soboxstyle.css" rel="stylesheet" type="text/css" />
<link href="${ staticbase }/web/css/select2.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"
			src="${ staticbase }/js/dialog/lhgdialog.min.js"></script>
<script type="text/javascript" src="${ staticbase }/js/sohobox/jquery.sobox.js"></script>
<script type="text/javascript" src="${ staticbase }/js/sohobox/sohobox.js"></script>
<script type="text/javascript" src="${ staticbase }/js/select2.min.js"></script>
<script type="text/javascript" src="${ staticbase }/js/select-ui.min.js"></script>
<script type="text/javascript" src="${ staticbase }/js/editSms/editSms.js"></script>

<script type="text/javascript">
var tips = '手机号码/群组名，多个请用[;]隔开。最多只能输入1000个号码或群组，多于1000请采用导入方式';

String.prototype.startWith=function(str){     
	  var reg=new RegExp("^"+str);     
	  return reg.test(this);        
	};

 $(function(){
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
	
	function addPlate(){
		
		$.ajax({
			url: "<%=path%>/addPlateContent.html",
			type: "GET",
			success: function(data){
				$.sobox.pop({
					cls:'subsidy-box',
					title:'插入常用短语',
					drag :false, 
					content:data,// 支持html标签
					width:500,
					height:400,
					btn:[
					     
                    {text:'添加',removePop:true,callback:function(){
                        doAddPlate();
                    	
                    }
   
                  	},
					{text:'关闭',removePop:true,cls:'a-sopop-cancel'}
					    	 
					]
				});
				
			}
		});
		
	}
	
	 function doAddPlate(){
		 
		 $("input[name=plateradio]:checked").each(function(){
			   var plateContent = $(this).parent().siblings('#plateContent').text();
			    $('#content').empty();
		    	$('#content').val(plateContent); 
			})
		
	    }

</script>
<script >

function insertText(obj,str) { 
	if (document.selection) { 
	var sel = document.selection.createRange(); 
	sel.text = str; 
	} else if (typeof obj.selectionStart === 'number' && typeof obj.selectionEnd === 'number') { 
	var startPos = obj.selectionStart, 
	endPos = obj.selectionEnd, 
	cursorPos = startPos, 
	tmpStr = obj.value; 
	obj.value = tmpStr.substring(0, startPos) + str + tmpStr.substring(endPos, tmpStr.length); 
	cursorPos += str.length; 
	obj.selectionStart = obj.selectionEnd = cursorPos; 
	} else { 
	obj.value += str; 
	} 
	} 
	function moveEnd(obj){ 
	obj.focus(); 
	var len = obj.value.length; 
	if (document.selection) { 
	var sel = obj.createTextRange(); 
	sel.moveStart('character',len); 
	sel.collapse(); 
	sel.select(); 
	} else if (typeof obj.selectionStart == 'number' && typeof obj.selectionEnd == 'number') { 
	obj.selectionStart = obj.selectionEnd = len; 
	} 
	} 

function addMdnSuffix(){
	  var newTitle = "\${#}";
	  insertText(document.getElementById('content'),newTitle);
}

function addRegionSuffix(){
	  var newTitle = "\${R}";
	  insertText(document.getElementById('content'),newTitle);
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
			<span class="ico_locate"></span>您当前的位置：<span><a>信息发送</a>&nbsp;>&nbsp;短信发送</span>
		</div>
		<div class="content sms_content">
			<form id="sendSmsForm" action="${ basepage }/sendSms/send.html"
				method="post">
				<input type="hidden" name="token" value="${token}" />
				<input type="hidden" name="file_id" id="file_id" />
				<input type="hidden" name="LongSMSWords" id="LongSMSWords"
					value="67" /> <input type="hidden" name="shortSMSWords"
					id="shortSMSWords" value="70" /> <input type="hidden"
					name="signature" id="signature"
					value="${signature}" /> <input
					type="hidden" name="maxSMSWords" id="maxSMSWords" value="1000" />
				<input type="hidden" id="importSendObjPathId" name="importFilePath"
					value="" /> <input type="hidden" id="importSendObjFileNameId"
					name="importFileName" value="" /> <input type="hidden"
					id="importSendObjGroupName" name="importSendObjGroupName" value="" />
				<input type="hidden" id="selectGroupIds" name="selectGroupIds"
					value="" /> <input type="hidden" id="unselectedPhone"
					name="unselectedPhone" value="" />
				<h3 style="display : inline">请输入短信内容：</h3>&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
				<%--<a href="javascript:addPlate()"
						style="text-decoration: none; color: #2d63b5; vertical-align: middle"><span
						id="inserPlate">插入常用短语发送</span></a>--%>
				<a href="javascript:addMdnSuffix()"
					style="text-decoration: none; color: #2d63b5; vertical-align: middle"><span
					id="inserPlate">插入手机后四位</span></a>
						&nbsp;&nbsp;
				 <a href="javascript:addRegionSuffix()"
					style="text-decoration: none; color: #2d63b5; vertical-align: middle"><span
					id="inserRegion">插入手机归属地</span></a>
					
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
						字符
						<c:if test="${signature!=''and signature!=null }">
							(包含企业签名)
						</c:if>
						<c:if test="${signature!=''and signature!=null }">
	                             &nbsp; &nbsp; &nbsp;   企业签名:${signature}
						</c:if>
						
<!-- 						&nbsp; &nbsp; &nbsp; -->
<!-- 						<a onclick="openSMSPhraseDialog();" style="cursor: pointer;">短信模板</a> -->
					</div>
				</div>
				<div class="book_send">
					<input id="sltAll" name="booksend" type="checkbox" value="on"
						onclick="javascript:editSms.showBookTime()" /> <label
						for="sltAll">预约发送</label>
					<div style="display: none;" id="booksend">
					   <input type = "radio" name="birthdaySend" class="radioItem" value="1" checked="checked" /> 预约时间: <input type="text" name="booksendTime" value="${book_time}"
							id="booksendTime" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:00',minDate: '%y-%M-%d-',skin:'twoer',isShowClear:false})" />
						
						<input  name="birthdaySend" class="radioItem" id="birthdaysend" type="radio" value="2"/>生日发送
						 &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
						<%--<input  name="loopSend" class="radioItem" id="loopSend" type="checkbox" value="on"/><label>循环发送</label>	--%>

					</div>
				</div>
				
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
				
				<div style="margin-top: 20px;display: none;" >
				<label>过滤省份</label>
      					<select id="noprovince">
      						<c:forEach items="${provinceList}" var="province">
      							<option value="${province}">${province}</option>
      						</c:forEach>
						</select>
						<button class="btn_grid" type="button" onclick="selectProvince('noprovince','noprovinceregion')">
							<span class="ico_add"></span>
						</button>
						<input name="noprovinceregion" type="text" id="noprovinceregion"   value="" style="width: 300px;"/>
				</div>
				<div style="margin-top: 20px;">
					<button class="btn_save" type="button" onclick="return editSms.checksms()">发&nbsp;&nbsp;送</button>
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
       
       function selectProvince(pid,regionid){
    		 var province = $("#"+pid).val();
    		 var region=$("#"+regionid).val();
    		 if(region!=''){
    			 region=region+","+province;
    		 }else{
    			 region=province;
    		 }
    		 $("#"+regionid).val(region);
    		 return false;
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
				$.ajax({
					url:"<%=path%>/contact/findByMdn.html?mdn="+phonenumber,
					type:"GET",
					success:function(data){
						json=JSON.parse(data);
						if(json.returnCode != 200){
                            $.dialog({
                                id : 'tip',
                                title : '提示',
                                width : 300,
                                height : 100,
                                lock : true,
                                background : '#000',
                                opacity : 0.5,
                                title : '温馨提示',
                                content : json.msg,
                            });
						}else {
                            var values = $('#mdn').val();
                            var index = values.indexOf('手机');
                            if(index==0){
                                $('#mdn').empty();
                            }else{
                                if(values.length < 11){//一个号码都没有
                                    $('#mdn').val(values+phone);
                                }else{
                                    if(values.indexOf(phone) == -1 ){
                                        $('#mdn').val(values+phone);
                                    }
                                }
                            }
						}
					}
				})
				//alert(phonenumber); */
			}); 
		
	</script>
</body>


</html>
