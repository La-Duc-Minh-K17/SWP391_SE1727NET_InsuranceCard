<%-- 
    Document   : webdoctordetail
    Created on : Oct 7, 2023, 9:50:29 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <div class="header">
            <jsp:include page="/frontend/common/header.jsp" />
        </div>

        <div class="container mt-100">
            <div class="border-0 rounded shadow row">
                <div class="col-xl-4 col-lg-4 col-md-5 position-relative doctor-img">
                    <img src="data:image/jpg;base64,${doctor.image}" width="300" height="360"/>
                </div>
                <div class="col-xl-8 col-lg-8 col-md-7">
                    <div class="mt-5 text-black-50">
                        <h2 class="mt-3 text-primary">Dr. ${doctor.fullName}</h2>
                        <h6 class="mt-3">Great doctor if you need your family member to get effective immediate assistance,</h6>
                        <h6>emergency treatment or a simple consultation</h6>
                        <div class="text-center">
                            <div class="mt-5 pt-2">
                                <div class="d-flex justify-content-center">
                                    <a href="servicedetail?action=book-service&id=${s.service_id}" class="btn btn-outline-primary btn-lg">Book Now</a>
                                </div>
                            </div>
                        </div><!--end text-center-->
                    </div>    
                </div>
            </div>
        </div>
        <div class="container">
            <div class="col-12 mt-4">
                <div class="card component-wrapper border-0 rounded shadow">
                    <div class="row">
                        <div class="col-lg-12">
                            <ul class="nav nav-pills nav-justified flex-column flex-sm-row rounded"
                                id="pills-tab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link rounded active" id="pills-cloud-tab"
                                       data-bs-toggle="pill" href="#pills-cloud" role="tab"
                                       aria-controls="pills-cloud" aria-selected="false">
                                        <div class="text-center pt-1 pb-1">
                                            <h4 class="title font-weight-normal mb-0">Information</h4>
                                        </div>
                                    </a><!--end nav link-->
                                </li><!--end nav item-->

                                <li class="nav-item">
                                    <a class="nav-link rounded" id="pills-smart-tab"
                                       data-bs-toggle="pill" href="#pills-smart" role="tab"
                                       aria-controls="pills-smart" aria-selected="false">
                                        <div class="text-center pt-1 pb-1">
                                            <h4 class="title font-weight-normal mb-0">Review</h4>
                                        </div>
                                    </a><!--end nav link-->
                                </li><!--end nav item-->
                            </ul><!--end nav pills-->
                        </div><!--end col-->
                    </div><!--end row-->

                    <div class="row pt-2">
                        <div class="col-12">
                            <div class="tab-content" id="pills-tabContent">
                                <div class="tab-pane fade show active" id="pills-cloud"
                                     role="tabpanel" aria-labelledby="pills-cloud-tab">
                                    <div class="p-5">
                                        <h5>${doctor.fullName}</h5>
                                        <h6>${doctor.position}</h6>
                                        <br><!-- comment -->
                                        <p>${doctor.description}</p>
                                        <h5>Speciality:</h5>
                                        <p>${doctor.speciality}</p>
                                    </div>
                                </div><!--end teb pane-->

                                <div class="tab-pane fade" id="pills-smart" role="tabpanel"
                                     aria-labelledby="pills-smart-tab">
                                    <div class="p-5">
                                        <h5 class="card-title mt-4 mb-0">Comments :</h5>
                                        <ul class="media-list list-unstyled mb-0">
                                            <c:forEach items="${feedback}" var="feedback">
                                                <li class="mt-4">
                                                    <div class="d-flex justify-content-between">
                                                        <div class="d-flex align-items-center">
                                                            <a class="pe-3" href="#">
                                                                <img src="data:image/jpg;base64,${feedback.user.image}" class="img-fluid avatar avatar-md-sm rounded-circle shadow" alt="img">
                                                            </a>
                                                            <div class="commentor-detail">
                                                                <h6 class="mb-0"><a href="javascript:void(0)" class="text-dark media-heading">{feedback.user.fullName}</a></h6>
                                                                <small class="text-muted">${feedback.create_time}</small>
                                                            </div>
                                                            <div>
                                                                <c:choose>
                                                                    <c:when test="${feedback.rate >= 1}">
                                                                        ★
                                                                    </c:when>
                                                                    <c:otherwise>☆</c:otherwise>
                                                                </c:choose>
                                                                <c:choose>
                                                                    <c:when test="${feedback.rate >= 2}">
                                                                        ★
                                                                    </c:when>
                                                                    <c:otherwise>☆</c:otherwise>
                                                                </c:choose>
                                                                <c:choose>
                                                                    <c:when test="${feedback.rate >= 3}">
                                                                        ★
                                                                    </c:when>
                                                                    <c:otherwise>☆</c:otherwise>
                                                                </c:choose>
                                                                <c:choose>
                                                                    <c:when test="${feedback.rate >= 4}">
                                                                        ★
                                                                    </c:when>
                                                                    <c:otherwise>☆</c:otherwise>
                                                                </c:choose>
                                                                <c:choose>
                                                                    <c:when test="${feedback.rate >= 5}">
                                                                        ★
                                                                    </c:when>
                                                                    <c:otherwise>☆</c:otherwise>
                                                                </c:choose>      
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="mt-3">
                                                        <p class="text-muted font-italic p-3 bg-light rounded">${feedback.content}</p>
                                                    </div>
                                                </li>
                                            </c:forEach>
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
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!--end col-->
                </div>
            </div><!--end col-->
        </div>
    </div>

</body>
<footer>
    <jsp:include page="/frontend/common/footer.jsp" />
</footer>
</html>






