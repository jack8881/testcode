<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String path = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>信息查询详情</title>
    <link href="<%=path %>/css2.0/soboxstyle.css" rel="stylesheet"
          type="text/css"/>
    <script type="text/javascript"
            src="<%=path %>/js/sohobox/jquery.sobox.js"></script>
    <script type="text/javascript"
            src="<%=path %>/js/sohobox/sohobox.js"></script>

    <style type="text/css">
        body {
            width: 100%;
            height: 100%;
            background-color: #FFFFFF;
            text-align: center;
        }

        .textinput {
            font-size: 10px;
            font-style: 微软雅黑;
        }

        .table th {
            text-align: center;
            width: 90px;
            color: #4f4f4f;
            padding-right: 5px;
            font-size: 13px;
            font-style: 微软雅黑;
        }

        .table td {
            text-align: center;
            width: 90px;
            color: #4f4f4f;
            padding-right: 5px;
            border-bottom: 1px solid #d2d2d2;
            font-size: 13px;
            font-style: 微软雅黑;
        }
    </style>
</head>
<body>
<table border="1px" bordercolor="#A1D6FF" width="100%" cellpadding="0" cellspacing="0" bgcolor="#ECF1F5">
    <%--    <tr >
            <td>企业ID: ${taskDetailInfo.sp_id}</td>
            <td>企业名称:: ${taskDetailInfo.sp_name}</td>
        </tr> --%>
    <tr>
        <th>手机号码:</th>
        <td>${taskDetailInfo.mdn}</td>
    </tr>
    <tr>
        <th>网关回执代码:</th>
        <td>${taskDetailInfo.stat_desc}</td>
    </tr>
    <tr>
        <th>提交时间:</th>
        <td>${taskDetailInfo.send_time}</td>
    <tr>
        <th>到达时间:</th>
        <td>
            <fmt:formatDate value="${taskDetailInfo.arrive_time}" type="both"
                            pattern="yyyy-MM-dd HH:mm:ss"/>
            <%--<c:choose>
                <c:when test="${taskDetailInfo.result==null || taskDetailInfo.result == 1}">
                </c:when>
                <c:otherwise>
                    <fmt:formatDate value="${taskDetailInfo.arrive_time}" type="both"
                                    pattern="yyyy-MM-dd HH:mm:ss"/>
                </c:otherwise>
            </c:choose>--%>
        </td>
    </tr>
    <tr>
        <c:choose>
            <c:when test="${taskDetailInfo.status==0}">
                <th>是否被取状态:</th>
                <td>否</td>
            </c:when>
            <c:otherwise>
                <th>是否被取状态:</th>
                <td>是</td>
            </c:otherwise>
        </c:choose>
    </tr>
    <tr>
        <th>接入号:</th>
        <td>${taskDetailInfo.callmdn}</td>
    </tr>
    <tr>
        <th>运营商:</th>
        <td>${taskDetailInfo.opoperator}</td>
    </tr>
    <tr>
        <th>号码归属地:</th>
        <td>${taskDetailInfo.mdnProvice}省(市)|${taskDetailInfo.mdnCity}</td>
    </tr>

    <tr>
        <th>发送内容:</th>
        <td colspan="2"><textarea rows="8" cols="30" name="descption" id="descption"
                                  style="margin: 2px; width: 230px; height: 169px;" class="textinput"
                                  readonly="readonly">${taskDetailInfo.res_content}</textarea></td>
    </tr>

</table>


</body>
</html>