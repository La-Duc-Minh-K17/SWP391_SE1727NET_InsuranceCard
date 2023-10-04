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
        <title>Doctris - Doctor Appointment Booking System</title>
        <link rel="shortcut icon" href="/assets/images/favicon.ico.png">
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/simplebar.css" rel="stylesheet" type="text/css" />
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
                        <div class="d-md-flex justify-content-between">
                            <h5 class="mb-0">Doctor Profile</h5>
                        </div>
                        <c:set var="doctor" value="${doctor}"></c:set>
                            <div class="card bg-white rounded shadow overflow-hidden mt-4 border-0">
                                <div class="p-5 bg-primary bg-gradient"></div>
                                <div class="avatar-profile d-flex margin-nagative mt-n5 position-relative ps-3">
                                    <img src="data:image/jpg;base64,${doctor.image}"
                                         class="rounded-circle shadow-md avatar avatar-medium" alt="">
                                    <div class="mt-4 ms-3 pt-3">
                                        <h5 class="mt-3 mb-1">Dr. ${doctor.fullName}</h5>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-12 mt-4">
                                        <div class="card border-0 rounded-0 p-4">
                                            <ul class="nav nav-pills nav-justified flex-column flex-sm-row rounded shadow overflow-hidden bg-light"
                                                id="pills-tab" role="tablist">
                                                <li class="nav-item">
                                                    <a class="nav-link rounded-0 active" id="overview-tab" data-bs-toggle="pill"
                                                       href="#pills-overview" role="tab" aria-controls="pills-overview"
                                                       aria-selected="false">
                                                        <div class="text-center pt-1 pb-1">
                                                            <h4 class="title fw-normal mb-0">Overview</h4>
                                                        </div>
                                                    </a><!--end nav link-->
                                                </li><!--end nav item-->

                                                <li class="nav-item">
                                                    <a class="nav-link rounded-0" id="timetable-tab" data-bs-toggle="pill"
                                                       href="#pills-timetable" role="tab" aria-controls="pills-timetable"
                                                       aria-selected="false">
                                                        <div class="text-center pt-1 pb-1">
                                                            <h4 class="title fw-normal mb-0">Appointments</h4>
                                                        </div>
                                                    </a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link rounded-0" id="review-tab" data-bs-toggle="pill"
                                                       href="#pills-review" role="tab" aria-controls="pills-review"
                                                       aria-selected="false">
                                                        <div class="text-center pt-1 pb-1">
                                                            <h4 class="title fw-normal mb-0">Feedbacks</h4>
                                                        </div>
                                                    </a><!--end nav link-->
                                                </li><!--end nav item-->
                                            </ul>
                                            <div class="tab-content mt-2" id="pills-tabContent">
                                                <div class="tab-pane fade show active" id="pills-overview" role="tabpanel"
                                                     aria-labelledby="overview-tab">
                                                    <p class="text-muted">${doctor.description}</p>
                                                <h6 class="mb-0">Information: </h6>

                                                <ul class="list-unstyled mt-4">
                                                    <li class="mt-1">
                                                        <i class="uil uil-user text-primary "> Gender:</i>
                                                        <span class="ms-5 h6">
                                                            <c:if test= "${doctor.gender == 0}">Female</c:if>
                                                            <c:if test= "${doctor.gender == 1}">Male</c:if>
                                                            </span>

                                                        </li>
                                                        <li class="mt-1"><i class="uil uil-phone text-primary "> Phone:</i>
                                                            <span class=" ms-5 h6">${doctor.phone}</span>
                                                    </li>
                                                    <li class="mt-1"><i class="uil uil-mailbox text-primary "> Email:</i>
                                                        <span class=" ms-5 h6">${doctor.email}</span>
                                                    </li>
                                                     <li class="mt-1"><i class="uil uil-user-nurse text-primary "> Speciality:</i>
                                                        <span class="ms-5 h6">${doctor.speciality   }</span>
                                                    </li>
                                                    <li class="mt-1"><i class="uil uil-user-nurse text-primary "> Position:</i>
                                                        <span class="ms-5 h6">${doctor.position}</span>
                                                    </li>
                                                    <li class="mt-1"><i class="uil uil-user-check text-primary "> Status:</i>
                                                        <span class="ms-5 h6">
                                                        <c:if test= "${doctor.status == 0}">Inactive</c:if>
                                                        <c:if test= "${doctor.status == 1}">Active</c:if>
                                                        </span>
                                                        </li>
                                                    </ul>

                                                </div><!--end teb pane-->


                                                <div class="tab-pane fade" id="pills-review" role="tabpanel"
                                                     aria-labelledby="review-tab">
                                                    <div class="row justify-content-center">
                                                        <div class="col-lg-8 text-center">
                                                            <div class="client-review-slider">
                                                                <div class="tiny-slide text-center">
                                                                    <p class="text-muted h6 fw-normal fst-italic">" It seems
                                                                        that only fragments of the original text remain in the
                                                                        Lorem Ipsum texts used today. One may speculate that
                                                                        over the course of time certain letters were added or
                                                                        deleted at various positions within the text. "</p>
                                                                    <img src="../assets/images/client/06.jpg"
                                                                         class="img-fluid avatar avatar-small rounded-circle mx-auto shadow my-3"
                                                                         alt="">
                                                                    <ul class="list-unstyled mb-0">
                                                                        <li class="list-inline-item"><i
                                                                                class="mdi mdi-star text-warning"></i></li>
                                                                        <li class="list-inline-item"><i
                                                                                class="mdi mdi-star text-warning"></i></li>
                                                                        <li class="list-inline-item"><i
                                                                                class="mdi mdi-star text-warning"></i></li>
                                                                        <li class="list-inline-item"><i
                                                                                class="mdi mdi-star text-warning"></i></li>
                                                                        <li class="list-inline-item"><i
                                                                                class="mdi mdi-star text-warning"></i></li>
                                                                    </ul>
                                                                    <h6 class="text-primary">- Jill Webb <small
                                                                            class="text-muted">Designer</small></h6>
                                                                </div><!--end customer testi-->
                                                            </div><!--end carousel-->
                                                        </div><!--end col-->
                                                    </div><!--end row-->
                                                </div><!--end teb pane-->

                                                <div class="tab-pane fade" id="pills-timetable" role="tabpanel"
                                                     aria-labelledby="timetable-tab">
                                                    <div class="row">
                                                        <div class="col-lg-4 col-md-12">
                                                            <div class="card border-0 p-3 rounded shadow">
                                                                <ul class="list-unstyled mb-0">
                                                                    <li class="d-flex justify-content-between">
                                                                        <p class="text-muted mb-0"><i
                                                                                class="ri-time-fill text-primary align-middle h5 mb-0"></i>
                                                                            Monday</p>
                                                                        <p class="text-primary mb-0"><span
                                                                                class="text-dark">Time:</span> 8.00 - 20.00</p>
                                                                    </li>
                                                                    <li class="d-flex justify-content-between mt-2">
                                                                        <p class="text-muted mb-0"><i
                                                                                class="ri-time-fill text-primary align-middle h5 mb-0"></i>
                                                                            Tuesday</p>
                                                                        <p class="text-primary mb-0"><span
                                                                                class="text-dark">Time:</span> 8.00 - 20.00</p>
                                                                    </li>
                                                                    <li class="d-flex justify-content-between mt-2">
                                                                        <p class="text-muted mb-0"><i
                                                                                class="ri-time-fill text-primary align-middle h5 mb-0"></i>
                                                                            Wednesday</p>
                                                                        <p class="text-primary mb-0"><span
                                                                                class="text-dark">Time:</span> 8.00 - 20.00</p>
                                                                    </li>
                                                                    <li class="d-flex justify-content-between mt-2">
                                                                        <p class="text-muted mb-0"><i
                                                                                class="ri-time-fill text-primary align-middle h5 mb-0"></i>
                                                                            Thursday</p>
                                                                        <p class="text-primary mb-0"><span
                                                                                class="text-dark">Time:</span> 8.00 - 20.00</p>
                                                                    </li>
                                                                    <li class="d-flex justify-content-between mt-2">
                                                                        <p class="text-muted mb-0"><i
                                                                                class="ri-time-fill text-primary align-middle h5 mb-0"></i>
                                                                            Friday</p>
                                                                        <p class="text-primary mb-0"><span
                                                                                class="text-dark">Time:</span> 8.00 - 20.00</p>
                                                                    </li>
                                                                    <li class="d-flex justify-content-between mt-2">
                                                                        <p class="text-muted mb-0"><i
                                                                                class="ri-time-fill text-primary align-middle h5 mb-0"></i>
                                                                            Saturday</p>
                                                                        <p class="text-primary mb-0"><span
                                                                                class="text-dark">Time:</span> 8.00 - 18.00</p>
                                                                    </li>
                                                                    <li class="d-flex justify-content-between mt-2">
                                                                        <p class="text-muted mb-0"><i
                                                                                class="ri-time-fill text-primary align-middle h5 mb-0"></i>
                                                                            Sunday</p>
                                                                        <p class="text-primary mb-0"><span
                                                                                class="text-dark">Time:</span> 8.00 - 14.00</p>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div><!--end col-->

                                                        <div class="col-lg-4 col-md-6 mt-4 mt-lg-0 pt-2 pt-lg-0">
                                                            <div class="card border-0 text-center features feature-primary">
                                                                <div class="icon text-center mx-auto rounded-md">
                                                                    <i class="uil uil-phone h3 mb-0"></i>
                                                                </div>

                                                                <div class="card-body p-0 mt-4">
                                                                    <h5 class="title fw-bold">Phone</h5>
                                                                    <p class="text-muted">Great doctor if you need your family
                                                                        member to get effective immediate assistance</p>
                                                                    <a href="tel:+152534-468-854" class="link">+152
                                                                        534-468-854</a>
                                                                </div>
                                                            </div>
                                                        </div><!--end col-->

                                                        <div class="col-lg-4 col-md-6 mt-4 mt-lg-0 pt-2 pt-lg-0">
                                                            <div class="card border-0 text-center features feature-primary">
                                                                <div class="icon text-center mx-auto rounded-md">
                                                                    <i class="uil uil-envelope h3 mb-0"></i>
                                                                </div>

                                                                <div class="card-body p-0 mt-4">
                                                                    <h5 class="title fw-bold">Email</h5>
                                                                    <p class="text-muted">Great doctor if you need your family
                                                                        member to get effective immediate assistance</p>
                                                                    <a href="mailto:contact@example.com"
                                                                       class="link">contact@example.com</a>
                                                                </div>
                                                            </div>
                                                        </div><!--end col-->
                                                    </div><!--end row-->
                                                </div><!--end teb pane-->

                                            </div><!--end tab content-->
                                        </div>
                                    </div><!--end col-->
                                </div><!--end row-->
                            </div>
                        </div>
                    </div><!--end container-->

                </main>
                <!--End page-content" -->
                <!-- Modal -->

            </div>
            <!-- page-wrapper -->
            <!-- javascript -->

            <script src="${pageContext.request.contextPath}/frontend/template/assets/js/bootstrap.bundle.min.js"></script>
        <!-- simplebar -->
        <script src="${pageContext.request.contextPath}/frontend/template/assets/js/simplebar.min.js"></script>
        <!-- Icons -->
        <script src="${pageContext.request.contextPath}/frontend/template/assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="${pageContext.request.contextPath}/frontend/template/assets/js/app.js"></script>


    </body>
</html> 