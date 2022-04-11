<!--
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.forum.*"%>
-->

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
</style>


<meta charset="UTF-8">
<title>討論區</title>
</head>
<body>
	<div class="div1">
	
	<h2 class="head2">編輯</h2>
	
	<form action="UpdateServlet" method="post">
	<div class="divForm">
		<table class="table table-striped">
			<tr>
			<tr>
				<td>文章編號:</td>
				<td><input class="form-control" type="text" name="fid" maxlength="10"
					value="${forum.fid}" disabled>
				<input class="form-control" type="hidden" name="fid" maxlength="10"
					value="${forum.fid}">
					</td>
			</tr>
			<tr>
				<td>帳號</td>
				<td><input class="form-control" type="text" name="account" maxlength="10"
					value="${forum.account}" disabled>
					<input class="form-control" type="hidden" name="account" maxlength="10"
					value="${forum.account}">
					</td>
			</tr>
			<tr>
				<td>時間:</td>
				<td><input class="form-control" type="text" name="posttime" maxlength="10"
					value="${forum.postTime}"disabled>
					<input class="form-control" type="hidden" name="posttime" maxlength="10"
					value="${forum.postTime}">
					</td>
			</tr>

			<tr>
				<td>主題:</td>
				<td><input class="form-control" type="text" name="theme" maxlength="10"
					value="${forum.theme}"></td>
			</tr>
			<tr>
				<td>標題:</td>
				<td><input class="form-control" type="text" name="title" maxlength="20"
					value="${forum.title}"></td>
			</tr>
			<tr>
				<td>內容:</td>
				<td><input class="form-control" type="text" name="content"
					value="${forum.content}"></td>
			</tr>
		</table>
			<div class="divInput">
		
		<center>
			<input class="btn btn-primary" type="submit" value="確認" />
		</center>
		</div>
		</div>
	</form>
	</div>
<!-- 	<a href="Index.jsp">回首頁</a> -->
</body>
</html>



