<%-- 
    Document   : managedoctor
    Created on : Sep 28, 2023, 10:44:49 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!-- favicon -->
        <link rel="shortcut icon" href="/assets/images/favicon.ico.png">
        <!-- Bootstrap -->
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- simplebar -->
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/simplebar.css" rel="stylesheet" type="text/css" />
        <!-- Select2 -->
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/select2.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css" rel="stylesheet">

        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
    </head>
    <body>
        <div id="preloader">
            <div id="status">
                <div class="spinner">
                    <div class="double-bounce1"></div>
                    <div class="double-bounce2"></div>
                </div>
            </div>
        </div>
        <!-- Loader -->
        <div class="page-wrapper doctris-theme toggled">

            <jsp:include page="/frontend/common/manager_side_bar.jsp" />

            <!-- sidebar-wrapper  -->
            <!-- Start Page Content -->
            <main class="page-content">  
                <div class="top-header">
                    <div class="header-bar d-flex justify-content-between border-bottom">
                        <div class="d-flex align-items-center">
                            <a href="#" class="logo-icon">
                                <img src="../assets/images/logo-icon.png" height="30" class="small" alt="">
                                <span class="big">
                                    <img src="../assets/images/logo-dark.png" height="24" class="logo-light-mode" alt="">
                                    <img src="../assets/images/logo-light.png" height="24" class="logo-dark-mode" alt="">
                                </span>
                            </a>
                            <a id="close-sidebar" class="btn btn-icon btn-pills btn-soft-primary ms-2" href="#">
                                <i class="uil uil-bars"></i>
                            </a>
                        </div>
                        <ul class="list-unstyled mb-0">
                            <li class="list-inline-item mb-0 ms-1">
                                <div class="dropdown dropdown-primary">
                                    <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0"
                                            data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img
                                            src="../assets/images/doctors/01.jpg"
                                            class="avatar avatar-ex-small rounded-circle" alt=""></button>
                                    <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3"
                                         style="min-width: 200px;">
                                        <a class="dropdown-item d-flex align-items-center text-dark"
                                           <img src="../assets/images/doctors/01.jpg"
                                           class="avatar avatar-md-sm rounded-circle border shadow" alt="">
                                            <div class="flex-1 ms-2">
                                                <span class="d-block mb-1">Calvin Carlo</span>
                                                <small class="text-muted">Orthopedic</small>
                                            </div>
                                        </a>
                                        <a class="dropdown-item text-dark" href="dr-profile.html"><span
                                                class="mb-0 d-inline-block me-1"><i
                                                    class="uil uil-setting align-middle h6"></i></span> Profile Settings</a>
                                        <div class="dropdown-divider border-top"></div>
                                        <a class="dropdown-item text-dark" href="lock-screen.html"><span
                                                class="mb-0 d-inline-block me-1"><i
                                                    class="uil uil-sign-out-alt align-middle h6"></i></span> Logout</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="col-12 mt-4">
                            <div class="card component-wrapper border-0 rounded shadow">
                                <div class="p-4 border-bottom">
                                    <h5 class="mb-0"> Update Account  </h5>
                                </div>
                                <form style="padding: 20px;" action="AccountDetail" method="post" id="searchform" class="searchform">
                                    <div class="row align-content-center justify-content-center">
                                        <div class="col-xl-6 col-md-6 p-1">
                                            <label>Id:</label>
                                            <input class="form-control" type="text" readonly="" name="id" value="${acc.userId}" id="id" >
                                        </div>
                                        <div class="col-xl-6 col-md-6 p-1">
                                            <label>Email:</label>
                                            <input class="form-control" type="email" readonly name="email" value="${acc.email}" id="email" >
                                        </div>
                                        <div class="col-xl-6 col-md-6 p-1">
                                            <label>Username:</label>
                                            <input class="form-control" type="text" readonly name="username" value="${acc.username}" id="username" >
                                        </div>
                                        <div class="col-xl-6 col-md-6 p-1">
                                            <label>Full name:</label>
                                            <input class="form-control" type="text" name="fullname" value="${acc.fullName}" id="fullname" >
                                        </div>
                                        <div class="col-xl-6 col-md-6 p-1">
                                            <label>Role:</label>
                                            <select class="form-select form-control" id="speFilter" name="role">
                                                <c:forEach var="r" items="${rl}">
                                                    <option value="${r.role_id}" ${acc.role.role_id == r.role_id?"selected":"" } >${r.role_name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-xl-6 col-md-6 p-1">
                                            <label>Phone:</label>
                                            <input class="form-control" type="text" name="phone" value="${acc.phone}" id="phone" >
                                        </div>
                                        <div class="col-xl-6 col-md-6 p-1">
                                            <label>Dob: </label>
                                            <input class="form-control" type="date" name="dob" value="${acc.dob}" id="dob" >
                                        </div>
                                        <div class="col-xl-6 col-md-6 p-1">
                                            <label>Gender:</label>
                                            <p></p>
                                            <input type="radio" name="gender"  ${acc.status == 1 ?"checked":""} value="1" id="gender" checked="" > Male
                                            <input type="radio" name="gender"  ${acc.status == 0 ?"checked":""} value="0" id="gender"  > Female
                                        </div>
                                        <div class="col-xl-6 col-md-6 p-1">
                                            <label>Status:</label>
                                            <p></p>
                                            <input type="radio" name="status" ${acc.status == 1 ?"checked":""} value="1" id="gender"  > Active
                                            <input type="radio" name="status"  ${acc.status == 0 ?"checked":""} value="0" id="gender"  > Inactive
                                        </div>
                                        <div class="col-xl-12 col-md-12">
                                            <p style="color: red">${error}</p>
                                            <p style="color: greenyellow">${success}</p>
                                        </div>
                                        <div class="col-xl-12 col-md-12">
                                            <button class="btn btn-primary" type="submit" >Update</button>
                                        </div>
                                    </div><!--end row-->
                                </form>

                            </div>
                        </div><!--end col-->

                    </div>
                </div><!--end container-->
            </main>
            <!--End page-content" -->
            <!-- Modal -->

        </div>

        <script src="${pageContext.request.contextPath}/frontend/template/assets/js/bootstrap.bundle.min.js"></script>
        <!-- simplebar -->
        <script src="${pageContext.request.contextPath}/frontend/template/assets/js/simplebar.min.js"></script>
        <!-- Icons -->
        <script src="${pageContext.request.contextPath}/frontend/template/assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="${pageContext.request.contextPath}/frontend/template/assets/js/app.js"></script>


    </body>
</html>
