<%-- 
    Document   : admin_schedulecalendar
    Created on : Oct 23, 2023, 4:36:27 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Doctris - Doctor Appointment Booking System</title>

        <!-- favicon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/frontend/template/assets/images/favicon.ico.png">
        <!-- Bootstrap -->
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- simplebar -->
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/simplebar.css" rel="stylesheet" type="text/css" />
        <!-- Calendar -->
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/fullcalendar.min.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->

        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <script src= "<c:url value= '/frontend/template/assets/js/jquery.min.js'/>"></script>
        <script src="<c:url value= '/frontend/template/assets/js/index.global.min.js'/>"></script>
        <style>

        </style>
    </head>
    <body>
        <div class="row justify-content-center">
            <div class=" col-10 mt-4">
                <div id="calendar-container" class="card rounded border-0 shadow p-4">
                    <div id="calendar"></div>
                </div>
            </div><!--end col-->
        </div><!--end row-->
    </body>
    <script>


        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialDate: new Date(),
                initialView: 'timeGridWeek',
                nowIndicator: true,
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
                },
                navLinks: true, // can click day/week names to navigate views
                editable: true,
                selectable: true,
                selectMirror: true,
                dayMaxEvents: true, // allow "more" link when too many events events: '/MedicalAppointmentBooking/admin-calendar',
                eventSources: [
                    {
                        url: '/MedicalAppointmentBooking/admin-calendar',   
                        success: function (data) {
                            console.log(data); // Log the JSON data to the console for debugging
                        }
                    }
                ],
            });

            calendar.render();
        });
        
    </script>
    <script src= "<c:url value= '/frontend/template/assets/js/bootstrap.bundle.min.js'/>"></script>
    <script src= "<c:url value= '/frontend/template/assets/js/simplebar.min.js'/>"></script>
    <script src="<c:url value= '/frontend/template/assets/js/feather.min.js'/>"></script>
    <script src="<c:url value= '/frontend/template/assets/js/app.js'/>"></script>
</html>
