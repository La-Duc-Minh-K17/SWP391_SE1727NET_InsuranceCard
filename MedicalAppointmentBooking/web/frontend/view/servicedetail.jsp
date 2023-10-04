<%-- 
    Document   : servicedetail
    Created on : Oct 3, 2023, 9:40:11 AM
    Author     : PC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>ServicesDetail</title>
        <!-- Favicon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/frontend/template/assets/images/favicon.ico.png">
        <!-- Bootstrap CSS -->
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Custom CSS -->
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <!-- SLIDER CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/frontend/template/assets/css/tiny-slider.css"/>
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/select2.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/frontend/template/assets/css/flatpickr.min.css">
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/jquery.timepicker.min.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <jsp:include page="/frontend/common/header.jsp" />
        <!-- Service Detail Section -->
        <section class="bg-light mt-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <div class="text-center">
                            <p class="mx-auto text-muted">Great doctor if you need your family member to get effective immediate assistance, emergency treatment, or a simple consultation.</p>

                            <nav aria-label="breadcrumb" class="mt-3">
                                <ol class="breadcrumb bg-light rounded bg-transparent">
                                    <li class="breadcrumb-item"><a href="home">MABS</a></li>
                                    <li class="breadcrumb-item"><a href="service">Services</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Services Detail</li>
                                </ol>
                            </nav>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end container-->
        </section><!--end Service Detail Section-->

        <!-- Product Images and Details Section -->
        <section class="container mt-5 m-5 ">
            <div class="row ">
                <c:set value="${requestScope.serviceDetail}" var="s"/>
                <div class="col-md-7">
                    <div class="text-center m-5 " >
                        <img src="data:image/jpg;base64,${s.service_image}" height="70%" width="90%"/>
                        <h4 class="title">${s.service_name}</h4>
                        <h5 class="text-muted">$${s.fee}</h5>
                        <ul class="list-unstyled text-warning h5 mb-0">
                            <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                            <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                            <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                            <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                            <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                            <li class="list-inline-item me-2 h6 text-muted">(20 Ratings)</li>
                        </ul>
                        <div class="m-5">
                        <h5 class="mt-4 py-2">Overview :${s.service_description}</h5>
                        <p class="text-muted">.</p>
                        <div class="col-md-5 text-right">
                            <div class="mt-9 pt-2">
                                <div class="d-flex justify-content-end mr-5">
                                    <a href="#" class="btn btn-primary">Schedule Now</a>
                                </div>
                            </div>
                        </div><!--end col-->
                    </div><!--end row-->
                    </div>
                </div><!--end row-->
        </section><!--end Product Images and Details Section-->

        <jsp:include page="/frontend/common/footer.jsp" />

        <!-- Add your scripts here -->
        <script src="<c:url value='/frontend/template/assets/js/bootstrap.bundle.min.js' />"></script>
        <!-- Icons -->
        <script src="<c:url value='/frontend/template/assets/js/feather.min.js' />"></script>
        <!-- Main Js -->
        <script src="<c:url value='/frontend/template/assets/js/tiny-slider.js' />"></script>
        <script src="<c:url value='/frontend/template/assets/js/app.js' />"></script>
        <script src="<c:url value='/frontend/template/assets/js/tiny-slider.js' />"></script>
        <script src="<c:url value='/frontend/template/assets/js/tiny-slider-init.js' />"></script>
        <!-- End -->
    </body>
</html>
