
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
        <!-- Navbar End -->
        <!-- Start Hero -->
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
                                        </div><!--end col-->
                                        <div class="col-md-auto mt-4 mt-sm-0">
                                            <div class="d-grid d-md-block">
                                                <button type="submit" class="btn btn-primary">Search</button>
                                            </div>
                                        </div><!--end col-->
                                    </div><!--end row-->
                                </form><!--end form-->
                            </div>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end container-->
        </section><!--end section-->
        <!-- End Hero -->
        <!-- Start -->
        <section class="section bg-white pb-0">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-5 col-md-6">
                        <div class="position-relative">
                            <img src="frontend/template/assets/images/about/About1.png" class="img-fluid" alt="">
                            
                        </div>
                    </div><!--end col-->
                    <div class="col-lg-7 col-md-6 mt-4 pt-2 mt-sm-0 pt-sm-0">
                        <div class="section-title ms-lg-5">
                            <span class="badge badge-pill badge-soft-primary">About MABS</span>
                            <h4 class="title mt-3 mb-4">Good Services And Better <br> Health By Our Specialists</h4>
                            <p class="para-desc text-muted">Providing excellent services for a healthier tomorrow, led by our dedicated specialists.assistance, emergency treatment or a simple consultation.</p>
                            <p class="para-desc text-muted">Access to healthcare in Vietnam is not just an appointment; it's a promise of care, compassion, and well-being for all.</p>
                            
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
                            <p class="text-muted mx-auto para-desc mb-0">When you need a great doctor for your family's well-being, we offer immediate assistance, emergency care, and thoughtful consultations to ensure their health and peace of mind.</p>
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
                                <p class="text-muted mt-3"> the need for meaningful information is paramount,the required of treat,the threat that need, for every word holds the power to heal, comfort, and guide.</p>
                              
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
            <div class="container mt-100 mt-60">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <div class="section-title mb-4 pb-2 text-center">
                            <span class="badge badge-pill badge-soft-primary mb-3">Departments</span>
                            <h4 class="title mb-4">Our Departments</h4>
                            <p class="text-muted mx-auto para-desc mb-0">Departments are the heartbeat of a hospital, each one serving a unique rhythm in the symphony of patient care.</p>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->

                <div class="row">
                    <div class="col-xl-3 col-md-4 col-12 mt-5">
                        <div class="card features feature-primary bg-transparent border-0">
                            <div class="icon text-center rounded-md">
                                <i class="ri-eye-fill h3 mb-0"></i>
                            </div>
                            <div class="card-body p-0 mt-3">
                                <a href="departments.html" class="title text-dark h5">Eye Care</a>
                                <p class="text-muted mt-3">where vision meets precision, even the words we use are meticulously crafted to illuminate the path to clearer sight.</p>
                                <a href="departments.html" class="link">Read More <i class="ri-arrow-right-line align-middle"></i></a>
                            </div>
                        </div>
                    </div><!--end col-->
                    <div class="col-xl-3 col-md-4 col-12 mt-5">
                        <div class="card features feature-primary bg-transparent border-0">
                            <div class="icon text-center rounded-md">
                                <i class="ri-psychotherapy-fill h3 mb-0"></i>
                            </div>
                            <div class="card-body p-0 mt-3">
                                <a href="departments.html" class="title text-dark h5">Psychotherapy</a>
                                <p class="text-muted mt-3">where the mind's labyrinth unfolds, words become the bridge between pain and healing, filling spaces with understanding and hope.</p>
                                <a href="departments.html" class="link">Read More <i class="ri-arrow-right-line align-middle"></i></a>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-xl-3 col-md-4 col-12 mt-5">
                        <div class="card features feature-primary bg-transparent border-0">
                            <div class="icon text-center rounded-md">
                                <i class="ri-stethoscope-fill h3 mb-0"></i>
                            </div>
                            <div class="card-body p-0 mt-3">
                                <a href="departments.html" class="title text-dark h5">Primary Care</a>
                                <p class="text-muted mt-3">Wellness is the cornerstone, words become the foundation upon which we build a healthier tomorrow, filling spaces with guidance and compassion.</p>
                                <a href="departments.html" class="link">Read More <i class="ri-arrow-right-line align-middle"></i></a>
                            </div>
                        </div>
                    </div><!--end col-->
                    <div class="col-xl-3 col-md-4 col-12 mt-5">
                        <div class="card features feature-primary bg-transparent border-0">
                            <div class="icon text-center rounded-md">
                                <i class="ri-capsule-fill h3 mb-0"></i>
                            </div>
                            <div class="card-body p-0 mt-3">
                                <a href="departments.html" class="title text-dark h5">Dental Care</a>
                                <p class="text-muted mt-3">Where smiles are crafted and maintained, words become the gentle touch that fills spaces with knowledge and reassurance, ensuring your oral health shines bright.</p>
                                <a href="departments.html" class="link">Read More <i class="ri-arrow-right-line align-middle"></i></a>
                            </div>
                        </div>
                    </div><!--end col-->

                    <div class="col-xl-3 col-md-4 col-12 mt-5">
                        <div class="card features feature-primary bg-transparent border-0">
                            <div class="icon text-center rounded-md">
                                <i class="ri-microscope-fill h3 mb-0"></i>
                            </div>
                            <div class="card-body p-0 mt-3">
                                <a href="departments.html" class="title text-dark h5">Orthopedic</a>
                                <p class="text-muted mt-3">Where bones mend and bodies regain strength, words serve as the sturdy framework, filling spaces with insights and expertise, paving the way for a healthier, more mobile future.</p>
                                <a href="departments.html" class="link">Read More <i class="ri-arrow-right-line align-middle"></i></a>
                            </div>
                        </div>
                    </div><!--end col-->
                    <div class="col-xl-3 col-md-4 col-12 mt-5">
                        <div class="card features feature-primary bg-transparent border-0">
                            <div class="icon text-center rounded-md">
                                <i class="ri-pulse-fill h3 mb-0"></i>
                            </div>
                            <div class="card-body p-0 mt-3">
                                <a href="departments.html" class="title text-dark h5">Cardiology</a>
                                <p class="text-muted mt-3">Where every beat matters, words become the rhythm that fills spaces with knowledge and care, ensuring hearts stay strong and lives keep pulsing forward.</p>
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
                                <a href="departments.html" class="title text-dark h5">Gynecology</a>
                                <p class="text-muted mt-3">Where women's health takes center stage, words become the canvas, filling spaces with expertise and support, nurturing the well-being of every woman through every stage of life.</p>
                                <a href="departments.html" class="link">Read More <i class="ri-arrow-right-line align-middle"></i></a>
                            </div>
                        </div>
                    </div><!--end col-->
                    <div class="col-xl-3 col-md-4 col-12 mt-5">
                        <div class="card features feature-primary bg-transparent border-0">
                            <div class="icon text-center rounded-md">
                                <i class="ri-mind-map h3 mb-0"></i>
                            </div>
                            <div class="card-body p-0 mt-3">
                                <a href="departments.html" class="title text-dark h5">Neurology</a>
                                <p class="text-muted mt-3">Where the brain's mysteries are unraveled, words act as the neural pathways, filling spaces with knowledge and understanding, guiding us through the labyrinth of the mind.</p>
                                <a href="departments.html" class="link">Read More <i class="ri-arrow-right-line align-middle"></i></a>
                            </div>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end container-->
            <!-- Start -->
            <section class="section bg-white">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <div class="section-title text-center mb-4 pb-2">
                                <h4 class="title mb-4">Doctors</h4>
                                <p class="text-muted mx-auto para-desc mb-0">Great doctor if you need your family member to get effective immediate assistance, emergency treatment or a simple consultation.</p>
                            </div>
                        </div><!--end col-->
                    </div><!--end row-->

                    <div class="row align-items-center">

                        <c:forEach items="${requestScope.doctors}" var="d">
                            <div class="col-xl-3 col-lg-3 col-md-6 mt-4 pt-2">
                                <div class="card team border-0 rounded shadow overflow-hidden">
                                    <div class="team-img position-relative">

                                        <img src="data:image/jpg;base64,${d.image}" width="240" height="300"/>
                                        <ul class="list-unstyled team-social mb-0">
                                            <li><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="facebook" class="icons"></i></a></li>
                                            <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="linkedin" class="icons"></i></a></li>
                                            <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="github" class="icons"></i></a></li>
                                            <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="twitter" class="icons"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="card-body content text-center">
                                        <a href="doctor-team-one.html" class="title text-dark h5 d-block mb-0">${d.fullName}</a>
                                        <small class="text-muted speciality">${d.speciality}</small>
                                    </div>
                                </div>
                            </div><!--end col-->
                        </c:forEach>


                    </div><!--end row-->
                </div><!--end container-->
                <div class="container mt-70 mt-70">
                    <div class="row">
                        <div class="col-lg-20">
                            <div class="section-title">
                                <h4 class="title mb-0">Blogs:</h4>
                            </div>
                        </div><!--end col-->
                    </div><!--end row-->

                    <div class="row">
                        <div class="col-lg-12 mt-4 pt-4 m-4">
                            <div class="slider-range-three">
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
                                        <img src="frontend/template/assets/images/blog/04.jpg" class="img-fluid" alt="">
                                        <div class="card-body p-4">
                                            <ul class="list-unstyled mb-2">
                                                <li class="list-inline-item text-muted small me-3"><i class="uil uil-calendar-alt text-dark h6 me-1"></i>20th November, 2020</li>
                                                <li class="list-inline-item text-muted small"><i class="uil uil-clock text-dark h6 me-1"></i>5 min read</li>
                                            </ul>
                                            <a href="blog-detail.html" class="text-dark title h5">Comparing Nitrogen And Mechanical Freezers</a>
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
                                        <img src="frontend/template/assets/images/blog/05.jpg" class="img-fluid" alt="">
                                        <div class="card-body p-4">
                                            <ul class="list-unstyled mb-2">
                                                <li class="list-inline-item text-muted small me-3"><i class="uil uil-calendar-alt text-dark h6 me-1"></i>20th November, 2020</li>
                                                <li class="list-inline-item text-muted small"><i class="uil uil-clock text-dark h6 me-1"></i>5 min read</li>
                                            </ul>
                                            <a href="blog-detail.html" class="text-dark title h5">It Is Very Important To Wear Proper Clothing</a>
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
                                        <img src="frontend/template/assets/images/blog/06.jpg" class="img-fluid" alt="">
                                        <div class="card-body p-4">
                                            <ul class="list-unstyled mb-2">
                                                <li class="list-inline-item text-muted small me-3"><i class="uil uil-calendar-alt text-dark h6 me-1"></i>20th November, 2020</li>
                                                <li class="list-inline-item text-muted small"><i class="uil uil-clock text-dark h6 me-1"></i>5 min read</li>
                                            </ul>
                                            <a href="blog-detail.html" class="text-dark title h5">Hollowed-Out Faces More Cuts Amid Virus</a>
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
                </div><!--end container-->
            </section><!--end section-->
            <!-- End -->
            <jsp:include page="/frontend/common/footer.jsp" />

            <!-- End -->
            <!-- Back to top -->
            <a href="#" onclick="topFunction()" id="back-to-top" class="btn btn-icon btn-pills btn-primary back-to-top"><i data-feather="arrow-up" class="icons"></i></a>
            <!-- Back to top -->
            <!-- Offcanvas Start -->
            <div class="offcanvas offcanvas-end bg-white shadow" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
                <div class="offcanvas-header p-4 border-bottom">
                    <h5 id="offcanvasRightLabel" class="mb-0">
                        <img src="frontend/template/assets/images/MABS__1.png" height="24" class="light-version" alt="">
                        <img src="frontend/template/assets/images/MABS__1.png" height="24" class="dark-version" alt="">
                    </h5>
                    <button type="button" class="btn-close d-flex align-items-center text-dark" data-bs-dismiss="offcanvas" aria-label="Close"><i class="uil uil-times fs-4"></i></button>
                </div>
                <div class="offcanvas-body p-4 px-md-5">
                    <div class="row">
                        <div class="col-12">
                            <!-- Style switcher -->
                            <div id="style-switcher">
                                <div>
                                    <ul class="text-center list-unstyled mb-0">
                                        <li class="d-grid"><a href="#" class="rtl-version t-rtl-light" onclick="setTheme('style-rtl')"><img src="frontend/assets/images/layouts/landing-light-rtl.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">RTL Version</span></a></li>
                                        <li class="d-grid"><a href="#" class="ltr-version t-ltr-light" onclick="setTheme('style')"><img src="frontend/assets/images/layouts/landing-light.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">LTR Version</span></a></li>
                                        <li class="d-grid"><a href="#" class="dark-rtl-version t-rtl-dark" onclick="setTheme('style-dark-rtl')"><img src="frontend/assets/images/layouts/landing-dark-rtl.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">RTL Version</span></a></li>
                                        <li class="d-grid"><a href="#" class="dark-ltr-version t-ltr-dark" onclick="setTheme('style-dark')"><img src="frontend/assets/images/layouts/landing-dark.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">LTR Version</span></a></li>
                                        <li class="d-grid"><a href="#" class="dark-version t-dark mt-4" onclick="setTheme('style-dark')"><img src="frontend/assets/images/layouts/landing-dark.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">Dark Version</span></a></li>
                                        <li class="d-grid"><a href="#" class="light-version t-light mt-4" onclick="setTheme('style')"><img src="frontend/assets/images/layouts/landing-light.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">Light Version</span></a></li>
                                        <li class="d-grid"><a href="frontend/admin/index.html" target="_blank" class="mt-4"><img src="frontend/assets/images/layouts/light-dash.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">Admin Dashboard</span></a></li>
                                    </ul>
                                </div>
                            </div>
                            <!-- end Style switcher -->
                        </div><!--end col-->
                    </div><!--end row-->
                </div>
                <div class="offcanvas-footer p-4 border-top text-center">
                    <ul class="list-unstyled social-icon mb-0">
                        <li class="list-inline-item mb-0"><a href="#" target="_blank" class="rounded"><i class="uil uil-shopping-cart align-middle" title="Buy Now"></i></a></li>
                        <li class="list-inline-item mb-0"><a href="#" target="_blank" class="rounded"><i class="uil uil-dribbble align-middle" title="dribbble"></i></a></li>
                        <li class="list-inline-item mb-0"><a href="#" target="_blank" class="rounded"><i class="uil uil-facebook-f align-middle" title="facebook"></i></a></li>
                        <li class="list-inline-item mb-0"><a href="#/" target="_blank" class="rounded"><i class="uil uil-instagram align-middle" title="instagram"></i></a></li>
                        <li class="list-inline-item mb-0"><a href="#" target="_blank" class="rounded"><i class="uil uil-twitter align-middle" title="twitter"></i></a></li>
                        <li class="list-inline-item mb-0"><a href="mailto:support@shreethemes.in" class="rounded"><i class="uil uil-envelope align-middle" title="email"></i></a></li>
                        <li class="list-inline-item mb-0"><a href="frontend/frontend/frontend/index.html" target="_blank" class="rounded"><i class="uil uil-globe align-middle" title="website"></i></a></li>
                    </ul><!--end icon-->
                </div>
            </div>

            <script src= "<c:url value= '/frontend/template/assets/js/bootstrap.bundle.min.js'/>"></script>
            <!-- Icons -->

            <script src= "<c:url value= '/frontend/template/assets/js/feather.min.js'/>"></script>
            <!-- Main Js -->
            <script src= "<c:url value= '/frontend/template/assets/js/tiny-slider.js'/>"></script>
            <script src= "<c:url value= '/frontend/template/assets/js/app.js'/>"></script>
            <script src= "<c:url value= '/frontend/template/assets/js/tiny-slider.j'/>"></script>
            <script src= "<c:url value= '/frontend/template/assets/js/tiny-slider-init.js'/>"></script>
    </body>
</html>