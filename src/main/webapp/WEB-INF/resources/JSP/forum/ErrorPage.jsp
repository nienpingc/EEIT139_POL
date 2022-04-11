<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="/CSS/styles.css" rel="stylesheet" />
<script src="https://kit.fontawesome.com/6a69f60fc3.js"
	crossorigin="anonymous"></script>
	<style type="text/css">
	.div1{
		border:2px solid #0B1A4A;
		border-radius:20px;
		width:600px;
		margin: 50px auto;
	}
	.head2{
		margin: 20px auto;
		text-align: center;
	}
	.divForm{
		width: 500px;
		margin: 20px auto;
		text-align: left;
	}
	.divInput{
		margin: 10px auto;
		text-align: center;
	}input{
		width:250px;
	}td,th{
		width:250px
	}.btn{
		width:100px;
	}
</style>s
	
<meta charset="UTF-8">
<title>討論區</title>
</head>
<body>
<table>
<h2 class="head2">失敗</h2>
<%
if(request.getParameter("submit") != null){
%>
<a href="/JSP/forum/ForumForum.jsp">請再新增一次</a>
<%
}
%>
<%
if(request.getParameter("submit") != null){
%>
<a href="/JSP/forum/ForumForum.jsp">請再新增一次</a>
<%
}
%>

</table>
</body>
</html>