<!--
<%@page import="util.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.forum.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
-->


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 改Title -->
<title>View Forum</title>

<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="/CSS/styles.css" rel="stylesheet" />
<script src="https://kit.fontawesome.com/6a69f60fc3.js"
	crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">

	<!-- 不動 -->
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-new">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3 home" href="index_project.html">Project</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group">
				<!-- <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button> -->
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<!-- <li><a class="dropdown-item" href="#!">Settings</a></li> -->
					<!-- <li><a class="dropdown-item" href="#!">Activity Log</a></li> -->
					<!-- <li><hr class="dropdown-divider" /></li> -->
					<li><a class="dropdown-item" id="logout" href="#!">Logout</a></li>
				</ul></li>
		</ul>
	</nav>


	<div id="layoutSidenav">

		<!-- 不動 -->
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<a class="nav-link home" href="#">
							<div class="sb-nav-link-icon">
								<i class="fa-brands fa-squarespace"></i>
							</div> 首頁
						</a>
						<div class="sb-sidenav-menu-heading">後台管理系統</div>
						<a class="nav-link member" href="#">
							<div class="sb-nav-link-icon">
								<i class="fa-solid fa-user-gear"></i>
							</div> 會員管理
						</a> <a class="nav-link house" href="#">
							<div class="sb-nav-link-icon">
								<i class="fa-solid fa-house"></i>
							</div> 房源管理
						</a> <a class="nav-link order" href="#">
							<div class="sb-nav-link-icon">
								<i class="fas fa-shopping-cart"></i>
							</div> 訂單管理
						</a> <a class="nav-link coupon" href="#">
							<div class="sb-nav-link-icon">
								<i class="fa-solid fa-coins"></i>
							</div> 優惠券
						</a> <a class="nav-link forum" href="#">
							<div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> 討論版管理
						</a>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Logged in as: ${member.lastname}</div>
					Project Manager
				</div>
			</nav>
		</div>


		<div id="layoutSidenav_content">
			<main>
				<!-- 從這邊開始改 -->
				<div class="container-fluid px-4">
					<h1 class="mt-4">顯示討論</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">Forum Management</li>
					</ol>

					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 查詢
						</div>
						<div class="card-body">
							<!--表單內容可以從這開始 -->
							<div>
								<a href="JSP/forum/ForumForm.jsp"
									style="margin-left: 1px; display: inline"><input
									class="btn-primary" type="button" value="新增"></a>
								<!-- 								<form style="display:inline" action="order_deleteAll.jsp" method="post"> -->
								<!-- 									<input style="margin-left:10px;display:inline" -->
								<!-- 										class="btn-warning" type="submit" value="批次刪除">  -->
								
								<table id="datatablesSimple">
									<thead>
										<tr>
											<th>編號</th>

											<th>帳號</th>
											<th>時間</th>
											<th>主題</th>
											<th>標題</th>

											<th>內容</th>
											<th colspan="2">功能</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${forumList}" var="forum">
											<tr>
												<td>${forum.getFid()}</td>
												<td>${forum.getAccount()}</td>
												<td>${forum.getPostTime()}</td>
												<td>${forum.getTheme()}</td>
												<td>${forum.getTitle()}</td>
												<td>${forum.getContent()}</td>
												<td class="text-center"><a href="UpdateServlet?fid=${forum.getFid()}"><input
														type="button" class="btn btn-primary" value="編輯"></a></td>
												<td class="text-center"><a href="DeleteServlet?fid=${forum.getFid()}"><input
														type="button" class="btn btn-danger" value="刪除"></a></td>
											</tr>
											</c:forEach>
																					
									</tbody>
								</table>
								
								
								</form>
							</div>
						</div>
					</div>
				</div>
			</main>

			<!-- 不動 -->
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Group4 Project
							Website 2022</div>
					</div>
				</div>
			</footer>
		</div>
	</div>


	<!-- 不動/新增js在前面 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="/JS/scripts.js"></script>
	<script src="/JS/datatables-simple-demo.js"></script>


</body>
</html>