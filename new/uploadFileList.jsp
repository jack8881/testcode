<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>文件发送历史记录</title>
<script type="text/javascript">
	function submitform() {
		$("#formId").submit();
	}
</script>
<script type="text/javascript" src="${ staticbase }/js/sohobox/jquery.sobox.js"></script>
<script type="text/javascript" src="${ staticbase }/js/sohobox/sohobox.js"></script>
<link href="${ staticbase }/css2.0/soboxstyle.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.btn_navy {
	color: #fff;
	background: #319DB5;
	border-color: #2B8B9F;
}

.btn_navy:hover, .btn_navy:focus {
	background: #2B8B9F;
	color: #fff;
}

</style>


</head>

<body class="content_body">
	<div class="content_wrapper">
		<form id='formId' action="${ basepage }/upLoad/upLoadFileList.html"
			method="post">
			<div class="locate">
				<span class="ico_locate"></span>您当前的位置：<span><a>信息发送</a>&nbsp;>&nbsp;文件发送历史记录</span>
			</div>
			<div class="content">
				<div class="search_wrap">
				<label>文件内容：</label> <input type="text" name="content" value="${uploadFile.content}"/>
					<label>创建时间：</label> <input id="d12"
						name="createtime" type="text" value="${uploadFile.createtime}"
						type="text"
						onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'d13\')||\'%y-%M-%d\'}',dateFmt:'yyyy-MM-dd',isShowClear:false,readOnly:true})" />--
					<input id="d13" name="createtime1" type="text"
						value="${uploadFile.createtime1}" type="text"
						onfocus="WdatePicker({minDate:'#F{$dp.$D(\'d12\')||\'%y-%M-%d\'}',dateFmt:'yyyy-MM-dd',isShowClear:false,readOnly:true})" />
					<input name="search" class="btn_search" type="button"
						onclick="submitform()" />
				</div>
				<div class="table_wrap" >
					<table class="grid_table" >
						<thead>
							<tr>
							<th width="30">序号</th>
								<th >发送内容</th>
								<th >文件名</th>
								<th >号码信息</th>
								<th >状态</th>
								
								<th >提交时间</th>
								<th >处理完成时间</th>
								<th width="30">备注</th>
								<!-- <th>操作</th> -->
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty uploadList}">
									<c:forEach items="${uploadList}" var="uploadList" varStatus="vs">
										<tr class="main_info" id="tr${uploadList.id}" >
											<td >${vs.index+1}     </td>
											<td  >${uploadList.content}</td>
											<td >${uploadList.name}</td>
											
											<td >${fn:substringBefore(uploadList.mdn_info, "|")}  <a class="btn btn_navy"
														href='javascript:showProvince("${fn:substringAfter(uploadList.mdn_info, "|")}")'>分省详情</a></td>
											<td  >${uploadList.status}</td>
											<td >${uploadList.createtime}</td>
											
											<td >${uploadList.deal_time}</td>
											<td >${uploadList.remark}     </td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="11" align="center">没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
						<tfoot>

						</tfoot>
					</table>
					<div class="page_and_btn">${uploadFile.page.pageStr}</div>
				</div>
			</div>
		</form>

	</div>

	<script type="text/javascript">
	function showProvince(province_info){
		SoDialog.alert("分省详情",province_info,  function(me) {
			return ;
		});
	}
	</script>

</body>
</html>
