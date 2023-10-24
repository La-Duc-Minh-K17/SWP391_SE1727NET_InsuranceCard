<%-- 
    Document   : booking
    Created on : Oct 4, 2023, 9:37:32 PM
    Author     : Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>MABS</title>
        <!-- favicon -->
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
        <jsp:include page="/frontend/common/header.jsp" />
        <section  class="bg-half-150 d-table w-100 bg-light" style="padding: 150px 0 90px 0;">
            <div class="container">
                <div class="row  justify-content-center">
                    <div class="col-12"  ">
                        <div class="section-title text-center">
                            <h3 class="sub-title mb-2">Booking Appointment</h3>
                            <p class="para-desc mx-auto text-muted">Great doctor if you need your family member to get
                                effective immediate assistance, emergency treatment or a simple consultation.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <c:if test="${error != null}">
                            <div class="alert alert-error">${requestScope.error}</div>
                        </c:if>
                        <c:set var="isApptOrResv" value="resv"></c:set>
                        <c:if test="${sessionScope.chosen_doctor != null}">
                            <c:set var="isApptOrResv" value="appt"></c:set>
                        </c:if>
                        <div class="card border-0 shadow rounded overflow-hidden">
                            <c:if test="${sessionScope.chosen_doctor != null}">
                                <div class="mb-4">
                                    <div class="bg-white rounded shadow overflow-hidden">
                                        <div class="text-center avatar-profile margin-nagative mt-5 position-relative pb-4 border-bottom">
                                            <c:if test="${sessionScope.chosen_doctor.img == 'default'}">
                                                <img src="/frontend/template/assets/images/avatar.png" class="rounded-circle shadow-md avatar avatar-md-md"
                                                     alt="">
                                            </c:if>
                                            <c:if test="${sessionScope.chosen_doctor.img != 'default'}">
                                                <img src="data:image/png;base64,${sessionScope.chosen_doctor.image}" class="rounded-circle shadow-md avatar avatar-md-md" alt="">
                                            </c:if>
                                            <h5 class="mt-3 mb-1"></h5>
                                        </div>

                                        <div class="list-unstyled p-4">
                                            <div class="d-flex align-items-center mt-3">
                                                <h6 class="mb-0">Full Name: </h6>
                                                <p class="text-muted mb-0 ms-2">
                                                    ${sessionScope.chosen_doctor.fullName}
                                                </p>
                                            </div>
                                            <div class="d-flex align-items-center mt-3">
                                                <h6 class="mb-0">Position : </h6>
                                                <p class="text-muted mb-0 ms-2">
                                                    ${sessionScope.chosen_doctor.position}
                                                </p>
                                            </div>
                                            <div class="d-flex align-items-center mt-3">
                                                <h6 class="mb-0">Speciality : </h6>
                                                <p class="text-muted mb-0 ms-2">
                                                    ${sessionScope.chosen_doctor.speciality}
                                                </p>
                                            </div>
                                            <div class="d-flex align-items-center mt-3">
                                                <h6 class="mb-0">Fee: </h6>
                                                <p class="text-muted mb-0 ms-2">
                                                    ${sessionScope.chosen_doctor.serviceFee}
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${sessionScope.chosen_service != null}">
                                <div class="mb-4">
                                    <div class="bg-white rounded shadow overflow-hidden">
                                        <div class="p-4 border-bottom">
                                            <h6 class="mb-0">Service Information</h6>
                                        </div>
                                        <br><br><br>
                                        <div
                                            class="text-center avatar-profile margin-nagative mt-n5 position-relative pb-4 border-bottom">
                                            <c:if test="${sessionScope.chosen_service.service_image == 'default'}">
                                                <img src="assets/images/avata.png" class="rounded-circle shadow-md avatar avatar-md-md"
                                                     alt="">
                                            </c:if>
                                            <c:if test="${sessionScope.chosen_service.service_image != 'default'}">
                                                <img src="data:image/png;base64,${sessionScope.chosen_service.service_image}"
                                                     class="rounded-circle shadow-md avatar avatar-md-md" alt="">
                                            </c:if>
                                            <h5 class="mt-3 mb-1">${sessionScope.chosen_service.service_name}</h5>
                                        </div>
                                        <div class="list-unstyled p-4">
                                            <div class="d-flex align-items-center mt-3">
                                                <h6 class="mb-0">Fee: </h6>
                                                <p class="text-muted mb-0 ms-2">
                                                    ${sessionScope.chosen_service.fee}
                                                </p>
                                            </div>
                                            <div class="d-flex align-items-center mt-3">
                                                <h6 class="mb-0">Description: </h6>
                                                <p class="text-muted mb-0 ms-2">
                                                    ${sessionScope.chosen_service.service_description}
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>

                            <div class="tab-content p-4" id="pills-tabContent">
                                <div class="tab-pane fade show active" id="pills-clinic" role="tabpanel" aria-labelledby="clinic-booking">
                                    <form action="<c:url value='/booking?action=yourself-booking'/> " method="post">
                                        <div class="row">
                                            <div class="p-6 ">
                                                <h6 class="mb-2 h5">Patient Information</h6>
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Patient Name <span class="text-danger">*</span></label>
                                                    <input name="name" type="text" class="form-control" placeholder="Patient Name :" value="${sessionScope.user.fullName}">
                                                </div>
                                            </div><!--end col-->
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Your Email <span class="text-danger">*</span></label>
                                                    <input name="email" type="email" class="form-control" placeholder="@example.com" value="${sessionScope.user.email}">
                                                </div> 
                                            </div><!--end col-->
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Your Phone <span class="text-danger">*</span></label>
                                                    <input name="phone" id="phone" type="tel" class="form-control" placeholder="Your Phone :" value="${sessionScope.user.phone}">
                                                </div> 
                                            </div><!--end col-->
                                            <div class="col-md-6 ">
                                                <div class="mb-3">
                                                    <label class="form-label">Gender <span class="text-danger">*</span></label>
                                                </div>
                                                <div class=" d-flex justify-content-around radio-group"> <!-- Group for radio buttons -->

                                                    <c:if test="${sessionScope.user.gender == 1 }">
                                                        <label for="male">Male</label>
                                                        <input type="radio" checked="checked" name="gender" value="Male" required>
                                                        <label for="female">Female</label>
                                                        <input type="radio"  name="gender" value="Female" required>
                                                    </c:if>
                                                    <c:if test="${sessionScope.user.gender == 0 }">
                                                        <label for="male">Male</label>
                                                        <input type="radio" name="gender" value="Male" required>
                                                        <label for="female">Female</label>
                                                        <input type="radio" checked="checked" name="gender" value="Female" required>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Date of Birth<span class="text-danger">*</span></label>
                                                    <input name="dob"  type="date" class="flatpickr flatpickr-input form-control" id="dob" value="${sessionScope.user.dob}">
                                                </div> 
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Address <span class="text-danger">*</span></label>
                                                    <input name="address" class="form-control" placeholder="Address:" value="${sessionScope.user.address}">
                                                </div>
                                            </div><!--end col-->
                                            <div class="p-6">
                                                <h6 class="mb-2 h5">Appointment Information</h6>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Date : </label>
                                                    <input id="checkin-date" required="" name="appt-date" type="date"class="flatpickr flatpickr-input form-control"  >
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Time</label>
                                                    <select id ="time"required="" name="appt-time"
                                                            class="form-control department-name select2input">
                                                        <option>Select Time</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Examination Reason <span class="text-danger">*</span></label>
                                                    <textarea name="appt-reason" rows="5" class="form-control" placeholder="Your Heath Status:"></textarea>
                                                </div>
                                            </div><!--end col-->
                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Choose payment method</label>
                                                    <select name="payment" class="form-control department-name select2input">
                                                        <option check="checked" value="">
                                                            Pay later at the medical facility</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="d-grid">
                                                    <div class="alert alert-primary alert-danger">
                                                        <p style="text-align: justify; "><b>NOTE</b></p>
                                                        <p style="text-align: justify; ">
                                                            Please fill in all information to save time during examination procedures</p>
                                                    </div>
                                                </div>
                                            </div><!--end col-->
                                            <div class="col-lg-12">
                                                <div class="d-grid">
                                                    <button type="submit" class="btn btn-primary">Book An Appointment</button>
                                                </div>
                                            </div><!--end col-->
                                        </div><!--end row-->
                                    </form>
                                </div>


                            </div>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end container-->
        </section><!--end section-->
        <jsp:include page="/frontend/common/footer.jsp" />
        <script src= "<c:url value= '/frontend/template/assets/js/bootstrap.bundle.min.js'/>"></script>
        <script src= "<c:url value= '/frontend/template/assets/js/feather.min.js'/>"></script>
        <script src= "<c:url value= '/frontend/template/assets/js/app.js'/>"></script>
        <script src="<c:url value= '/frontend/template/assets/js/select2.min.js'/>"></script>
        <script src="<c:url value= '/frontend/template/assets/js/select2.init.js'/>"></script>
        <script src="<c:url value= '/frontend/template/assets/js/jquery.timepicker.min.js'/>"></script>
        <script src="<c:url value= '/frontend/template/assets/js/timepicker.init.js'/>"></script>
        <script>
            $("#checkin-date").flatpickr({
                minDate: "today",
                maxDate: new Date().fp_incr(7)
            });
            $(document).ready(function () {

                $("#checkin-date").change(function () {
                    $("#time").find("option").remove();
                    $("#time").append("<option>Select Time</option>");

                    let chosendate = $("#checkin-date").val();
                    let data;

                    if ('${isApptOrResv}' === 'appt') {
                        data = {
                            type: "appointment",
                            chosenDate: chosendate,
                            doctor_id: '${sessionScope.chosen_doctor.doctorId}'
                        };
                    } else {
                        data = {
                            type: "reservation",
                            chosenDate: chosendate,
                            service_id: '${sessionScope.chosen_service.service_id}'
                        };
                    }


                    $.ajax({
                        url: "CheckAvailabilityServlet",
                        method: "GET",
                        data: data,
                        success: function (data, textStatus, jqXHR) {

                            let obj = $.parseJSON(data);

                            $.each(obj, function (key, value) {
                                if ('${isApptOrResv}' === 'appt') {
                                    $("#time").append(
                                            '<option value="' + value.slotTime + '">' + value.slotTime + "</option>"
                                            );
                                } else {
                                    $("#time").append(
                                            '<option value="' + value + '">' + value + "</option>"
                                            );
                                }
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
    </body>
</html>