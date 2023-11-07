<%-- 
    Document   : admin_appointmentdetail
    Created on : Oct 19, 2023, 2:40:48 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Appointment Detail Page</title>
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/frontend/template/assets/images/favicon.ico.png">
        <!-- Bootstrap -->
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <!-- SLIDER -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/frontend/template/assets/css/tiny-slider.css"/>
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/select2.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/frontend/template/assets/css/flatpickr.min.css">
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/jquery.timepicker.min.css" rel="stylesheet" type="text/css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="<c:url value= '/frontend/template/assets/js/flatpickr.min.js'/>"></script>
    </head>

    <body>
        <div class="page-wrapper doctris-theme toggled">
            <jsp:include page="/frontend/common/manager_side_bar.jsp" />

            <main class="page-content bg-light">
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
                                            src="data:image/jpg;base64,${sessionScope.user.image}"
                                            class="avatar avatar-ex-small rounded-circle" alt=""></button>
                                    <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3"
                                         style="min-width: 200px;">
                                        <a class="dropdown-item d-flex align-items-center text-dark"
                                           <img src="data:image/jpg;base64,${sessionScope.user.image}"
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
                        <div class="row">
                            <div class="col-lg-6 col-md-6">
                                <div class="bg-white rounded shadow overflow-hidden">
                                    <div class="p-4 border-bottom">
                                        <h5 class="mb-0">Patient Information</h5>
                                    </div>
                                    <br><br><br><br><br>
                                    <div class="text-center avatar-profile margin-nagative mt-n5 position-relative pb-4 border-bottom">
                                        <c:if test="${appt.patient.image == 'default'}">
                                            <img src="frontend/template/assets/images/patient.jpg" class="rounded-circle shadow-md avatar avatar-md-md" alt="">
                                        </c:if>
                                        <c:if test="${appt.patient.image != 'default'}">
                                            <img src="data:image/png;base64,${appt.patient.image}" class="rounded-circle shadow-md avatar avatar-md-md" alt="">
                                        </c:if>
                                        <h5 class="mt-3 mb-1">${appt.patient.fullName}</h5>
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
                                            <p class="text-muted mb-0 ms-2">${appt.patient.phone}</p>
                                        </div>
                                        <div class="d-flex align-items-center mt-2">
                                            <i class="uil uil-mailbox align-text-bottom text-primary h5 mb-0 me-2"></i>
                                            <h6 class="mb-0">Email</h6>
                                            <p class="text-muted mb-0 ms-2">${appt.patient.email}</p>
                                        </div>
                                        <div class="d-flex align-items-center mt-2">
                                            <i class="uil uil-calendar-alt align-text-bottom text-primary h5 mb-0 me-2"></i>
                                            <h6 class="mb-0">Date Of Birth</h6>
                                            <p class="text-muted mb-0 ms-2">${appt.patient.dob}</p>
                                        </div>
                                        <div class="d-flex align-items-center mt-2">
                                            <i class="uil uil-globe align-text-bottom text-primary h5 mb-0 me-2"></i>
                                            <h6 class="mb-0">Address</h6>
                                            <p class="text-muted mb-0 ms-2">${appt.patient.address}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 ">
                                <div class="bg-white rounded shadow overflow-hidden">
                                    <div class="p-4 border-bottom">
                                        <h5 class="mb-0">Doctor Information</h5>
                                    </div>
                                    <br><br><br><br><br>
                                    <div class="text-center avatar-profile margin-nagative mt-n5 position-relative pb-4 border-bottom">
                                        <c:if test="${appt.doctor.image == 'default'}">
                                            <img src="../template/assets/images/avatar.png" class="rounded-circle shadow-md avatar avatar-md-md" alt="">
                                        </c:if>
                                        <c:if test="${appt.doctor.image != 'default'}">
                                            <img src="data:image/png;base64,${appt.doctor.image}" class="rounded-circle shadow-md avatar avatar-md-md" alt="">
                                        </c:if>
                                        <h5 class="mt-3 mb-1">${appt.doctor.fullName}</h5>
                                    </div>

                                    <div class="list-unstyled p-4">
                                        <div class="d-flex align-items-center mt-2">
                                            <i class="uil uil-user align-text-bottom text-primary h5 mb-0 me-2"></i>
                                            <h6 class="mb-0">Gender</h6>
                                            <c:if test="${appt.doctor.gender == 1}">
                                                <p class="text-muted mb-0 ms-2">Male</p>
                                            </c:if>
                                            <c:if test="${appt.doctor.gender == 0}">
                                                <p class="text-muted mb-0 ms-2">Female</p>
                                            </c:if>     
                                        </div>

                                        <div class="d-flex align-items-center mt-2">
                                            <i class="uil uil-phone align-text-bottom text-primary h5 mb-0 me-2"></i>
                                            <h6 class="mb-0">Phone Contact</h6>
                                            <p class="text-muted mb-0 ms-2">${appt.doctor.phone}</p>
                                        </div>
                                        <div class="d-flex align-items-center mt-2">
                                            <i class="uil uil-mailbox align-text-bottom text-primary h5 mb-0 me-2"></i>
                                            <h6 class="mb-0">Email</h6>
                                            <p class="text-muted mb-0 ms-2">${appt.doctor.email}</p>
                                        </div>
                                        <div class="d-flex align-items-center mt-2">
                                            <i class="uil uil-book-open align-text-bottom text-primary h5 mb-0 me-2"></i>
                                            <h6 class="mb-0">Speciality</h6>
                                            <p class="text-muted mb-0 ms-2">${appt.doctor.speciality}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row"> 
                            <div class="card border-0 shadow overflow-hidden mt-4 col-lg-6 col-md-6">
                                <div class="p-4 border-bottom">
                                    <h5 class="mb-0">Appointment Details</h5>
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
                                                <p class="">${appt.status}</p>
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
                                        <div class="col-lg-6">
                                            <div class="mb-3">
                                                <label class="form-label"> Reschedule Reason</label>
                                                <p>${appt.rescheduleReason}</p>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="mb-3">
                                                <label class="form-label">Reject Reason</label>
                                                <p>${appt.rejectReason}</p>
                                            </div>
                                        </div>
                                    </div>
                                    <c:if test="${ appt.status ==  'PENDING' || appt.status == 'RESCHEDULED'}">
                                        <div class="d-flex justify-content-between">
                                            <div class="mt-3">
                                                <a href="manage-appointmentdetail?action=confirm&apptId=${appt.apptId}"class="btn btn-primary ">Confirm Appointment</a>
                                            </div>
                                            <c:if test = "${appt.status ==  'PENDING'}">    
                                                <div class="mt-3">
                                                    <a href="#cancelappointment" class="btn btn-primary btn-danger " 
                                                       data-bs-toggle="modal" data-bs-target="#cancelappointment" onclick="cancelAppt(this)" data-id="${appt.apptId}">
                                                        Reject Appointment</a>
                                                </div>
                                                <div class="modal fade"  id="cancelappointment" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog "style="max-width: 500px;"  >
                                                        <div class="modal-content">
                                                            <div class="modal-body py-5">
                                                                <div class="text-center">
                                                                    <div class="icon d-flex align-items-center justify-content-center bg-soft-danger rounded-circle mx-auto" style="height: 95px; width:95px;">
                                                                        <i class="uil uil-times-circle h1 mb-0"></i>
                                                                    </div>
                                                                    <div class="mt-4">
                                                                        <h4>Reject Appointment</h4>
                                                                        <p class="para-desc mx-auto text-muted mb-0">This appointment will be rejected.Are you sure ?</p>
                                                                        <div class="mt-4">
                                                                            <form action="<c:url value='manage-appointmentdetail?action=reject'></c:url>" method="post">
                                                                                    <textarea rows="5" class="form-control" name="reject_reason" placeholder="Your reason" required></textarea>
                                                                                    <br> <br> <br>
                                                                                    <input type="hidden" id="cancel_appointment" name="cancel_appointment" value="">
                                                                                    <input type="submit" class="btn btn-soft-danger" name="cancel" value="Reject">
                                                                                </form>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                            </c:if>
                                        </div>
                                    </c:if>
                                </div>

                            </div>
                            <c:if test="${(appt.status ==  'PENDING' && appt.doctor != null)|| appt.status == 'RESCHEDULED'}">
                                <div class="card border-0 shadow overflow-hidden mt-4 col-lg-6 col-md-6">  
                                    <form action="<c:url value='manage-appointmentdetail?action=reassign&apptId=${appt.apptId}'/>" method="post">
                                        <div class="bg-white rounded shadow overflow-hidden">
                                            <div class="p-4 border-bottom">
                                                <h5 class="mb-0">Assign new appointment</h5>
                                            </div>
                                            <div class="col-md-6 p-3">
                                                <div class="mb-3">
                                                    <label class="form-label">Choose doctor: </label>
                                                    <select required="" class="form-select form-control" name="doctor" id="doctor">
                                                        <c:forEach var="d" items="${doctorL}">
                                                            <option value="${d.doctorId }">${d.fullName}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6 p-3">
                                                <div class="">
                                                    <label class="form-label">Select Appointment Date: </label>
                                                    <input required="" id="checkin-date" required="" name="appt-date" value="${appt.apptDate}" type="date"class="flatpickr flatpickr-input form-control"  >
                                                </div>
                                            </div>
                                            <div class="col-md-6 p-3">
                                                <div class="">
                                                    <label class="form-label">Select Appointment Time:</label>
                                                    <select id ="time"required="" name="appt-time" class="form-control department-name select2input" required="">
                                                        <option readonly>Select Time</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6 p-3 d-flex ">
                                                <div class="me-5">
                                                    <input type="submit" id="reassign" class="btn btn-primary" value="Assign"> </input>
                                                </div>

                                                <div class="">
                                                    <input type="submit" id="remove" class="btn btn-primary" value="Remove"> </input>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </c:if>

                            <c:if test="${appt.status ==  'PENDING' && appt.doctor == null   }">
                                <div class="card border-0 shadow overflow-hidden mt-4 col-lg-6 col-md-6">  
                                    <form action="<c:url value='manage-appointmentdetail?action=reassign&apptId=${appt.apptId}'/>" method="post">
                                        <div class="bg-white rounded shadow overflow-hidden">
                                            <div class="p-4 border-bottom">
                                                <h5 class="mb-0">Assign doctor to appointment</h5>
                                            </div>
                                            <div class="col-md-6 p-3">
                                                <div class="mb-3">
                                                    <label class="form-label">Choose Apartment: </label>
                                                    <select id="speciality" required="" class="form-select form-control" >
                                                        <c:forEach items="${speList}" var="spe">
                                                            <option value="${spe.id}">${spe.speName}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>

                                                <div class="mb-3">
                                                    <label class="form-label">Choose doctor: </label>
                                                    <select required="" class="form-select form-control" name="doctor" id="doctor">
                                                        <option readonly>Select Doctor</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6 p-3">
                                                <div class="">
                                                    <label class="form-label">Select Appointment Date: </label>
                                                    <input required="" id="checkin-date" required="" name="appt-date" value="${appt.apptDate}" type="date"class="flatpickr flatpickr-input form-control"  >
                                                </div>
                                            </div>
                                            <div class="col-md-6 p-3">
                                                <div class="">
                                                    <label class="form-label">Select Appointment Time:</label>
                                                    <select id ="time"required="" name="appt-time" class="form-control department-name select2input" required="">
                                                        <option readonly>Select Time</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6 p-3">
                                                <div class="">
                                                    <input type="submit" id="reassign" class="btn btn-primary" value="Update"> </input>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </c:if>
                        </div>            
                    </div>           
                </div>
            </main>
        </div>
        <script>
            $("#checkin-date").flatpickr({
                minDate: "today",
                maxDate: new Date().fp_incr(7)
            });
            function cancelAppt(appt) {
                var dataId = appt.getAttribute('data-id');
                let cancel_appt = document.getElementById('cancel_appointment');
                cancel_appt.value = dataId;
            }
            $(document).ready(function () {
                $("#speciality").change(function () {
                    $("#doctor").find("option").remove();
                    $("#doctor").append("<option>Select Doctor</option>");

                    let data = {
                        type: "doctor",
                        speciality_id: $("#speciality").val()
                    };

                    $.ajax({
                        url: "CheckAvailabilityServlet",
                        method: "GET",
                        data: data,
                        success: function (data, textStatus, jqXHR) {

                            let obj = $.parseJSON(data);
                            $.each(obj, function (key, value) {
                                $("#doctor").append(
                                        '<option value="' + value.doctorId + '">' + value.fullName + "</option>"
                                        );
                            });
                            $("select").formSelect();
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#time").append("<option>No Time Slot Unavailable</option>");
                        },
                        cache: false
                    });
                });

                $("#checkin-date").change(function () {
                    $("#time").find("option").remove();
                    $("#time").append("<option>Select Time</option>");
                    let chosendate = $("#checkin-date").val();
                    let data = {
                        type: "appointment",
                        chosenDate: chosendate,
                        doctor_id: $("#doctor").val()
                    };

                    $.ajax({
                        url: "CheckAvailabilityServlet",
                        method: "GET",
                        data: data,
                        success: function (data, textStatus, jqXHR) {

                            let obj = $.parseJSON(data);
                            $.each(obj, function (key, value) {
                                $("#time").append(
                                        '<option value="' + value + '">' + value + "</option>"
                                        );
                            });
                            $("select").formSelect();
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#time").append("<option>No Time Slot Unavailable</option>");
                        },
                        cache: false
                    });
                });

            });
        </script>
        <script src= "<c:url value= '/frontend/template/assets/js/bootstrap.bundle.min.js'/>"></script>
        <script src= "<c:url value= '/frontend/template/assets/js/feather.min.js'/>"></script>
        <script src= "<c:url value= '/frontend/template/assets/js/app.js'/>"></script>
        <script src="<c:url value= '/frontend/template/assets/js/select2.min.js'/>"></script>
        <script src="<c:url value= '/frontend/template/assets/js/select2.init.js'/>"></script>
        <script src="<c:url value= '/frontend/template/assets/js/jquery.timepicker.min.js'/>"></script>
        <script src="<c:url value= '/frontend/template/assets/js/timepicker.init.js'/>"></script>

    </body>
</html>
