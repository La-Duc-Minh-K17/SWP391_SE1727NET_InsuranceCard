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
        <div class="page-wrapper doctris-theme toggled">
            <jsp:include page="/frontend/common/doctor_side_bar.jsp" />
            <main class="page-content">  
                <div class="top-header">
                    <div class="header-bar d-flex justify-content-between border-bottom">
                        <div class="d-flex align-items-center">
                            <a href="#" class="logo-icon">
                                <img src="frontend/template/assets/images/logo-icon.png" height="30" class="small" alt="">
                                <span class="">
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
                                            src="/assets/images/doctors/01.jpg"
                                            class="avatar avatar-ex-small rounded-circle" alt=""></button>
                                    <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3"
                                         style="min-width: 200px;">
                                        <a class="dropdown-item d-flex align-items-center text-dark"
                                           <img src="../assets/images/doctors/01.jpg"
                                           class="avatar avatar-md-sm rounded-circle border shadow" alt="">
                                            <div class="flex-1 ms-2">
                                                <span class="d-block mb-1">${sessionScope.user.fullName}</span>
                                                <small class="text-muted"></small>
                                            </div>
                                        </a>

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
                            <div class="col-xl-3 col-md-3">
                                <div class="card component-wrapper border-0 rounded shadow">
                                    <div>
                                        <select class="form-select form-control" id="status_filter" onchange="filter()">
                                            <option selected disabled>Status</option>
                                            <option value="all">All</option>
                                            <option value="CONFIRMED">CONFIRMED</option>
                                            <option value="PENDING">PENDING</option>
                                            <option value="RESCHEDULED">RESCHEDULED</option>
                                            <option value="COMPLETED">COMPLETED</option>
                                            <option value="CANCELED">CANCELED</option>
                                            <option value="FOLLOW_UP">FOLLOW-UP</option>    
                                        </select>
                                    </div>
                                </div>

                            </div>
                            <div class="col-xl-6 col-md-6">
                                <div class="search-bar d-lg-block" style="padding-top :0">
                                    <div id="search" class="menu-search ">
                                        <form action="<c:url value='/admin-appointment?action=search'/>" role="search" method="post"
                                              id="searchform" class="searchform">
                                            <div>
                                                <input type="text" class="form-control border rounded-pill" name="search" id="search" placeholder="Search patient name">
                                                <input type="submit" id="searchsubmit" value="Search">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="col-12 mt-4">
                            <div class="card component-wrapper border-0 rounded shadow">
                                <div class="p-4 border-bottom">
                                    <h5 class="mb-0">Appointment List</h5>
                                </div>
                                <div class="p-4">
                                    <div class="row pt-2">
                                        <div class="col-12 ">
                                            <div class="card component-wrapper border-0 rounded shadow">
                                                <div> <div class="table-responsive bg-white shadow rounded">
                                                        <table class="table mb-0 table-center">
                                                            <thead>
                                                                <tr>
                                                                    <th class="border-bottom p-3" style="min-width: 180px;">Name</th>
                                                                    <th class="border-bottom p-3" style="min-width: 150px;">Date</th>
                                                                    <th class="border-bottom p-3">Time</th>
                                                                    <th class="border-bottom p-3">Status</th>
                                                                    <th class="border-bottom p-3" style="min-width: 150px;">Action</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach items="${apptList}" var="appt">
                                                                    <c:set var="patient" value="${appt.patient}"></c:set>
                                                                        <tr>
                                                                            <td class="p-3">
                                                                                <a href="#" class="text-dark">
                                                                                    <div class="d-flex align-items-center">
                                                                                    <c:if test="${patient.image != 'default'}"> 
                                                                                        <img src="data:image/jpg;base64,${patient.image}" class="avatar avatar-md-sm rounded-circle shadow" alt="">
                                                                                    </c:if>
                                                                                    <c:if test="${patient.image == 'default'}"> 
                                                                                        <img src="frontend/template/assets/images/patient.jpg" class="avatar avatar-md-sm rounded-circle shadow" alt="">
                                                                                    </c:if>
                                                                                    <span class="ms-2">${patient.fullName}</span>
                                                                                </div>
                                                                            </a>
                                                                        </td>
                                                                        <td class="p-3">${appt.apptDate}</td>
                                                                        <td class="p-3">${appt.apptTime}</td>

                                                                        <td class="p-3">${appt.status}</td>
                                                                        <td class="p-3">
                                                                            <div class="d-flex align-items-center">
                                                                                <a href="doctor-appointmentdetail?action=view-detail&apptId=${appt.apptId}" class="me-3 btn btn-primary btn-sml btn-soft-success">
                                                                                    Details</a>

                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>

                                                <c:set var="page" value="${page}"/>
                                                <div class="row text-center">
                                                    <div class="col-12 mt-4">
                                                        <div class="d-md-flex align-items-center text-center justify-content-between">
                                                            <ul class="pagination justify-content-center mb-0 mt-3 mt-sm-0">
                                                                <c:forEach begin="${1}" end="${num}" var="i">
                                                                    <li class="page-item ${i==page?"active":""}"><a class="page-link" href="${url}&page=${i}">${i}</a></li>
                                                                    </c:forEach>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div><!--end col-->
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div><!--end container-->
                </div>
            </main>
        </div>
        <!-- page-wrapper -->
        <!-- javascript -->

        <script>


            function filter() {
                const url = 'http://localhost:8080/MedicalAppointmentBooking/admin-appointment?action=filter&status_filter=';
                const filterElement = document.getElementById("status_filter").value;
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