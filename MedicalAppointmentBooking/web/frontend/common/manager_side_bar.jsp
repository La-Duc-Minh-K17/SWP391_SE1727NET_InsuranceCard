<%-- 
    Document   : adminSidebar
    Created on : Sep 28, 2023, 10:40:27 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <nav id="sidebar" class="sidebar-wrapper">
            <div class="sidebar-content" data-simplebar style="height: calc(100% - 60px);">
                <div class="sidebar-brand">
                    <a href="#">
                        <img src="frontend/template/assets/images/MABS__1.png" height="24" class="logo-light-mode" alt="">
                        <img src="frontend/template/assets/images/MABS__1.png" height="24" class="logo-dark-mode" alt="">
                    </a>
                </div>
                <div class="card border-0" >
                    <img src="frontend/template/assets/images/doctors/profile-bg.jpg" class="img-fluid" alt="">
                </div>
                <ul class="sidebar-menu pt-3">
                    <li class="sidebar-menu">
                        <a href="<c:url value='/manage-appointment?action=view'/>"><i class="uil uil-calendar-alt me-2 d-inline-block"></i>Appointment List</a>
                    </li>
                    <li class="sidebar-menu">
                        <a href="<c:url value='/manage-reservation?action=view'/>"><i class="uil uil-calendar-alt me-2 d-inline-block"></i>Reservation List</a>
                    </li>
                    <li class="sidebar-menu">
                        <a href="<c:url value='/manage-doctor?action=view-all'/>"><i class="uil uil-user me-2 d-inline-block"></i>Doctors</a>
                    </li>
                    <li class="sidebar-menu">
                        <a href="<c:url value='/manage-service?action=view-all'/>"><i class="uil uil-user me-2 d-inline-block"></i>Services</a>
                    </li>
                    <li class="sidebar-menu">
                        <a href="<c:url value='/manage-patient?action=view-all'/>"><i class="uil uil-wheelchair me-2 d-inline-block"></i>Patients</a>
                    </li>
                    <li class="sidebar-menu">
                        <a href="<c:url value='/manage-blog?action=view-all'/>"><i class="uil uil-flip-h me-2 d-inline-block"></i>Blogs</a>
                    </li>
                    <li class="sidebar-menu">
                        <a href="<c:url value='/manage-servicereview?action=view-all'/>"><i class="uil uil-user me-2 d-inline-block"></i>Service Review</a>
                    </li>
                    <li class="sidebar-menu">
                        <a href="<c:url value='/manage-doctorfeedback?action=view-all'/>"><i class="uil uil-user me-2 d-inline-block"></i>Doctor Feedback</a>
                    </li>
                    <li class="sidebar-menu">
                        <a href="<c:url value='/user-profile?action=view'/>"><i class="uil uil-user me-2 d-inline-block"></i>My Account</a>
                    </li>
                </ul>
                <!-- sidebar-menu  -->
            </div>
        </nav>
    </body>

</html>
