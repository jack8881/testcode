<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<%@ include file="../common/common.jsp"%>
</head>
<form id="addVoteConfigForm" method="post" name="addVoteConfigForm" action='${basepage}/vote/saveVoteConfig.html'>

<div class="subsidy-box">
	<p class="p-item">
		<label class="lab-item"><em class="red">*</em>投票主题：</label><input type="text" id="title" name="title" value="" maxlength="50"/>
	</p>
	<p class="p-item">
		<label class="lab-item"><em class="red">*</em>投票类型：</label><input type="radio" name="type" value="0" checked="checked"/>&nbsp;投票为单选<input type="radio" name="type" value="1"/>&nbsp;投票为多选
	</p>
	<p class="p-item">
		<label class="lab-item"><em class="red">*</em>投票截止时间：</label><input type="text" id="deadtime" name="deadtime" readonly="readonly"
			id="deadtime" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:00',minDate: '%y-%M-%d-',skin:'twoer',isShowClear:false})" />
	</p>
	<p class="p-item">
		<label class="lab-item"><em class="red">*</em>选项设置</label>(最多设置6个选项)
	</p>
	<p class="p-item">
		<label class="lab-item"><em class="red">*</em>选项一：</label><input type="text" id="item1" name="item1" maxlength="20"/>
	</p>
	<p class="p-item">
		<label class="lab-item"><em class="red">*</em>选项二：</label><input type="text" id="item2" name="item2" maxlength="20"/>
	</p>
	<p class="p-item" id="additem">
		<label class="lab-item">&nbsp;&nbsp;&nbsp;</label><a href="#" onclick="addItem();return false;" style="color: blue;">添加选项</a>
	</p>
	
</div>
</form>
<script>
var n=3;
var a=["一","二","三","四","五","六"];
function addItem(){
	if(n>6){
		return false;
	}
	$("#delitem").remove();
	$("#additem").before('<p class="p-item" id="pp'+n+'"><label class="lab-item"><em class="red">*</em>选项'+a[n-1]+'：</label><input type="text" id="item'+n+'"  name="item'+n+'" maxlength="20"/><a id="delitem" href="#" onclick="delItem('+n+');return false;" style="color: blue;">&nbsp;删除</a></p>');
	n=n+1;
}
function delItem(m){
	$("#pp"+m).remove();
	n=m-1;
	if(n>=3){
		$("#item"+n).after('<a id="delitem" href="#" onclick="delItem('+n+');return false;" style="color: blue;">&nbsp;删除</a>');
	}
}

function save() {
}
</script>