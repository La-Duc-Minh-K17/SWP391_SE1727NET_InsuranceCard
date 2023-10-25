
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <nav id="sidebar" class="sidebar-wrapper">
            <div class="sidebar-content">
                <ul class="sidebar-menu pt-3 " style="list-style: none">
                    <li class="sidebar-menu side" >
                        <a href="<c:url value='/user-profile?action=view'/>"><i class="uil uil-dashboard me-2 d-inline-block"></i>My Profile</a></li>
                    
                    <li class="sidebar-menu">
                        <a href="<c:url value='/user-appointment?action=view'/>"><i class="uil uil-calendar-alt me-2 d-inline-block"></i>My Appointment </a>
                    </li>
                    <li class="sidebar-menu">
                        <a href="<c:url value='/user-reservation?action=view'/>"><i class="uil uil-calendar-alt me-2 d-inline-block"></i>My Reservation</a>
                    </li>
 
                </ul>

            </div>
        </nav>
    </body>

</html>