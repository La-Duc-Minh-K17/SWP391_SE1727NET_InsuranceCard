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
                margin-bottom: 200px;
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
                margin-left: 65%;
            }
            .func{
                margin-top: 25px;
                margin-left: 5%;
            }
        </style>
        </head>
    <body>
        
        <div class="header">
            <jsp:include page="/frontend/common/header.jsp" />
        </div>
        
        <div class="header-content">
            <h3>Doctors team</h2>
            <h6>Great doctor if you need your family member to get effective immediate assistance,</h4>
            <h6>emergency treatment or a simple consultation</h4>
        </div>
        
        <div class="func">
            <input type="text" id="search" name="search" placeholder="Search">
            <select id="speciality" name="speciality">
            <option value="">Filter</option>
            <c:forEach items="${speList}" var="spe">
                <option value="${spe.speName}">${spe.speName}</option>
            </c:forEach>
        </select>
        </div>
        
        <div class="doctor">
            
        </div>
    </body>
</html>
