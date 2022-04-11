<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增房屋</title>

<!-- 複製樣式 -->
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
	textarea{
            resize: none;
    }
</style>
</head>
<body>

<!-- 	從這邊開始改 -->
	<div class="div1">
	<h2 class="head2">新增房屋</h2>
	
	<form action="CreateHouseInfo" method="post">
	
	<div class="divForm">
	<!-- <input class="form-control" type="text"> -->
	<table class="table table-striped">
		<thead>
		<tr>
			<th>欄位名稱</th>
			<th>新增資料</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td><label for="title">
				房屋名稱:
			</label></td>
			<td><input type="text" id="title" name="h_title" size="30"></td>
		</tr>
		<tr>	
			<td><label for="price">
				房屋費用:
			</label></td>
			<td><input type="number" id="price" name="h_price" size="30" value="0"></td>
		</tr>
		<tr>	
			<td><label for="address">
				房屋地址:
			</label></td>
			<td><input type="text" id="address" name="h_address" size="100"></td>
		</tr>
		<tr>
			<td><label for="type">
				房屋房型:
			</label></td>
			<td><label for="single">
				<input type="radio" id="single" name="h_type" value="1" checked>單人房
			</label></td>
		</tr>
		<tr>
			<td></td>
			<td><label for="double">
				<input type="radio" id="double" name="h_type" value="2">雙人房
			</label></td>
		</tr>
		<tr>
			<td></td>
			<td><label for="quadruple">
				<input type="radio" id="quadruple" name="h_type" value="4">四人房
			</label></td>
		</tr>
		<tr>	
			<td><label for="about">
				房屋介紹:
			</label></td>
			<td><textarea id="about" name="h_about" cols="30" rows="10"></textarea></td>
		</tr>
		
		</tbody>		
	</table>
	<div class="divInput">
			<input type="submit" class="btn btn-primary" value="新增房屋">
	</div>
	</div>
	</form>
	</div>
	<div class="divInput">
			<a href="HouseInfo"><input type="submit" class="btn btn-secondary" value="取消"></a>
	</div>
	
</body>
</html>