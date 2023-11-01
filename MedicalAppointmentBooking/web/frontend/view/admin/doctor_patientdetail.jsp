<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <title>MABS</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Premium Bootstrap 4 Landing Page Template" />
        <meta name="keywords" content="Appointment, Booking, System, Dashboard, Health" />
        <meta name="author" content="Group6" />
        <meta name="email" content="support@group6.in" />
        <meta name="website" content="https://group6.in" />
        <meta name="Version" content="v1.2.0" />
        <!-- favicon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/frontend/template/assets/images/favicon.ico.png">
        <!-- Bootstrap -->
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/newstyle.css" rel="stylesheet" type="text/css" />

        <!-- SLIDER -->
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/tiny-slider.css" />
        <!-- Select2 -->
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/select2.min.css" rel="stylesheet" />
        <!-- Date picker -->
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/flatpickr.min.css">
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/jquery.timepicker.min.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link  href="${pageContext.request.contextPath}/frontend/template/assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link  href="${pageContext.request.contextPath}/frontend/template/assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css" rel="stylesheet">
        <!-- Css -->
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <style>
            #home {
                background-image: url("frontend/template/assets/images/bg/backgroundclinic.jpg");
            }
        </style>

    </head>
    <body>

        <jsp:include page="/frontend/common/header.jsp" />

        <section class="bg-dashboard">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-3 col-lg-4 col-md-5 col-12">
                        <div class="rounded shadow overflow-hidden sticky-bar">
                            <div class="card border-0" >
                                <img src="frontend/template/assets/images/doctors/profile-bg.jpg" class="img-fluid" alt="">
                            </div>  
                            <div>
                                <ul class="list-unstyled sidebar-nav mb-0">
                                    <li class="navbar-item"><a href="doctor-appointmentlist?id=" class="navbar-link"><i class="ri-calendar-check-line align-middle navbar-icon"></i> Appointment</a></li>
                                    <li class="navbar-item"><a href="doctor-schedule.html" class="navbar-link"><i class="ri-timer-line align-middle navbar-icon"></i> Schedule Timing</a></li>
                                    <li class="navbar-item"><a href="doctor-profile.html" class="navbar-link"><i class="ri-user-line align-middle navbar-icon"></i> Profile</a></li>
                                    <li class="navbar-item"><a href="doctor-profile-setting.html" class="navbar-link"><i class="ri-user-settings-line align-middle navbar-icon"></i> Profile Settings</a></li>
                                    <li class="navbar-item active"><a href="doctor-patientlist?id=" class="navbar-link"><i class="ri-empathize-line align-middle navbar-icon"></i> Patients</a></li>
                                    <li class="navbar-item"><a href="patient-review.html" class="navbar-link"><i class="ri-chat-1-line align-middle navbar-icon"></i> Patients Review</a></li>
                                    <li class="navbar-item"><a href="forgot-password.html" class="navbar-link"><i class="ri-device-recover-line align-middle navbar-icon"></i> Forgot Password</a></li>
                                </ul>
                            </div>
                        </div><!--end col-->
                    </div>
                    <div class="col-xl-9 col-lg-8 col-md-7 mt-4 pt-2 mt-sm-0 pt-sm-0">
                        <div class="row">
                            <div class="col-lg-12 col-md-6">
                                <div class="bg-white rounded shadow overflow-hidden">
                                    <div class="p-4 border-bottom">
                                        <h5 class="mb-0">Patient Information</h5>
                                    </div>
                                    <br><br><br><br><br>
                                    <div class="text-center avatar-profile margin-nagative mt-n5 position-relative pb-4 border-bottom">
                                        <c:if test="${patient.image == 'default'}">
                                            <img src="frontend/template/assets/images/patient.jpg" class="rounded-circle shadow-md avatar avatar-md-md" alt="">
                                        </c:if>
                                        <c:if test="${patient.image != 'default'}">
                                            <img src="data:image/png;base64,${patient.image}" class="rounded-circle shadow-md avatar avatar-md-md" alt="">
                                        </c:if>
                                        <h5 class="mt-3 mb-1">${patient.fullName}</h5>
                                    </div>
                                    <div class="list-unstyled p-4">
                                        <div class="d-flex align-items-center mt-2">
                                            <i class="uil uil-user align-text-bottom text-primary h5 mb-0 me-2"></i>
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
                                            <p class="text-muted mb-0 ms-2">${patient.phone}</p>
                                        </div>
                                        <div class="d-flex align-items-center mt-2">
                                            <i class="uil uil-mailbox align-text-bottom text-primary h5 mb-0 me-2"></i>
                                            <h6 class="mb-0">Email</h6>
                                            <p class="text-muted mb-0 ms-2">${patient.email}</p>
                                        </div>

                                        <div class="d-flex align-items-center mt-2">
                                            <i class="uil uil-calendar-alt align-text-bottom text-primary h5 mb-0 me-2"></i>
                                            <h6 class="mb-0">Date Of Birth</h6>
                                            <p class="text-muted mb-0 ms-2">${patient.dob}</p>
                                        </div>
                                        <div class="d-flex align-items-center mt-2">
                                            <i class="uil uil-globe align-text-bottom text-primary h5 mb-0 me-2"></i>
                                            <h6 class="mb-0">Address</h6>
                                            <p class="text-muted mb-0 ms-2">${patient.address}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex align-items-center mt-4">
                                <a href="javascript:history.back();" class="me-3 btn btn-primary btn-sml btn-soft-success">
                                    Return  
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="/frontend/common/footer.jsp" />
        <script src= "<c:url value= '/frontend/template/assets/js/bootstrap.bundle.min.js'/>"></script>
        <!-- Icons -->
        <script src= "<c:url value= '/frontend/template/assets/js/feather.min.js'/>"></script>
        <!-- Main Js -->
        <script src= "<c:url value= '/frontend/template/assets/js/tiny-slider.js'/>"></script>
        <script src= "<c:url value= '/frontend/template/assets/js/app.js'/>"></script>
        <script src= "<c:url value= '/frontend/template/assets/js/tiny-slider.js'/>"></script>
        <script src= "<c:url value= '/frontend/template/assets/js/tiny-slider-init.js'/>"></script>
</body>

</html>
