<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="tw.grp4.member.model.*"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
	<!-- 網址列上已經有tttp..../updatemember.controller ,只需要補最後面的會員帳號 -->
	<!-- 用form:form表單跟Member bean綁定,進而取得目標帳號的bean物件? -->
	<form:form action="${member.account}" method="post" modelAttribute="member">
	
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
			<td><form:label path="account">會員:</form:label></td>
			<td><form:input id="account" size="30" path="account" /></td>
<!--<td>帳號</td>-->
<!--<td><input type="text" name="account" value="${account}" disabled></td>-->
<!-- 上面沒法傳輸資料到controller,用下面的hidden代替,上面負責顯示 -->
<!--<input type="text" name="account" value="${account}" hidden> -->
		</tr>
		<tr>
			<td><form:label path="hashed_pwd">密碼:</form:label></td>
			<td><form:input id="hashed_pwd" size="30" path="hashed_pwd"/></td>
<!-- 密碼設成disabled結果集會變null值 -->
<!--	<td>密碼</td> -->
<!--	<td><input type="text" name="hashed_pwd" value="${member.getHashed_pwd()}" ></td> -->
		</tr>
		<tr>
			<td><form:label path="salt">密碼:</form:label></td>
			<td><form:input id="salt" size="30" path="salt"/></td>
<!--<td>鹽值</td>-->
<!--<td><input type="text" name="salt" value="${member.getSalt()}"></td>-->
		</tr>
		<tr>
			<td><form:label path="firstname">姓:</form:label></td>
			<td><form:input id="firstname" size="30" path="firstname"/></td>
<!--<td>姓</td>-->
<!--<td><input type="text" name="firstname" value="${member.getFirstname()}"></td>-->
		</tr>
		<tr>
			<td><form:label path="lastname">名:</form:label></td>
			<td><form:input id="lastname" size="30" path="lastname"/></td>
<!--<td>名</td>-->
<!--<td><input type="text"  name="lastname" value="${member.getLastname()}"></td>-->
		</tr>
		<tr>
			<td><form:label path="birthday">生日:</form:label></td>
			<td><form:input type="date" id="birthday" size="30" path="birthday"/></td>
<!--<td>生日</td>-->
<!--<td><input type="date"  name="birthday" value="${member.getBirthday()}"></td>-->
		</tr>

		<tr>
			<td><form:label path="email">e-mail</form:label></td>
			<td><form:input id="email" size="30" path="email"/></td>
<!--<td>e-mail</td>-->
<!--<td><input type="text"  name="email" value="${member.getEmail()}"></td>-->
		</tr>
		<tr>
			<td><form:label path="m_address">地址:</form:label></td>
			<td><form:input id="address" size="30" path="m_address"/></td>
<!--<td>地址</td>-->
<!--<td><input type="text"  name="m_address" value="${member.getM_address()}"></td>-->
		</tr>
		<tr>
			<td><form:label path="phone">聯絡電話:</form:label></td>
			<td><form:input id="phone" size="30" path="phone"/></td>
<!--<td>聯絡電話</td>-->
<!--<td><input type="text"  name="phone" value="${member.getPhone()}"></td>-->
		</tr>
		<tr>
			<td><form:label path="mempic">頭像:</form:label></td>
			<td><form:input id="mempic" size="30" path="mempic"/></td>
<!--<td>頭像</td>-->
<!--<td><input type="text"  name="mempic" value="${member.getMempic()}"></td>-->
		</tr>	
		</tbody>		
	</table>
	<div class="divInput">
			<input type="submit" name="update_confirm" class="btn btn-primary" value="修改">
	</div>
	</div>
	</form:form>
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