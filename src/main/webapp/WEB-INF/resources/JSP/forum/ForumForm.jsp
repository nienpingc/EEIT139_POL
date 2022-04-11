<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
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
		<h2 class="head2">新增討論</h2>
		<form action="/HouseShip/CreateServlet" method="post">
			<div class="divForm">
				<table class="table table-striped">
					<tr>
						<td>帳號:</td>
						<td><input class="form-control" type="text" name="account"
							maxlength="10"></td>
					</tr>
					<tr>
						<td>主題:</td>
						<td><input class="form-control" type="text" name="theme"
							maxlength="10"></td>
					</tr>
					<tr>
						<td>標題:</td>
						<td><input class="form-control" type="text" name="title"
							maxlength="20"></td>
					</tr>
					<tr>
						<td>內容:</td>
						<td><textarea rows="10" cols="40" type="text" name="content"></textarea></td>
					</tr>
				</table>
				<div class="divInput">
					<center>
						<input class="btn btn-primary" type="submit" name="submit"
							value="送出">
					</center>
				</div>
			</div>
		</form>
	</div>
</body>
</html>