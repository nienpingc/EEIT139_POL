<%@page import="model.order.OrderInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
<style type="text/css">
	.er{
		width:600px;
		margin: 30px auto;
	}
</style>
</head>
<body>
<div class="er">
	<% String msg = (String)session.getAttribute("errMsg");%>
	<span style="color : red">Error Message: <%=msg %></span><br>
	
	<% if (session.getAttribute("newOrder")!= null){ %>
		<%@ include file="order_new.jsp" %>
		
	<% request.getSession().removeAttribute("newOrder");
	}else if (session.getAttribute("updateOrder")!= null){ 
		int orderId = (Integer)session.getAttribute("updateOrderId");
		%>
		<form action="updateOrder" method="get">
			<input type="hidden" name="orderId" value="<%=orderId %>">
		<input type="submit" value="重試一次">
		</form>

	<% request.getSession().removeAttribute("updateOrder");
	} 
	request.getSession().removeAttribute("errMsg");%>
		
		
	
	
</div>    
</body>
</html>