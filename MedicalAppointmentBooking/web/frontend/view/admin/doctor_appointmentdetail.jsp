<%-- Document : admin_appointmentdetail Created on : Oct 19, 2023, 2:40:48 PM Author : Admin --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Appointment Detail Page</title>
        <link rel="shortcut icon"href="${pageContext.request.contextPath}/frontend/template/assets/images/favicon.ico.png">
        <!-- Bootstrap -->
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/bootstrap.min.css"
              rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/materialdesignicons.min.css"
              rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/remixicon.css"
              rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/style.min.css"
              rel="stylesheet" type="text/css" id="theme-opt" />
        <!-- SLIDER -->
        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/frontend/template/assets/css/tiny-slider.css" />
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/select2.min.css"
              rel="stylesheet" />
        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/frontend/template/assets/css/flatpickr.min.css">
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/jquery.timepicker.min.css"
              rel="stylesheet" type="text/css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="<c:url value= '/frontend/template/assets/js/flatpickr.min.js'/>"></script>
    </head>

    <body>
        <div class="page-wrapper doctris-theme toggled">
            <jsp:include page="/frontend/common/doctor_side_bar.jsp" />
            <div class="top-header">
                <div class="header-bar d-flex justify-content-between border-bottom">
                    <div class="d-flex align-items-center">
                        <a href="#" class="logo-icon">
                            <img src="frontend/template/assets/images/logo-icon.png" height="30" class="small"
                                 alt="">
                            <span class="">
                                <img src="frontend/template/assets/images/logo-dark.png" height="24"
                                     class="logo-light-mode" alt="">
                                <img src="frontend/template/assets/images/logo-light.png" height="24"
                                     class="logo-dark-mode" alt="">
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
                                    <a class="dropdown-item d-flex align-items-center text-dark" <img
                                       src="frontend/template/assets/images/doctors/01.jpg"
                                       class="avatar avatar-md-sm rounded-circle border shadow" alt="">
                                        <div class="flex-1 ms-2">
                                            <span class="d-block mb-1">${sessionScope.user.fullName}</span>
                                            <small class="text-muted"></small>
                                        </div>
                                    </a>
                                    <a class="dropdown-item text-dark" href="dr-profile.html"><span
                                            class="mb-0 d-inline-block me-1"><i
                                                class="uil uil-setting align-middle h6"></i></span> Profile
                                        Settings</a>
                                    <div class="dropdown-divider border-top"></div>
                                    <a class="dropdown-item text-dark" href="lock-screen.html"><span
                                            class="mb-0 d-inline-block me-1"><i
                                                class="uil uil-sign-out-alt align-middle h6"></i></span>
                                        Logout</a>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <main class="page-content bg-light">
                <div class="top-header">
                    <div class="header-bar d-flex justify-content-between border-bottom">
                        <div class="d-flex align-items-center">
                            <a href="#" class="logo-icon">
                                <img src="frontend/template/assets/images/logo-icon.png" height="30"
                                     class="small" alt="">
                                <span class="">
                                    <img src="../assets/images/logo-dark.png" height="24"
                                         class="logo-light-mode" alt="">
                                    <img src="../assets/images/logo-light.png" height="24"
                                         class="logo-dark-mode" alt="">
                                </span>
                            </a>
                            <a id="close-sidebar" class="btn btn-icon btn-pills btn-soft-primary ms-2" href="#">
                                <i class="uil uil-bars"></i>
                            </a>
                        </div>
                        <ul class="list-unstyled mb-0">
                            <li class="list-inline-item mb-0 ms-1">
                                <div class="dropdown dropdown-primary">
                                    <button type="button"
                                            class="btn btn-pills btn-soft-primary dropdown-toggle p-0"
                                            data-bs-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false"><img src="/assets/images/doctors/01.jpg"
                                                               class="avatar avatar-ex-small rounded-circle" alt=""></button>
                                    <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3"
                                         style="min-width: 200px;">
                                        <a class="dropdown-item d-flex align-items-center text-dark" <img
                                           src="../assets/images/doctors/01.jpg"
                                           class="avatar avatar-md-sm rounded-circle border shadow" alt="">
                                            <div class="flex-1 ms-2">
                                                <span class="d-block mb-1">${sessionScope.user.fullName}</span>
                                                <small class="text-muted"></small>
                                            </div>
                                        </a>
                                        <a class="dropdown-item text-dark" href="dr-profile.html"><span
                                                class="mb-0 d-inline-block me-1"><i
                                                    class="uil uil-setting align-middle h6"></i></span> Profile
                                            Settings</a>
                                        <div class="dropdown-divider border-top"></div>
                                        <a class="dropdown-item text-dark" href="lock-screen.html"><span
                                                class="mb-0 d-inline-block me-1"><i
                                                    class="uil uil-sign-out-alt align-middle h6"></i></span>
                                            Logout</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="row">
                            <div class="col-lg-6 col-md-6">
                                <div class="bg-white rounded shadow overflow-hidden">
                                    <div class="p-4 border-bottom">
                                        <h5 class="mb-0">Patient Information</h5>
                                    </div>
                                    <br><br><br><br><br>
                                    <div
                                        class="text-center avatar-profile margin-nagative mt-n5 position-relative pb-4 border-bottom">
                                        <c:if test="${appt.patient.image == 'default'}">
                                            <img src="frontend/template/assets/images/patient.jpg"
                                                 class="rounded-circle shadow-md avatar avatar-md-md" alt="">
                                        </c:if>
                                        <c:if test="${appt.patient.image != 'default'}">
                                            <img src="data:image/png;base64,${appt.patient.image}"
                                                 class="rounded-circle shadow-md avatar avatar-md-md" alt="">
                                        </c:if>
                                        <h5 class="mt-3 mb-1">${appt.patient.fullName}</h5>
                                    </div>
                                    <div class="list-unstyled p-4">
                                        <div class="d-flex align-items-center mt-2">
                                            <i
                                                class="uil uil-user align-text-bottom text-primary h5 mb-0 me-2"></i>
                                            <h6 class="mb-0">Gender</h6>
                                            <c:if test="${appt.patient.gender == 1}">
                                                <p class="text-muted mb-0 ms-2">Male</p>
                                            </c:if>
                                            <c:if test="${appt.patient.gender == 0}">
                                                <p class="text-muted mb-0 ms-2">Female</p>
                                            </c:if>
                                        </div>

                                        <div class="d-flex align-items-center mt-2">
                                            <i class="uil uil-phone align-text-bottom text-primary h5 mb-0 me-2"></i>
                                            <h6 class="mb-0">Phone</h6>
                                            <p class="text-muted mb-0 ms-2">${appt.patient.phone}</p>
                                        </div>
                                        <div class="d-flex align-items-center mt-2">
                                            <i
                                                class="uil uil-mailbox align-text-bottom text-primary h5 mb-0 me-2"></i>
                                            <h6 class="mb-0">Email</h6>
                                            <p class="text-muted mb-0 ms-2">${appt.patient.email}</p>
                                        </div>

                                        <div class="d-flex align-items-center mt-2">
                                            <i
                                                class="uil uil-calendar-alt align-text-bottom text-primary h5 mb-0 me-2"></i>
                                            <h6 class="mb-0">Date Of Birth</h6>
                                            <p class="text-muted mb-0 ms-2">${appt.patient.dob}</p>
                                        </div>
                                        <div class="d-flex align-items-center mt-2">
                                            <i
                                                class="uil uil-globe align-text-bottom text-primary h5 mb-0 me-2"></i>
                                            <h6 class="mb-0">Address</h6>
                                            <p class="text-muted mb-0 ms-2">${appt.patient.address}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 ">
                                <div class="bg-white rounded shadow overflow-hidden">
                                    <div class="p-4 border-bottom">
                                        <h5 class="mb-0">Appointment Details</h5>
                                    </div>
                                    <br><br><br><br><br>
                                    <div
                                        class="text-center avatar-profile margin-nagative mt-n5 position-relative pb-4 border-bottom">

                                        <img src="frontend/template/assets/images/appointment.jpg"
                                             class="rounded-circle shadow-md avatar avatar-md-md" alt="">

                                        <br><br><br><br>
                                    </div>
                                    <div class="tab-content p-4" id="pills-tabContent">
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Appointment Date</label>
                                                    <p>${appt.apptDate}</p>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Appointment Time</label>
                                                    <p>${appt.apptTime}</p>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Status</label>
                                                    <p>${appt.status}</p>
                                                </div>
                                            </div>

                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Service Fee</label>
                                                    <p>${appt.doctor.serviceFee}</p>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Appointment Note</label>
                                                    <p>${appt.apptNote}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <c:if test="${appt.status == 'CONFIRMED' || appt.status == 'RESCHEDULED'}">
                            <div class="card border-0 mt-4 col-lg-12 row ">
                                <div class="col-5">
                                    <a href="<c:url value= 'doctor-appointmentdetail?action=complete&apptId=${appt.apptId}'/>"
                                       class="me-3 btn btn-primary  ">
                                        Complete appointment
                                    </a>
                                </div>
                            </div>
                        </c:if>
                    </div>

                </div>
            </main>
        </div>
        <script src="<c:url value= '/frontend/template/assets/js/bootstrap.bundle.min.js'/>"></script>
        <script src="<c:url value= '/frontend/template/assets/js/feather.min.js'/>"></script>
        <script src="<c:url value= '/frontend/template/assets/js/app.js'/>"></script>
        <script src="<c:url value= '/frontend/template/assets/js/select2.min.js'/>"></script>
        <script src="<c:url value= '/frontend/template/assets/js/select2.init.js'/>"></script>
        <script src="<c:url value= '/frontend/template/assets/js/jquery.timepicker.min.js'/>"></script>
        <script src="<c:url value= '/frontend/template/assets/js/timepicker.init.js'/>"></script>

    </body>

</html>