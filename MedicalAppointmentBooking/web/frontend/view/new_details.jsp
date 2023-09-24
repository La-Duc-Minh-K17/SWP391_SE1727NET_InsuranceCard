<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">


    <head>
        <meta charset="utf-8" />
        <title>MABS</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Premium Bootstrap 4 Landing Page Template" />
        <meta name="keywords" content="Appointment, Booking, System, Dashboard, Health" />
        <meta name="author" content="Group6" />
        <meta name="email" content="support@group6.in" />
        <meta name="website" content="https://group6.in" />
        <meta name="Version" content="v1.2.0" />
        <!-- favicon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/frontend/template/assets/images/favicon.ico.png">
        <!-- Bootstrap -->
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/newstyle.css" rel="stylesheet" type="text/css" />

        <!-- SLIDER -->
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/tiny-slider.css" />
        <!-- Select2 -->
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/select2.min.css" rel="stylesheet" />
        <!-- Date picker -->
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/flatpickr.min.css">
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/jquery.timepicker.min.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link  href="${pageContext.request.contextPath}/frontend/template/assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link  href="${pageContext.request.contextPath}/frontend/template/assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css" rel="stylesheet">
        <!-- Css -->
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <style>
            #home {
                background-image: url("../assets/images/bg/backgroundclinic.jpg");
            }
        </style>

    </head>
    <body>
       
        <header id="topnav" class="defaultscroll sticky">
            <div class="container">
                <!-- Logo container-->
                <div>
                    <a class="logo" href="index.html">
                        <span class="logo-light-mode">
                            <img src="../assets/images/MABS__1.png" class="l-dark" height="24" alt="">
                            <img src="../assets/images/MABS__1.png" class="l-light" height="24" alt="">
                        </span>
                        <img src="../assets/images/logo-light.png" height="24" class="logo-dark-mode" alt="">
                    </a>
                </div>
                <!-- End Logo container-->

                <!-- Start Mobile Toggle -->
                <div class="menu-extras">
                    <div class="menu-item">
                        <!-- Mobile menu toggle-->
                        <a class="navbar-toggle" id="isToggle" onclick="toggleMenu()">
                            <div class="lines">
                                <span></span>
                                <span></span>
                                <span></span>
                            </div>
                        </a>
                        <!-- End mobile menu toggle-->
                    </div>
                </div>
                <!-- End Mobile Toggle -->

                <!-- Start Dropdown -->
                <ul class="dropdowns list-inline mb-0">
                    <!-- <li class="list-inline-item mb-0">
                            <a href="javascript:void(0)" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
                                <div class="btn btn-icon btn-pills btn-primary"><i data-feather="settings" class="fea icon-sm"></i></div>
                            </a>
                        </li> -->

                    <!-- <li class="list-inline-item mb-0 ms-1">
                            <a href="javascript:void(0)" class="btn btn-icon btn-pills btn-primary" data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop" aria-controls="offcanvasTop">
                                <i class="uil uil-search"></i>
                            </a>
                        </li> -->

                    <li class="list-inline-item mb-0 ms-1">
                        <!-- <div class="dropdown dropdown-primary"> -->
                        <!-- <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="../assets/images/doctors/1.jpg" class="avatar avatar-ex-small rounded-circle" alt=""></button> -->
                        <!-- <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px;">
                                    <a class="dropdown-item d-flex align-items-center text-dark" href="doctor-profile.html"> -->
                        <!-- <img src="../assets/images/doctors/1.jpg" class="avatar avatar-md-sm rounded-circle border shadow" alt=""> -->
                        <div class="flex-1 ms-2">
                            <!-- <span class="d-block mb-1">Tran Xuan Tiem</span>
                                            <small class="text-muted">Doctor</small> -->
                        </div>
                        <div class="d-grid d-md-block">
                            <button type="submit" class="btn btn-primary">Sign up</button>

                            <button type="submit" class="btn btn-primary">Login</button>
                            <!-- </a> -->
                            <!-- <a class="dropdown-item text-dark" href="doctor-dashboard.html"><span class="mb-0 d-inline-block me-1"><i class="uil uil-dashboard align-middle h6"></i></span> Dashboard</a>
                                    <a class="dropdown-item text-dark" href="doctor-profile-setting.html"><span class="mb-0 d-inline-block me-1"><i class="uil uil-setting align-middle h6"></i></span> Profile Settings</a>
                                    <div class="dropdown-divider border-top"></div>
                                    <a class="dropdown-item text-dark" href="login.html"><span class="mb-0 d-inline-block me-1"><i class="uil uil-sign-out-alt align-middle h6"></i></span> Logout</a> -->
                        </div>
                        </div>
                    </li>
                </ul>
                <!-- Start Dropdown -->

                <div id="navigation">
                    <!-- Navigation Menu-->
                    <ul class="navigation-menu nav-left nav-light">
                        <li class="has-submenu parent-menu-item">
                            <a href="index-three.html">Home</a>
                        </li>

                        <li class="has-submenu parent-parent-menu-item">
                            <a href="doctor-team-one.html">Doctors</a>
                            <!-- <ul class="submenu"> -->
                            <!-- <li class="has-submenu parent-menu-item">
                                            <a href="javascript:void(0)" class="menu-item"> Dashboard </a><span class="submenu-arrow"></span>
                                            <ul class="submenu">
                                                <li><a href="doctor-dashboard.html" class="sub-menu-item">Dashboard</a></li>
                                                <li><a href="doctor-appointment.html" class="sub-menu-item">Appointment</a></li>
                                                <li><a href="patient-list.html" class="sub-menu-item">Patients</a></li>
                                                <li><a href="doctor-schedule.html" class="sub-menu-item">Schedule Timing</a></li>
                                                <li><a href="invoices.html" class="sub-menu-item">Invoices</a></li>
                                                <li><a href="patient-review.html" class="sub-menu-item">Reviews</a></li>
                                                <li><a href="doctor-messages.html" class="sub-menu-item">Messages</a></li>
                                                <li><a href="doctor-profile.html" class="sub-menu-item">Profile</a></li>
                                                <li><a href="doctor-profile-setting.html" class="sub-menu-item">Profile Settings</a></li>
                                                <li><a href="doctor-chat.html" class="sub-menu-item">Chat</a></li>
                                                <li><a href="login.html" class="sub-menu-item">Login</a></li>
                                                <li><a href="signup.html" class="sub-menu-item">Sign Up</a></li>
                                                <li><a href="forgot-password.html" class="sub-menu-item">Forgot Password</a></li>
                                            </ul>
                                        </li> -->

                            <!-- </ul> -->
                        </li>

                        <!-- <li class="has-submenu parent-menu-item">
                                    <a href="javascript:void(0)">Patients</a><span class="menu-arrow"></span>
                                    <ul class="submenu">
                                        <li><a href="patient-dashboard.html" class="sub-menu-item">Dashboard</a></li>
                                        <li><a href="patient-profile.html" class="sub-menu-item">Profile</a></li>
                                        <li><a href="booking-appointment.html" class="sub-menu-item">Book Appointment</a></li>
                                        <li><a href="patient-invoice.html" class="sub-menu-item">Invoice</a></li>
                                    </ul>
                                </li> -->

                        <li class="has-submenu parent-menu-item">
                            <a href="javascript:void(0)">Services</a>
                            <!-- <ul class="submenu">
                                        <li><a href="pharmacy.html" class="sub-menu-item">Pharmacy</a></li>
                                        <li><a href="pharmacy-shop.html" class="sub-menu-item">Shop</a></li>
                                        <li><a href="pharmacy-product-detail.html" class="sub-menu-item">Medicine Detail</a></li>
                                        <li><a href="pharmacy-shop-cart.html" class="sub-menu-item">Shop Cart</a></li>
                                        <li><a href="pharmacy-checkout.html" class="sub-menu-item">Checkout</a></li>
                                        <li><a href="pharmacy-account.html" class="sub-menu-item">Account</a></li>
                                    </ul>
                                </li> -->

                        <li class="has-submenu parent-parent-menu-item"><a href="javascript:void(0)">Blogs</a>
                            <!-- <ul class="submenu">
                                        <li><a href="aboutus.html" class="sub-menu-item"> About Us</a></li>
                                        <li><a href="departments.html" class="sub-menu-item">Departments</a></li>
                                        <li><a href="faqs.html" class="sub-menu-item">FAQs</a></li>
                                        <li class="has-submenu parent-menu-item">
                                            <a href="javascript:void(0)" class="menu-item"> Blogs </a><span class="submenu-arrow"></span>
                                            <ul class="submenu">
                                                <li><a href="blogs.html" class="sub-menu-item">Blogs</a></li>
                                                <li><a href="blog-detail.html" class="sub-menu-item">Blog Details</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="terms.html" class="sub-menu-item">Terms & Policy</a></li>
                                        <li><a href="privacy.html" class="sub-menu-item">Privacy Policy</a></li>
                                        <li><a href="error.html" class="sub-menu-item">404 !</a></li>
                                        <li><a href="contact.html" class="sub-menu-item">Contact</a></li>
                                    </ul> -->
                        </li>
                        <li><a href="../admin/index.html" class="sub-menu-item" target="_blank">About Us</a></li>
                    </ul><!--end navigation menu-->
                </div><!--end navigation-->
            </div><!--end container-->
        </header><!--end header-->

        <main>
        <section class="section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-7">
                        <img src="../assets/images/blog/single.jpg" class="img-fluid rounded shadow" alt="">

                       

                        <p class="text-muted mt-4">This is required when, for example, the final text is not yet
                            available. Dummy text is also known as 'fill text'. It is said that song composers of the
                            past used dummy texts as lyrics when writing melodies in order to have a 'ready-made' text
                            to sing with the melody. Dummy texts have been in use by typesetters since the 16th century.
                        </p>
                        <p class="text-muted">Due to its widespread use as filler text for layouts, non-readability is
                            of great importance: human perception is tuned to recognize certain patterns and repetitions
                            in texts.</p>
                        <p class="text-muted mb-0">For this reason, dummy text usually consists of a more or less random
                            series of words or syllables.</p>
                    </div>

                    <div class="col-lg-4 col-md-5 mt-4 mt-sm-0 pt-2 pt-sm-0">
                        <div class="card border-0 sidebar sticky-bar rounded shadow">
                            <div class="card-body">
                                <div class="widget mb-4 pb-2">
                                    <h5 class="widget-title">Search</h5>
                                    <div id="search2" class="widget-search mt-4 mb-0">
                                        <form role="search" method="get" id="searchform" class="searchform">
                                            <div>
                                                <input type="text" class="border rounded form-control" name="s" id="s"
                                                    placeholder="Search Keywords...">
                                                <input type="submit" id="searchsubmit" value="Search">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="widget mb-4 pb-2">
                                    <h5 class="widget-title">Recent Post</h5>
                                    <div class="mt-4">
                                        <div class="clearfix post-recent">
                                            <div class="post-recent-thumb float-start"> <a href="jvascript:void(0)">
                                                    <img alt="img" src="../assets/images/blog/07.jpg"
                                                        class="img-fluid rounded"></a></div>
                                            <div class="post-recent-content float-start"><a
                                                    href="jvascript:void(0)">Consultant Business</a><span
                                                    class="text-muted mt-2">15th June, 2019</span></div>
                                        </div>
                                        <div class="clearfix post-recent">
                                            <div class="post-recent-thumb float-start"> <a href="jvascript:void(0)">
                                                    <img alt="img" src="../assets/images/blog/08.jpg"
                                                        class="img-fluid rounded"></a></div>
                                            <div class="post-recent-content float-start"><a
                                                    href="jvascript:void(0)">Look On The Glorious Balance</a> <span
                                                    class="text-muted mt-2">15th June, 2019</span></div>
                                        </div>
                                        <div class="clearfix post-recent">
                                            <div class="post-recent-thumb float-start"> <a href="jvascript:void(0)">
                                                    <img alt="img" src="../assets/images/blog/01.jpg"
                                                        class="img-fluid rounded"></a></div>
                                            <div class="post-recent-content float-start"><a
                                                    href="jvascript:void(0)">Research Financial.</a> <span
                                                    class="text-muted mt-2">15th June, 2019</span></div>
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>
                </div><!--end row-->
            </div><!--end container-->

            <div class="container mt-100 mt-60">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <h4 class="title mb-0">Related Post:</h4>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->

                <div class="row">
                    <div class="col-lg-12 mt-4 pt-2">
                        <div class="tns-outer" id="tns1-ow">
                            <div class="tns-liveregion tns-visually-hidden" aria-live="polite" aria-atomic="true">slide
                                <span class="current">1 to 3</span> of 5
                            </div>
                            <div id="tns1-mw" class="tns-ovh">
                                <div class="tns-inner" id="tns1-iw">
                                    <div class="slider-range-three  tns-slider tns-carousel tns-subpixel tns-calc tns-horizontal"
                                        id="tns1" style="transform: translate3d(0%, 0px, 0px);">
                                        <div class="tiny-slide tns-item tns-slide-active" id="tns1-item0">
                                            <div
                                                class="card blog blog-primary border-0 shadow rounded overflow-hidden m-1">
                                                <img src="../assets/images/blog/03.jpg" class="img-fluid" alt="">
                                                <div class="card-body p-4">
                                                    <ul class="list-unstyled mb-2">
                                                        <li class="list-inline-item text-muted small me-3"><i
                                                                class="uil uil-calendar-alt text-dark h6 me-1"></i>20th
                                                            November, 2020</li>
                                                        <li class="list-inline-item text-muted small"><i
                                                                class="uil uil-clock text-dark h6 me-1"></i>5 min read
                                                        </li>
                                                    </ul>
                                                    <a href="blog-detail.html" class="text-dark title h5">medicine
                                                        research course for doctors</a>
                                                    <div class="post-meta d-flex justify-content-between mt-3">
                                                        <ul class="list-unstyled mb-0">
                                                            <li class="list-inline-item me-2 mb-0"><a href="#"
                                                                    class="text-muted like"><i
                                                                        class="mdi mdi-heart-outline me-1"></i>33</a>
                                                            </li>
                                                            <li class="list-inline-item"><a href="#"
                                                                    class="text-muted comments"><i
                                                                        class="mdi mdi-comment-outline me-1"></i>08</a>
                                                            </li>
                                                        </ul>
                                                        <a href="blog-detail.html" class="link">Read More <i
                                                                class="mdi mdi-chevron-right align-middle"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="tiny-slide tns-item tns-slide-active" id="tns1-item1">
                                            <div
                                                class="card blog blog-primary border-0 shadow rounded overflow-hidden m-1">
                                                <img src="../assets/images/blog/04.jpg" class="img-fluid" alt="">
                                                <div class="card-body p-4">
                                                    <ul class="list-unstyled mb-2">
                                                        <li class="list-inline-item text-muted small me-3"><i
                                                                class="uil uil-calendar-alt text-dark h6 me-1"></i>20th
                                                            November, 2020</li>
                                                        <li class="list-inline-item text-muted small"><i
                                                                class="uil uil-clock text-dark h6 me-1"></i>5 min read
                                                        </li>
                                                    </ul>
                                                    <a href="blog-detail.html" class="text-dark title h5">Comparing
                                                        Nitrogen And Mechanical Freezers</a>
                                                    <div class="post-meta d-flex justify-content-between mt-3">
                                                        <ul class="list-unstyled mb-0">
                                                            <li class="list-inline-item me-2 mb-0"><a href="#"
                                                                    class="text-muted like"><i
                                                                        class="mdi mdi-heart-outline me-1"></i>33</a>
                                                            </li>
                                                            <li class="list-inline-item"><a href="#"
                                                                    class="text-muted comments"><i
                                                                        class="mdi mdi-comment-outline me-1"></i>08</a>
                                                            </li>
                                                        </ul>
                                                        <a href="blog-detail.html" class="link">Read More <i
                                                                class="mdi mdi-chevron-right align-middle"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="tiny-slide tns-item tns-slide-active" id="tns1-item2">
                                            <div
                                                class="card blog blog-primary border-0 shadow rounded overflow-hidden m-1">
                                                <img src="../assets/images/blog/05.jpg" class="img-fluid" alt="">
                                                <div class="card-body p-4">
                                                    <ul class="list-unstyled mb-2">
                                                        <li class="list-inline-item text-muted small me-3"><i
                                                                class="uil uil-calendar-alt text-dark h6 me-1"></i>20th
                                                            November, 2020</li>
                                                        <li class="list-inline-item text-muted small"><i
                                                                class="uil uil-clock text-dark h6 me-1"></i>5 min read
                                                        </li>
                                                    </ul>
                                                    <a href="blog-detail.html" class="text-dark title h5">It Is Very
                                                        Important To Wear Proper Clothing</a>
                                                    <div class="post-meta d-flex justify-content-between mt-3">
                                                        <ul class="list-unstyled mb-0">
                                                            <li class="list-inline-item me-2 mb-0"><a href="#"
                                                                    class="text-muted like"><i
                                                                        class="mdi mdi-heart-outline me-1"></i>33</a>
                                                            </li>
                                                            <li class="list-inline-item"><a href="#"
                                                                    class="text-muted comments"><i
                                                                        class="mdi mdi-comment-outline me-1"></i>08</a>
                                                            </li>
                                                        </ul>
                                                        <a href="blog-detail.html" class="link">Read More <i
                                                                class="mdi mdi-chevron-right align-middle"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="tiny-slide tns-item" id="tns1-item3" aria-hidden="true"
                                            tabindex="-1">
                                            <div
                                                class="card blog blog-primary border-0 shadow rounded overflow-hidden m-1">
                                                <img src="../assets/images/blog/06.jpg" class="img-fluid" alt="">
                                                <div class="card-body p-4">
                                                    <ul class="list-unstyled mb-2">
                                                        <li class="list-inline-item text-muted small me-3"><i
                                                                class="uil uil-calendar-alt text-dark h6 me-1"></i>20th
                                                            November, 2020</li>
                                                        <li class="list-inline-item text-muted small"><i
                                                                class="uil uil-clock text-dark h6 me-1"></i>5 min read
                                                        </li>
                                                    </ul>
                                                    <a href="blog-detail.html" class="text-dark title h5">Hollowed-Out
                                                        Faces More Cuts Amid Virus</a>
                                                    <div class="post-meta d-flex justify-content-between mt-3">
                                                        <ul class="list-unstyled mb-0">
                                                            <li class="list-inline-item me-2 mb-0"><a href="#"
                                                                    class="text-muted like"><i
                                                                        class="mdi mdi-heart-outline me-1"></i>33</a>
                                                            </li>
                                                            <li class="list-inline-item"><a href="#"
                                                                    class="text-muted comments"><i
                                                                        class="mdi mdi-comment-outline me-1"></i>08</a>
                                                            </li>
                                                        </ul>
                                                        <a href="blog-detail.html" class="link">Read More <i
                                                                class="mdi mdi-chevron-right align-middle"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="tiny-slide tns-item" id="tns1-item4" aria-hidden="true"
                                            tabindex="-1">
                                            <div
                                                class="card blog blog-primary border-0 shadow rounded overflow-hidden m-1">
                                                <img src="../assets/images/blog/07.jpg" class="img-fluid" alt="">
                                                <div class="card-body p-4">
                                                    <ul class="list-unstyled mb-2">
                                                        <li class="list-inline-item text-muted small me-3"><i
                                                                class="uil uil-calendar-alt text-dark h6 me-1"></i>20th
                                                            November, 2020</li>
                                                        <li class="list-inline-item text-muted small"><i
                                                                class="uil uil-clock text-dark h6 me-1"></i>5 min read
                                                        </li>
                                                    </ul>
                                                    <a href="blog-detail.html" class="text-dark title h5">A Researcher
                                                        Is Research On Coronavirus In Lab</a>
                                                    <div class="post-meta d-flex justify-content-between mt-3">
                                                        <ul class="list-unstyled mb-0">
                                                            <li class="list-inline-item me-2 mb-0"><a href="#"
                                                                    class="text-muted like"><i
                                                                        class="mdi mdi-heart-outline me-1"></i>33</a>
                                                            </li>
                                                            <li class="list-inline-item"><a href="#"
                                                                    class="text-muted comments"><i
                                                                        class="mdi mdi-comment-outline me-1"></i>08</a>
                                                            </li>
                                                        </ul>
                                                        <a href="blog-detail.html" class="link">Read More <i
                                                                class="mdi mdi-chevron-right align-middle"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                           
                        </div>
                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end container-->
        </section>

    </main>

                        <!-- Start -->
                        <footer class="bg-footer">
                            <div class="container">
                                <div class="row">
                                    <div class="col-xl-5 col-lg-4 mb-0 mb-md-4 pb-0 pb-md-2">
                                        <a href="#" class="logo-footer">
                                            <img src="../assets/images/MABS__1.png" height="30" alt="">
                                        </a>
                                        <p class="mt-4 me-xl-5">Great doctor if you need your family member to get effective immediate
                                            assistance, emergency treatment or a simple consultation.</p>
                                    </div><!--end col-->

                                    <div class="col-xl-7 col-lg-8 col-md-12">
                                        <div class="row">
                                            <div class="col-md-4 col-12 mt-4 mt-sm-0 pt-2 pt-sm-0">
                                                <h5 class="text-light title-dark footer-head">Company</h5>
                                                <ul class="list-unstyled footer-list mt-4">
                                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> About
                                                            us</a></li>
                                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i>
                                                            Services</a></li>
                                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Team</a>
                                                    </li>
                                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Project</a>
                                                    </li>
                                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Blog</a>
                                                    </li>
                                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Login</a>
                                                    </li>
                                                </ul>
                                            </div><!--end col-->

                                            <div class="col-md-4 col-12 mt-4 mt-sm-0 pt-2 pt-sm-0">
                                                <h5 class="text-light title-dark footer-head">Departments</h5>
                                                <ul class="list-unstyled footer-list mt-4">
                                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Eye
                                                            Care</a></li>
                                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i>
                                                            Psychotherapy</a></li>
                                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Dental
                                                            Care</a></li>
                                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i>
                                                            Orthopedic</a></li>
                                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i>
                                                            Cardiology</a></li>
                                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i>
                                                            Gynecology</a></li>
                                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i>
                                                            Neurology</a></li>
                                                </ul>
                                            </div><!--end col-->

                                            <div class="col-md-4 col-12 mt-4 mt-sm-0 pt-2 pt-sm-0">
                                                <h5 class="text-light title-dark footer-head">Contact us</h5>
                                                <ul class="list-unstyled footer-list mt-4">
                                                    <li class="d-flex align-items-center">
                                                        <i data-feather="mail" class="fea icon-sm text-foot align-middle"></i>
                                                        <a href="mailto:contact@example.com" class="text-foot ms-2">Group6@gmail.com</a>
                                                    </li>

                                                    <li class="d-flex align-items-center">
                                                        <i data-feather="phone" class="fea icon-sm text-foot align-middle"></i>
                                                        <a href="tel:+152534-468-854" class="text-foot ms-2">+84375299621</a>
                                                    </li>

                                                    <!-- <li class="d-flex align-items-center">
                                                            <i data-feather="map-pin" class="fea icon-sm text-foot align-middle"></i>
                                                            <a href="javascript:void(0)" class="video-play-icon text-foot ms-2">View on Google map</a>
                                                        </li>
                                                    </ul> -->

                                                    <ul class="list-unstyled social-icon footer-social mb-0 mt-4">
                                                        <li class="list-inline-item"><a href="#" class="rounded-pill"><i
                                                                    data-feather="facebook" class="fea icon-sm fea-social"></i></a></li>
                                                        <li class="list-inline-item"><a href="#" class="rounded-pill"><i
                                                                    data-feather="instagram" class="fea icon-sm fea-social"></i></a></li>
                                                        <li class="list-inline-item"><a href="#" class="rounded-pill"><i
                                                                    data-feather="twitter" class="fea icon-sm fea-social"></i></a></li>
                                                        <li class="list-inline-item"><a href="#" class="rounded-pill"><i
                                                                    data-feather="linkedin" class="fea icon-sm fea-social"></i></a></li>
                                                    </ul><!--end icon-->
                                            </div><!--end col-->
                                        </div><!--end row-->
                                    </div><!--end col-->
                                </div><!--end row-->
                            </div><!--end container-->

                            <div class="container mt-5">
                                <div class="pt-4 footer-bar">
                                    <div class="row align-items-center">
                                        <div class="col-sm-6">
                                            <div class="text-sm-start text-center">
                                                <p class="mb-0">
                                                    <script>document.write(new Date().getFullYear())</script> © Design with <i
                                                        class="mdi mdi-heart text-danger"></i> by <a href="../../../index.html"
                                                        target="_blank" class="text-reset">Group6</a>.
                                                </p>
                                            </div>
                                        </div><!--end col-->

                                        <div class="col-sm-6 mt-4 mt-sm-0">
                                            <ul class="list-unstyled footer-list text-sm-end text-center mb-0">
                                                <li class="list-inline-item"><a href="terms.html" class="text-foot me-2">Terms</a></li>
                                                <li class="list-inline-item"><a href="privacy.html" class="text-foot me-2">Privacy</a></li>
                                                <li class="list-inline-item"><a href="aboutus.html" class="text-foot me-2">About</a></li>
                                                <li class="list-inline-item"><a href="contact.html" class="text-foot me-2">Contact</a></li>
                                            </ul>
                                        </div><!--end col-->
                                    </div><!--end row-->
                                </div>
                            </div><!--end container-->
                        </footer><!--end footer-->
                        <!-- End -->

                        <!-- Back to top -->
                        <a href="#" onclick="topFunction()" id="back-to-top" class="btn btn-icon btn-pills btn-primary back-to-top"><i
                                data-feather="arrow-up" class="icons"></i></a>
                        <!-- Back to top -->

                        <!-- Offcanvas Start -->
                        <!-- <div class="offcanvas bg-white offcanvas-top" tabindex="-1" id="offcanvasTop">
                                <div class="offcanvas-body d-flex align-items-center align-items-center">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col">
                                                <div class="text-center">
                                                    <h4>Search now.....</h4>
                                                    <div class="subcribe-form mt-4">
                                                        <form>
                                                            <div class="mb-0">
                                                                <input type="text" id="help" name="name" class="border bg-white rounded-pill" required="" placeholder="Search">
                                                                <button type="submit" class="btn btn-pills btn-primary">Search</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div> -->
                    </div><!--end col-->
            </div><!--end row-->
        </div><!--end container-->
    </div>
</div>
<!-- Offcanvas End -->

<!-- Offcanvas Start -->
<div class="offcanvas offcanvas-end bg-white shadow" tabindex="-1" id="offcanvasRight"
     aria-labelledby="offcanvasRightLabel">
    <div class="offcanvas-header p-4 border-bottom">
        <h5 id="offcanvasRightLabel" class="mb-0">
            <img src="../assets/images/MABS__1.png" height="24" class="light-version" alt="">
            <img src="../assets/images/MABS__1.png" height="24" class="dark-version" alt="">
        </h5>
        <button type="button" class="btn-close d-flex align-items-center text-dark" data-bs-dismiss="offcanvas"
                aria-label="Close"><i class="uil uil-times fs-4"></i></button>
    </div>
    <div class="offcanvas-body p-4 px-md-5">
        <div class="row">
            <div class="col-12">
                <!-- Style switcher -->
                <div id="style-switcher">
                    <div>
                        <ul class="text-center list-unstyled mb-0">
                            <li class="d-grid"><a href="javascript:void(0)" class="rtl-version t-rtl-light"
                                                  onclick="setTheme('style-rtl')"><img
                                        src="../assets/images/layouts/landing-light-rtl.png"
                                        class="img-fluid rounded-md shadow-md d-block" alt=""><span
                                        class="text-muted mt-2 d-block">RTL Version</span></a></li>
                            <li class="d-grid"><a href="javascript:void(0)" class="ltr-version t-ltr-light"
                                                  onclick="setTheme('style')"><img
                                        src="../assets/images/layouts/landing-light.png"
                                        class="img-fluid rounded-md shadow-md d-block" alt=""><span
                                        class="text-muted mt-2 d-block">LTR Version</span></a></li>
                            <li class="d-grid"><a href="javascript:void(0)" class="dark-rtl-version t-rtl-dark"
                                                  onclick="setTheme('style-dark-rtl')"><img
                                        src="../assets/images/layouts/landing-dark-rtl.png"
                                        class="img-fluid rounded-md shadow-md d-block" alt=""><span
                                        class="text-muted mt-2 d-block">RTL Version</span></a></li>
                            <li class="d-grid"><a href="javascript:void(0)" class="dark-ltr-version t-ltr-dark"
                                                  onclick="setTheme('style-dark')"><img
                                        src="../assets/images/layouts/landing-dark.png"
                                        class="img-fluid rounded-md shadow-md d-block" alt=""><span
                                        class="text-muted mt-2 d-block">LTR Version</span></a></li>
                            <li class="d-grid"><a href="javascript:void(0)" class="dark-version t-dark mt-4"
                                                  onclick="setTheme('style-dark')"><img
                                        src="../assets/images/layouts/landing-dark.png"
                                        class="img-fluid rounded-md shadow-md d-block" alt=""><span
                                        class="text-muted mt-2 d-block">Dark Version</span></a></li>
                            <li class="d-grid"><a href="javascript:void(0)" class="light-version t-light mt-4"
                                                  onclick="setTheme('style')"><img
                                        src="../assets/images/layouts/landing-light.png"
                                        class="img-fluid rounded-md shadow-md d-block" alt=""><span
                                        class="text-muted mt-2 d-block">Light Version</span></a></li>
                            <li class="d-grid"><a href="../admin/index.html" target="_blank" class="mt-4"><img
                                        src="../assets/images/layouts/light-dash.png"
                                        class="img-fluid rounded-md shadow-md d-block" alt=""><span
                                        class="text-muted mt-2 d-block">Admin Dashboard</span></a></li>
                        </ul>
                    </div>
                </div>
                <!-- end Style switcher -->
            </div><!--end col-->
        </div><!--end row-->
    </div>

    <div class="offcanvas-footer p-4 border-top text-center">
        <ul class="list-unstyled social-icon mb-0">
            <li class="list-inline-item mb-0"><a href="https://1.envato.market/doctris-template" target="_blank"
                                                 class="rounded"><i class="uil uil-shopping-cart align-middle" title="Buy Now"></i></a></li>
            <li class="list-inline-item mb-0"><a href="https://dribbble.com/shreethemes" target="_blank"
                                                 class="rounded"><i class="uil uil-dribbble align-middle" title="dribbble"></i></a></li>
            <li class="list-inline-item mb-0"><a href="https://www.facebook.com/shreethemes" target="_blank"
                                                 class="rounded"><i class="uil uil-facebook-f align-middle" title="facebook"></i></a></li>
            <li class="list-inline-item mb-0"><a href="https://www.instagram.com/shreethemes/" target="_blank"
                                                 class="rounded"><i class="uil uil-instagram align-middle" title="instagram"></i></a></li>
            <li class="list-inline-item mb-0"><a href="https://twitter.com/shreethemes" target="_blank"
                                                 class="rounded"><i class="uil uil-twitter align-middle" title="twitter"></i></a></li>
            <li class="list-inline-item mb-0"><a href="mailto:support@shreethemes.in" class="rounded"><i
                        class="uil uil-envelope align-middle" title="email"></i></a></li>
            <li class="list-inline-item mb-0"><a href="../../../index.html" target="_blank" class="rounded"><i
                        class="uil uil-globe align-middle" title="website"></i></a></li>
        </ul><!--end icon-->
    </div>
</div>
<!-- Offcanvas End -->

<!-- MOdal Start -->
<div class="modal fade" id="watchvideomodal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content video-modal rounded overflow-hidden">
            <video class="w-100" controls autoplay muted loop>
                <source src="https://www.w3schools.com/html/mov_bbb.mp4" type="video/mp4">>
                <!--Browser does not support <video> tag -->
            </video>
        </div>
    </div>
</div>
<!-- MOdal End -->

<!-- javascript -->
<script src="../assets/js/jquery.min.js"></script>
<script src="../assets/js/bootstrap.bundle.min.js"></script>
<!-- SLIDER -->
<script src="../assets/js/tiny-slider.js"></script>
<script src="../assets/js/tiny-slider-init.js"></script>
<script src="../assets/js/easy_background.js"></script>
<!-- Select2 -->
<script src="../assets/js/select2.min.js"></script>
<script src="../assets/js/select2.init.js"></script>
<!-- Datepicker -->
<script src="../assets/js/flatpickr.min.js"></script>
<script src="../assets/js/flatpickr.init.js"></script>
<!-- Datepicker -->
<script src="../assets/js/jquery.timepicker.min.js"></script>
<script src="../assets/js/timepicker.init.js"></script>
<!-- Icons -->
<script src="../assets/js/feather.min.js"></script>
<!-- Main Js -->
<script src="../assets/js/app.js"></script>
<script>
                                                      // easy_background("#home",
                                                      //     {
                                                      //         slide: ["../assets/images/bg/02.jpg", "../assets/images/bg/03.jpg", "../assets/images/bg/04.jpg"],
                                                      //         delay: [1000, 1000, 1000]
                                                      //     }
                                                      // );
</script>
</body>

</html>