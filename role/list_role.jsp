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
    <title>角色管理</title>

    <script type="text/javascript" src="<%=path%>/js/dialog/lhgdialog.min.js?self=true&skin=discuz"></script>
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
    <div class="locate"><span class="ico_locate"></span>您当前的位置：<span><a>用户管理</a>&nbsp;>&nbsp;角色管理</span>
    </div>

    <div class="content_wrapper">
            <div class="content">
                <div class="search_wrap">




                </div>
                <div class="table_wrap">
                    <button class="btn_grid"style="margin-bottom: 10px" onclick="javascript:addRole();">
                        <span class="ico_add"></span>添加角色
                    </button>

                    <table class="grid_table">
                        <thead>
                        <tr>
                            <th>ID<i class="sort"><img src="images/px.gif"/></i></th>
                            <th>角色名称</th>
                            <th>角色备注</th>
                            <th>创建人</th>
                            <th>操作</th>
                        </tr>
                        </thead>

                        <tbody>

                        <c:choose>
                            <c:when test="${not empty roleList}">
                                <c:forEach items="${roleList}" var="roleInfo" varStatus="vs">
                                    <tr class="main_info" id="tr${roleInfo.role_id}">
                                        <td>${roleInfo.role_id}</td>
                                            <%-- <td>${taskDetail.pa_dsc}</td> --%>
                                        <td><span>${roleInfo.roleName}</span></td>
                                        <td><span>${roleInfo.description}</span></td>
                                        <td>${roleInfo.create_user}</td>

                                        <td>
                                            <a class="tablelink"
                                               href="javascript:editRights(${roleInfo.role_id });">授权</a>
                                            <a class="tablelink" name="${roleInfo.role_id }-${roleInfo.roleName}"
                                                onclick="editRole(this);">修改</a>
                                            <a class="tablelink"
                                                href="javascript:delRole(${roleInfo.role_id });">删除</a>
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
    </div>
</div>

<script type="text/javascript">

    function addRole() {

        $.dialog({
            title: "添加角色",
            content: '<div style="width:100%;height:40px;line-height:40px;text-align:center;"><span style="color: #4f4f4f;font-size: 13px;font-weight: bolder;display:inline-block;vertical-align:middle;">角色名称：</span><input type="text" name="roleName" id="roleName" class="form_control form_white" style="vertical-align: middle;"/></div>',
            width: 500,
            height: 200,
            ok: function () {
                var url = "roleList/save.html";
                var postData = {
                    roleName : $("#roleName").val()
                };
                if(postData.roleName.length <= 0){
                    Dialog.alertError('角色名不能为空！');
                    $("#roleName").focus();
                    $("#roleName").select();
                    return;
                }
                $.post(url, postData, function(data) {
                    if (data == 'success') {
                        Dialog.alertSucc("成功");
                        window.location.reload();
                        return true;

                    } else {
                        Dialog.alertError('角色名重复，保存失败！');
                        $("#roleName").focus();
                        $("#roleName").select();
                    }
                });
            },
            cancelVal: '关闭',
            cancel: function () {
                return true;
            }
        });

    }
    function editRole(object) {

        var name = $(object).attr("name");
        var split = name.split("-");
        var role_id = split[0];
        var roleName = split[1];
        $.dialog({
            title: "修改角色",
            content:'<div style="height:40px;line-height:40px;text-align:center;"><span style="color: #4f4f4f;font-size: 13px;font-weight: bold;display:inline-block;vertical-align:middle;">角色名称：</span><input type="text" name="roleName" class="form_control form_white" id="roleName" value="'+roleName+'" style="vertical-align: middle;"/></div>',// 支持html标签
            width: 500,
            height: 200,
            ok: function () {
                var url = "roleList/save.html";
                var postData = {role_id:role_id,roleName:$("#roleName").val()};
                if(postData.roleName.length <= 0){
                    Dialog.alertError('角色名不能为空！');
                    $("#roleName").focus();
                    $("#roleName").select();
                    return;
                }
                $.post(url, postData, function(data) {
                    if (data == 'success') {
                        Dialog.alertSucc("成功");
                        window.location.reload();
                        return true;

                    } else {
                        Dialog.alertError('角色名重复，保存失败！');
                        $("#roleName").focus();
                        $("#roleName").select();
                    }
                });
            },
            cancelVal: '关闭',
            cancel: function () {
                return true;
            }
        });

    }
    function delRole(role_id) {
        if (confirm("确定要删除该记录？")) {
            var url = "roleList/delete.html?role_id=" + role_id;
            $.get(url, function(data) {
                if (data == "success") {
                    alert("删除成功！");
                    document.location.reload();
                } else {
                    alert(data);
                }
            });
        }
    }
    function editRights(roleId) {

        Dialog.ajaxOpen('roleList/auth.html?role_id=' + roleId, "授权",
            function(me) {
                me.close();
                return doAuth(me);
            }
        );


    }

</script>

</body>

</html>