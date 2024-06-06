<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	response.setHeader("Pragma","No-cache");
	response.setHeader("Cache-Control","no-cache");
	response.setDateHeader("Expires", -10);

%>

<%-- 所有的请求前加上 --%>
<c:set var="basepage"><%=request.getContextPath() %></c:set>
<%-- 静态资源 如:image, css等等, 前加上 --%>
<c:set var="staticbase"><%=request.getContextPath() %></c:set>
<%-- <c:set var="version"><%= new java.util.Date().getTime() %></c:set> --%>
<%-- import javascript begin --%>
<script type="text/javascript">
    var basepage = '<c:out value="${basepage}" default="/" escapeXml="false" />';
    var staticbase = '<c:out value="${staticbase}" default="/" escapeXml="false" />';
</script>
<script type="text/javascript" src="${ staticbase }/js/jquery.js"></script>
<!-- <script> var jquery = jQuery.noConflict(true); </script>	 -->
<script>  var $jq = $; </script>
<%--<script type="text/javascript"--%>
		<%--src="${ staticbase }/js/zTree/jquery-1.4.4.min.js"></script>--%>
<%--<script>  var $144 = $; </script>--%>
<script type="text/javascript"
		src="${ staticbase }/js/jquery-1.7.2.min.js"></script>
<script>  var $144 = $; </script>
<script type="text/javascript"
		src="${ staticbase }/js/zTree/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript"
		src="${ staticbase }/js/datePicker/WdatePicker.js"></script>
<script type="text/javascript"
		src="${ staticbase }/js/jquery.form.js"></script>
<script type="text/javascript"
		src="${ staticbase }/js/common.js"></script>
<script type="text/javascript"
		src="${ staticbase }/js/validation.js"></script>
<link href="${ staticbase }/js/zTree/zTreeStyle.css" rel="stylesheet"
	  type="text/css" />
<link href="${ staticbase }/css2.0/style.css" rel="stylesheet" type="text/css" />
<link href="${ staticbase }/css/main.css" rel="stylesheet" type="text/css" />
<link href="${ staticbase }/js/datePicker/skin/WdatePicker.css" rel="stylesheet" type="text/css" />


