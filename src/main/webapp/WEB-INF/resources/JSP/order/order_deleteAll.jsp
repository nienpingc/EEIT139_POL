<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.order.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>批次刪除訂單</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
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
</head>
<body>
	<div class="div1">
		<h2 class="head2">刪除以下訂單</h2>
		<form id="form" action="/HouseShip/deleteOrder"
			method="post">
			<div class="divForm">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>訂單編號</th>
							<th>房屋編號</th>
							<th>入住日期</th>
							<th>退房日期</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="orderinfo"
											items="${sessionScope.deleteList}">
						<c:forEach var="item" items="${orderinfo.items}">
						<tr>
							<td>${item.orderid}</td>
							<td>${item.houseno}</td>
							<td>${item.chkinDate }</td>
							<td>${item.chkoutDate }</td>
						</tr>
						</c:forEach>
						</c:forEach>
					</tbody>
				</table>
				<div class="divInput">
					<input type="submit" id="bt1" class="btn btn-primary" name="confirmDelete" value="確認刪除">
				</div>
			</div>
		</form>
	</div>
	<div class="divInput">
		<a href="ViewOrder"><input type="submit"
			class="btn btn-secondary" value="取消"></a>
	</div>

	<script>
		document.getElementById("bt1").addEventListener("click", function(e) {
			if (!confirm("確認刪除資料?")) {
				e.preventDefault()
			}
		})
	</script>
</body>
</html>