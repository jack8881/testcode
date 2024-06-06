<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<form id="resendinfo" action="/sms-app/task/taskToReSend.html" method="post">
    <input id="resend_task_id" name="task_id" value="${taskid}" type="hidden" />
    <c:if test="${submitfail!='0'}">
        <p class="p-item">
            <label><input name="submittype" type="radio" value="0" checked="checked"/>对提交失败号码进行补发 (提交失败共${submitfail}个手机号码)  </label>
        </p>
    </c:if>
    <c:if test="${reportfail!='0'}">
        <p class="p-item">
            <label><input name="submittype" type="radio" value="1" <c:if test="${submitfail=='0'}">checked="checked"</c:if> />对回执失败号码进行补发 (回执失败共${reportfail}个手机号码)</label>
        </p>
    </c:if>
    <p class="p-item">
        <label><input name="submittype" type="radio" value="2" <c:if test="${submitfail=='0' and reportfail=='0'}">checked="checked"</c:if>/>全部重发（共${allmdn}个手机号码）</label>
    </p>

</form>



<script type="text/javascript">
    

</script>