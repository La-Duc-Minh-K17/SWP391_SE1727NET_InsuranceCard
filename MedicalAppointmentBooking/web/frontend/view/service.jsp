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
            .card-img-container {
    height: 200px; /* Điều chỉnh chiều cao tùy ý */
    overflow: hidden;
}

.card-img-container img {
    width: 100%;
    height: 100%;
    object-fit: cover; /* Đảm bảo tỷ lệ kích thước và cắt hình ảnh nếu cần */
}

            #home{
                background-image: url("frontend/template/assets/images/bg/department.jpg") ;
            }
        </style>
    </head>
    <body>
        <jsp:include page="/frontend/common/header.jsp" />
        <!-- Hero Section -->
<!-- Hero Section -->

<section class="bg-half-170 d-table w-100" id="home">
    <!-- ... Hero content ... -->
</section>
<!-- End Hero -->

<!-- Form Select -->
<div class="container mt-5 m-5 text-center">
    <!-- ... Form select ... -->
</div>
<!-- End Form Select -->

<!-- Service Items -->
<section>
    <div class="container mt-5 m-5">
        <div class="row">
            <c:forEach items="${requestScope.services}" var="s" varStatus="loop">
                <div class="col-md-3 mt-4">
                    <div class="card mb-4">
                        <div class="card-img-container">
                            <img src="data:image/jpg;base64,${s.service_image}" class="card-img-top" alt="${s.service_name}">
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">${s.service_name}</h5>
                            <p class="card-text">${s.service_description}</p>
                            <a href="servicedetail?id=${s.service_id}" class="btn btn-primary">Learn More</a>
                        </div>
                    </div>
                </div><!--end col-md-3-->
                <c:if test="${loop.index % 4 == 3}">
                    <div class="w-100"></div><!-- Clear the row after every 4 items -->
                </c:if>
            </c:forEach>
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
