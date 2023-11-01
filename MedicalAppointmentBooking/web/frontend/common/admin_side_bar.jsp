<%-- 
    Document   : adminSidebar
    Created on : Sep 28, 2023, 10:40:27 AM
    Author     : Admin
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <img src="${pageContext.request.contextPath}/frontend/template/assets/images/logo-dark.png" height="24" class="logo-light-mode" alt="">
                        <img src="${pageContext.request.contextPath}/frontend/template/assets/images/logo-light.png" height="24" class="logo-dark-mode" alt="">
                    </a>
                </div>
                <div class="card border-0" >
                    <img src="frontend/template/assets/images/doctors/profile-bg.jpg" class="img-fluid" alt="">
                </div>
                <ul class="sidebar-menu pt-3">
                    <li class="sidebar-menu" >
                        <a href="<c:url value='/admin-dashboard?action=view-all'/>"><i class="uil uil-dashboard me-2 d-inline-block"></i>Dashboard</a></li>
                    <li class="sidebar-menu">
                        <a href="<c:url value='/frontend/view/admin/admin_schedulecalendar.jsp'/>"><i class="uil uil-calendar-alt me-2 d-inline-block"></i>System Schedule</a></li>
                    <li class="sidebar-menu">
                        <a href="<c:url value='/admin-accountlist?action=view-all'/>"><i class="uil uil-user me-2 d-inline-block"></i>Accounts</a>
                    </li>
                    <li class="sidebar-menu">
                        <a href="<c:url value='/admin-settinglist'/>"><i class="uil uil-setting me-2 d-inline-block"></i>Settings</a>
                    </li>
                    <li class="sidebar-menu">
                        <a href="<c:url value='/admin-appointment?action=view'/>"><i class="uil uil-calendar-alt me-2 d-inline-block"></i>Appointment List</a>
                    </li>
                    <li class="sidebar-menu">
                        <a href="<c:url value='/admin-reservation?action=view'/>"><i class="uil uil-calendar-alt me-2 d-inline-block"></i>Reservation List</a>
                    </li>
                    <li class="sidebar-menu">
                        <a href="<c:url value='/frontend/view/admin/profile.jsp'/>"><i class="uil uil-user me-2 d-inline-block"></i>My Account</a>
                    </li>
                </ul>
            </div>
        </nav>
    </body>

</html>
