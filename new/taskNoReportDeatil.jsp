<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="../common/common.jsp" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link href="${ staticbase }/css2.0/soboxstyle.css" rel="stylesheet"
          type="text/css"/>
    <script type="text/javascript"
            src="${ staticbase }/js/sohobox/jquery.sobox.js"></script>
    <script type="text/javascript"
            src="${ staticbase }/js/sohobox/sohobox.js"></script>
    <title>信息查询</title>


    <script type="text/javascript">
        $(document).ready(function () {
            $(".click").click(function () {
                $(".tip").fadeIn(200);
            });

            $(".tiptop a").click(function () {
                $(".tip").fadeOut(200);
            });

            $(".sure").click(function () {
                $(".tip").fadeOut(100);
            });

            $(".cancel").click(function () {
                $(".tip").fadeOut(100);
            });

        });
    </script>


</head>


<body>

<div class="content_body">
    <div class="locate"><span class="ico_locate"></span>您当前的位置：<span><a>发送统计</a>&nbsp;>&nbsp;未知状态查询</span>
    </div>

    <div class="content_wrapper">
        <form action="taskNoReportDetail.html" method="post">
            <div class="content">
                <div class="search_wrap">


                    <label>手机号码:</label>
                    <input name="mdn" type="text" id="mdn" value="${taskDetailInfo.mdn}" maxlength="18"/>

                    <label>任务编号:</label>
                    <input name="taskid" type="text" id="taskid" value="${taskDetailInfo.taskid}" maxlength="18"/>
					
                    <label>提交时间:</label>
                    <input id="d12" name="createtime" type="text" class="Wdate" value="${taskDetailInfo.createtime}"
                           type="text"
                           onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'d13\')||\'%y-%M-%d\'}',skin:'twoer',dateFmt:'yyyy-MM-dd',isShowClear:false,readOnly:true})"/>--
                    <input id="d13" name="endtime" type="text" class="Wdate" value="${taskDetailInfo.endtime}"
                           type="text"
                           onfocus="WdatePicker({minDate:'#F{$dp.$D(\'d12\',{d:0});}',maxDate:'%y-%M-%d',skin:'twoer',dateFmt:'yyyy-MM-dd',isShowClear:false,readOnly:true})"/>


                    <button name="search" type="submit" class="btn_search"/>
                    <button style="margin-left: 15px" class="btn_grid" onclick="exportSpAccount()">
                        <span class="ico_export"></span>导出
                    </button>

                </div>
                <div class="table_wrap">
                    <table class="grid_table">
                        <thead>
                        <tr>
                            <th>任务编号<i class="sort"><img src="images/px.gif"/></i></th>
                            <th>手机号码</th>
                            <th>接入号</th>
                            <th>提交时间</th>
                            <th>提交结果</th>
                            <th>操作</th>
                        </tr>
                        </thead>

                        <tbody>

                        <c:choose>
                            <c:when test="${not empty taskDetailList}">
                                <c:forEach items="${taskDetailList}" var="taskDetail" varStatus="vs">
                                    <tr class="main_info" id="tr${taskDetail.id}">
                                        <td>${taskDetail.taskid}</td>
                                        <td><span>${taskDetail.mdn}</span></td>
                                        <td>${taskDetail.callmdn}</td>
                                        <td>${taskDetail.send_time}</td>
                                        <td>${taskDetail.res_desc}</td>
                                        <td><a class="tablelink" onclick="viewTaskDetail(${taskDetail.id})">查看详情</a>
                                        </td>
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
                    </table>
                </div>

                <div class="page_and_btn">${taskDetailInfo.page.pageStr} </div>


            </div>
        </form>


    </div>
</div>

<script type="text/javascript">


    function viewTaskDetail(id) {


        $.ajax({
            url: "getTaskDetail.html?id=" + id,
            type: "GET",

            success: function (data) {

                $.sobox.pop({
                    cls: 'subsidy-box',
                    title: '状态查询',

                    drag: false,
                    content: data,// 支持html标签
                    btn: [
                        {text: '关闭', removePop: true}

                    ]
                });


            }
        });

    };
    function exportSpAccount() {
        if (confirm("确认导出")) {
            var createtime = $("#d12").val();
            var endtime = $("#d13").val();
            var mdn = $("#mdn").val();
            var taskid = $("#taskid").val();
            
            $.ajax({
	            url: "<%=path%>/downLoad/DownLoadTaskNoReport.html?createtime=" + createtime + "&mdn=" + mdn + "&taskid=" + taskid + "&endtime=" + endtime,
	            type: "GET",
            	success: function (data) {
                	if(!(data.result)=="0"){
                		alert("任务已经提交，请到下载中心下载");
                		return;
                	}else{
                		var url = basepage + "/task/exportTaskDetail.html?createtime=" + createtime + "&mdn=" + mdn + "&taskid=" + taskid + "&endtime=" + endtime;
            			window.open(url);
                	}
            	},
            	error: function(XMLHttpRequest, textStatus, errorThrown) {
            		/* alert("error");
					alert(XMLHttpRequest.status);
					alert(XMLHttpRequest.readyState);
					alert(textStatus); */
  				 },
  				 complete: function(XMLHttpRequest, textStatus) {
                        this; // 调用本次AJAX请求时传递的options参数
                 }
        	});
            
        }
    };


</script>

</body>

</html>