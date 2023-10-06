
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
        <style>
            #home{
                background-image: url("frontend/template/assets/images/bg/backgroundclinic.jpg") ;
            }
        </style>
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
                                <form class="rounded text-start shadow p-4 bg-white-50">
                                    <div class="row align-items-center">
                                        <div class="col-md">
                                            <div class="input-group bg-white border rounded" style="opacity: 0.7;">
                                                <span class="input-group-text bg-white border-0"></span>
                                                <input name="name" id="location" type="text" class="form-control border-0" placeholder="">
                                            </div>
                                        </div>
                                        <div class="col-md-auto mt-4 mt-sm-0">
                                            <div class="d-grid d-md-block">
                                                <button type="submit" class="btn btn-primary">Search</button>
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
                            <h4 class="title mb-4">Our Medical Services</h4>
                            <p class="text-muted mx-auto para-desc mb-0">Discover a wide spectrum of high-quality medical services at MABS. From preventive care to specialized treatments, our dedicated team of professionals is here to support your health and well-being. Trust us for comprehensive, compassionate, and cutting-edge medical care.</p>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->

                <div class="row">
                    <div class="col-xl-3 col-md-4 col-12 mt-5">
                        <div class="card features feature-primary bg-transparent border-0">
                            <div class="icon text-center rounded-md">
                                <img src="frontend/template/assets/images/about/homemedical.png" height="40"></img>
                            </div>
                            <div class="card-body p-0 mt-3">
                                <a href="departments.html" class="title text-dark h5">Medical treatment at home</a>
                                <p class="text-muted mt-3">The need for meaningful information is paramount,the required of treat,the threat that need, for every word holds the power to heal, comfort, and guide.</p>

                            </div>
                        </div>
                    </div><!--end col-->
                    <div class="col-xl-3 col-md-4 col-12 mt-5">
                        <div class="card features feature-primary bg-transparent border-0">
                            <div class="icon text-center rounded-md">
                                <img src="frontend/template/assets/images/about/pediatric.png" height="40"></img>
                            </div>
                            <div class="card-body p-0 mt-3">
                                <a href="departments.html" class="title text-dark h5">Pediatric</a>
                                <p class="text-muted mt-3">where the well-being of our youngest treasures is paramount, the need for informative and engaging content is abundant to nurture their growth and health.</p>
                                <a href="departments.html" class="link">Read More <i class="ri-arrow-right-line align-middle"></i></a>
                            </div>
                        </div>
                    </div><!--end col-->
                    <div class="col-xl-3 col-md-4 col-12 mt-5">
                        <div class="card features feature-primary bg-transparent border-0">
                            <div class="icon text-center rounded-md">
                                <img src="frontend/template/assets/images/about/internal.png" height="40"></img>
                            </div>
                            <div class="card-body p-0 mt-3">
                                <a href="departments.html" class="title text-dark h5">Endoscopy</a>
                                <p class="text-muted mt-3">where expertise meets the intricacies of the human body, the demand for informative content is abundant to illuminate the path to health and well-being.</p>
                                <a href="departments.html" class="link">Read More <i class="ri-arrow-right-line align-middle"></i></a>
                            </div>
                        </div>
                    </div><!--end col-->
                    <div class="col-xl-3 col-md-4 col-12 mt-5">
                        <div class="card features feature-primary bg-transparent border-0">
                            <div class="icon text-center rounded-md">
                                <img src="frontend/template/assets/images/about/ear-nose-mouth.png" height="40"></img>
                            </div>
                            <div class="card-body p-0 mt-3">
                                <a href="departments.html" class="title text-dark h5">ENT</a>
                                <p class="text-muted mt-3">where precision and care converge, the need for informative content is abundant to guide you through the sounds, scents, and sensations of health.</p>
                                <a href="departments.html" class="link">Read More <i class="ri-arrow-right-line align-middle"></i></a>
                            </div>
                        </div>
                    </div><!--end col-->
                    <div class="col-xl-3 col-md-4 col-12 mt-5">
                        <div class="card features feature-primary bg-transparent border-0">
                            <div class="icon text-center rounded-md">
                                <img src="frontend/template/assets/images/about/specialize.png" height="40"></img>
                            </div>
                            <div class="card-body p-0 mt-3">
                                <a href="departments.html" class="title text-dark h5">Specialized</a>
                                <p class="text-muted mt-3">Each field holds its unique significance, the demand for informative content is abundant to navigate the solutions.</p>
                                <a href="departments.html" class="link">Read More <i class="ri-arrow-right-line align-middle"></i></a>
                            </div>
                        </div>
                    </div><!--end col-->
                    <div class="col-xl-3 col-md-4 col-12 mt-5">
                        <div class="card features feature-primary bg-transparent border-0">
                            <div class="icon text-center rounded-md">
                                <img src="frontend/template/assets/images/about/vaccination.png" height="40"></img>
                            </div>
                            <div class="card-body p-0 mt-3">
                                <a href="departments.html" class="title text-dark h5">Vaccination</a>
                                <p class="text-muted mt-3">Science safeguards our future, the need for informative content is abundant to educate, protect, and ensure a healthier tomorrow.</p>
                                <a href="departments.html" class="link">Read More <i class="ri-arrow-right-line align-middle"></i></a>
                            </div>
                        </div>
                    </div><!--end col-->
                    <div class="col-xl-3 col-md-4 col-12 mt-5">
                        <div class="card features feature-primary bg-transparent border-0">
                            <div class="icon text-center rounded-md">
                                <i class="ri-empathize-fill h3 mb-0"></i>
                            </div>
                            <div class="card-body p-0 mt-3">
                                <a href="departments.html" class="title text-dark h5">Business health check</a>
                                <p class="text-muted mt-3">Success meets strategy, there's an abundance of insightful content to evaluate, optimize, and ensure the vitality of your enterprise.</p>
                                <a href="departments.html" class="link">Read More <i class="ri-arrow-right-line align-middle"></i></a>
                            </div>
                        </div>
                    </div><!--end col-->
                    <div class="col-xl-3 col-md-4 col-12 mt-5">
                        <div class="card features feature-primary bg-transparent border-0">
                            <div class="icon text-center rounded-md">
                                <img src="frontend/template/assets/images/about/bussinesshealthcheck.png" height="40"/>
                            </div>
                            <div class="card-body p-0 mt-3">
                                <a href="departments.html" class="title text-dark h5">Medical Equpipment Rental</a>
                                <p class="text-muted mt-3">Precision and access to technology are vital, there is a wealth of informative content to assist in meeting your healthcare needs.</p>
                                <a href="departments.html" class="link">Read More <i class="ri-arrow-right-line align-middle"></i></a>
                            </div>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end container-->
            <!-- Start -->
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
                        <a href="#" class="btn btn-soft-primary">View More Doctors </a>
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
                    <div >
                        <a href="#" class="btn btn-soft-primary"> View More Blogs </a>
                    </div>

                </div><!--end row-->

                <div class="row">
                    <div class="col-lg-12 mt-4 pt-4 m-4">
                        <div class="slider-range-four">  
                            <div class="tiny-slide">
                                <div class="card blog blog-primary border-0 shadow rounded overflow-hidden m-1">
                                    <img src="frontend/template/assets/images/blog/03.jpg" class="img-fluid" alt="">
                                    <div class="card-body p-4">
                                        <ul class="list-unstyled mb-2">
                                            <li class="list-inline-item text-muted small me-3"><i class="uil uil-calendar-alt text-dark h6 me-1"></i>20th November, 2020</li>
                                            <li class="list-inline-item text-muted small"><i class="uil uil-clock text-dark h6 me-1"></i>5 min read</li>
                                        </ul>
                                        <a href="blog-detail.html" class="text-dark title h5">medicine research course for doctors</a>
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


                            <div class="tiny-slide">
                                <div class="card blog blog-primary border-0 shadow rounded overflow-hidden m-1">
                                    <img src="frontend/template/assets/images/blog/07.jpg" class="img-fluid" alt="">
                                    <div class="card-body p-4">
                                        <ul class="list-unstyled mb-2">
                                            <li class="list-inline-item text-muted small me-3"><i class="uil uil-calendar-alt text-dark h6 me-1"></i>20th November, 2020</li>
                                            <li class="list-inline-item text-muted small"><i class="uil uil-clock text-dark h6 me-1"></i>5 min read</li>
                                        </ul>
                                        <a href="blog-detail.html" class="text-dark title h5">A Researcher Is Research On Coronavirus In Lab</a>
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
                        </div>
                    </div><!--end col-->
                </div><!--end row-->
            </div>
        </section><!--end section-->
        <!-- End -->
        <jsp:include page="/frontend/common/footer.jsp" />
        <script src= "<c:url value= '/frontend/template/assets/js/bootstrap.bundle.min.js'/>"></script>
        <script src= "<c:url value= '/frontend/template/assets/js/feather.min.js'/>"></script>
        <script src= "<c:url value= '/frontend/template/assets/js/tiny-slider.js'/>"></script>
        <script src= "<c:url value= '/frontend/template/assets/js/app.js'/>"></script>
        <script src= "<c:url value= '/frontend/template/assets/js/tiny-slider.j'/>"></script>
        <script src= "<c:url value= '/frontend/template/assets/js/tiny-slider-init.js'/>"></script>
    </body>

</html> 