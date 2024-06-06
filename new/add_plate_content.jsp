<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%String path=request.getContextPath(); %>
<script>

	
   $(function(){
	   $('#plate_type').live('change',function(){
		   var type=$(this).val();
		   var str='';
			$.ajax({
				url: "<%=path%>/getPlateByTypeId.html?id="+type,
				type: "GET",
				success: function(data){
					str+="<tr class=\"main_info\">";
					if(!(data.data)=="0"){
					   $.each(data.data, function (index) {  
						   str+="<td><input type=\"radio\" name=\"plateradio\" value="+data.data[index].id+"/></td>";
							str+="<td id=\"plateContent\">"+data.data[index].content+"</td>";
				            str+="</tr>";
				        });  
					}else{
						 str+="<td  colspan=\"4\" align=\"center\">"+"请先添加常用短语"+"</td>";
						 str+="</tr>";
					}
					   $('#databody').empty();
						  $('#databody').append(str);
					
				}
			});
	   })
   })

  </script>
</head>


<form id='formId_plate' action="" method="post">

	<label>常用短语类别:</label> <select id="plate_type" name="t_id">
		<option value="-1">---请选择类别--</option>
		<c:forEach items="${plateTypeList}" var="plateTypeList" varStatus="vs">
			<option value="${plateTypeList.id}">${plateTypeList.g_name}</option>
		</c:forEach>

	</select>



	<table class="grid_table">
		<thead>
			<tr>
               <th></th>
				<th>常用短语内容</th>
			</tr>
		</thead>
		<tbody id="databody">
		</tbody>
	</table>
</form>
