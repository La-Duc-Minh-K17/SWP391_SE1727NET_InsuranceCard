<%-- 
Document   : listpatient
Created on : Oct 18, 2023, 6:10:40 PM
Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Patient</title>

        <!-- favicon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/frontend/template/assets/images/favicon.ico.png">
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
                                <img src="frontend/template/assets/images/logo-icon.png" height="30" class="small" alt="">
                                <span class="big">
                                    <img src="frontend/template/assets/images/MABS__1.png" height="24" class="logo-light-mode" alt="">
                                    <img src="frontend/template/assets/images/MABS__1.png" height="24" class="logo-dark-mode" alt="">
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
                                            src="../../assets/images/doctors/01.jpg"
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
                                <div class="search-bar d-lg-block " style="padding-top :0">
                                    <div id="search" class="menu-search  ">
                                        <form action="<c:url value='/manage-patient?action=search'/>"role="search" method="post" id="searchform" class="searchform  ">
                                            <div>
                                                <input type="text" class="form-control border rounded-pill bg-light " name="search"
                                                       id="search" placeholder="Search patient by name">
                                                <input type="submit" id="searchsubmit" value="Search">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            
                        </div><!--end row-->


                        <div class="col-12 mt-5">
                            <div class="card component-wrapper border-0 rounded shadow ">
                                <div class="p-4 border-bottom">
                                    <h4 class="mb-0 text-primary">Patient List</h4>
                                </div>

                                <div class="p-4">
                                    <div class="table-responsive bg-white shadow rounded">
                                        <table class="table mb-0 table-center">
                                            <thead>
                                                <tr>
                                                    <th class="border-bottom p-3">PatientID</th>
                                                    <th class="border-bottom p-3">Name</th>
                                                    <th class="border-bottom p-3">DOB</th>
                                                    <th class="border-bottom p-3">Gender</th>
                                                    <th class="border-bottom p-3">Status</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${pList}" var="p">
                                                    <tr>
                                                        <th scope="col">${p.patientId}</th>
                                                        <td class="p-3">${p.fullName}</td>
                                                        <td class="p-3">${p.dob}</td>
                                                        <td> 
                                                            <c:if test="${p.gender == 1}">
                                                                <span class="text-primary">Male</span>
                                                            </c:if>
                                                            <c:if test="${p.gender == 0}">
                                                                <span class="text-secondary">Female</span>
                                                            </c:if>
                                                        </td>
                                                        <td>
                                                            <c:if test="${p.status == 1}">
                                                                <span class="text-success">Active</span>
                                                            </c:if>
                                                            <c:if test="${p.status == 0}">
                                                                <span class="text-danger">InActive</span>
                                                            </c:if>
                                                        </td>
                                                        <td class="p-3">
                                                            <style>
                                                                .custom-btn {
                                                                    width: 100px; 
                                                                }
                                                            </style>
                                                        <td class="text-center">
                                                            <div class="container d-flex justify-content-center">
                                                                <div class="card component-wrapper border-0 rounded">
                                                                    <div class="d-flex mb-2">
                                                                        <a href="<c:url value='/manage-patient?action=view&patientId=${p.patientId}'/>" class="btn btn-primary custom-btn btn-sm m-2">View</a>
                                                                        <a href="<c:url value='/manage-patient?action=edit&patientId=${p.patientId}'/>" class="btn btn-primary custom-btn btn-sm m-2">Edit</a>
                                                                        
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>



                                                    </tr>
                                                </c:forEach>
                                            </tbody>
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
            function filter() {
                const url = 'http://localhost:8080/MedicalAppointmentBooking/manage-service?action=filter&category_id=';
                const filterElement = document.getElementById("Filter").value;
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
