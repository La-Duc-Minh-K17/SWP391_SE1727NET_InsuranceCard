<%-- 
    Document   : footer
    Created on : Sep 21, 2023, 9:49:48 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8" />
        <title>MABS - Medical Appointment Booking System</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- favicon -->
        <link rel="shortcut icon" href="frontend/assets/images/favicon.ico.png">
        <!-- Bootstrap -->
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- SLIDER -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/frontend/template/assets/css/tiny-slider.css"/>
        <!-- Select2 -->
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/select2.min.css" rel="stylesheet" />
        <!-- Date picker -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/frontend/template/assets/css/flatpickr.min.css">
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/jquery.timepicker.min.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/remixicon.css"  type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/frontend/template/assets/css/style.min.css" type="text/css">
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/otherStyle.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <!-- Navbar STart -->
        <!-- Loader -->
        <div id="preloader">
            <div id="status">
                <div class="spinner">
                    <div class="double-bounce1"></div>
                    <div class="double-bounce2"></div>
                </div>
            </div>
        </div>
        <!-- Loader -->

        <!-- Navbar STart -->
        <header id="topnav" class="navigation sticky">
            <div class="container">

                <div>
                    <a class="logo" href="home">
                        <img src="assets/images/logo-light.png" height="24" class="l-light" alt="">
                        <img src="assets/images/logo-dark.png" class="l-dark" height="24" alt="">
                    </a>
                </div>

                <div class="menu-extras">
                    <div class="menu-item">
                        <a class="navbar-toggle" id="isToggle" onclick="toggleMenu()">
                            <div class="lines">
                                <span></span>
                                <span></span>
                                <span></span>
                            </div>
                        </a>
                    </div>
                </div>

                <ul class="dropdowns list-inline mb-0">

                    <li class="list-inline-item mb-0 ms-1">
                        <a href="javascript:void(0)" class="btn btn-icon btn-pills btn-primary" data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop" aria-controls="offcanvasTop">
                            <i class="uil uil-search"></i>
                        </a>
                    </li>

                    <li class="list-inline-item mb-0 ms-1">
                        <div class="dropdown dropdown-primary">
                            <c:if test="${sessionScope.user != null}">
                                <c:if test="${sessionScope.user.img != 'default'}">
                                    <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="data:image/png;base64,${sessionScope.user.img}" class="avatar avatar-ex-small rounded-circle" alt=""></button> 
                                    </c:if>
                                    <c:if test="${sessionScope.user.img == 'default'}">
                                    <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="assets/images/avata.png" class="avatar avatar-ex-small rounded-circle" alt=""></button>
                                    </c:if>
                                </c:if>

                            <c:if test="${sessionScope.user == null}">
                                <button class="btn btn-primary p-1" onclick="window.location.href = 'user?action=login'">Login</button>
                            </c:if>
                            <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px;">
                                <c:if test="${sessionScope.user.username != null}">
                                    <a class="dropdown-item d-flex align-items-center text-" href="#">
                                        <c:if test="${sessionScope.user.img != 'default'}">
                                            <img src="data:image/png;base64,${sessionScope.user.img}" class="avatar avatar-md-sm rounded-circle border shadow" alt="">
                                        </c:if>
                                        <c:if test="${sessionScope.user.img == 'default'}">
                                            <img src="assets/images/avata.png" class="avatar avatar-md-sm rounded-circle border shadow" alt="">
                                        </c:if>
                                        <div class="flex-1 ms-2">
                                            <span class="d-block mb-1">${sessionScope.user.username}</span>
                                        </div>                     
                                    </a>
                                </c:if>
                                <div class="dropdown-divider border-top"></div>
                                <c:if test="${sessionScope.user != null}">
                                    <a class="dropdown-item text-" href="user?action=profile"><span class="mb-0 d-inline-block me-1"><i class="uil uil-sign-out-alt align-middle h6"></i></span> Tài khoản của tôi</a>
                                        </c:if>
                                        <c:if test="${sessionScope.user != null}">
                                    <a class="dropdown-item text-" href="user?action=logout"><span class="mb-0 d-inline-block me-1"><i class="uil uil-sign-out-alt align-middle h6"></i></span> Đăng xuất</a>
                                        </c:if>
                                        <c:if test="${sessionScope.user == null}">
                                    <a class="dropdown-item text-" href="user?action=login"><span class="mb-0 d-inline-block me-1"><i class="uil uil-sign-out-alt align-middle h6"></i></span> Đăng Nhập</a>
                                        </c:if>
                            </div>
                        </div>
                    </li>

                </ul>

                    <div id="navigation">

                        <ul class="navigation-menu nav-left nav-light">
                            <li><a href="home" class="sub-menu-item">Home</a></li>
                            <li><a href="#" class="sub-menu-item">Doctors</a></li>
                            <li><a href="#" class="sub-menu-item">Services</a></li>
                            <li><a href="#" class="sub-menu-item">Contact us</a></li>
                            <li><a href="#" class="sub-menu-item">News and Blogs</a></li>
                        </ul>

                    </div>
            </div>
        </header>
        
         <div class="offcanvas bg-white offcanvas-top" tabindex="-1" id="offcanvasTop">
            <div class="offcanvas-body d-flex align-items-center align-items-center">
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <div class="text-center">
                                <h4>Search now.....</h4>
                                <div class="subcribe-form mt-4">
                                    <form>
                                        <div class="mb-0">
                                            <input type="text" id="help" name="name" class="border bg-white rounded-pill" required="" placeholder="Search">
                                            <button type="submit" class="btn btn-pills btn-primary">Search</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div><!--end col-->
                    </div><!--end row-->
                </div><!--end container-->
            </div>
        </div>
    </body>
    <script src= "<c:url value= '/frontend/template/assets/js/bootstrap.bundle.min.js'/>"></script>
    <!-- Icons -->
    <script src= "<c:url value= '/frontend/template/assets/js/feather.min.js'/>"></script>
    <!-- Main Js -->

    <script src= "<c:url value= '/frontend/template/assets/js/app.js'/>"></script>
</html>
