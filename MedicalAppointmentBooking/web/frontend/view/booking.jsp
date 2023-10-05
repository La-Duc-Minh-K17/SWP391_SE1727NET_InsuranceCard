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
        <style>
            #home{
                background-image: url("frontend/template/assets/images/bg/backgroundclinic.jpg") ;
            }
        </style>
    </head>

    <body>

        <section class="bg-half-170 d-table w-100 bg-light">
            <div class="container">
                <div class="row mt-5 justify-content-center">
                    <div class="col-12">
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
                        <div class="card border-0 shadow rounded overflow-hidden">
                            <div class="mb-4">
                                <div class="bg-white rounded shadow overflow-hidden">
                                    <div class="text-center avatar-profile margin-nagative mt-5 position-relative pb-4 border-bottom">
                                        <c:if test="${sessionScope.doctor.img == 'default'}">
                                            <img src="/frontend/template/assets/images/avatar.png" class="rounded-circle shadow-md avatar avatar-md-md"
                                                 alt="">
                                        </c:if>
                                        <c:if test="${sessionScope.doctor.img != 'default'}">
                                            <img src="data:image/png;base64," class="rounded-circle shadow-md avatar avatar-md-md" alt="">
                                        </c:if>
                                        <h5 class="mt-3 mb-1"></h5>
                                    </div>

                                    <div class="list-unstyled p-4">
                                        <div class="d-flex align-items-center mt-3">
                                            <h6 class="mb-0">Full Name: </h6>
                                            <p class="text-muted mb-0 ms-2">
                                                Helloworld
                                            </p>
                                        </div>
                                        <div class="d-flex align-items-center mt-3">
                                            <h6 class="mb-0">Position : </h6>
                                            <p class="text-muted mb-0 ms-2">
                                                adsfdf
                                            </p>
                                        </div>
                                        <div class="d-flex align-items-center mt-3">
                                            <h6 class="mb-0">Speciality : </h6>
                                            <p class="text-muted mb-0 ms-2">
                                                adsfdf
                                            </p>
                                        </div>
                                        <div class="d-flex align-items-center mt-3">
                                            <h6 class="mb-0">Fee: </h6>
                                            <p class="text-muted mb-0 ms-2">
                                                100$
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="mb-4">
                                <div class="bg-white rounded shadow overflow-hidden">
                                    <div class="p-4 border-bottom">
                                        <h6 class="mb-0">Service Information</h6>
                                    </div>
                                    <br><br><br>
                                    <div
                                        class="text-center avatar-profile margin-nagative mt-n5 position-relative pb-4 border-bottom">
                                        <c:if test="${sessionScope.service.img == 'default'}">
                                            <img src="assets/images/avata.png" class="rounded-circle shadow-md avatar avatar-md-md"
                                                 alt="">
                                        </c:if>
                                        <c:if test="${sessionScope.service.img != 'default'}">
                                            <img src="data:image/png;base64,${sessionScope.service.img}"
                                                 class="rounded-circle shadow-md avatar avatar-md-md" alt="">
                                        </c:if>
                                        <h5 class="mt-3 mb-1">${sessionScope.service.title}</h5>
                                    </div>

                                    <div class="list-unstyled p-4">
                                        <div class="d-flex align-items-center mt-3">
                                            <h6 class="mb-0">Fee: </h6>
                                            <p class="text-muted mb-0 ms-2">
                                            <fmt:formatNumber pattern="#,###,###,###" value="" />
                                            </p>
                                        </div>
                                        <div class="d-flex align-items-center mt-3">
                                            <h6 class="mb-0">Description: </h6>
                                            <p class="text-muted mb-0 ms-2">

                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <ul class="nav nav-pills nav-justified flex-column flex-sm-row rounded-0 shadow overflow-hidden bg-light mb-0" id="pills-tab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link rounded-0 active" id="clinic-booking" data-bs-toggle="pill" href="#pills-clinic" role="tab" aria-controls="pills-clinic" aria-selected="false">
                                        <div class="text-center pt-1 pb-1">
                                            <h4 class="title fw-normal mb-0">Booking for yourself</h4>
                                        </div>
                                    </a><!--end nav link-->
                                </li><!--end nav item-->

                                <li class="nav-item">
                                    <a class="nav-link rounded-0" id="online-booking" data-bs-toggle="pill" href="#pills-online" role="tab" aria-controls="pills-online" aria-selected="false">
                                        <div class="text-center pt-1 pb-1">
                                            <h4 class="title fw-normal mb-0">Booking for relatives</h4>
                                        </div>
                                    </a><!--end nav link-->
                                </li><!--end nav item-->
                            </ul>

                            <div class="tab-content p-4" id="pills-tabContent">
                                <div class="tab-pane fade show active" id="pills-clinic" role="tabpanel" aria-labelledby="clinic-booking">

                                    <form>
                                        <div class="row">
                                            <div class="p-6 ">
                                                <h6 class="mb-2 h5">Patient Information</h6>
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Patient Name <span class="text-danger">*</span></label>
                                                    <input name="name" id="name" type="text" class="form-control" placeholder="Patient Name :">
                                                </div>
                                            </div><!--end col-->
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Your Email <span class="text-danger">*</span></label>
                                                    <input name="email" id="email" type="email" class="form-control" placeholder="Your email :">
                                                </div> 
                                            </div><!--end col-->

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Your Phone <span class="text-danger">*</span></label>
                                                    <input name="phone" id="phone" type="tel" class="form-control" placeholder="Your Phone :">
                                                </div> 
                                            </div><!--end col-->
                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Date of Birth<span class="text-danger">*</span></label>
                                                    <input name="dob"  type="date" class="flatpickr flatpickr-input form-control" id="dob">
                                                </div> 
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Address <span class="text-danger">*</span></label>
                                                    <input name="address" class="form-control" placeholder="Address:">
                                                </div>
                                            </div><!--end col-->
                                            <div class="p-6">
                                                <h6 class="mb-2 h5">Appointment Information</h6>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label"> Date : </label>
                                                    <input required="" name="date" type="text"
                                                           class="flatpickr flatpickr-input form-control" id="checkin-date">
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Time</label>
                                                    <select required="" name="time"
                                                            class="form-control department-name select2input">
                                                        <option value="7:00">7:00</option>
                                                        <option value="8:00">8:00</option>
                                                        <option value="9:00">9:00</option>
                                                        <option value="10:00">10:00</option>
                                                        <option value="11:00">11:00</option>
                                                        <option value="14:00">14:00</option>
                                                        <option value="15:00">15:00</option>
                                                        <option value="16:00">16:00</option>
                                                        <option value="17:00">17:00</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-lg-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Examination Reason <span class="text-danger">*</span></label>
                                                    <textarea name="comments" id="comments" rows="4" class="form-control" placeholder="Your Heath Status:"></textarea>
                                                </div>
                                            </div><!--end col-->
                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Choose payment method</label>
                                                    <select required="" name="payment"
                                                            class="form-control department-name select2input">

                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="d-grid">
                                                    <button type="submit" class="btn btn-primary">Book An Appointment</button>
                                                </div>
                                            </div><!--end col-->
                                        </div><!--end row-->
                                    </form>
                                </div>

                                <div class="tab-pane fade" id="pills-online" role="tabpanel" aria-labelledby="online-booking">
                                   <form>
                                        <div class="row">
                                              <div class="p-6 ">
                                                <h6 class="mb-2 h5">Booker Information</h6>
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Booker Name <span class="text-danger">*</span></label>
                                                    <input name="name" id="name" type="text" class="form-control" placeholder="Patient Name :">
                                                </div>
                                            </div><!--end col-->
                                            <div class="col-lg-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Booker Phone<span class="text-danger">*</span></label>
                                                    <input name="name" id="name" type="text" class="form-control" placeholder="Patient Name :">
                                                </div>
                                            </div><!--end col-->
                                            <div class="p-6 ">
                                                <h6 class="mb-2 h5">Patient Information</h6>
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Patient Name <span class="text-danger">*</span></label>
                                                    <input name="name" id="name" type="text" class="form-control" placeholder="Patient Name :">
                                                </div>
                                            </div><!--end col-->
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Your Email <span class="text-danger">*</span></label>
                                                    <input name="email" id="email" type="email" class="form-control" placeholder="Your email :">
                                                </div> 
                                            </div><!--end col-->

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Your Phone <span class="text-danger">*</span></label>
                                                    <input name="phone" id="phone" type="tel" class="form-control" placeholder="Your Phone :">
                                                </div> 
                                            </div><!--end col-->
                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Date of Birth<span class="text-danger">*</span></label>
                                                    <input name="dob"  type="date" class="flatpickr flatpickr-input form-control" id="dob1">
                                                </div> 
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Address <span class="text-danger">*</span></label>
                                                    <input name="address" class="form-control" placeholder="Address:">
                                                </div>
                                            </div><!--end col-->
                                            <div class="p-6">
                                                <h6 class="mb-2 h5">Appointment Information</h6>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label"> Date : </label>
                                                    <input required="" name="date" type="text"
                                                           class="flatpickr flatpickr-input form-control" id="checkin-date1">
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Time</label>
                                                    <select required="" name="time"
                                                            class="form-control department-name select2input">
                                                        <option value="7:00">7:00</option>
                                                        <option value="8:00">8:00</option>
                                                        <option value="9:00">9:00</option>
                                                        <option value="10:00">10:00</option>
                                                        <option value="11:00">11:00</option>
                                                        <option value="14:00">14:00</option>
                                                        <option value="15:00">15:00</option>
                                                        <option value="16:00">16:00</option>
                                                        <option value="17:00">17:00</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-lg-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Examination Reason <span class="text-danger">*</span></label>
                                                    <textarea name="comments" id="comments" rows="4" class="form-control" placeholder="Your Heath Status:"></textarea>
                                                </div>
                                            </div><!--end col-->
                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label class="form-label">Choose payment method</label>
                                                    <select required="" name="payment"
                                                            class="form-control department-name select2input">

                                                    </select>
                                                </div>
                                            </div>
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

        <script src= "<c:url value= '/frontend/template/assets/js/bootstrap.bundle.min.js'/>"></script>
        <script src= "<c:url value= '/frontend/template/assets/js/feather.min.js'/>"></script>
        <script src= "<c:url value= '/frontend/template/assets/js/app.js'/>"></script>
        <script src="<c:url value= '/frontend/template/assets/js/jquery.min.js'/>"></script>
        <script src="<c:url value= '/frontend/template/assets/js/flatpickr.init.js'/>"></script>
        <script src="<c:url value= '/frontend/template/assets/js/flatpickr.min.js'/>"></script>
        <script src="<c:url value= '/frontend/template/assets/js/select2.min.js'/>"></script>
        <script src="<c:url value= '/frontend/template/assets/js/select2.init.js'/>"></script>
        <script src="<c:url value= '/frontend/template/assets/js/jquery.timepicker.min.js'/>"></script>
        <script src="<c:url value= '/frontend/template/assets/js/timepicker.init.js'/>"></script>
        <script>
            $("#checkin-date").flatpickr({
                defaultDate: "today",
                minDate: "today",
                maxDate: new Date().fp_incr(7),
                dateFormat: "d/m/Y"

            });
            $("#dob").flatpickr({
                defaultDate: new Date(),
                dateFormat: "d/m/Y"
            });
            
             $("#checkin-date1").flatpickr({
                defaultDate: "today",
                minDate: "today",
                maxDate: new Date().fp_incr(7),
                dateFormat: "d/m/Y"

            });
            $("#dob1").flatpickr({
                defaultDate: new Date(),
                dateFormat: "d/m/Y"
            });
        </script>

    </body>
</html>
