<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
response.setContentType("text/html;charset=UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="/CSS/styles.css" rel="stylesheet" />
<script src="https://kit.fontawesome.com/6a69f60fc3.js"
	crossorigin="anonymous"></script>
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


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>討論區</title>
</head>
<body>
	<div class="div1">
		<h2 class="head2">討論請確認</h2>

		<form action="CreateServlet" method="post">
			<div class="divForm">
				<table class="table table-striped">
					<tr>
						<td>帳號:</td>
						<td>${create_forum.getAccount()}</td>
					</tr>

					<tr>
						<td>主題:</td>
						<td>${create_forum.getTheme()}</td>
					</tr>
					<tr>
						<td>標題:</td>
						<td>${create_forum.getTitle()}</td>
					</tr>
					<tr>
						<td>內容:</td>
						<td>${create_forum.getContent()}</td>
					</tr>
				</table>
				<center>
					<input class="btn btn-primary" type="submit" name="confirm"
						value="確認">
				</center>
			</div>
		</form>
	</div>
</body>
</html>