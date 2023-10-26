

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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/frontend/template/assets/css/tiny-slider.css"/>
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/select2.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/frontend/template/assets/css/flatpickr.min.css">
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/jquery.timepicker.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/remixicon.css"  type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/frontend/template/assets/css/style.min.css" type="text/css">
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/otherStyle.css" rel="stylesheet" type="text/css" />


    </head>
    <body>
        <jsp:include page="/frontend/common/header.jsp" />
        <section class="bg-hero mt-4">
            <div class="container">
                <div class="row mt-lg-5">
                    <div class="col-md-6 col-lg-4">
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
                            <c:if test="${sessionScope.user.role.role_name == 'PATIENT'}">
                                <jsp:include page="/frontend/common/patient_side_bar.jsp" />  
                            </c:if>

                        </div>
                    </div><!--end col-->

                    <div class="col-lg-8 col-md-6 mt-4 mt-sm-0 pt-2 pt-sm-0">
                        <div class="card border-0 shadow overflow-hidden">
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
                        </div><!--end col-->
                        <div class="card border-0 shadow overflow-hidden mt-4 ">
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
                        <div class="card border-0 shadow overflow-hidden mt-4 ">
                            <div class=" p-3 d-flex justify-content-center ">
                                <div class="me-5">
                                    <a href="#cancelappointment" class="btn btn-primary btn-sml btn-soft-danger" 
                                       data-bs-toggle="modal" data-bs-target="#cancelappointment" onclick="cancelAppt(this)" data-id="${appt.apptId}">
                                        Cancel</a>
                                    <div class="modal fade"  id="cancelappointment" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog "style="max-width: 500px;"  >
                                            <form action="<c:url value='/admin-reservation?action=cancel'></c:url>" method="post">
                                                    <div class="modal-content">
                                                        <div class="modal-body py-5">
                                                            <div class="text-center">
                                                                <div class="icon d-flex align-items-center justify-content-center bg-soft-danger rounded-circle mx-auto" style="height: 95px; width:95px;">
                                                                    <i class="uil uil-times-circle h1 mb-0"></i>
                                                                </div>
                                                                <div class="mt-4">
                                                                    <h4>Cancel Reservation</h4>
                                                                    <p class="para-desc mx-auto text-muted mb-0">This appointment will be canceled.Are you sure ?</p>
                                                                    <div class="mt-4">
                                                                        <textarea type="text" class="form-control" name="cancel_reason" placeholder="Your reason"> </textarea>
                                                                        <br>
                                                                        <input type="hidden" id="cancel_appointment" name="appointment_canceled " value="">
                                                                        <input type="submit" class="btn btn-soft-danger" name="cancel" value="Cancel">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="">
                                        <a href="#rescheduleappointment" class="btn btn-primary btn-sml" 
                                           data-bs-toggle="modal" data-bs-target="#rescheduleappointment" onclick="reschedule(this)" data-id="${appt.apptId}">
                                        Reschedule</a>
                                    <div class="modal fade"  id="rescheduleappointment" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog "style="max-width: 500px;"  >
                                            <form action="<c:url value='/admin-reservation?action=cancel'></c:url>" method="post">
                                                    <div class="modal-content">
                                                        <div class="modal-body py-5">
                                                            <div class="text-center">
                                                                <div class="icon d-flex align-items-center justify-content-center bg-soft-danger rounded-circle mx-auto" style="height: 95px; width:95px;">
                                                                    <i class="uil uil-times-circle h1 mb-0"></i>
                                                                </div>
                                                                <div class="mt-4">
                                                                    <h4>Delete Reservation</h4>
                                                                    <p class="para-desc mx-auto text-muted mb-0">This appointment will be canceled.Are you sure ?</p>
                                                                    <div class="mt-4">
                                                                        <textarea type="text" class="form-control" name="cancel_reason" placeholder="Your reason"> </textarea>
                                                                        <br>
                                                                        <input type="hidden" id="cancel_appointment" name="reservation_canceled " value="">
                                                                        <input type="submit" class="btn btn-soft-danger" name="cancel" value="Reschedule">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>        
                        </div>
                        </section>

                        <script>
                            function cancelAppt(appt) {
                                var dataId = appt.getAttribute('data-id');
                                let cancel_appt = document.getElementById('cancel_appointment');
                                cancel_appt.value = dataId;
                            }
                        </script>
                    <jsp:include page="/frontend/common/footer.jsp" />
                    <script src= "<c:url value= '/frontend/template/assets/js/bootstrap.bundle.min.js'/>"></script>
                    <script src= "<c:url value= '/frontend/template/assets/js/feather.min.js'/>"></script>
                    <script src= "<c:url value= '/frontend/template/assets/js/tiny-slider.js'/>"></script>
                    <script src= "<c:url value= '/frontend/template/assets/js/app.js'/>"></script>
                    <script src= "<c:url value= '/frontend/template/assets/js/tiny-slider.j'/>"></script>
                    <script src= "<c:url value= '/frontend/template/assets/js/tiny-slider-init.js'/>"></script>
                    </body>
                    </html>