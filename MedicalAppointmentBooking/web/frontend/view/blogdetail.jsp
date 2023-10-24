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

        <jsp:include page="/frontend/common/header.jsp" />

        <section class="bg-half-60 d-table w-100" id="home">

            <div class="container">
                <div class="row mt-5 justify-content-center">
                    <div class="col-12">
                        <div class="section-title text-center">
                            <h3 class="sub-title mb-4 text-white title-dark">Blogs &amp; News</h3>
                            <p class="para-desc mx-auto text-white-50">Great doctor if you need your family member to get
                                effective immediate assistance, emergency treatment or a simple consultation.</p>

                            <nav aria-label="breadcrumb" class="d-inline-block mt-3">
                                <ul class="breadcrumb bg-light rounded mb-0 py-1 px-2">
                                    <li class="breadcrumb-item"><a href="home">MABS</a></li>
                                    <li class="breadcrumb-item active" aria-current="page"href="new">Blogs</li>
                                </ul>
                            </nav>
                        </div>
                    </div><!--end col-->
                </div>
            </div><!--end container-->
        </section>

        <main>
            <section class="section">
                <div class="container">
                    <div class="row" >
                        <div class="col-lg-8">
                            <div class="container">
                                <div class="row mt-5 justify-content-center">
                                    <div class="col-12">
                                        <div class="section-title text-center">
                                            <h3 class="sub-title mb-4">${blog.title}</h3>
                                            <ul class="list-unstyled mt-4">

                                                <li class="list-inline-item date text-muted"><i class="mdi mdi-calendar-check"></i> ${blog.created_time}</li>
                                            </ul>
                                        </div>
                                    </div><!--end col-->
                                </div><!--end row-->
                            </div><!--end container-->
                            <div class="">
                                <img src="data:image/jpg;base64,${blog.image}" class="img-fluid rounded shadow" alt="">
                                <p class="text-muted">${blog.content}</p>
                                <h5 class="card-title mt-4 mb-0">Comments :</h5>
                                <ul class="media-list list-unstyled mb-0">
                                    <li class="mt-4">
                                        <div class="d-flex justify-content-between">
                                            <div class="d-flex align-items-center">
                                                <a class="pe-3" href="#">
                                                    <img src="../assets/images/client/01.jpg" class="img-fluid avatar avatar-md-sm rounded-circle shadow" alt="img">
                                                </a>
                                                <div class="commentor-detail">
                                                    <h6 class="mb-0"><a href="javascript:void(0)" class="text-dark media-heading">Lorenzo Peterson</a></h6>
                                                    <small class="text-muted">15th August, 2019 at 01:25 pm</small>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="mt-3">
                                            <p class="text-muted font-italic p-3 bg-light rounded">" There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour "</p>
                                        </div>
                                    </li>


                                </ul>

                                <h5 class="card-title mt-4 mb-0">Leave A Comment :</h5>

                                <form class="mt-3">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">Your Comment</label>
                                                <textarea id="message" placeholder="Your Comment" rows="5" name="message" class="form-control" required=""></textarea>
                                            </div>
                                        </div><!--end col-->
                                        <div class="col-md-12">
                                            <div class="send d-grid">
                                                <button type="submit" class="btn btn-primary">Send Message</button>
                                            </div>
                                        </div><!--end col-->
                                    </div><!--end row-->
                                </form><!--end form-->
                            </div><!--end col-->
                        </div>

                        <div class="col-lg-4 col-md-5 mt-4 mt-sm-0 pt-2 pt-sm-0">
                            <div class="card border-0 sidebar sticky-bar rounded shadow">
                                <div class="card-body">                       
                                    <div class="widget mb-4 pb-2">
                                        <h5 class="widget-title">Recent Post</h5>
                                        <div class="mt-4">
                                            <c:forEach var="o" items="${requestScope.blogs3}">
                                                <div class="clearfix post-recent">
                                                    <div class="post-recent-thumb float-start"> <a href="jvascript:void(0)">
                                                            <img alt="img" src= "data:image/jpg;base64,${o.image}"
                                                                 class="img-fluid rounded"></a></div>
                                                    <div class="post-recent-content float-start"><a
                                                            href="newdetail?id=${o.blog_id}"">${o.title}</a><span
                                                            class="text-muted mt-2">${created_time}</span></div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div>
                                        <h5>Related Doctor</h5>
                                        <div class="tiny-slide">
                                            <div class="card blog blog-primary border-0 shadow rounded overflow-hidden m-1">
                                                <div class="tiny-slide">
                                                    <div class="card blog blog-primary border-0 shadow rounded overflow-hidden m-1">
                                                        <div class="card border-0" >
                                                            <img src="frontend/template/assets/images/doctors/profile-bg.jpg" class="img-fluid" alt="">
                                                        </div>
                                                        <div>
                                                            <c:set var="doctor" value="${doctor}"></c:set>
                                                                <div class="text-center avatar-profile margin-nagative mt-n5 position-relative pb-4 border-bottom">
                                                                    <img src="data:image/jpg;base64,${doctor.image}" class="rounded-circle shadow-md avatar avatar-md-md" alt="">
                                                                <h5 class="mt-3 mb-1">Dr. ${doctor.fullName}</h5>
                                                                <p class="text-muted mb-0">${doctor.speciality}</p>
                                                            </div>
                                                        </div>
                                                    </div>
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
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </form>
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
                    <div class="container" style="margin-top: 90px;">
                        <section class="blog_area section-padding">
                            <div class="container">
                                <div class="row">
                                    <div class="row">
                                        <div class="col-lg-12 mt-4 pt-4 m-4">
                                            <div class="slider-range-three">
                                                <c:forEach var="o" items="${requestScope.blogs6}">
                                                    <div class="tiny-slide">
                                                        <div class="card blog blog-primary border-0 shadow rounded overflow-hidden m-1" value="${o.blog_id}">
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
                                                                    <a href="newdetail?id=${o.blog_id}" class="text-dark title h5">${o.title}</a>
                                                                    <div>
                                                                        <ul class="list-unstyled mb-0">
                                                                            <a href="newdetail?id=${o.blog_id}" class="text-dark title h6">${o.description}</a>
                                                                        </ul>
                                                                    </div>
                                                                    <div class="post-meta d-flex justify-content-between mt-3">                                               
                                                                        <a href="newdetail?id=${o.blog_id}" class="link">Read More <i
                                                                                class="mdi mdi-chevron-right align-middle"></i></a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div><!--end col-->
                                        </div>
                                    </div>
                                </div>
                        </section>
                    </div>
                </div><!--end col-->
            </section>


        </main>

        <jsp:include page="/frontend/common/footer.jsp" />
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

    </body>
</html>