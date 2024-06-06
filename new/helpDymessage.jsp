<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<c:set var="staticbase"><%=request.getContextPath() %></c:set>
<script type="text/javascript" src="${ staticbase }/js/sohobox/jquery.sobox.js"></script>
<script type="text/javascript" src="${ staticbase }/js/sohobox/sohobox.js"></script>
<link href="${ staticbase }/css2.0/soboxstyle.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>操作说明</title>

</head>

<body class="content_body">

<div>
       <table>
		
			<tr class="importfile">
				<td>操作步骤说明: <br /> 
				    1、动态短信与短信发送区别是动态短信是每个号码发送的内容是不一样的，但都是根据同一个模板发送的，自己可以在输入内容框中自定义模板.<br />
					2、上传完成后会把第一行的标题显示出来，点击标题后每一行对应的标题数据会动态拼接. <br/>
					3、 例子 :根据模板分别向  13764750703,13764750704发送两条不同的短信内容.具体输入内容为： 
					       尊敬的{姓名}您好，您当月水费{水费}元，物业费{物业费}元，祝您生活愉快！(其中大括号的内容可以点击上面的标题获得)
					<br />
                                                                   
					
				</td>
			</tr>
			
		
		</table>
		
     <div>
     <img src="${staticbase}/images2.0/help.png" height="100" width="400" alt="操作说明"/>
     </div>
          4、发送后的内容为：号码为 13764750703 收到的短信内容为 :尊敬的张三您好，您当月水费222元，物业费3333元，祝您生活愉快！<br/>
                          号码为 13764750704 收到的短信内容为：尊敬的李四您好，您当月水费223元，物业费3334元，祝您生活愉快！<br/>
   </div>
</body>
</html>