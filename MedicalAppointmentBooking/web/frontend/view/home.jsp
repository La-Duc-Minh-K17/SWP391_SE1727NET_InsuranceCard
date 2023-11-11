
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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
        <link rel="stylesheet" href="frontend/template/assets/css/flatpickr.min.css">
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/jquery.timepicker.min.css" rel="stylesheet" type="text/css" />

    </head>
    <body>

        <jsp:include page="/frontend/common/header.jsp" />

        <section class="bg-half-170 d-table w-100" id="home">
            <div class="bg-overlay bg-overlay-dark"></div>
            <div class="container">
                <div class="row justify-content-center mt-5">
                    <div class="col-xl-10">
                        <div class="heading-title text-center">
                            <img src="frontend/template/assets/images/logo-icon.png" height="50" alt="">
                            <h4 class="heading fw-bold text-white title-dark mt-3 mb-4">Booking Your Appointments</h4>
                            <p class="para-desc mx-auto text-white-50 mb-0">Great doctor if you need your family member to get effective immediate assistance, emergency treatment or a simple consultation.</p>

                            <div class="mt-4 pt-2">
                                <form class="rounded shadow p-3 ">
                                    <div class="row align-items-center justify-content-center">
                                        <div class="col-md-auto mt-4 mt-sm-0">
                                            <div class="d-grid d-md-block">
                                                <a href="frontend/view/bookingnodoctor.jsp" class="btn btn-primary">Book your appointment</a>
                                            </div>
                                        </div><!--end col-->
                                    </div><!--end row-->
                                </form><!--end form-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="section py-5 bg-light">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="d-flex">
                            <i class="uil uil-briefcase h1 mb-0 text-primary"></i>
                            <div class="ms-3 ms-lg-4">
                                <h5>Our Mission</h5>
                                <p class="text-muted mb-0">Our mission is clear: to provide exceptional healthcare that empowers individuals to lead healthier, happier lives.</p>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-md-4 mt-4 pt-2 mt-sm-0 pt-sm-0">
                        <div class="d-flex">
                            <i class="uil uil-airplay h1 mb-0 text-primary"></i>
                            <div class="ms-3 ms-lg-4">
                                <h5>Our Vision</h5>
                                <p class="text-muted mb-0">Our vision is to create a healthier tomorrow for all by ensuring access to quality healthcare and promoting well-being in the communities we serve.</p>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-md-4 mt-4 pt-2 mt-sm-0 pt-sm-0">
                        <div class="d-flex">
                            <i class="uil uil-flip-v h1 mb-0 text-primary"></i>
                            <div class="ms-3 ms-lg-4">
                                <h5>Who We Are ?</h5>
                                <p class="text-muted mb-0"> MABS is your trusted healthcare partner, providing compassionate and innovative medical services for 10 years.</p>
                            </div>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end container-->
        </section><!--end section-->

        <section class="section bg-white pb-0">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-5 col-md-6">
                        <div class="position-relative">
                            <img src="frontend/template/assets/images/about/about-2.png" class="img-fluid" alt="">

                        </div>
                    </div><!--end col-->
                    <div class="col-lg-7 col-md-6 mt-4 pt-2 mt-sm-0 pt-sm-0">
                        <div class="section-title ms-lg-5">
                            <span class="badge badge-pill badge-soft-primary">About MABS</span>
                            <h4 class="title mt-3 mb-4">Good Services And Better <br> Health By Our Specialists</h4>
                            <p class="para-desc text-muted">Welcome to MABS, where your health is our mission. With a legacy of 10 years in healthcare excellence, we're dedicated to providing compassionate, patient-centered care. Our team of experienced professionals is committed to your well-being, utilizing cutting-edge technology to ensure the best possible outcomes. We're not just a healthcare provider; we're your trusted partner on your journey to better health.</p>

                        </div>
                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end container-->
            <div class="container mt-100 mt-60">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <div class="section-title mb-4 pb-2 text-center">
                            <span class="badge badge-pill badge-soft-primary mb-3">Services</span>
                            <h4 class="title mb-4">Our Best Services</h4>
                            <p class="text-muted mx-auto para-desc mb-0">Discover a wide spectrum of high-quality medical services at MABS. From preventive care to specialized treatments, our dedicated team of professionals is here to support your health and well-being. Trust us for comprehensive, compassionate, and cutting-edge medical care.</p>
                        </div>
                        <div class="d-flex justify-content-end ">
                            <a href="/MedicalAppointmentBooking/service?action=view-all" class="btn btn-soft-primary">More Services </a>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->
                <div class="row justify-content-center">
                    <c:forEach items="${requestScope.service}" var="s" varStatus="loop">
                        <div class="col-md-4 mt-4">
                            <div class="card mb-4">
                                <div class="card-img-container">
                                    <img src="data:image/jpg;base64,${s.service_image}" class="card-img-top" alt="${s.service_name}">
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title text-primary">${s.service_name}</h5>
                                    <div class="card-text">
                                        <p class="text-secondary">${s.service_description}</p>
                                    </div>
                                    <h5 class="text-muted">$${s.fee}</h5>
                                </div>
                                <div class="card-end">
                                    <a href="servicedetail?action=view-detail&id=${s.service_id}&category_id=${s.category_id}"  class="btn btn-primary custom-button">Learn More</a>
                                    <a href="service?action=book-service&id=${s.service_id}" class="btn btn-success custom-button">Appointment Now</a>
                                </div>
                            </div>

                        </div>
                        <c:if test="${loop.index % 3 == 3}">
                            <div class="w-100"></div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </section>
        <section class="section bg-white">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <div class="section-title mb-1 pb-2 text-center">
                            <span class="badge badge-pill badge-soft-primary mb-3">Doctors</span>
                            <h4 class="title mb-2">Find Your Specialists</h4>
                            <p class="text-muted mx-auto para-desc mb-0">We've assembled a team of highly skilled and compassionate specialists to address your unique healthcare needs. Whether you're seeking a primary care physician or a specialized expert, you can trust our doctors to provide personalized care that puts your health first. Search our directory to find the perfect specialist for you.</p>
                        </div>
                    </div><!--end col-->
                    <div class="d-flex justify-content-end ">

                        <a href="/MedicalAppointmentBooking/WebDoctorList" class="btn btn-soft-primary">View More Doctors </a>
                    </div>
                </div><!--end row-->

                <div class="row">
                    <div class="col-lg-12 mt-2 pt-4 m-4">
                        <div class="slider-range-three">
                            <c:forEach items="${requestScope.doctors}" var="d">
                                <div class="tiny-slide">
                                    <div class="card blog blog-primary border-0 shadow rounded overflow-hidden m-1">
                                        <div class="d-flex justify-content-center">
                                            <img src="data:image/jpg;base64,${d.image}" width="80%" height="220" />
                                        </div>
                                        <div class="card-body p-4">
                                            <div class="card-body content text-center">
                                                <a href="#"
                                                   class="title text-dark  d-block mb-0">${d.fullName}</a>
                                                <small class="text-muted speciality">${d.speciality}</small>
                                            </div>

                                            <div class="post-meta d-flex justify-content-around mt-3">
                                                <div>
                                                    <a href="#" class="btn btn-primary btn-sm">Book Appointment</a></div>
                                                <div>
                                                    <a href="#" class="btn btn-primary btn-sm">View Details</a>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                    </div>
                </div><!--end row-->
            </div>
        </section><!--end section-->

        <section class=" bg-white">
            <div class="container mt-70 mt-70">
                <div class="d-flex justify-content-between">
                    <div class="">
                        <div class="section-title">
                            <h4 class="title mb-0 text-muted">Medical Blogs</h4>
                        </div>
                    </div>
                    <div>
                        <a href="/MedicalAppointmentBooking/new" class="btn btn-soft-primary"> View More Blogs </a>
                    </div>

                </div><!--end row-->

                <div class="row">
                    <div class="col-lg-12 mt-4 pt-4 m-4">
                        <div class="slider-range-four">  
                            <c:forEach var="blog" items="${data}">
                                <div class="tiny-slide">
                                    <div class="card blog blog-primary border-0 shadow rounded overflow-hidden m-1">
                                        <img src="frontend/template/assets/images/blog/03.jpg" class="img-fluid" alt="">
                                        <div class="card-body p-4">
                                            <ul class="list-unstyled mb-2">
                                                <li class="list-inline-item text-muted small me-3"><i class="uil uil-calendar-alt text-dark h6 me-1"></i>${blog.created_time}</li>
                                                <li class="list-inline-item text-muted small"><i class="uil uil-clock text-dark h6 me-1"></i>5 min read</li>
                                            </ul>
                                            <a href="blog-detail.html" class="text-dark title h5">${blog.title}</a>
                                            <div class="post-meta d-flex justify-content-between mt-3">
                                                <ul class="list-unstyled mb-0">
                                                    <li class="list-inline-item me-2 mb-0"><a href="#" class="text-muted like"><i class="mdi mdi-heart-outline me-1"></i>33</a></li>
                                                    <li class="list-inline-item"><a href="#" class="text-muted comments"><i class="mdi mdi-comment-outline me-1"></i>08</a></li>
                                                </ul>
                                                <a href="blog-detail.html" class="link">Read More <i class="mdi mdi-chevron-right align-middle"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->
            </div>
        </section><!--end section-->
        <!-- End -->
        <script>
            function viewServiceDetails(serviceId, categoryId) {
                var url = "servicedetail?action=view-detail&id=" + serviceId + "&category_id=" + categoryId;
                window.location.href = url;
            }

            function search() {
                var searchInput = document.getElementById("searchInput").value;
                var url = "home"; // Default action
            }

            window.location.href = url;
            }


        </script>
        <style>
            #home{
                background-image: url("frontend/template/assets/images/bg/backgroundclinic.jpg") ;

            }
            .custom-center {
                justify-content: center !important;
            }
            .card {
                height: 100%;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                text-align: center;
            }

            .card-end {
                display: flex;
                flex-direction: column;
                align-items: center;
                padding: 10px; /* Adjust padding as needed */
            }

            .custom-button {
                width: 100%;
                margin: 5px 0;
            }

            .service-card-container {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
            }

            .card {
                flex: 1;
                margin: 0 1rem; /* Adjust margin as needed for spacing between cards */
                width: 100%; /* Set the width to 100% for full container width */
                max-width: 400px; /* Adjust the max-width as needed for the desired card size */
                height: 400px; /* Adjust the height as needed for the desired card size */
            }
            .card-img-container {
                height: 200px;
                overflow: hidden;
            }
            /* CSS để cân đối các dòng chữ trong card */
            .card {
                height: 100%;
                display: flex;
                flex-direction: column;
            }
            .card-body {
                flex: 1;
            }

            .card-title,
            .card-text {
                text-align: center;
                justify-content: center;
            }
            .card-title,
            .card-text {
                margin-bottom: 15px; /* Khoảng cách giữa các dòng chữ */
            }

            .btn-primary {
                align-self: center; /* Để căn giữa nút "Learn More" */
            }

            .card-img-container img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }
            /* CSS để cân đối nút "Learn More" trong card */
            .card {
                height: 100%;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                text-align: center;
            }


            .custom-button {
                width: 100%; /* Đảm bảo rằng nút có chiều ngang 100% của phần tử cha */
                margin: 5px 0; /* Khoảng cách giữa các nút */
            }
            .btn-primary {
                margin-top: auto; /* Để nút "Learn More" ở dưới cùng */
            }
            .custom-button {
                width: 100%; /* Đảm bảo rằng nút có chiều ngang 100% của phần tử cha */

            }
            body {
                margin: 0;
                padding: 0;
                display: flex;
                flex-direction: column;
                min-height: 100vh;
            }

            .wrapper {
                flex: 1;
            }
            .footer {
                background-color: #333; /* Set the background color of your footer */
                color: white; /* Set the text color of your footer */
                text-align: center;
                padding: 20px;
                width: 100%;
            }
        </style>
        <jsp:include page="/frontend/common/footer.jsp" />
        <script src= "<c:url value= '/frontend/template/assets/js/bootstrap.bundle.min.js'/>"></script>
        <script src= "<c:url value= '/frontend/template/assets/js/feather.min.js'/>"></script>
        <script src= "<c:url value= '/frontend/template/assets/js/tiny-slider.js'/>"></script>
        <script src= "<c:url value= '/frontend/template/assets/js/app.js'/>"></script>
        <script src= "<c:url value= '/frontend/template/assets/js/tiny-slider.j'/>"></script>
        <script src= "<c:url value= '/frontend/template/assets/js/tiny-slider-init.js'/>"></script>
    </body>
</html> 