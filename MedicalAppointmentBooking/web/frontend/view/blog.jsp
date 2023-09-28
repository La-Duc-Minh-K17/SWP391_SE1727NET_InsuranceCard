<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/newstyle.css" rel="stylesheet" type="text/css" id="theme-opt" />

        <!-- SLIDER -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/frontend/template/assets/css/tiny-slider.css"/>
        <!-- Select2 -->
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/select2.min.css" rel="stylesheet" />
        <!-- Date picker -->
        <link rel="stylesheet" href="frontend/template/assets/css/flatpickr.min.css">
        <link href="frontend/template/assets/css/jquery.timepicker.min.css" rel="stylesheet" type="text/css" />
        <style>
            #home{
                background-image: url("frontend/template/assets/images/bg/backgroundclinic.jpg") ;
            }
        </style>
    <body>


        <!-- Navbar STart -->
        <header id="topnav" class="defaultscroll sticky">
            <div class="container">
                <!-- Logo container-->
                <div>
                    <a class="logo" href="index.html">
                        <span class="logo-light-mode">
                            <img src="frontend/template/assets/images/MABS__1.png" class="l-dark" height="30" alt="">
                            <img src="frontend/template/assets/images/MABS__1.png" class="l-light" height="30" alt="">
                        </span>
                        <img src="frontend/template/assets/images/logo-light.png" height="24" class="logo-dark-mode" alt="">
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
                <ul class="dropdowns list-inline mb-0">
                    <li class="list-inline-item mb-0 ms-1">
                        <div class="flex-1 ms-2">
                        </div>
                        <div class="d-grid d-md-block">
                            <button type="submit" class="btn btn-primary">Sign up</button>

                            <button type="submit" class="btn btn-primary">Login</button>
                        </div>
                        <div id="navigation">
                    </li>
                </ul>


                <div id="navigation">
                    <!-- Navigation Menu-->   
                    <ul class="navigation-menu nav-left nav-light">
                        <li class="has-submenu parent-menu-item">
                            <a href="index-three.html">Home</a>
                        </li>

                        <li class="has-submenu parent-parent-menu-item">
                            <a href="doctor-team-one.html">Doctors</a>
                        </li>
                        <li class="has-submenu parent-menu-item">
                            <a href="javascript:void(0)">Services</a>
                        </li>
                        <li class="has-submenu parent-parent-menu-item"><a href="javascript:void(0)">Blogs</a>
                        </li>
                        <li><a href="../admin/index.html" class="sub-menu-item" target="_blank">About Us</a></li>
                    </ul><!--end navigation menu-->
                </div><!--end navigation-->
            </div><!--end container-->
        </header><!--end header-->

        <section class="bg-half-60 d-table w-100" id="home">
            <div class="bg-overlay bg-overlay-dark"></div>
            <div class="container">
                <div class="row mt-5 justify-content-center">
                    <div class="col-12">
                        <div class="section-title text-center">
                            <h3 class="sub-title mb-4 text-white title-dark">Blogs &amp; News</h3>
                            <p class="para-desc mx-auto text-white-50">Great doctor if you need your family member to get
                                effective immediate assistance, emergency treatment or a simple consultation.</p>

                            <nav aria-label="breadcrumb" class="d-inline-block mt-3">
                                <ul class="breadcrumb bg-light rounded mb-0 py-1 px-2">
                                    <li class="breadcrumb-item"><a href="index.html">MABS</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Blogs</li>
                                </ul>
                            </nav>
                        </div>
                    </div><!--end col-->
                </div>
            </div><!--end container-->
        </section>


        <div class="container" style="margin-top: 90px;">
            <section class="blog_area section-padding">
                <div class="container">
                    <div class="row">
                        <h6 class="widget_title" style="color: #2d2d2d;">Recent Post</h6>                          
                        <c:forEach var="o" items="${requestScope.blogs3}">

                            <div class="col-lg-4 col-md-6 col-12 mb-4 pb-2" value="${o.blog_id}">
                                <div class="card blog blog-primary border-0 shadow rounded overflow-hidden">
                                    <div class="imagefit">
                                        <img src="data:image/jpg;base64,${o.image}" style="width:100%;height:100%;" class="img-fluid" alt="">
                                    </div>
                                    <div class="card-body p-4">
                                        <ul class="list-unstyled mb-2">
                                            <li class="list-inline-item text-muted small me-3">
                                                ${o.created_time}
                                            </li>
                                            <li class="list-inline-item text-muted small"><i
                                                    class="uil uil-clock text-dark h6 me-1"></i>5 min read</li>
                                        </ul>
                                        <a href="newdetail" class="text-dark title h5">${o.title}</a>
                                        <div>
                                            <ul class="list-unstyled mb-0">
                                                <a href="newdetail" class="text-dark title h6">${o.description}</a>
                                            </ul>
                                        </div>
                                        <div class="post-meta d-flex justify-content-between mt-3">                                               
                                            <a href="newdetail" class="link">Read More <i
                                                    class="mdi mdi-chevron-right align-middle"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
        </div>


        <div class="container" style="padding-top:10px">
            <section class="blog_area section-padding">
                <div class="container">      
                    
                    
                    <form class="flexsearch--form1" action="new" method="post">
                        <div class="row">
                            <div class="col-lg-5 mb-5 mb-lg-0">
                                <div class="blog_left_sidebar">
                                    <aside class="single_sidebar_widget post_category_widget">
                                        <div>
                                            <h5 class="widget_title" style="color: #2d2d2d;text-align: center;">Category</h5>
                                        </div>
                                        <div>
                                            <ul class="list cat-list">
                                                <select name="category" id="category" >
                                                    <option value="0">All</option>
                                                    <c:forEach var="o" items="${requestScope.listC}">
                                                        <option value="${o.blog_category_id}">${o.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </ul>
                                        </div>
                                    </aside>
                                </div>
                            </div>
                            <div class="col-lg-5 mb-5 mb-lg-0">
                                <div class="blog_left_sidebar">
                                    <aside class="single_sidebar_widget post_category_widget">
                                        <ul class="list cat-list">
                                            <div>
                                                <h5 class="widget_title" style="color: #2d2d2d;text-align: center;">Sorted By</h5>
                                            </div>
                                            <div>
                                                <select name="sort" id="sort">
                                                    <option value="all">All</option>
                                                    <option value="newest">Newest</option>
                                                    <option value="oldest">Oldest</option>
                                                </select>
                                            </div>
                                        </ul>
                                    </aside>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="blog_left_sidebar">
                                    <aside class="single_sidebar_widget post_category_widget">
                                        <ul class="list cat-list">
                                            <div class="flexsearch">
                                                <div class="flexsearch--wrapper">
                                                    <div row>
                                                        <input class="flexsearch--submit" type="submit" value="&#10140" />
                                                    </div>
                                                </div>
                                            </div>
                                        </ul>
                                    </aside>
                                </div>
                            </div>
                        </div>
                    </form>

            </section>
        </div>

        <div class="container" style="padding-top:20px">
            <div>
                <c:forEach var="o" items="${requestScope.data}">
                    <div class="col-lg-12 col-md-6 col-12 mb-4 pb-2">
                        <div class="card blog blog-primary border-0 shadow rounded overflow-hidden">
                            <div class="row">
                                <div class="col-lg-4">
                                    <img src="data:image/jpg;base64,${o.image}" class="image-container" alt="">
                                </div>
                                <div class="col-lg-8">
                                    <div class="card-body p-4">
                                        <ul class="list-unstyled mb-2">
                                            <li class="list-inline-item text-muted small me-3"><i
                                                    class="uil uil-calendar-alt text-dark h6 me-1"></i>${o.created_time}</li>
                                            <li class="list-inline-item text-muted small"><i
                                                    class="uil uil-clock text-dark h6 me-1"></i>5 min read</li>
                                        </ul>
                                        <a href="newdetail" class="text-dark title h5">${o.title}</a>
                                        <div>
                                            <ul class="list-unstyled mb-0">
                                                <a href="newdetail" class="text-dark title h6">${o.description}</a>
                                            </ul>
                                        </div>
                                        <div class="post-meta d-flex justify-content-between mt-3">                                                           
                                            <a href="newdetail" class="link">Read More <i
                                                    class="mdi mdi-chevron-right align-middle"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>  
                </c:forEach>
                
            </div>
        </div>
        <footer class="bg-footer">
            <div class="container">
                <div class="row">
                    <div class="col-xl-5 col-lg-4 mb-0 mb-md-1 pb-0  pb-md-2">
                        <a href="#" class="logo-footer">
                            <img src="frontend/template/assets/images/MABS__1.png" height="30" alt="">
                        </a>
                        <p class="mt-4 me-xl-5">Great doctor if you need your family member to get effective immediate assistance, emergency treatment or a simple consultation.</p>
                    </div><!--end col-->

                    <div class="col-xl-7 col-lg-8 col-md-12">
                        <div class="row">
                            <div class="col-md-4 col-12 mt-4 mt-sm-0 pt-2 pt-sm-0">
                                <h5 class="text-light title-dark footer-head">Company</h5>
                                <ul class="list-unstyled footer-list mt-4">
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> About us</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Services</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Team</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Project</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Blog</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Login</a></li>
                                </ul>
                            </div><!--end col-->

                            <div class="col-md-4 col-12 mt-4 mt-sm-0 pt-2 pt-sm-0">
                                <h5 class="text-light title-dark footer-head">Departments</h5>
                                <ul class="list-unstyled footer-list mt-4">
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Eye Care</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Psychotherapy</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Dental Care</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Orthopedic</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Cardiology</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Gynecology</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Neurology</a></li>
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
                                        <li class="list-inline-item"><a href="#" class="rounded-pill"><i data-feather="facebook" class="fea icon-sm fea-social"></i></a></li>
                                        <li class="list-inline-item"><a href="#" class="rounded-pill"><i data-feather="instagram" class="fea icon-sm fea-social"></i></a></li>
                                        <li class="list-inline-item"><a href="#" class="rounded-pill"><i data-feather="twitter" class="fea icon-sm fea-social"></i></a></li>
                                        <li class="list-inline-item"><a href="#" class="rounded-pill"><i data-feather="linkedin" class="fea icon-sm fea-social"></i></a></li>
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
                                <p class="mb-0"><script>document.write(new Date().getFullYear())</script> ©  Design with <i class="mdi mdi-heart text-danger"></i> by <a href="../../../index.html" target="_blank" class="text-reset">Group6</a>.</p>
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
        <a href="#" onclick="topFunction()" id="back-to-top" class="btn btn-icon btn-pills btn-primary back-to-top"><i data-feather="arrow-up" class="icons"></i></a>
        <!-- Back to top -->
        <!-- Offcanvas Start -->
        <div class="offcanvas offcanvas-end bg-white shadow" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
            <div class="offcanvas-header p-4 border-bottom">
                <h5 id="offcanvasRightLabel" class="mb-0">
                    <img src=frontend/template/assets/images/MABS__1.png" height="24" class="light-version" alt="">
                    <img src=frontend/template/assets/images/MABS__1.png" height="24" class="dark-version" alt="">
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
                                    <li class="d-grid"><a href="javascript:void(0)" class="rtl-version t-rtl-light" onclick="setTheme('style-rtl')"><img src="../assets/images/layouts/landing-light-rtl.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">RTL Version</span></a></li>
                                    <li class="d-grid"><a href="javascript:void(0)" class="ltr-version t-ltr-light" onclick="setTheme('style')"><img src="../assets/images/layouts/landing-light.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">LTR Version</span></a></li>
                                    <li class="d-grid"><a href="javascript:void(0)" class="dark-rtl-version t-rtl-dark" onclick="setTheme('style-dark-rtl')"><img src="../assets/images/layouts/landing-dark-rtl.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">RTL Version</span></a></li>
                                    <li class="d-grid"><a href="javascript:void(0)" class="dark-ltr-version t-ltr-dark" onclick="setTheme('style-dark')"><img src="../assets/images/layouts/landing-dark.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">LTR Version</span></a></li>
                                    <li class="d-grid"><a href="javascript:void(0)" class="dark-version t-dark mt-4" onclick="setTheme('style-dark')"><img src="../assets/images/layouts/landing-dark.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">Dark Version</span></a></li>
                                    <li class="d-grid"><a href="javascript:void(0)" class="light-version t-light mt-4" onclick="setTheme('style')"><img src="../assets/images/layouts/landing-light.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">Light Version</span></a></li>
                                    <li class="d-grid"><a href="../admin/index.html" target="_blank" class="mt-4"><img src="../assets/images/layouts/light-dash.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">Admin Dashboard</span></a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- end Style switcher -->
                    </div><!--end col-->
                </div><!--end row-->
            </div>
            <div class="offcanvas-footer p-4 border-top text-center">
                <ul class="list-unstyled social-icon mb-0">
                    <li class="list-inline-item mb-0"><a href="https://1.envato.market/doctris-template" target="_blank" class="rounded"><i class="uil uil-shopping-cart align-middle" title="Buy Now"></i></a></li>
                    <li class="list-inline-item mb-0"><a href="https://dribbble.com/shreethemes" target="_blank" class="rounded"><i class="uil uil-dribbble align-middle" title="dribbble"></i></a></li>
                    <li class="list-inline-item mb-0"><a href="https://www.facebook.com/shreethemes" target="_blank" class="rounded"><i class="uil uil-facebook-f align-middle" title="facebook"></i></a></li>
                    <li class="list-inline-item mb-0"><a href="https://www.instagram.com/shreethemes/" target="_blank" class="rounded"><i class="uil uil-instagram align-middle" title="instagram"></i></a></li>
                    <li class="list-inline-item mb-0"><a href="https://twitter.com/shreethemes" target="_blank" class="rounded"><i class="uil uil-twitter align-middle" title="twitter"></i></a></li>
                    <li class="list-inline-item mb-0"><a href="mailto:support@shreethemes.in" class="rounded"><i class="uil uil-envelope align-middle" title="email"></i></a></li>
                    <li class="list-inline-item mb-0"><a href="../../../index.html" target="_blank" class="rounded"><i class="uil uil-globe align-middle" title="website"></i></a></li>
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
        <script src="frontend/template/assets/js/jquery.min.js"></script>
        <script src="frontend/template/assets/js/bootstrap.bundle.min.js"></script>
        <!-- SLIDER -->
        <script src="frontend/template/assets/js/tiny-slider.js"></script>
        <script src="frontend/template/assets/js/tiny-slider-init.js"></script>
        <script src="frontend/template/assets/js/easy_background.js"></script>
        <!-- Select2 -->
        <script src="frontend/template/assets/js/select2.min.js"></script>
        <script src="frontend/template/assets/js/select2.init.js"></script>
        <!-- Datepicker -->
        <script src="frontend/template/assets/js/flatpickr.min.js"></script>
        <script src="frontend/template/assets/js/flatpickr.init.js"></script>
        <!-- Datepicker -->
        <script src="frontend/template/assets/js/jquery.timepicker.min.js"></script> 
        <script src="frontend/template/assets/js/timepicker.init.js"></script> 
        <!-- Icons -->
        <script src="frontend/template/assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="frontend/template/assets/js/app.js"></script>
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