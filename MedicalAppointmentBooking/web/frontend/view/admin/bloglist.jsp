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
            <jsp:include page="/frontend/common/adminSidebar.jsp" />
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
                        <div class="row align-content-center">

                            <div class="col-xl-6 col-md-6">
                                <div class="search-bar d-lg-block" style="padding-top :0">
                                    <div id="search" class="menu-search ">
                                        <form action="<c:url value='/manage-doctor?action=search'/>"role="search" method="post" id="searchform" class="searchform">
                                            <div>
                                                <input type="text" class="form-control border rounded-pill" name="search"
                                                       id="search" placeholder="Search blogs by name">
                                                <input type="submit" id="searchsubmit" value="Search">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6 col-md-3 mt-4 mt-md-0 text-md-end">
                                <a href="<c:url value='/manage-doctor?action=create'/>" class="btn btn-primary ">Add Blogs</a>
                            </div><!--end col-->
                        </div><!--end row-->


                        <div class="col-12 mt-4">
                            <div class="card component-wrapper border-0 rounded shadow">
                                <div class="p-4 border-bottom">
                                    <h5 class="mb-0">Blogs List</h5>
                                </div>

                                <div class="p-4">
                                    <div class="table-responsive bg-white shadow rounded">
                                        <table class="table mb-0 table-center">
                                            <section class="blog_area section-padding">
                                                <div class="container">
                                                    <div class="row">
                                                        <c:forEach var="o" items="${requestScope.data}">

                                                            <div class="col-lg-4 col-md-6 col-12 mb-4 pb-2" value="${o.blog_id}">
                                                                <div class="card blog blog-primary border-0 shadow rounded overflow-hidden">
                                                                    <div class="imagefit">
                                                                        <img src="data:image/jpg;base64,${o.image}" style="width:100%;height:100%;" class="img-fluid" alt="">
                                                                    </div>
                                                                    <div class="card-body p-4">
                                                                        <ul class="list-unstyled mb-2">
                                                                            <li class="list-inline-item text-muted small me-3">
                                                                                ${o.created_time}
                                                                            </li>
                                                                            <li class="list-inline-item text-muted small"><i
                                                                                    class="uil uil-clock text-dark h6 me-1"></i>5 min read</li>
                                                                        </ul>
                                                                        <a href="newdetail?id=${o.blog_id}" class="text-dark title h5">${o.title}</a>
                                                                        <div>
                                                                            <ul class="list-unstyled mb-0">
                                                                                <a href="newdetail?id=${o.blog_id}" class="text-dark title h6">${o.description}</a>
                                                                            </ul>
                                                                        </div>
                                                                        <div class="post-meta d-flex justify-content-between mt-3">                                               
                                                                            <a href="newdetail?id=${o.blog_id}" class="link">Read More <i
                                                                                    class="mdi mdi-chevron-right align-middle"></i></a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </section>
                                        </table>
                                    </div>
                                </div>

                                <div>
                                    <ul class="pagination mb-0 mt-5">
                                        <li class="page-item"><a class="page-link" href="javascript:void(0)"
                                                                 aria-label="Previous">Prev</a></li>
                                        <li class="page-item active"><a class="page-link" href="javascript:void(0)">1</a>
                                        </li>
                                        <li class="page-item"><a class="page-link" href="javascript:void(0)">2</a></li>
                                        <li class="page-item"><a class="page-link" href="javascript:void(0)">3</a></li>
                                        <li class="page-item"><a class="page-link" href="javascript:void(0)"
                                                                 aria-label="Next">Next</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div><!--end col-->

                    </div>
                </div><!--end container-->
            </main>
            <!--End page-content" -->
            <!-- Modal -->

        </div>
        <!-- page-wrapper -->
        <!-- javascript -->
        <script>
            console.log("helloworld");
            function filter() {
                const url = 'http://localhost:8080/MedicalAppointmentBooking/manage-doctor?action=filter&speciality_id=';
                const filterElement = document.getElementById("speFilter").value;
                window.location.href = url + filterElement;
            }
        </script>
        <script src="${pageContext.request.contextPath}/frontend/template/assets/js/bootstrap.bundle.min.js"></script>
        <!-- simplebar -->
        <script src="${pageContext.request.contextPath}/frontend/template/assets/js/simplebar.min.js"></script>
        <!-- Icons -->
        <script src="${pageContext.request.contextPath}/frontend/template/assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="${pageContext.request.contextPath}/frontend/template/assets/js/app.js"></script>


    </body>
</html>
