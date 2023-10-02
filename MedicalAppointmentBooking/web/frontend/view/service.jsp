<%-- 
    Document   : service
    Created on : Sep 26, 2023, 11:34:47 PM
    Author     : PC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Services</title>
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
                background-image: url("frontend/template/assets/images/bg/department.jpg") ;
            }
        </style>
    </head>
    <body>
        <jsp:include page="/frontend/common/header.jsp" />
        <section class="bg-half-170 d-table w-100" id="home"  center center;">
            <div class="bg-overlay bg-overlay-dark"></div>
            <div class="container">
                <div class="row mt-5 justify-content-center">
                    <div class="col-12">
                        <div class="section-title text-center">
                            <h3 class="sub-title mb-4 text-white title-dark">Services</h3>
                            <p class="para-desc mx-auto text-white-50">Great doctor if you need your family member to get effective immediate assistance, emergency treatment or a simple consultation.</p>
                            <nav aria-label="breadcrumb" class="d-inline-block mt-3">
                                <ul class="breadcrumb bg-light rounded mb-0 py-1 px-2">
                                    <li class="breadcrumb-item"><a href="home">MABS</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Services</li>
                                </ul>
                            </nav>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end container-->
        </section><!--end section-->
        <div class="position-relative">
            <div class="shape overflow-hidden text-white">
                <svg viewBox="0 0 2880 48" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M0 48H1437.5H2880V0H2160C1442.5 52 720 0 720 0H0V48Z" fill="currentColor"></path>
                </svg>
            </div>
        </div>
        <!-- End Hero -->

        <!-- Start -->
        <section>
    <div class="container m-7">
       <c:forEach items="${requestScope.services}" var="s">
    <div class="row m-8">
        <div class="col-md-7 mt-4 mt-sm-0 pt-2 pt-sm-0">
            <div class="d-flex section-title m-6">
                <img src="data:image/jpg;base64,${s.service_image}" width="60%" height="80%"/>
                <div class="service-details">
                    <h4 class="title">${s.service_name}</h4>
                    <h5 class="text-muted">${s.fee}</h5>
                </div>
            </div>
        </div><!--end col-->
        <div class="col-md-5 text-right">
            <div class="mt-9 pt-2">
                <ul class="list-unstyled text-warning h5 mb-0">
                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                    <li class="list-inline-item"><i class="mdi mdi-star"></i></li>
                    <li class="list-inline-item me-2 h6 text-muted">(20 Ratings)</li>
                </ul>
                <a href="#" class="btn btn-primary mr-2">Shop Now</a>
                <a href="#" class="btn btn-soft-primary">Add to Cart</a>
            </div>
        </div><!--end col-->
    </div><!--end row-->
</c:forEach>

    </div><!--end container-->
</section><!--end section-->
<!-- End -->



        <jsp:include page="/frontend/common/footer.jsp" />

        <!-- End -->
        <script src= "<c:url value= '/frontend/template/assets/js/bootstrap.bundle.min.js'/>"></script>
        <!-- Icons -->
        <script src= "<c:url value= '/frontend/template/assets/js/feather.min.js'/>"></script>
        <!-- Main Js -->
        <script src= "<c:url value= '/frontend/template/assets/js/tiny-slider.js'/>"></script>
        <script src= "<c:url value= '/frontend/template/assets/js/app.js'/>"></script>
        <script src= "<c:url value= '/frontend/template/assets/js/tiny-slider.js'/>"></script>
        <script src= "<c:url value= '/frontend/template/assets/js/tiny-slider-init.js'/>"></script>
    </body>
</html>
