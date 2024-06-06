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
	<style type="text/css">
		.editor_content{
			padding: 10px;
			height: 110px;
			width: 670px;
			border: 1px solid #ccc;
		}

	</style>
	<script type="text/javascript"
			src="${ staticbase }/js/dialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="${ staticbase }/js/sohobox/jquery.sobox.js"></script>
	<script type="text/javascript" src="${ staticbase }/js/sohobox/sohobox.js"></script>
	<script type="text/javascript" src="${ staticbase }/js/select2.min.js"></script>
	<script type="text/javascript" src="${ staticbase }/js/select-ui.min.js"></script>
	<script type="text/javascript" src="${ staticbase }/js/editPms/editPms.js"></script>

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
		<form id="sendSmsForm" action="${ basepage }/sendPms/send.html"
			  method="post">
			<input name="template_id" value="${smsSendTemplate.id}" type="hidden"/>
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
			<div class="textarea_box">
				<div class="textarea">
					<div id="editor" class="textarea_box editor_content">${smsSendTemplate.content}</div>
					<input type="hidden" name="content" />
				</div>
				<div class="textarea_footer">
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


			<div> <h3 style="display : inline">请输入短信接收号码：</h3>  &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
				<a href="javascript:editPms.toImportMdnFile();"
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
				<button class="btn_save" type="button" onclick="return editPms.checksms()">发&nbsp;&nbsp;送</button>
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
