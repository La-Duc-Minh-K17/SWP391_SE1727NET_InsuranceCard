<%-- 
    Document   : webdoctorlist
    Created on : Oct 3, 2023, 2:45:04 PM
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
        <style>
            #home{
                background-image: url("frontend/template/assets/images/bg/backgroundclinic.jpg") ;
            }
            .header{
                margin-bottom: 150px;
                background-color: #D9D9D9;
            }
            .header-content{
                /*                background-color: #D9D9D9;*/
                text-align: center;
                padding-bottom: 30px;
            }
            .header-content h3{
                margin-bottom: 15px;
            }
            .header-content h6{
                color:grey;

            }
            .func select{
                margin-left: 55.7%;
            }
            .func{
                margin-top: 25px;
                margin-left: 13.3%;
                margin-bottom: 25px;
            }
            .doctor{
                /*              text-align: center;*/
            }
            .doctor h6{
                color:grey;
            }
        </style>
    </head>
    <body>

        <div class="header">
            <jsp:include page="/frontend/common/header.jsp" />
        </div>

        <div class="header-content  text-center p-5">
            <h3 class="text-primary">Doctors Team</h3>
            <p class="lead">Great doctors if you need immediate assistance, emergency treatment, or a simple consultation.</p>
        </div>
        <form action="WebDoctorList" method="POST">
            <div class="row justify-content-between">
                <div class="col-md-3 d-flex m-5 ">
                    <input class="form-control border bg-light" type="text" id="search" name="search" placeholder="Search">
                    <button class="btn btn-primary" type="submit">Search</button>
                </div>
                <div class="col-md-2 d-flex m-5">
                    <select class="form-select" id="speciality" name="speciality">
                        <option value="">Speciality</option>
                        <c:forEach items="${speList}" var="spe">
                            <option value="${spe.speName}">${spe.speName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
        </form>
        <section class="section bg-white">
            <div id="doctor-container" class="container">
                <div class="row justify-content-center">
                    <c:forEach items="${doctor}" var="doctor">
                        <div class=" col-xl-3 col-lg-3 col-md-6  doctor card border-1 shadow rounded overflow-hidden m-4 ">
                            <a href="WebDoctorDetail?doctorId=${doctor.doctorId}">
                                <div class="d-flex justify-content-center border-1">
                                    <img src="data:image/jpg;base64,${doctor.image}" width="100%" height="300" class="border-1 rounded" />
                                </div>
                                <h5>${doctor.fullName}</h5>
                                <h6>${doctor.speciality}</h6>
                                <h6 class="text-muted">$ ${doctor.serviceFee} USD / visit</h6>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
        <script>

            function filterDoctors() {
                var selectedSpeciality = document.getElementById("speciality").value;
                var doctorContainers = document.getElementsByClassName("doctor");

                for (var i = 0; i < doctorContainers.length; i++) {
                    var doctorSpeciality = doctorContainers[i].querySelector("h6").textContent;
                    if (selectedSpeciality === "" || selectedSpeciality === doctorSpeciality) {
                        doctorContainers[i].style.display = "block";
                    } else {
                        doctorContainers[i].style.display = "none";
                    }
                }
            }

            document.getElementById("speciality").addEventListener("change", filterDoctors);

            filterDoctors();
        </script>
    </body>
    <footer>
        <jsp:include page="/frontend/common/footer.jsp" />
    </footer>

</html>
