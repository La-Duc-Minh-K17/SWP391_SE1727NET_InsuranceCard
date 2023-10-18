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
                    <a href="index.html">
                        <img src="../../template/assets/images/logo-dark.png" height="24" class="logo-light-mode" alt="">
                        <img src="../assets/images/logo-light.png" height="24" class="logo-dark-mode" alt="">
                    </a>
                </div>
                <ul class="sidebar-menu pt-3">
                    <li>
                        <a href="<c:url value='/staff-waiting-list?action=view-all'/>"><i class="uil uil-calendar-alt me-2 d-inline-block">
                            </i>Waiting List
                        </a>
                    </li>
                    <li>
                        <a href="<c:url value='/staff?action=view-appointment'/>"><i class="uil uil-calendar-alt me-2 d-inline-block"></i>Appointment List</a>
                    </li>
                    <li>
                        <a href="<c:url value='/staff?action=view-reservation'/>"><i class="uil uil-calendar-alt me-2 d-inline-block"></i>Reservation List</a>
                    </li>
                </ul>
                <!-- sidebar-menu  -->
            </div>
        </nav>
    </body>

</html>
