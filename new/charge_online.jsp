<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="../common/common.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>在线充值</title>

<script type="text/javascript">
function submitform(){
	var amount=$("#d12").val();
	if(isNaN(amount)){
		alert("输入的金额不是数字!");
	}else{
		if(amount<100){
			alert("每次充值不能低于100元");
		}else{
	        $("#formId").submit();
		}
	}
}

</script>
</head>

<body class="content_body">
	<div class="content_wrapper">
		<form id='formId' action="${ basepage }/spList/toAlipayChargePage.html"
			method="post">
			<div class="locate">
				<span class="ico_locate"></span>您当前的位置：<span><a>财务管理</a>&nbsp;>&nbsp;在线充值</span>
			</div>
			<div class="content">
				<div class="search_wrap">
					<label>充值金额:</label> <input id="d12" type="text" name="amount" value=""  />
						&nbsp;<input name="search" class="btn_search" type="button" onclick="submitform()" />
				</div>
				<div class="pay_style">
				<img src="${staticbase}/images/aliPay.png" alt="" width="220px;" /><br />
				 温馨提示： <br/>
				1,在线充值目前只支持支付宝<br/>
				2,在线充值每次金额必须大于100元<br/>
				3,充值完成后，系统会根据企业设置的费率自动增加条数<br/>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
