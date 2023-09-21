<%-- 
    Document   : settingList
    Created on : Sep 19, 2023, 2:14:05 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>MABS - Medical Appointment Booking System</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- favicon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/frontend/template/assets/images/favicon.ico.png">
        <!-- Bootstrap -->
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />

    </head>  
    <style>
        body{
            background-color: #D5D3D3;
        }
        .header-title{
            margin-left: 14%;
            margin-bottom: 20px;
        }
        .header{
            margin-left: 63%;
            margin-bottom: 20px;
        }
        .header button{
            background-color: #516FDC;
            color:#EBEBEB;
            border-color:#516FDC;

        }
        .header select{
            height:27px;
        }
        .header{
            background-color: #D9D9D9;
        }
        .container{
            background-color: #D9D9D9;
        }
    </style>
    <body>
        <div class="header-title">
            <h3>Settings</h3>
        </div>
        <form action="settinglist" method="POST">
            <div class="header">
                <input type="text" id="search" name="search" placeholder="Search">
                <select id="searchType" name="searchType">
                    <option value="">All Types</option>
                    <option value="setting_id">Setting ID</option>
                    <option value="type">Type</option>
                    <option value="value">Value</option>
                    <option value="description">Description</option>
                    <option value="status">Status</option>
                </select>
                <button type="button">Add more</button>
            </div>
            <div class="container">
                <table class="col-md-8 table">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Type</th>  
                            <th scope="col">Value</th>
                            <th scope="col">Description</th>
                            <th scope="col">Status</th>
                            <th scope="col">    </th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="s" items="${settings}">
                            <tr>
                                <td>${s.settingId}</td>
                                <td>${s.type}</td>  
                                <td>${s.value}</td>
                                <td>${s.description}</td>
                                <td>${s.status ? 'Active' : 'Deactive'}</td>
                                <td><a href="edit.jsp">Edit</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <script src= "<c:url value= '/frontend/template/assets/js/bootstrap.bundle.min.js'/>"></script>
                <!-- Icons -->

                <script src= "<c:url value= '/frontend/template/assets/js/feather.min.js'/>"></script>
                <!-- Main Js -->

                <script src= "<c:url value= '/frontend/template/assets/js/app.js'/>"></script>
            </div>
        </form>


    </body>
</html>
