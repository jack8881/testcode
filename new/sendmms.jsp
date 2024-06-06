<%@page import="org.springframework.http.HttpOutputMessage"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="../common/common.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>彩信发送</title>
<link href="${ staticbase }/css2.0/style.css" rel="stylesheet" type="text/css" />
<link href="${ staticbase }/css2.0/soboxstyle.css" rel="stylesheet" type="text/css" />
<link href="${ staticbase }/js/kindeditor/themes/default/default.css" rel="stylesheet" type="text/css" />
<link href="${ staticbase }/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="${ staticbase }/web/css/select2.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ staticbase }/js/sohobox/jquery.sobox.js"></script>
<script type="text/javascript" src="${ staticbase }/js/sohobox/sohobox.js"></script>
<script type="text/javascript" src="${ staticbase }/js/select2.min.js"></script>
<script type="text/javascript" src="${ staticbase }/js/select-ui.min.js"></script>
<script type="text/javascript" src="${ staticbase }/js/tab.js"></script>
<script type="text/javascript" src="${ staticbase }/js/editMms/editMms.js?d=${rand}"></script>
<script type="text/javascript" src="${ staticbase }/js/kindeditor/kindeditor-all-min.js"></script>
<style >
.iden_top{width: 100%;border-bottom: 1px solid #ccc;height: 37px; line-height: 35px;}
.iden_top ul li{height: 37px; line-height: 35px; cursor: pointer;width: auto;padding: 0px 10px; background-color: #eee;float: left;border-radius: 5px 5px 0px 0px;border: 1px solid #ccc;margin-bottom: -1px; }
.iden_add{float: left;margin-top: 0px;cursor: pointer; display: inline-block;text-align: center;font-size: 25px;width: 40px; height:36px;color: #2B98FC; font-weight: bold; background-color: #eee; border: 1px solid #ccc;border-radius: 5px 5px 0px 0px;}
.iden_top_button{ display: inline-block;width: 20px; height: 20px;background-repeat: no-repeat;background-size: 100%;margin: 7px 0px 0px 5px;float: left;}
.iden_top_dete{float: right; width: 20px; height: 20px; background-image: url(../img/close.png);background-repeat: no-repeat;background-size: 100%;margin: 7px 0px 0px 5px;float: right;}
.iden_add_name{float: left; }
.data_z_create_box{display: none; width: 600px; min-height: 200px; background-color: #fff; border: 1px solid #ccc; border-radius: 5px; position: absolute;z-index:44; top: 10%;left: 50%;margin-left: -300px;box-shadow: 0px 5px 10px #666}
.data_z_create_box_center_quxiao{background-color: #ea5d5b;color: #fff;margin-right:10px; width: auto!important;padding: 0px 10px;}
.data_z_create_box_center_quxiao:hover{background-color: #d2322d;}
.data_tips{padding: 10px; width: 90%; margin: 0px auto; color: #a94442;background-color: #f2dede;border:1px solid #ebccd1;border-radius: 5px;}
.data_input{height: auto;padding:0px 30px;}
.data_input ul li{height: 50px; line-height: 50px;}
.data_input_input input{text-indent: 10px; width:70%; height: 40px; line-height: 40px; border-radius: 5px; border: 1px solid #ccc;}
.data_input_tips{margin-left: 5%;display: none;}
.data_z_create_box_top_title{margin-left: 20px;font-weight: bold;}
.shua{margin-top: 20px;float: left;}
.shua span{display: inline-block;width: 95%; float: right;}
.data_state_buttonl_tips{color: #4CAE4C;font-weight: bold;display: none;}
</style>
<script>
			var editor;
			KindEditor.ready(function(K) {
				editor = K.create('textarea[name="content_edit"]', {
					resizeType : 1,
					pasteType : 1,
					allowPreviewEmoticons : false,
					uploadJson : '${ staticbase }/js/kindeditor/jsp/upload_json.jsp',
	                fileManagerJson : '${ staticbase }/js/kindeditor/jsp/file_manager_json.jsp',
					allowImageUpload : true,
					items : [
						 'image']
				});
			});
		</script>
</head>

<body class="content_body">
	<div class="sidebar">
		<h3>选择接收人</h3>
		<div class="sidebar_content">
			<div class="search_input">
				<input id="phonenumber" type="text" /> <a class="icoBtn_search" onclick="addphone()"></a>
			</div>
			<div class="wrap_contactTree">
				<ul id="contactTree1" class="ztree"></ul>
			</div>
		</div>
	</div>
	<div class="content_wrapper right_content">
		<div class="locate">
			<span class="ico_locate"></span>您当前的位置：<span><a>信息发送</a>&nbsp;>&nbsp;彩信发送</span>
		</div>
		<div class="content sms_content">
			<form id="sendSmsForm" action="${ basepage }/sendMms/send.html"
				method="post">
				<input type="hidden" name="file_id" id="file_id" />
				<input type="hidden" name="plateId" id="plateId" value="${plateId}" />
				<input type="hidden" name="LongSMSWords" id="LongSMSWords"
					value="67" /> <input type="hidden" name="shortSMSWords"
					id="shortSMSWords" value="70" /> <input type="hidden"
					name="signature" id="signature"
					value="${sessionScope.sessionEpUser.signature}" /> <input
					type="hidden" name="maxSMSWords" id="maxSMSWords" value="1000" />
				<input type="hidden" id="importSendObjPathId" name="importFilePath"
					value="" /> <input type="hidden" id="importSendObjFileNameId"
					name="importFileName" value="" /> <input type="hidden"
					id="importSendObjGroupName" name="importSendObjGroupName" value="" />
				<input type="hidden" id="selectGroupIds" name="selectGroupIds"
					value="" /> <input type="hidden" id="unselectedPhone"
					name="unselectedPhone" value="" />
				<div> <h3 style="display : inline">请输入彩信主题： </h3>
				<input style="width: 450px" type="text" id="subject" name="subject" value="" maxlength="30"/>
				</div>
				
				
<!-- 				分页 -->
<!-- 				<div class="container iden_top"> -->
<!-- 					<ul> -->
<!-- 					<li> -->
<!-- 					<p class='iden_add_name'>第1页</p> -->
<!-- 					</li> -->
<!-- 					</ul> -->
<!-- 					<span class="iden_add">+</span> -->
<!-- 				</div> -->
				 
				<textarea id="editor_id" name="content_edit" style="width:700px;height:200px;visibility:hidden;"></textarea>
                <textarea rows="" cols="" name="content" id="content" style="display:none;"></textarea>
				
<!-- 				<textarea name="content" style="width:700px;height:200px;visibility:hidden;"></textarea> -->
				<div class="textarea_footer">
						<c:if test="${signature!=''and signature!=null }">
	                             &nbsp; &nbsp; &nbsp;   企业签名:${signature}
						</c:if>
					</div>
				
				<div> <h3 style="display : inline">请输入彩信接收号码：</h3>  &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; 
					<a href="javascript:editMms.toImportMdnFile();"
						style="text-decoration: none; color: #2d63b5; vertical-align: middle"><span
						id="importTitle">导入接收号码</span></a>
		        </div>
				<div class="textarea_box">
					<textarea name="sendMobiles" id="mdn" onclick="clearMdntip()"
							onblur="clearMdntip()" style="height: 80px;"></textarea>
			
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
					<button class="btn_save" type="button" onclick="return editMms.checksms()">发&nbsp;&nbsp;送</button>
					<button class="btn_cancel" type="reset" >重&nbsp;&nbsp;置</button>
				</div>
			</form>
		</div>
	</div>

<div class="data_z_create_box">
	<div class="create_z_create_box_top">
		<span class="data_z_create_box_top_title"></span>
		<div class="create_z_create_box_top_close">X</div>
	</div>
	<div class="create_z_create_box_center">
		<!--<div class="data_tips">
		</div>-->
		<div class="data_input">
			<ul>
				<li>
				<span class="data_input_title">应用标识：</span>
				<span class="data_input_input"><input type="text" placeholder="应用标识1"></span>
				</li>
			</ul>
		</div>
	</div>
	<div class="create_z_create_box_button">
	<button class="create_z_create_box_center_quxiao">取消</button>
	<button class="create_z_create_box_center_baocun">保存</button>
	<button class="create_z_create_box_center_queding">确定</button>
	</div>
</div>


	<script type="text/javascript">
/* 	$(document).ready(function(){
		
		var str = "123(wang)"
			var str1 = str.indexOf("(");
			alert(str1);
			var str2 = str.indexOf(")");
			alert(str2);
		  alert(str.substring(str1+1,str2));
	}) */
	
		function submitform() {

			$('#sendSmsForm').submit();
		}
		function addphone() {
			var phonenumber = $("#phonenumber").val();
			var phone;
			 var mobilereg =/^1\d{10}$/;
				if(!isNaN(phonenumber)&&!phonenumber.match(mobilereg)){
					alert("请输入正确的手机号码!");
					return false;
				} else{
					phone = phonenumber+";"
				}
			
			var values = $('#mdn').val();
			$('.icoBtn_search').click(function() {
				$('#mdn').val(values+phone);
				//alert(phonenumber);
			});
		}
		

		function clearMdntip() {
			var s = $('#mdn').val();
			if (s.indexOf('手机号码') > -1) {
				$('#mdn').empty();
			}

		}
		function addMdntip() {
			var s = $('#mdn').val();

			if (s == "") {
				$('#mdn').html(tips);
			}

		}
	</script>
</body>


</html>
