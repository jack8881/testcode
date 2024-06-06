<%@ page language="java" import="java.util.*,cn.com.app.bo.BlackObject"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="../common/common.jsp"%>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>生日预约发送查询</title>
	<script type="text/javascript">
        function delObject(id){
            if(confirm("确定要删除该记录？")){
                var url =basepage+"/birthdayBook/delete.html?id="+id;
                $.get(url,function(data){
                    if(data=="success"){
                        alert("删除成功！");
                        document.location.reload();
                    }else{
                        alert(data);
                    }
                });
            }
        }

        function submitform() {
            $("#formId_birth").submit();
        }
	</script>

</head>

<body class="content_body">
<div class="content_wrapper">

	<div class="locate">
		<span class="ico_locate"></span>您当前的位置：<span><a>信息发送</a>&nbsp;>&nbsp;生日预约发送查询</span>
	</div>
	<form id="formId_birth" action="${ basepage }/birthdayBook.html"
		  method="post">
		<div class="search_wrap">

			<label>查询号码:</label> <input name="mdn" type="text"
										value="${smsBirthdayObject.mdn}" />
			<input name="search" class="btn_search" type="button"
				   onclick="submitform()" />
		</div>

		<div class="table_wrap">

			<table class="grid_table">
				<thead>
				<tr>
					<th>姓名</th>
					<th>手机号码</th>
					<th>生日</th>
					<th>类型</th>
					<th>操作</th>
				</tr>
				</thead>

				<tbody>

				<c:choose>
					<c:when test="${not empty listBirthdayDetail}">
						<c:forEach items="${listBirthdayDetail}" var="birthdayDetail"
								   varStatus="vs">
							<tr class="main_info">
								<td>${birthdayDetail.contactName}</td>
								<td><span>${birthdayDetail.mdn}</span></td>
								<td>${birthdayDetail.birthday}</td>
								<c:choose>
									<c:when test="${birthdayDetail.type==0}">
										<td align="center">生日预约</td>
									</c:when>
									<c:when test="${birthdayDetail.type==1}">
										<td align="center">循环预约发送</td>
									</c:when>

								</c:choose>

								<td><a href="#" class="tablelink" onclick="delObject(${birthdayDetail.id})">取消发送</a></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr class="main_info">
							<td colspan="4" align="center">没有相关数据</td>
						</tr>
					</c:otherwise>
				</c:choose>

				</tbody>
			</table>
		</div>
		<div class="page_and_btn">${smsBirthdayObject.page.pageStr}</div>
	</form>
</div>





</body>
</html>



