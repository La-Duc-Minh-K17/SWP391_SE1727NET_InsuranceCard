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
                background-image: url("../template/assets/images/bg/department.jpg") ;
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
                                    <li class="breadcrumb-item"><a href="index.html">MABS</a></li>
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
        <section class="section">
            <div class="container">
                <div class="row">
                    <div class="col-xl-3 col-lg-4 col-md-6 col-12">
                        <div class="card features feature-primary border-0">
                            <div class="icon text-center rounded-md">
                                <i class="ri-eye-fill h3 mb-0"></i>
                            </div>
                            <div class="card-body p-0 mt-3">
                                <a href="#" class="title text-dark h5">Medical treatment at home</a>
                                <p class="text-muted mt-3">The need for meaningful information is paramount,the required of treat,the threat that need, for every word holds the power to heal, comfort, and guide.</p>
                                <a href="#" class="link">Read More <i class="ri-arrow-right-line align-middle"></i></a>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-xl-3 col-lg-4 col-md-6 col-12 mt-5 mt-sm-0">
                        <div class="card features feature-primary border-0">
                            <div class="icon text-center rounded-md">
                                <i class="ri-psychotherapy-fill h3 mb-0"></i>
                            </div>
                            <div class="card-body p-0 mt-3">
                                <a href="#" class="title text-dark h5">Endoscopy</a>
                                <p class="text-muted mt-3">where expertise meets the intricacies of the human body, the demand for informative content is abundant to illuminate the path to health and well-being..</p>
                                <a href="#" class="link">Read More <i class="ri-arrow-right-line align-middle"></i></a>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-xl-3 col-lg-4 col-md-6 col-12 mt-5 mt-lg-0">
                        <div class="card features feature-primary border-0">
                            <div class="icon text-center rounded-md">
                                <i class="ri-stethoscope-fill h3 mb-0"></i>
                            </div>
                            <div class="card-body p-0 mt-3">
                                <a href="#" class="title text-dark h5">Specialized</a>
                                <p class="text-muted mt-3">Each field holds its unique significance, the demand for informative content is abundant to navigate the solutions.</p>
                                <a href="#" class="link">Read More <i class="ri-arrow-right-line align-middle"></i></a>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-xl-3 col-lg-4 col-md-6 col-12 mt-5 mt-xl-0">
                        <div class="card features feature-primary border-0">
                            <div class="icon text-center rounded-md">
                                <i class="ri-capsule-fill h3 mb-0"></i>
                            </div>
                            <div class="card-body p-0 mt-3">
                                <a href="#" class="title text-dark h5">Medical Equpipment Rental</a>
                                <p class="text-muted mt-3">Precision and access to technology are vital, there is a wealth of informative content to assist in meeting your healthcare needs.</p>
                                <a href="#" class="link">Read More <i class="ri-arrow-right-line align-middle"></i></a>
                            </div>
                        </div>
                    </div><!--end col-->
                    
                    <div class="col-xl-3 col-lg-4 col-md-6 col-12 mt-4 pt-2">
                        <div class="card features feature-primary border-0">
                            <div class="icon text-center rounded-md">
                                <i class="ri-microscope-fill h3 mb-0"></i>
                            </div>
                            <div class="card-body p-0 mt-3">
                                <a href="#" class="title text-dark h5">Orthopedic</a>
                                <p class="text-muted mt-3">There is now an abundance of readable dummy texts required purely to fill a space.</p>
                                <a href="#" class="link">Read More <i class="ri-arrow-right-line align-middle"></i></a>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-xl-3 col-lg-4 col-md-6 col-12 mt-4 pt-2">
                        <div class="card features feature-primary border-0">
                            <div class="icon text-center rounded-md">
                                <i class="ri-pulse-fill h3 mb-0"></i>
                            </div>
                            <div class="card-body p-0 mt-3">
                                <a href="#" class="title text-dark h5">Cardiology</a>
                                <p class="text-muted mt-3">There is now an abundance of readable dummy texts required purely to fill a space.</p>
                                <a href="#" class="link">Read More <i class="ri-arrow-right-line align-middle"></i></a>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-xl-3 col-lg-4 col-md-6 col-12 mt-4 pt-2">
                        <div class="card features feature-primary border-0">
                            <div class="icon text-center rounded-md">
                                <i class="ri-empathize-fill h3 mb-0"></i>
                            </div>
                            <div class="card-body p-0 mt-3">
                                <a href="#" class="title text-dark h5">Gynecology</a>
                                <p class="text-muted mt-3">There is now an abundance of readable dummy texts required purely to fill a space.</p>
                                <a href="#" class="link">Read More <i class="ri-arrow-right-line align-middle"></i></a>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-xl-3 col-lg-4 col-md-6 col-12 mt-4 pt-2">
                        <div class="card features feature-primary border-0">
                            <div class="icon text-center rounded-md">
                                <i class="ri-mind-map h3 mb-0"></i>
                            </div>
                            <div class="card-body p-0 mt-3">
                                <a href="#" class="title text-dark h5">Neurology</a>
                                <p class="text-muted mt-3">There is now an abundance of readable dummy texts required purely to fill a space.</p>
                                <a href="#" class="link">Read More <i class="ri-arrow-right-line align-middle"></i></a>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-xl-3 col-lg-4 col-md-6 col-12 mt-4 pt-2">
                        <div class="card features feature-primary border-0">
                            <div class="icon text-center rounded-md">
                                <i class="ri-mental-health-line h3 mb-0"></i>
                            </div>
                            <div class="card-body p-0 mt-3">
                                <a href="#" class="title text-dark h5">Dermatologists</a>
                                <p class="text-muted mt-3">There is now an abundance of readable dummy texts required purely to fill a space.</p>
                                <a href="#" class="link">Read More <i class="ri-arrow-right-line align-middle"></i></a>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-xl-3 col-lg-4 col-md-6 col-12 mt-4 pt-2">
                        <div class="card features feature-primary border-0">
                            <div class="icon text-center rounded-md">
                                <i class="ri-apple-line h3 mb-0"></i>
                            </div>
                            <div class="card-body p-0 mt-3">
                                <a href="#" class="title text-dark h5">Nutritionists</a>
                                <p class="text-muted mt-3">There is now an abundance of readable dummy texts required purely to fill a space.</p>
                                <a href="#" class="link">Read More <i class="ri-arrow-right-line align-middle"></i></a>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-xl-3 col-lg-4 col-md-6 col-12 mt-4 pt-2">
                        <div class="card features feature-primary border-0">
                            <div class="icon text-center rounded-md">
                                <i class="ri-infrared-thermometer-line h3 mb-0"></i>
                            </div>
                            <div class="card-body p-0 mt-3">
                                <a href="#" class="title text-dark h5">Physical Therapists</a>
                                <p class="text-muted mt-3">There is now an abundance of readable dummy texts required purely to fill a space.</p>
                                <a href="#" class="link">Read More <i class="ri-arrow-right-line align-middle"></i></a>
                            </div>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end container-->
        </section><!--end section-->
        <!-- End -->

        
        
            <jsp:include page="/frontend/common/footer.jsp" />
            <!-- End -->
            <!-- Back to top -->
            <a href="#" onclick="topFunction()" id="back-to-top" class="btn btn-icon btn-pills btn-primary back-to-top"><i data-feather="arrow-up" class="icons"></i></a>
            <!-- Back to top -->
            <!-- Offcanvas Start -->
                            <div class="offcanvas-body p-4 px-md-5">
                    <div class="row">
                        <div class="col-12">
                            <!-- Style switcher -->
                            <div id="style-switcher">
                                <div>
                                    <ul class="text-center list-unstyled mb-0">
                                    </ul>
                                </div>
                            </div>
                            <!-- end Style switcher -->
                        </div><!--end col-->
                    </div><!--end row-->
                </div>
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
