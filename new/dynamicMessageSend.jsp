<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="${ staticbase }/css2.0/soboxstyle.css" rel="stylesheet" type="text/css" />
<link href="${ staticbase }/web/css/select2.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ staticbase }/js/sohobox/jquery.sobox.js"></script>
<script type="text/javascript" src="${ staticbase }/js/sohobox/sohobox.js"></script>
<script type="text/javascript" src="${ staticbase }/js/select2.min.js"></script>
<script type="text/javascript" src="${ staticbase }/js/select-ui.min.js"></script>
<script type="text/javascript" src="${ staticbase }/js/editSms/editSms.js"></script>
<script type="text/javascript" src="${ staticbase }/js/kindeditor/kindeditor-all-min.js"></script>
<script type="text/javascript">
    $(function(){
    	$("ul.shortcut li ").bind('click',function () {
    		 var values = $('#content').val();
    		  var title = $(this).text();
    		  var newTitle = "{"+title+"}";
    		    $('#content').empty();
    		    $('#content').val(values+newTitle);


    	});
    })


  $(function(){
	var message ="${errMsg}";
        if(message != null && message !=''){
        	alert(message);
        }
		var isShow = "${isShow}";
		if(isShow == "0"){
			$("#show").css('display','block');
		}else{
			$("#show").css('display','none');
		}
	});
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
	function exportTemplate() {
		document.location = basepage + "/contact/exportTemplate.html?fileName=dynamicMessage.csv";
	}

	function toImportFile(){

		$.ajax({
			url: "addMessageFile.html",
			type: "GET",

			success: function(data){

				$144.sobox.pop({
					cls:'subsidy-box',
					title:'文件导入',
					drag :false,
					content:data,// 支持html标签
					 btn:[
						     {text:'关闭',removePop:true}

						]

				});


			}
		});
	}


	function help(){

		$.ajax({
			url: "addMessageHelp.html",
			type: "GET",

			success: function(data){

				$144.sobox.pop({
					cls:'subsidy-box',
					title:'操作说明',
				    width:800,
				    height:500,
					drag :false,
					//scroll:true,
					content:data,
					 btn:[
						     {text:'关闭',removePop:true}

						]

				});


			}
		});
	}


	function showDetail(){
		var content = $('#content').val();
		if(content == null ||content==''){
			alert("请输入短信内容才能预览，且短信内容必须包含动态数据字段");
			return false;
		}else{
			if(content.indexOf('{')==-1||content.indexOf('}')==-1){
				alert("短信内容必须包含动态数据字段才能预览");
				return false;
			}
		}
		var url= "showMessage.html?content="+encodeURI(encodeURI(content));

		$.ajax({

			type: "GET",
			url:url,
			success: function(data){

				$144.sobox.pop({
					cls:'subsidy-box',
					title:'短信预览(只显示十条)',
					drag :false,
					 width:600,
					 height:400,
					//scroll:true,
					 content:data,
					 btn:[
						     {text:'关闭',removePop:true}

						]

				});


			}
		});
	}


	function check(){
		var content = $('#content').val();
		if(content == null || content ==''){
			alert("请先导入动态数据然后输入短信内容发送!");
			return false;
		}

		var isShow = "${isShow}";
		if(isShow != "0"){
			alert("请导入动态数据");
			return false;
		}
        //有审核人时必选选中候选人
        if ($("#audit_select option").length == 0){
            $("input[name='userInfoAuditIds']").val("");
        }else {
            var select2 =$('#audit_select').select2().val();
            if(select2 == null){
                alert("请至少选中一个审核人");
                return false;
            }else {
                $("input[name='userInfoAuditIds']").val(select2);
            }
        }
        if (confirm("确定要发送短信吗?")) {
            $('#sendSmsForm').submit();
        }
	}


	function checkFile() {

		var filename = $("#importmdnfile").val();
		if (filename == '') {
			alert("文件不能为空");
			return false;
		}

		if (filename.split('.')[1] == 'txt' || filename.split('.')[1] == 'csv'
				|| filename.split('.')[1] == 'xls'
				|| filename.split('.')[1] == 'xlsx') {
		} else {
			alert("文件格式不正确");
			return false;
		}

		$("#import_form").submit();
		/* submitForm('import_form', 'getTitleWithFile.html', function(data) {
			alert("good");
		}) */

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
        var newTitle = "\${m}";
        insertText(document.getElementById('content'),newTitle);
    }

    function addRegionSuffix(){
        var newTitle = "\${R}";
        insertText(document.getElementById('content'),newTitle);
    }

</script>
</head>
<body class="content_body">

	<div class="content_wrapper">

		<div class="content sms_content">
			<form id="sendSmsForm" action="${ basepage }/dynamicMessageSend.html"
				method="post">
                <input type="hidden" name="dynamicTask" value="1"/>
                <input type="hidden" name="token" value="${token}" />
                 <input type="hidden" name="file_id" value="${file_id}" />
				<input type="hidden" name="LongSMSWords" id="LongSMSWords"
					value="67" /> <input type="hidden" name="shortSMSWords"
					id="shortSMSWords" value="70" /> <input type="hidden"
					name="signature" id="signature"
					value="${sessionScope.sessionEpUser.signature}" /> <input
					type="hidden" name="maxSMSWords" id="maxSMSWords" value="1000" />
				<input type="hidden" id="importSendObjPathId" name="importFilePath"
					value="" />
		    <ul class="shortcut">
				<!-- <li><span class="shortcut_stat" ></span>手机号</li>
				<li><span class="shortcut_stat" ></span>标题1</li>
				<li><span class="shortcut_stat" ></span>标题2</li>
				<li><span class="shortcut_stat" ></span>标题3</li> -->

				 <c:choose>
				 <c:when test="${not empty titleList}">
					<c:forEach items="${titleList}" var="titleList" varStatus="vs">
					 <li><span class="shortcut_stat" ></span>${titleList}</li>
					</c:forEach>
					</c:when>

						</c:choose>
			  </ul>
		 <div>	<h3 style="display : inline">请输入短信内容：</h3> &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
             <a href="#" onclick="toImportFile()" style="text-decoration: none; color: #2d63b5; vertical-align: middle"><span id="importFile">导入动态数据</span></a>    &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
             <a href="javascript:addMdnSuffix()" style="text-decoration: none; color: #2d63b5; vertical-align: middle"><span id="inserPlate">插入手机后四位</span></a> &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
             <a href="javascript:addRegionSuffix()" style="text-decoration: none; color: #2d63b5; vertical-align: middle"><span id="inserRegion">插入手机归属地</span></a> &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
             <a href="#" onclick="help()" style="text-decoration: none; color: #2d63b5; vertical-align: middle"><span id="importTitle">操作说明</span></a></div>
				<div class="textarea_box">
					<div class="textarea">
						<textarea style="font-size: 14px; font-family: arial, 微软雅黑;"
							name="content" id="content" onkeydown="javascript:editSms.WordsCount();"
							onkeyup="javascript:editSms.WordsCount();"
							onfocus="javascript:editSms.WordsCount();"
							onblur="javascript:editSms.WordsCount();"></textarea>
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
					</div>
				</div>
				<div class="book_send">
					<input id="sltAll" name="booksend" type="checkbox" value="on"
						onclick="javascript:editSms.showBookTime()" /> <label
						for="sltAll">预约发送</label>
					<div style="display: none;" id="booksend">
						预约时间: <input type="text" name="booksendTime" readonly="readonly"
							id="booksendTime" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:00',minDate: '%y-%M-%d-',skin:'twoer',isShowClear:false})"

							/>
					</div>
				</div>
				<div> <h3 style="display : inline">发送的号码：</h3>

		        </div>
				<div class="textarea_box">
					<textarea name="sendMobiles" id="mdn"  style="height: 80px;" readonly="readonly">${show}</textarea>

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
					<button class="btn_save"  onclick="return check()">发&nbsp;&nbsp;送</button>

					<button  class="btn_cancel" type="reset" >重&nbsp;&nbsp;置</button>

					<div id="show" ><button class="btn_view" type="button" onclick="showDetail()" style="margin-left: 170px;margin-top: -25px">预&nbsp;&nbsp;览</button></div>
					<!-- <a href="#" id="show" class ="btn_cancel" style="margin-left: 170px;margin-top: -25px" onclick="showDetail()">预&nbsp;&nbsp;览</a> -->
				</div>
			</form>


		</div>
	</div>


</body>

</html>

