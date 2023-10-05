<%-- 
    Document   : booking
    Created on : Oct 4, 2023, 9:37:32 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <div class="container ">
            <div class="row justify-content-center">

                <div class="col-lg-7">
                    <div class="bg-white rounded shadow overflow-hidden">
                        <div class="p-4 border-bottom">
                            <h6 class="mb-0">Doctor Information</h6>
                        </div>
                        <br><br><br><br><br>
                        <div class="text-center avatar-profile margin-nagative mt-n5 position-relative pb-4 border-bottom">
                            <c:if test="${sessionScope.doctor.img == 'default'}">
                                <img src="assets/images/avata.png" class="rounded-circle shadow-md avatar avatar-md-md"
                                    alt="">
                            </c:if>
                            <c:if test="${sessionScope.doctor.img != 'default'}">
                                <img src="data:image/png;base64,${sessionScope.doctor.img}" class="rounded-circle shadow-md avatar avatar-md-md" alt="">
                            </c:if>
                            <h5 class="mt-3 mb-1"></h5>
                        </div>

                        <div class="list-unstyled p-4">
                            <div class="d-flex align-items-center mt-3">
                                <h6 class="mb-0">Full Name: </h6>
                                <p class="text-muted mb-0 ms-2">

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
                                    <fmt:formatNumber pattern="#,###,###,###" value="" /> đ
                                </p>
                            </div>

                        </div>
                    </div>
                </div>


                <div class="col-lg-7">
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
                                    đ
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

                <div class="col-lg-7">
                    <div class="card border-0 shadow rounded overflow-hidden">
                        <div class="tab-content p-4" id="pills-tabContent">
                            <form action="book?type=checkout" method="POST">
                                <div class="row">
                                    <div class="p-6">
                                        <h6 class="mb-0">Patient Information</h6>
                                    </div>
                                    <br><br>
                                    <div class="col-lg-6">
                                        <div class="mb-3">
                                            <label class="form-label">Full Name</label>
                                            <input class="form-control" value=" " readonly="">
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="mb-3">
                                            <label class="form-label">Phone</label>
                                            <input type="text" class="form-control" value="" readonly="">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <label class="form-label">Email</label>
                                            <input type="text" class="form-control" value="" readonly="">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <label class="form-label">Date of birth</label>
                                            <input type="date" class="form-control" value="" readonly="">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <label class="form-label">Address</label>
                                            <input type="text" class="form-control" value="" readonly="">
                                        </div>
                                    </div>
                                    <br>
                                    <div class="p-6">
                                        <h6 class="mb-0">Appointment Information</h6>
                                    </div>
                                    <br><br>
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
                                            <label class="form-label">Examination Reason<span
                                                    class="text-danger">*</span></label>
                                            <textarea required="" name="description" id="comments2" rows="4"
                                                class="form-control"></textarea>
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label class="form-label">Payment Method</label>
                                            <select name="payment" oninvalid="Select(this);" oninput="Select(this);"
                                                id="mySelect" class="form-control ">
                                                <option selected="" readonly>Choose payment methods</option>
                                                <option value="default">Thanh toán sau khi khám</option>
                                                <option value="vnpay">Thanh toán thông qua VNPay</option>
                                            </select>
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-lg-12">
                                        <div class="d-grid">
                                            <button type="submit" style="display: none" id="booking"
                                                class="default btn btn-primary">Đặt lịch</button>
                                            <button type="submit" style="display: none" id="booking"
                                                class="vnpay btn btn-primary">Thanh toán</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </section>


    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/flatpickr.min.js"></script>
    <script src="../assets/js/flatpickr.init.js"></script>
    <script src="../assets/js/select2.min.js"></script>
    <script src="../assets/js/select2.init.js"></script>
    <script src="../assets/js/jquery.timepicker.min.js"></script>
    <script src="../assets/js/timepicker.init.js"></script>
    <script src="../assets/js/feather.min.js"></script>
    <script src="../assets/js/app.js"></script>
    
   

</body>
</html>
