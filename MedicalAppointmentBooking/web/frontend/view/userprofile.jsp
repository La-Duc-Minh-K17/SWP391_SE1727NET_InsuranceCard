

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
                            <jsp:include page="/frontend/common/patient_side_bar.jsp" />  
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-6 mt-4 mt-sm-0 pt-2 pt-sm-0">
                        <div class="card border-0 shadow overflow-hidden">
                            <div class="text-center pt-1 pb-1">
                                <h4 class="title fw-normal mb-0">Profile Settings</h4>
                            </div>
                            <c:if test="${success != null}">
                                <div class="alert alert-success">${requestScope.success}</div>
                            </c:if>
                            <div class="tab-content p-4"> 
                                <div>
                                    <form action="user-profile?action=edit-info" method="post" class="mt-4" enctype="multipart/form-data">
                                        <h5 class="mb-0">Personal Information :</h5>
                                        <div class="row align-items-center mt-4">
                                            <div>
                                                <p class="text-muted">Update Image.</p>
                                                <div id="myfileupload">
                                                    <input type="file" name="image" id="uploadfile" name="ImageUpload" onchange="displayThumbnail(this);" />
                                                </div>
                                                <div id="thumbbox" class="mt-3 mb-3">
                                                    <img class="rounded" height="20%" width="30%" alt="Thumb image" 
                                                         id="thumbImage"  src="data:image/jpg;base64,${sessionScope.user.image}" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Full Name</label>
                                                    <input name="name" id="name" type="text" class="form-control"
                                                           placeholder="Full Name :" value="${sessionScope.user.fullName}">
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Date of birth </label>
                                                    <input name="dob" id="dob" type="date" class="form-control" placeholder="Date of birth :"
                                                           value="${sessionScope.user.dob}">
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Your Email</label>
                                                    <input name="email" id="email" type="email" class="form-control"
                                                           placeholder="Your email :" value="${sessionScope.user.email}">
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Phone</label>
                                                    <input name="phone" id="phone" type="text" class="form-control"
                                                           placeholder="Phone no. :" value="${sessionScope.user.phone}">
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Address </label>
                                                    <input name="address" id="address" type="text" class="form-control"
                                                           placeholder="Address :" value="${sessionScope.user.address}">
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="mt-3">
                                                    <div>
                                                        <label class="form-label">Gender</label>
                                                        <div class="form-check">
                                                            <input id="gender-male" name="gender" ${sessionScope.user.gender == 1 ? "checked" : ""} value="1" type="radio" class="form-check-input" required>
                                                            <label for="gender-male" class="form-check-label">Male</label>
                                                        </div>
                                                        <div class="form-check">
                                                            <input id="gender-female" name="gender" ${sessionScope.user.gender == 0 ? "checked" : ""} value="0" type="radio" class="form-check-input" required>
                                                            <label for="gender-female" class="form-check-label">Female</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                        <div class="row">
                                            <div class="col-sm-12">
                                                <input type="submit" id="submit" name="send" class="btn btn-primary"
                                                       value="Save changes">
                                            </div>
                                        </div>
                                    </form><!--end form-->

                                    <div class="mt-4 pt-2">
                                        <c:if test="${error != null }">
                                            <div class="alert alert-danger">${requestScope.error}</div>
                                        </c:if>
                                        <h5 class="mb-0">Change Password :</h5>
                                        <form action="user-profile?action=change-password" method="post" class="mt-4">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="mb-3">
                                                        <label class="form-label">Old password :</label>
                                                        <input name="oldpassword" type="password" class="form-control"
                                                               placeholder="Old password" required="">
                                                    </div>
                                                </div><!--end col-->

                                                <div class="col-lg-12">
                                                    <div class="mb-3">
                                                        <label class="form-label">New password :</label>
                                                        <input name="newpassword" type="password" class="form-control"
                                                               placeholder="New password" required="">
                                                    </div>
                                                </div><!--end col-->

                                                <div class="col-lg-12">
                                                    <div class="mb-3">
                                                        <label class="form-label">Re-type New password :</label>
                                                        <input type="password" class="form-control"
                                                               name="confirmpassword"placeholder="Re-type New password" required="" onchange="onChange()">
                                                    </div>
                                                </div><!--end col-->

                                                <div class="col-lg-12 mt-2 mb-0">
                                                    <input type="submit"  name="send" class="btn btn-primary"
                                                           value="Change Password">
                                                </div><!--end col-->
                                            </div><!--end row-->
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end container-->
        </section><!--end section-->
      
        <jsp:include page="/frontend/common/footer.jsp" />
        <script>
            function onChange() {
                const password = document.querySelector('input[name=newpassword]');
                const confirm = document.querySelector('input[name=confirmpassword]');
                console.log(confirm.value);
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