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
            .custom-center {
                justify-content: center !important;
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
                justify-content: s
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

            .card-body {
                flex: 1;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .card-title,
            .card-text {
                margin-bottom: 15px;
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
            #home{
                background-image: url("frontend/template/assets/images/bg/department.jpg") ;
            }
        </style>
    </head>
    <body>
        <jsp:include page="/frontend/common/header.jsp" />
        <section class="bg-half-170 d-table w-100" id="home"></section>
        <div class="container">
        <div class="row">
            <div class="col-md-9">
                <h3 class="title mt-2">List Services</h3>
            </div>
            <div class="col-md-3">
                <div class="selection-bar btn-success m-5 col-md-12 align-items-center text-right">
                    <select class="form-select form-control">
                        <option selected>Choose...</option>
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                </div>
            </div>
        </div>
    </div>
            <div class="row custom-center">
                <div class="container mt-5 m-5">
                    <div class="row justify-content-center">

                        <c:forEach items="${requestScope.services}" var="s" varStatus="loop">
                            <div class="col-md-3 mt-4">
                                <div class="card mb-4">
                                    <div class="card-img-container">
                                        <img src="data:image/jpg;base64,${s.service_image}" class="card-img-top" alt="${s.service_name}">
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title text-primary">${s.service_name}</h5>
                                        <p class="card-body text-secondary ">${s.service_description}</p>
                                        <h5 class="card-body text-muted mt-2">$${s.fee}</h5>
                                        <div class="d-flex flex-column align-items-center mt-3">
                                            <div class="">
                                                <a href="servicedetail?id=${s.service_id}" class="btn btn-primary custom-button">Learn More</a>
                                                <a href="#" class="btn btn-success custom-button">Appointment Now</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <c:if test="${loop.index % 4 == 3}">
                                <div class="w-100"></div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div><!--end row-->
            </div><!--end container-->
        </section><!--end section-->
        <!-- End Service Items -->











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
