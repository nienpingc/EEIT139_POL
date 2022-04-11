<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="tw.grp4.member.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改會員資料</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
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
</head>
<body>

	<div class="div1">
	
	<h2 class="head2">修改會員資料</h2>
	
	<form action="updatemember.controller" method="get">
	
	<div class="divForm">
	<table class="table table-striped">
		<thead>
		<tr>
			<th>欄位名稱</th>
			<th>修改資料</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td>帳號</td>
			<td><input type="text" name="account" value="${account}" disabled></td>
			<!-- 上面沒法傳輸資料到controller,用下面的hidden代替,上面負責顯示 -->
			<input type="text" name="account" value="${account}" hidden>
		</tr>
		<tr>
		<!-- 密碼設成disabled結果集會變null值 -->
			<td>密碼</td>
			<td><input type="text" name="hashed_pwd" value="${member.getHashed_pwd()}" ></td>
		</tr>
		<tr>
			<td>鹽值</td>
			<td><input type="text" name="salt" value="${member.getSalt()}"></td>
		</tr>
		<tr>
			<td>姓</td>
			<td><input type="text" name="firstname" value="${member.getFirstname()}"></td>
		</tr>
		<tr>
			<td>名</td>
			<td><input type="text"  name="lastname" value="${member.getLastname()}"></td>
		</tr>
		<tr>
			<td>生日</td>
			<td><input type="date"  name="birthday" value="${member.getBirthday()}"></td>
		</tr>

		<tr>
			<td>e-mail</td>
			<td><input type="text"  name="email" value="${member.getEmail()}"></td>
		</tr>
		<tr>
			<td>地址</td>
			<td><input type="text"  name="m_address" value="${member.getM_address()}"></td>
		</tr>
		<tr>
			<td>聯絡電話</td>
			<td><input type="text"  name="phone" value="${member.getPhone()}"></td>
		</tr>
		<tr>
			<td>頭像</td>
			<td><input type="text"  name="mempic" value="${member.getMempic()}"></td>
		</tr>	
		</tbody>		
	</table>
	<div class="divInput">
			<input type="submit" name="update_confirm" class="btn btn-primary" value="修改">
	</div>
	</div>
	</form>
	</div>
	<div class="divInput">
			<a href="/HouseShip/member"><input type="submit" class="btn btn-secondary" value="取消"></a>
	</div>
	
	<script>
		document.getElementById("chkin").addEventListener("change",dateSet);
		document.getElementById("chkin").addEventListener("blur",dateSet);
		document.getElementById("chkout").addEventListener("focus",dateSet);
		function dateSet(){
			var inDateVal = document.getElementById("chkin").value;
  			var outDate = document.getElementById("chkout");
 			outDate.setAttribute("min", inDateVal);
		}
	</script>
</body>
</html>