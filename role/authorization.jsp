
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%--<%@ include file="../common/common.jsp"%>--%>
<%
	String path = request.getContextPath();
%>


 <%--<script type="text/javascript" src="<%=path%>/js/jquery-1.10.2.min.js"></script>--%>
<%--<script src="<%=path%>/js/zTree/jquery-1.4.4.min.js"></script>--%>





	<div class="modal-body">
		<ul id="tree" class="tree">
		</ul>
	</div>

<script type="text/javascript" src="<%=path%>/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript"
		src="<%=path%>/js/zTree2.6/jquery.ztree-2.6.min.js"></script>
<%--<script src="<%=path%>/js/zTree/jquery.ztree.all-3.5.min.js"></script>--%>
<link href="<%=path%>/js/zTree2.6/zTreeStyle-2.6.css" rel="stylesheet">
<script type="text/javascript" src="<%=path%>/js/dialog/lhgdialog.min.js?self=true&skin=discuz"></script>

	<script type="text/javascript">

	var zTree;
	$(document).ready(function(){
		var setting = {
			    showLine: true,
			    checkable: true
			};
			var zn = '${zTreeNodes}';
			var zTreeNodes = eval(zn);
		    zTree = $("#tree").zTree(setting, zTreeNodes);

	});
		
	function  doAuth(me){
		
		var nodes = zTree.getCheckedNodes();
		var tmpNode;
		var ids = "";
		for(var i=0; i<nodes.length; i++){
			tmpNode = nodes[i];
			if(i!=nodes.length-1){
				ids += tmpNode.id+",";
			}else{
				ids += tmpNode.id;
			}
		}
		var userId = "${userId}";
		var roleId = "${role_id}";
		var url = "userList/auth/save.html";
		var postData;
		if(userId!=""){
			postData = {"user_id":userId,"menuIds":ids};
		}else{
			url="roleList/auth/save.html";
			postData = {"role_id":roleId,"menuIds":ids};
		}
		$.post(url,postData,function(data){
			if(data !=""&& data=="success"){
			   alert("保存成功！");
			}
		});
	}	
	</script>
