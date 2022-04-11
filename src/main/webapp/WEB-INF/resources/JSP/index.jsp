<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Project首頁</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="CSS/styles.css" rel="stylesheet" />
        <script src="https://kit.fontawesome.com/6a69f60fc3.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-new">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3 home" href="index">Project</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <!-- <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button> -->
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <!-- <li><a class="dropdown-item" href="#!">Settings</a></li> -->
                        <!-- <li><a class="dropdown-item" href="#!">Activity Log</a></li> -->
                        <!-- <li><hr class="dropdown-divider" /></li> -->
                        <li><a class="dropdown-item" id="logout" href="logout.controller">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <a class="nav-link home" href="#">
                                <div class="sb-nav-link-icon"><i class="fa-brands fa-squarespace"></i></div>
                                首頁
                            </a>
                            <div class="sb-sidenav-menu-heading">後台管理系統</div>
                            <a class="nav-link member" href="#">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-user-gear"></i></div>
                                會員管理
                            </a>
                            <a class="nav-link house" href="#">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-house"></i></div>
                                房源管理
                            </a>
                            <a class="nav-link order" href="#">
                                <div class="sb-nav-link-icon"><i class="fas fa-shopping-cart"></i></div>
                                訂單管理
                            </a>
                            <a class="nav-link coupon" href="#" >
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-coins"></i></div>
                                優惠券管理
                            </a>                            
                            <a class="nav-link forum" href="#">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                討論版管理
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
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">網站後台管理</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Website Management</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-primary shadow h-100 py-2">
                                    <div class="card-body ">
                                        <div class="row1 no-gutters align-items-center">
                                            <div class="col ">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-2">
                                                    會員數 </div>
                                                <div class="mb-0 font-weight-bold text-gray-800">
                                                    <span class="h3">${sessionScope.indexCount["memberCount"]}</span>
                                                    <span class="text-xs">人</span>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fa-solid fa-user-gear opacity-75 text-gray-300 h2"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-dark stretched-link member" href="#">View</a>
                                        <div class="small text-dark"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-warning shadow h-100 py-2">
                                    <div class="card-body ">
                                        <div class="row1 no-gutters align-items-center">
                                            <div class="col ">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-2">
                                                    房源 </div>
                                                <div class="mb-0 font-weight-bold text-gray-800">
                                                    <span class="h3">${indexCount["houseCount"]}</span>
                                                    <span class="text-xs">間</span>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fa-solid fa-house opacity-75 text-gray-300 h2"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-dark stretched-link house" href="#">View</a>
                                        <div class="small text-dark"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-danger shadow h-100 py-2">
                                    <div class="card-body ">
                                        <div class="row1 no-gutters align-items-center">
                                            <div class="col ">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-2">
                                                    訂單 </div>
                                                <div class="mb-0 font-weight-bold text-gray-800">
                                                    <span class="h3">${indexCount["orderCount"]}</span>
                                                    <span class="text-xs">筆</span>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-shopping-cart opacity-75 text-gray-300 h2"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-dark stretched-link order" href="#">View</a>
                                        <div class="small text-dark"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-secondary shadow h-100 py-2">
                                    <div class="card-body ">
                                        <div class="row1 no-gutters align-items-center">
                                            <div class="col ">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-2">
                                                    優惠券 </div>
                                                <div class="mb-0 font-weight-bold text-gray-800">
                                                    <span class="h3">${indexCount["couponCount"]}</span>
                                                    <span class="text-xs">張</span>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fa-solid fa-coins opacity-75 text-gray-300 h2"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-dark stretched-link coupon" href="#">View</a>
                                        <div class="small text-dark"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-info shadow h-100 py-2">
                                    <div class="card-body ">
                                        <div class="row1 no-gutters align-items-center">
                                            <div class="col ">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-2">
                                                    討論版文章 </div>
                                                <div class="mb-0 font-weight-bold text-gray-800">
                                                    <span class="h3">${indexCount["forumCount"]}</span>
                                                    <span class="text-xs">篇</span>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-book-open opacity-75 text-gray-300 h2"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-dark stretched-link forum" href="#">View</a>
                                        <div class="small text-dark"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    	
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Group4 Project Website 2022</div>
                            <!-- <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div> -->
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="JS/scripts.js"></script>
        <script src="JS/datatables-simple-demo.js"></script>
    </body>
</html>
dy>
</html>