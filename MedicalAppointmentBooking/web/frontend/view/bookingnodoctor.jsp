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
        <section  class="bg-half-260 d-table w-100 bg-light" style="padding: 150px 0 90px 0; background: url('${pageContext.request.contextPath}/frontend/template/assets/images/bg/01.jpg'); background-position: center; background-size: cover" >
            <div class="container">
                <div class="row  justify-content-center">
                    <div class="col-12" >
                        <div class="section-title text-center">
                            <h3 class="sub-title mb-2">Booking Appointment</h3>
                            <p class="para-desc mx-auto text-dark">Great doctor if you need your family member to get
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
                        <div class="card border-0 shadow rounded overflow-hidden">
                            <div class="tab-content p-4" id="pills-tabContent">
                                <div class="tab-pane fade show active" id="pills-clinic" role="tabpanel" aria-labelledby="clinic-booking">
                                    <form action="<c:url value='/booking?action=booking-nodoctor'/> " method="post">
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
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Examination Reason <span class="text-danger">*</span></label>
                                                    <textarea name="appt-reason" rows="5" class="form-control" placeholder="Your Heath Status (Your symptoms):" required=""></textarea>
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

        </script>
    </body>
</html>