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

        <section class="bg-lig  ht mt-5">
            <div class="container">
                <div class="row ">
                    <div class="col-12">
                        <div class="">
                            <p class="mx-auto text-muted">Great doctor if you need your family member to get effective immediate assistance, emergency treatment, or a simple consultation.</p>

                            <nav aria-label="breadcrumb" class="mt-2 m-2">
                                <ol class="breadcrumb bg-light rounded bg-transparent">
                                    <li class="breadcrumb-item"><a href="home">MABS</a></li>
                                    <li class="breadcrumb-item"><a href="service?action=view-all">Services</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Services Detail</li>
                                </ol>
                            </nav>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end container-->
        </section><!--end Service Detail Section-->

        <!-- Product Images and Details Section -->
        <!-- Product Images and Details Section -->
        <section class="container ">
            <c:set value="${requestScope.serviceDetail}" var="s" />
            <div class="row">
                <div class="col-md-5">
                    <div class="text-center m-5">
                        <img src="data:image/jpg;base64,${s.service_image}" height="400" width="500" alt="${s.service_name}" />
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="text-center m-5">
                        <h4 class="title h3 text-primary">${s.service_name}</h4>
                        <h4 class="text-muted mt-5">$${s.fee}</h4>
                        <div class="text-center">
                            <div class="mt-5 pt-2">
                                <div class="d-flex justify-content-center">
                                    <a href="servicedetail?action=book-service&id=${s.service_id}" class="btn btn-outline-primary btn-lg">Book Now</a>
                                </div>
                            </div>
                        </div><!--end text-center-->
                    </div>
                </div><!--end col-md-7-->
            </div><!--end row-->

            <div class="row">
                <div class="col-md-12">
                    <div class="text-start m-5">
                        <h5 class="mt-4 py-2">Description</h5>
                        <label class="form-label">${s.service_details} </label>
                    </div>
                </div>
            </div><!--end row-->

            <div class="row mt-5">
                <h4 class="col-12 text-start title text-primary">Related Services</h4>
                <c:forEach items="${requestScope.Lists}" var="l" >
                    <div class="col-md-3 mt-4 pt-2">
                        <div class="card team border-0 rounded shadow overflow-hidden" style="height: 100%;">
                            <div class="team-img position-relative">
                                <img src="data:image/jpg;base64,${l.service_image}" width="300" height="250" alt="" />
                            </div>
                            <div class="card-body content text-center" style="position: relative;">
                                <a href="javascript:void(0);" onclick="viewServiceDetails(${l.service_id}, ${l.category_id})" class="title text-dark h5 d-block">${l.service_name}</a>
                                <small class="text-muted " style="position: absolute; bottom: 0; left: 0; right: 0;">$${l.fee}</small>
                            </div>
                        </div>
                    </div><!--end col-->
                </c:forEach>
            </div><!--end row-->


        </section><!--end Product Images and Details Section-->
        <script>
            function viewServiceDetails(serviceId, categoryId) {
                var url = "servicedetail?action=view-detail&id=" + serviceId + "&category_id=" + categoryId;
                window.location.href = url;
            }
        </script>


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
    <footer><jsp:include page="/frontend/common/footer.jsp" /></footer>
</html>
