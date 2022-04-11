<!--<%@page import="model.forum.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
-->

<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="/CSS/styles.css" rel="stylesheet" />
<script src="https://kit.fontawesome.com/6a69f60fc3.js"
	crossorigin="anonymous">
	
</script>
<style type="text/css">
.div1 {
	border: 2px solid #0B1A4A;
	border-radius: 20px;
	width: 600px;
	margin: 50px auto;
}

.head2 {
	margin: 20px auto;
	text-align: center;
}

.divForm {
	width: 500px;
	margin: 20px auto;
	text-align: left;
}

.divInput {
	margin: 10px auto;
	text-align: center;
}

input {
	width: 250px;
}

td, th {
	width: 250px
}

.btn {
	width: 100px;
}
</style>


<meta charset="UTF-8">
<title>討論區</title>
</head>
<body>
	<div class="div1">
		<h2 class="head2">刪除討論</h2>
		
				<form action="DeleteServlet" method="post">
			<input class="form-control" type="hidden" name="ForumId"
				value="${forum.fid}">
			<table class="table table-striped">
				<div class="divForm">
					<tr>
						<td>編號</td>
						<td>${forum.fid}</td>
					</tr>
					<tr>
						<td>帳號</td>
						<td>${forum.account}</td>
					</tr>
					<tr>
						<td>時間</td>
						<td>${forum.postTime}</td>
					</tr>
					<tr>
				        <td>主題</td>
				        <td>${forum.theme}</td>
					</tr>
					<tr>	
						<td>標題</td>
						<td>${forum.title}</td>
					</tr>
					<tr>	
						<td>內容</td>
						<td>${forum.content}</td>

				   </tr>
				   </div> 
			</table>
			<div class="divInput">
				<center>
					<input class="btn btn-primary" type="submit" value="確定刪除?">
				</center>
				</div>
		</form>
		<%-- 	<jsp:include page="QueryForumNoTitle.jsp"></jsp:include> --%>

		<!-- 	<script type="text/javascript"> -->

		<!-- 	</script> -->
	</div>
</body>
</html>



