

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <title>MABS</title>
        <!-- favicon -->
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
        <jsp:include page="/frontend/common/header.jsp" />
        <section class="bg-hero mt-4">
            <div class="container-fluid ">
                <div class="row p-4">
                    <div class="col-md-5 col-lg-4">
                        <div class="rounded shadow overflow-hidden sticky-bar">
                            <div class="card border-0">
                                <img src="frontend/template/assets/images/bg/bg-profile.jpg" class="img-fluid" alt="">
                            </div>
                            <div class="text-center avatar-profile margin-nagative mt-n5 position-relative pb-4 border-bottom">
                                <img src="data:image/jpg;base64,${sessionScope.user.image}" 
                                     class="rounded-circle shadow-md avatar avatar-md-md" alt="">
                                <h5 class="mt-3 mb-1">${sessionScope.user.fullName}</h5>
                            </div>
                            <div class="list-unstyled p-4">
                                <div class="d-flex align-items-center mt-2">
                                    <i class="uil uil-user align-text-bottom text-primary h5 mb-0 me-2"></i>
                                    <h6 class="mb-0">Gender</h6>
                                    <p class="text-muted mb-0 ms-2">${sessionScope.user.gender == 1 ?"Male": "Female" }</p>
                                </div>

                                <div class="d-flex align-items-center mt-2">
                                    <i class="uil uil-calendar-alt align-text-bottom text-primary h5 mb-0 me-2"></i>
                                    <h6 class="mb-0">Birthday</h6>
                                    <p class="text-muted mb-0 ms-2"><fmt:formatDate value="${sessionScope.user.dob}" pattern="dd/MM/yyyy"  /></p>
                                </div>

                                <div class="d-flex align-items-center mt-2">
                                    <i class="uil uil-phone  align-text-bottom text-primary h5 mb-0 me-2"></i>
                                    <h6 class="mb-0">Phone</h6>
                                    <p class="text-muted mb-0 ms-2">${sessionScope.user.phone}</p>
                                </div>
                                <div class="d-flex align-items-center mt-2">
                                    <i class="uil uil-italic align-text-bottom text-primary h5 mb-0 me-2"></i>
                                    <h6 class="mb-0">Address</h6>
                                    <p class="text-muted mb-0 ms-2">${sessionScope.user.address}</p>
                                </div>
                            </div>    
                            <jsp:include page="/frontend/common/patient_side_bar.jsp" />  

                        </div>
                    </div><!--end col-->

                    <div class="col-lg-8 col-md-6 mt-sm-0 pt-2 pt-sm-0">
                        <div class="card border-0 shadow overflow-hidden">
                            <div class="container-fluid">
                                <div class="layout-specing">
                                    <div class="row mt-3 align-content-center">
                                        <div class="col-xl-3 col-md-3">
                                            <div class="card component-wrapper border-0 rounded shadow">
                                                <div>
                                                    <select class="form-select form-control" id="status_filter" onchange="filter()">
                                                        <option selected disabled>Status</option>
                                                        <option value="all">All</option>
                                                        <option value="CONFIRMED">CONFIRMED</option>
                                                        <option value="PENDING">PENDING</option>
                                                        <option value="RESCHEDULING">RESCHEDULING</option>
                                                        <option value="RESCHEDULED">RESCHEDULED</option>
                                                        <option value="COMPLETED">COMPLETED</option>
                                                        <option value="CANCELED">CANCELED</option>
                                                        <option value="RESCHEDULING">CANCELLING</option>
                                                        <option value="FOLLOW_UP">FOLLOW-UP</option>    
                                                    </select>
                                                </div>
                                            </div>

                                        </div>

                                    </div>  
                                    <div class="col-12 mt-1">
                                        <div class="card component-wrapper border-0 rounded shadow">
                                            <div class="p-4 border-bottom">
                                                <h5 class="mb-0">My Appointment</h5>
                                            </div>
                                            <div class="p-4">
                                                <div class="row pt-2">
                                                    <div class="col-12 ">
                                                        <div class="card component-wrapper border-0 rounded shadow">
                                                            <div>
                                                                <div class="table-responsive bg-white shadow rounded">
                                                                    <table class="table mb-0 table-center">
                                                                        <thead>
                                                                            <tr>
                                                                                <th class="border-bottom p-3" style="min-width: 50px;">#</th>
                                                                                <th class="border-bottom p-3" style="min-width: 200px;">Doctor</th>
                                                                                <th class="border-bottom p-3" style="min-width: 150px;">Date</th>
                                                                                <th class="border-bottom p-3">Time</th>
                                                                                <th class="border-bottom p-3">Status</th>
                                                                                <th class="border-bottom p-3" style="min-width: 150px;">Action</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <c:if test="${not empty apptList}">
                                                                                <c:forEach items="${apptList}" var="appt">
                                                                                    <c:set var="patient" value="${appt.patient}"></c:set>
                                                                                        <tr>
                                                                                            <td class="p-3">${appt.apptId}</td>
                                                                                        <td class="p-3">
                                                                                            <a href="#" class="text-dark">
                                                                                                <div class="d-flex align-items-center">
                                                                                                    <img src="data:image/jpg;base64,${appt.doctor.image}" class="avatar avatar-md-sm rounded-circle border shadow" alt="">
                                                                                                    <span class="ms-2">${appt.doctor.fullName}</span>
                                                                                                </div>
                                                                                            </a>
                                                                                        </td>
                                                                                        <td class="p-3">${appt.apptDate}</td>
                                                                                        <td class="p-3">${appt.apptTime}</td>   
                                                                                        <td class="p-3">${appt.status}</td>
                                                                                        <td class="p-3 d-flex align-items-center">
                                                                                            <div class="">
                                                                                                <a href="user-appointment?action=view-detail&apptId=${appt.apptId}" class="me-3 btn btn-primary btn-sml btn-soft-success">
                                                                                                    View</a>
                                                                                            </div>
                                                                                        </td>
                                                                                    </tr>
                                                                                </c:forEach>
                                                                            </c:if>

                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                            <c:if test="${empty apptList  }" >
                                                                <div class=" text-center alert alert-primary h4" role="alert"> You haven't had any appointments yet. </div>
                                                            </c:if>
                                                        </div>
                                                    </div><!--end col-->
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div><!--end container-->
                            </div>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end container-->
        </section><!--end section-->
        <!-- javascript -->
        <jsp:include page="/frontend/common/footer.jsp" />
        <script>
            function filter() {
                const url = 'http://localhost:8080/MedicalAppointmentBooking/user-appointment?action=filter&status_filter=';
                const filterElement = document.getElementById("status_filter").value;
                window.location.href = url + filterElement;
            }
            function onChange() {
                const password = document.querySelector('input[name=newpassword]');
                const confirm = document.querySelector('input[name=confirmpassword]');

                if (confirm.value === password.value) {
                    confirm.setCustomValidity('');
                } else {
                    confirm.setCustomValidity('Confirm password do not match. Please check again');
                }
            }

        </script>
        <script src= "<c:url value= '/frontend/template/assets/js/bootstrap.bundle.min.js'/>"></script>
        <script src= "<c:url value= '/frontend/template/assets/js/feather.min.js'/>"></script>
        <script src= "<c:url value= '/frontend/template/assets/js/tiny-slider.js'/>"></script>
        <script src= "<c:url value= '/frontend/template/assets/js/app.js'/>"></script>
        <script src= "<c:url value= '/frontend/template/assets/js/tiny-slider.j'/>"></script>
        <script src= "<c:url value= '/frontend/template/assets/js/tiny-slider-init.js'/>"></script>
    </body>

</html>