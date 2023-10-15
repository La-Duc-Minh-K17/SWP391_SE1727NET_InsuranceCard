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
            <jsp:include page="/frontend/common/staff_side_bar.jsp" />

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
                                            src="/assets/images/doctors/01.jpg"
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
<!--                        <div class="row align-content-center">
                            <div class="col-xl-3 col-md-3">
                                <div class="card component-wrapper border-0 rounded shadow">
                                    <div>
                                        <select class="form-select form-control" id="speFilter" onchange="filter()">
                                            <option selected disabled>Sort</option>
                                            <option value="newest">Newest</option>
                                            <option value="oldest">Oldest</option>
                                        </select>
                                    </div>
                                </div>

                            </div>
                            <div class="col-xl-6 col-md-6">
                                <div class="search-bar d-lg-block" style="padding-top :0">
                                    <div id="search" class="menu-search ">
                                        <form action="<c:url value='/staff-waiting-list?action=search'/>" role="search" method="post"
                                              id="searchform" class="searchform">
                                            <div>
                                                <input type="text" class="form-control border rounded-pill" name="search"
                                                       id="search" placeholder="Search patient name">
                                                <input type="submit" id="searchsubmit" value="Search">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                        </div>end row-->

                        <div class="col-12 mt-4">
                            <div class="card component-wrapper border-0 rounded shadow">
                                <div class="p-4 border-bottom">
                                    <h5 class="mb-0">Waiting List </h5>
                                </div>
                                <div class="p-4">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <ul class="nav nav-pills nav-justified flex-column flex-sm-row rounded" id="pills-tab"
                                                role="tablist">
                                                <li class="nav-item">
                                                    <a class="nav-link rounded active" id="pills-cloud-tab" data-bs-toggle="pill"
                                                       href="#pills-cloud" role="tab" aria-controls="pills-cloud"
                                                       aria-selected="false">
                                                        <div class="text-center pt-1 pb-1">
                                                            <h4 class="title font-weight-normal mb-0">Appointment List</h4>
                                                        </div>
                                                    </a>
                                                </li>

                                                <li class="nav-item">
                                                    <a class="nav-link rounded" id="pills-smart-tab" data-bs-toggle="pill"
                                                       href="#pills-smart" role="tab" aria-controls="pills-smart"
                                                       aria-selected="false">
                                                        <div class="text-center pt-1 pb-1">
                                                            <h4 class="title font-weight-normal mb-0">Reservation List</h4>
                                                        </div>
                                                    </a>
                                                </li>


                                            </ul><!--end nav pills-->
                                        </div><!--end col-->
                                    </div><!--end row-->

                                    <div class="row pt-2">
                                        <div class="col-12">
                                            <div class="tab-content" id="pills-tabContent">
                                                <div class="tab-pane fade show active" id="pills-cloud" role="tabpanel"
                                                     aria-labelledby="pills-cloud-tab">
                                                    <div class="col-12 ">
                                                        <div class="card component-wrapper border-0 rounded shadow">
                                                            <div>
                                                                <div class="table-responsive bg-white shadow rounded">
                                                                    <table class="table mb-0 table-center">
                                                                        <thead>
                                                                            <tr>
                                                                                <th class="border-bottom p-3" style="min-width: 50px;">#</th>
                                                                                <th class="border-bottom p-3" style="min-width: 180px;">Name</th>
                                                                                <th class="border-bottom p-3" style="min-width: 150px;">Email</th>
                                                                                <th class="border-bottom p-3" style="min-width: 150px">DOB</th>
                                                                                <th class="border-bottom p-3">Gender</th>
                                                                                <th class="border-bottom p-3" style="min-width: 150px;">Date</th>
                                                                                <th class="border-bottom p-3">Time</th>
                                                                                <th class="border-bottom p-3" style="min-width: 220px;">Doctor</th>
                                                                                <th class="border-bottom p-3">Fees</th>
                                                                                <th class="border-bottom p-3" style="min-width: 150px;">Action</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <c:forEach items="${apptList}" var="appt">
                                                                                <c:if test="${appt.patient.userAccount != null}">
                                                                                    <c:set var="patient" value="${appt.patient.userAccount}"></c:set>
                                                                                </c:if>
                                                                                <c:if test="${appt.patient.userRelative != null}">
                                                                                    <c:set var="patient" value="${appt.patient.userRelative}"></c:set>
                                                                                </c:if>
                                                                                <tr>
                                                                                    <th class="p-3">1</th>
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
                                                                                    <td class="p-3">${patient.email}</td>
                                                                                    <td class="p-3">${patient.dob}</td>
                                                                                    <td class="p-3">${patient.gender == 1 ? "Male" : "Female"}</td>
                                                                                    <td class="p-3">${appt.apptDate}</td>
                                                                                    <td class="p-3">${appt.apptTime}</td>
                                                                                    <td class="p-3">
                                                                                        <a href="#" class="text-dark">
                                                                                            <div class="d-flex align-items-center">
                                                                                                <img src="data:image/jpg;base64,${appt.doctor.image}" class="avatar avatar-md-sm rounded-circle border shadow" alt="">
                                                                                                <span class="ms-2">${appt.doctor.fullName}</span>
                                                                                            </div>
                                                                                        </a>
                                                                                    </td>
                                                                                    <td class="p-3">${appt.doctor.serviceFee}/Patient</td>
                                                                                    <td class="text-start p-3">
                                                                                        <a href="#acceptappointment" class="btn btn-icon btn-pills btn-soft-success"
                                                                                           data-bs-toggle="modal" data-bs-target="#acceptappointment" onclick="acceptAppt(this)" data-id="${appt.apptId}">
                                                                                            <i class="uil uil-check-circle" ></i></a>
                                                                                        <a href="#cancelappointment" class="btn btn-icon btn-pills btn-soft-danger" 
                                                                                           data-bs-toggle="modal" data-bs-target="#cancelappointment" onclick="cancelAppt(this)" data-id="${appt.apptId}">
                                                                                            <i class="uil uil-times-circle"></i></a>
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

                                                <div class="tab-pane fade" id="pills-smart" role="tabpanel"
                                                     aria-labelledby="pills-smart-tab">
                                                    <div class="col-12 ">
                                                        <div class="card component-wrapper border-0 rounded shadow">
                                                            <div >
                                                                <div class="table-responsive bg-white shadow rounded">
                                                                    <table class="table mb-0 table-center">
                                                                        <thead>
                                                                            <tr>
                                                                                <th class="border-bottom p-3" style="min-width: 50px;">#</th>
                                                                                <th class="border-bottom p-3" style="min-width: 180px;">Name</th>
                                                                                <th class="border-bottom p-3" style="min-width: 150px;">Email</th>
                                                                                <th class="border-bottom p-3" style="min-width: 150px">DOB</th>
                                                                                <th class="border-bottom p-3">Gender</th>
                                                                                <th class="border-bottom p-3" style="min-width: 150px;">Date</th>
                                                                                <th class="border-bottom p-3">Time</th>
                                                                                <th class="border-bottom p-3" style="min-width: 220px;">Service</th>
                                                                                <th class="border-bottom p-3">Fees</th>
                                                                                <th class="border-bottom p-3" style="min-width: 150px;">Action</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <c:forEach items="${resvList}" var="resv">
                                                                                <c:if test="${resv.patient.userAccount != null}">
                                                                                    <c:set var="patient" value="${resv.patient.userAccount}"></c:set>
                                                                                </c:if>
                                                                                <c:if test="${resv.patient.userRelative != null}">
                                                                                    <c:set var="patient" value="${resv.patient.userRelative}"></c:set>
                                                                                </c:if>
                                                                                <tr>
                                                                                    <th class="p-3">1</th>
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
                                                                                    <td class="p-3">${patient.email}</td>
                                                                                    <td class="p-3">${patient.dob}</td>
                                                                                    <td class="p-3">${patient.gender == 1 ? "Male" : "Female"}</td>
                                                                                    <td class="p-3">${resv.resvDate}</td>
                                                                                    <td class="p-3">${resv.resvTime}</td>
                                                                                    <td class="p-3">
                                                                                        <a href="#" class="text-dark">
                                                                                            ${resv.service.service_name}</a>
                                                                                    </td>
                                                                                    <td class="p-3">$${resv.service.fee}/Patient</td>
                                                                                    <td class="text-start p-3">
                                                                                        <a href="#" class="btn btn-icon btn-pills btn-soft-success"
                                                                                           data-bs-toggle="modal" data-bs-target="#acceptreservation" onclick="acceptResv(this)" data-id="${resv.resvId}">
                                                                                            <i class="uil uil-check-circle"></i></a>
                                                                                        <a href="#" class="btn btn-icon btn-pills btn-soft-danger" data-bs-toggle="modal"
                                                                                           data-bs-target="#cancelreservation" onclick="cancelResv(this)" data-id="${resv.resvId}">
                                                                                            <i class="uil uil-times-circle"></i></a>
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

                                            </div><!--end tab content-->
                                        </div><!--end col-->
                                    </div><!--end row-->
                                </div>
                            </div>
                        </div>

                    </div><!--end container-->
                </div>
            </main>
            <!--End page-content" -->
            <!-- Modal -->
            <div class="modal fade" id="acceptappointment" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <form action="<c:url value='/staff-waiting-list?action=accept?type=appointment'></c:url>" method="post">
                            <div class="modal-content">
                                <div class="modal-body py-5">
                                    <div class="text-center">
                                        <div class="icon d-flex align-items-center justify-content-center bg-soft-success rounded-circle mx-auto" style="height: 95px; width:95px;">
                                            <i class="uil uil-check-circle h1 mb-0"></i>
                                        </div>
                                        <div class="mt-4">
                                            <h4>Accept Appointment</h4>
                                            <p class="para-desc mx-auto text-muted mb-0">This appointment will be assigned for you after clicking on accept button..</p>
                                            <div class="mt-4">
                                                <input type="hidden" id="accept_appointment" name="appointment_accepted" value="">
                                                <input type="submit" class="btn btn-success" name="accept" value="Accept">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- Accept Appointment End -->

                <!-- Cancel Appointment Start -->
                <div class="modal fade" id="cancelappointment" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <form action="<c:url value='/staff-waiting-list?action=cancel&type=appointment'></c:url>" method="post">
                            <div class="modal-content">
                                <div class="modal-body py-5">
                                    <div class="text-center">
                                        <div class="icon d-flex align-items-center justify-content-center bg-soft-danger rounded-circle mx-auto" style="height: 95px; width:95px;">
                                            <i class="uil uil-times-circle h1 mb-0"></i>
                                        </div>
                                        <div class="mt-4">
                                            <h4>Cancel Appointment</h4>
                                            <p class="para-desc mx-auto text-muted mb-0">This appointment will be cancelled by you. Are you sure ?</p>
                                            <div class="mt-4">
                                                <input type="hidden" id="cancel_appointment" name="appointment_canceled" value="">
                                                <input type="submit" class="btn btn-soft-danger" name="cancel" value="Cancel">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>


                <!-- Accept reservation Start-->
                <div class="modal fade" id="acceptreservation" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <form action="<c:url value='/staff-waiting-list?action=accept&type=reservation'></c:url>" method="post">
                                <div class="modal-body py-5">
                                    <div class="text-center">
                                        <div class="icon d-flex align-items-center justify-content-center bg-soft-success rounded-circle mx-auto" style="height: 95px; width:95px;">
                                            <i class="uil uil-check-circle h1 mb-0"></i>
                                        </div>
                                        <div class="mt-4">
                                            <h4>Accept Appointment</h4>
                                            <p class="para-desc mx-auto text-muted mb-0">This reservation will be assigned for you after clicking on accept button.</p>
                                            <div class="mt-4">
                                                <input type="hidden" id="accept_reservation" name="reservation_accepted" value="">
                                                <input type="submit" class="btn btn-success" name="accept" value="Accept">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- Accept reservation End -->

                <!-- Cancel Reservation Start -->
                <div class="modal fade" id="cancelreservation" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <form action="<c:url value='/staff-waiting-list?action=cancel&type=reservation'></c:url>" method="post">
                            <div class="modal-body py-5">
                                <div class="text-center">
                                    <div class="icon d-flex align-items-center justify-content-center bg-soft-danger rounded-circle mx-auto" style="height: 95px; width:95px;">
                                        <i class="uil uil-times-circle h1 mb-0"></i>
                                    </div>
                                    <div class="mt-4">
                                        <h4>Cancel Appointment</h4>
                                        <p class="para-desc mx-auto text-muted mb-0">This reservation will be cancelled by you. Are you sure ?.</p>
                                        <div class="mt-4">
                                            <input type="hidden" id="cancel_reservation" name="reservation_canceled" value="">
                                            <input type="submit" class="btn btn-soft-danger" name="cancel" value="Cancel">
                                        </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- page-wrapper -->
            <!-- javascript -->
            <script>
                function acceptAppt(appt) {
                    var dataId = appt.getAttribute('data-id');
                    let accept_appt = document.getElementById('accept_appointment');
                    accept_appt.value = dataId;
                    console.log(accept_appt.value);
                }
                function cancelAppt(appt) {
                    var dataId = appt.getAttribute('data-id');
                    let cancel_appt = document.getElementById('cancel_appointment');
                    cancel_appt.value = dataId;
                    
                }
                
                 function acceptResv(resv) {
                    
                    var dataId = resv.getAttribute('data-id');
                    let accept_resv = document.getElementById('accept_reservation');
                    accept_resv.value = dataId;
                  
                }
                function cancelResv(resv) {
                    var dataId = resv.getAttribute('data-id');
                    let cancel_resv = document.getElementById('cancel_reservation');
                    cancel_resv.value = dataId;
                }

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
