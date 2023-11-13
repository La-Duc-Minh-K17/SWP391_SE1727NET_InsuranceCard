<%-- 
    Document   : admin_appointmentdetail
    Created on : Oct 19, 2023, 2:40:48 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

            <c:if test="${sessionScope.user.role.role_name == 'ADMIN'}">
                <jsp:include page="/frontend/common/admin_side_bar.jsp" />
            </c:if>
            <c:if test="${sessionScope.user.role.role_name == 'DOCTOR'}">
                <jsp:include page="/frontend/common/doctor_side_bar.jsp" />
            </c:if>
            <c:if test="${sessionScope.user.role.role_name == 'MANAGER'}">
                <jsp:include page="/frontend/common/manager_side_bar.jsp" />
            </c:if>
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
                                            src="/assets/images/doctors/01.jpg"
                                            class="avatar avatar-ex-small rounded-circle" alt=""></button>
                                    <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3"
                                         style="min-width: 200px;">
                                        <a class="dropdown-item d-flex align-items-center text-dark"
                                           <img src="../assets/images/doctors/01.jpg"
                                           class="avatar avatar-md-sm rounded-circle border shadow" alt="">
                                            <div class="flex-1 ms-2">
                                                <span class="d-block mb-1">${sessionScope.user.fullName}</span>
                                                <small class="text-muted"></small>
                                            </div>
                                        </a>
                                        <a class="dropdown-item text-dark" href="dr-profile.html"><span
                                                class="mb-0 d-inline-block me-1"><i
                                                    class="uil uil-setting align-middle h6"></i></span> Profile Settings</a>
                                        <div class="dropdown-divider border-top"></div>
                                        <a class="dropdown-item text-dark" href="<c:url value='/home?action=logout'/>"><span
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
                        <div class="tab-content p-4"> 
                            <div>
                                <form action="<c:url value='/user-profile?action=edit-info'/>" method="post" class="mt-4" enctype="multipart/form-data">
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
                                    </div><!--end row-->
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="mb-3">
                                                <label class="form-label">Full Name</label>
                                                <input name="name" id="name" type="text" class="form-control"
                                                       placeholder="Full Name :" value="${sessionScope.user.fullName}   ">
                                            </div>
                                        </div><!--end col-->

                                        <div class="col-lg-6">
                                            <div class="mb-3">
                                                <label class="form-label">Date of birth </label>
                                                <input name="dob" id="dob" type="date" class="form-control" placeholder="Date of birth :" value="${sessionScope.user.dob}">
                                            </div>
                                        </div><!--end col-->

                                        <div class="col-lg-6">
                                            <div class="mb-3">
                                                <label class="form-label">Your Email</label>
                                                <input name="email" id="email" type="email" class="form-control"
                                                       placeholder="Your email :" value="${sessionScope.user.email}">
                                            </div>
                                        </div><!--end col-->

                                        <div class="col-lg-6">
                                            <div class="mb-3">
                                                <label class="form-label">Phone</label>
                                                <input name="phone" id="phone" type="text" class="form-control"
                                                       placeholder="Phone no:" value="${sessionScope.user.phone}">
                                            </div>
                                        </div><!--end col-->
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
                                </form>
                                <div class="mt-4 pt-2">
                                    <c:if test="${error != null }">
                                        <div class="alert alert-error">${requestScope.error}</div>
                                    </c:if>
                                    <h5 class="mb-0">Change Password :</h5>
                                    <form action="<c:url value='/user-profile?action=change-password'/>" method="post" class="mt-4">
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
                                                <input type="submit" id="submit" name="send" class="btn btn-primary"
                                                       value="Change Password">
                                            </div><!--end col-->
                                        </div><!--end row-->
                                    </form>
                                </div>
                            </div>
                        </div>  
                    </div>           
                </div>
            </main>
        </div>
        <script>

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
