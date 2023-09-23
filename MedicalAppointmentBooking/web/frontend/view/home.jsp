<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <title>MABS</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Premium Bootstrap 4 Landing Page Template" />
        <meta name="keywords" content="Appointment, Booking, System, Dashboard, Health" />
        <meta name="author" content="Group6" />
        <meta name="email" content="support@goup6.in" />
        <meta name="website" content="https://group6.com" />
        <meta name="Version" content="v1.2.0" />
        <!-- favicon -->
        <link rel="shortcut icon" href="frontend/assets/images/favicon.ico.png">
        <!-- Bootstrap -->
        <link href="frontend/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- SLIDER -->
        <link rel="stylesheet" href="fontend/assets/css/tiny-slider.css"/>
        <!-- Select2 -->
        <link href="frontend/assets/css/select2.min.css" rel="stylesheet" />
        <!-- Date picker -->
        <link rel="stylesheet" href="frontend/assets/css/flatpickr.min.css">
        <link href=".frontend/assets/css/jquery.timepicker.min.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="frontend/assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="frontend/assets/css/remixicon.css"  type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link rel="stylesheet" href="frontend/assets/css/style.min.css" type="text/css">
        <style>
            #home{
                background-image: url("frontend/assets/images/bg/backgroundclinic.jpg") ;
            }
        </style>
    <body>


        <!-- Navbar STart -->
        <header id="topnav" class="defaultscroll sticky">
            <div class="container">
                <!-- Logo container-->
                <div>
                    <a class="logo" href="index.html">
                        <span class="logo-light-mode">
                            <img src="frontend/assets/images/MABS__1.png" class="l-dark" height="30" alt="">
                            <img src="frontend/assets/images/MABS__1.png" class="l-light" height="30" alt="">
                        </span>
                        <img src="frontend/assets/images/logo-light.png" height="24" class="logo-dark-mode" alt="">
                    </a>
                </div>
                <!-- End Logo container-->

                <!-- Start Mobile Toggle -->
                <div class="menu-extras">
                    <div class="menu-item">
                        <!-- Mobile menu toggle-->
                        <a class="navbar-toggle" id="isToggle" onclick="toggleMenu()">
                            <div class="lines">
                                <span></span>
                                <span></span>
                                <span></span>
                            </div>
                        </a>
                        <!-- End mobile menu toggle-->
                    </div>
                </div>
                <!-- End Mobile Toggle -->
                <ul class="dropdowns list-inline mb-0">
                    <li class="list-inline-item mb-0 ms-1">
                        <div class="flex-1 ms-2">
                        </div>
                        <div class="d-grid d-md-block">
                            <button type="submit" class="btn btn-primary">Sign up</button>

                            <button type="submit" class="btn btn-primary">Login</button>
                            <</div>
                        <div id="navigation">
                    </li>
                </ul>
                

                <div id="navigation">
                    <!-- Navigation Menu-->   
                    <ul class="navigation-menu nav-left nav-light">
                        <li class="has-submenu parent-menu-item">
                            <a href="index-three.html">Home</a>
                        </li>

                        <li class="has-submenu parent-parent-menu-item">
                            <a href="doctor-team-one.html">Doctors</a>
                        </li>
                        <li class="has-submenu parent-menu-item">
                            <a href="javascript:void(0)">Services</a>
                        </li>
                        <li class="has-submenu parent-parent-menu-item"><a href="javascript:void(0)">Blogs</a>
                        </li>
                        <li><a href="../admin/index.html" class="sub-menu-item" target="_blank">About Us</a></li>
                    </ul><!--end navigation menu-->
                </div><!--end navigation-->
            </div><!--end container-->
        </header><!--end header-->
        <!-- Navbar End -->
</html>