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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!-- favicon -->
        <link rel="shortcut icon" href="/assets/images/favicon.ico.png">
        <!-- Bootstrap -->
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- simplebar -->
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/simplebar.css" rel="stylesheet" type="text/css" />
        <!-- Select2 -->
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/select2.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/frontend/template/assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />

    </head>  
    <body>
        <!-- Loader -->
        <div id="preloader">
            <div id="status">
                <div class="spinner">
                    <div class="double-bounce1"></div>
                    <div class="double-bounce2"></div>
                </div>
            </div>
        </div>
        <!-- Loader -->

        <div class="page-wrapper doctris-theme toggled">
            <jsp:include page="/frontend/common/admin_side_bar.jsp" />
            <main class="page-content">
                <div class="top-header">
                    <div class="header-bar d-flex justify-content-between border-bottom">
                        <div class="d-flex align-items-center">
                            <a href="#" class="logo-icon">
                                <img src="frontend/template/assets/images/logo-icon.png" height="30" class="small" alt="">
                                <span class="">
                                    <img src="../assets/images/logo-dark.png" height="24" class="logo-light-mode" alt="">
                                    <img src="../assets/images/logo-light.png" height="24" class="logo-dark-mode" alt="">
                                </span>
                            </a>
                            <a id="close-sidebar" class="btn btn-icon btn-pills btn-soft-primary ms-2" href="#">
                                <i class="uil uil-bars"></i>
                            </a>
                        </div>
                        <ul class="list-unstyled mb-0">
                            <li class="list-inline-item mb-0 ms-1">
                                <div class="dropdown dropdown-primary">
                                    <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0"
                                            data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img
                                            src="/assets/images/doctors/01.jpg"
                                            class="avatar avatar-ex-small rounded-circle" alt=""></button>
                                    <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3"
                                         style="min-width: 200px;">
                                        <a class="dropdown-item d-flex align-items-center text-dark" <img
                                           src="../assets/images/doctors/01.jpg"
                                           class="avatar avatar-md-sm rounded-circle border shadow" alt="">
                                            <div class="flex-1 ms-2">
                                                <span class="d-block mb-1">${sessionScope.user.fullName}</span>
                                                <small class="text-muted"></small>
                                            </div>
                                        </a>
                                        <a class="dropdown-item text-dark" href="dr-profile.html"><span
                                                class="mb-0 d-inline-block me-1"><i
                                                    class="uil uil-setting align-middle h6"></i></span> Profile Settings</a>
                                        <div class="dropdown-divider border-top"></div>
                                        <a class="dropdown-item text-dark" href="lock-screen.html"><span
                                                class="mb-0 d-inline-block me-1"><i
                                                    class="uil uil-sign-out-alt align-middle h6"></i></span> Logout</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>  

                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="row align-content-center justify-content-between" >

                            <div class="col-xl-8 col-md-8">
                                <form class="row" action="admin-settinglist" method="POST">
                                    <div class="card component-wrapper border-0 rounded ">
                                        <div class="row"> <!-- Added a new row container -->
                                            <div class="col-md-6">
                                                <select class="form-select form-control" id="searchType" name="searchType">
                                                    <option value="">All Types</option>                           
                                                    <option value="type">Type</option>
                                                    <option value="value">Value</option>
                                                    <option value="description">Description</option>
<!--                                                    <option value="status">Status</option>-->
                                                </select>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="search-bar d-lg-block" style="padding-top: 0">
                                                    <div id="search" class="menu-search">
                                                        <input type="text" class="form-control  rounded-pill" id="search"  style="opacity: 1; border:1px solid #000;"name="search" placeholder="Search">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <div class="col-xl-3 col-md-3">
                                <button class="btn btn-primary" type="button" id="addMoreButton">Add more</button>
                            </div>
                        </div>

                        <div class="col-12 mt-4">
                            <div class="card component-wrapper border-0 rounded shadow">
                                <div class="p-4 border-bottom">
                                    <h5 class="mb-0">Setting List</h5>
                                </div>
                                <div class="p-4">
                                    <div class="row pt-2">
                                        <div class="col-12 ">
                                            <div class="card component-wrapper border-0 rounded shadow">
                                                <div id="settingListForm">
                                                    <div class="table-responsive bg-white shadow rounded">
                                                        <table class="table mb-0 table-center">
                                                            <thead>
                                                                <tr>
                                                                    <th class="border-bottom p-3" >
                                                                        ID
                                                                    </th>
                                                                    <th class="border-bottom p-3" style="min-width: 50px;">
                                                                        Type</th>
                                                                    <th class="border-bottom p-3" >
                                                                        Value</th>
                                                                    <th class="border-bottom p-3" style="min-width: 100px;">Description</th>
<!--                                                                    <th class="border-bottom p-3" > Status</th>-->

                                                                    <th class="border-bottom p-3" ">
                                                                        Action</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach var="s" items="${settings}" varStatus="loop">
                                                                    <tr>
                                                                        <th class="p-3">${loop.index + 1}</th>
                                                                        <td class="p-3">${s.type}</td>
                                                                        <td class="p-3">${s.note}</td>
                                                                        <td class="p-3">${s.description}</td>
<!--                                                                        <td class="p-3">
                                                                            ${s.status ? 'Active' : 'Deactive'}
                                                                        </td>-->

                                                                        <td>
                                                                            <a class="btn btn-primary editButton" type="button" onclick="editSetting(${s.id}, '${s.settingID}', '${s.type}', '${s.note}', '${s.description}', ${s.status});">Edit</a>


                                                                        </td>

                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                                <div id="addSettingForm" class="add-setting-form" style="display: none;">
                                                    <form action="admin-addsetting" method="POST">
                                                        <h4 class="mb-3 p-4">Add Settings</h4>

                                                        <div class="form-group p-4">
                                                            <label for="settingType">Type:</label>
                                                            <select id="settingType" name="settingType" class="form-control">
                                                                <option value="">All Types</option>
                                                                <option value="user">User</option>
                                                                <option value="speciality">Speciality</option>
                                                                <option value="service">Service</option>
                                                                <option value="blog">Blog</option>
                                                            </select>
                                                        </div>

                                                        <div class="form-group  p-4">
                                                            <label for="settingValue">Value:</label>
                                                            <input type="text" id="settingValue" placeholder="Value" name="settingValue" required class="form-control">
                                                        </div>

                                                        <div class="form-group  p-4">
                                                            <label for="settingDescription">Description:</label>
                                                            <input type="text" id="settingDescription" placeholder="Description" name="settingDescription" required class="form-control">
                                                        </div>

                                                        <div class="form-group  p-4">
                                                            <label for="settingStatus">Status:</label>
<!--                                                            <select id="settingStatus" name="settingStatus" class="form-control">
                                                                <option value="Active">Active</option>
                                                                <option value="Deactive">Deactive</option>
                                                            </select>-->
                                                        </div>

                                                        <button type="submit" class="btn btn-primary ms-4">Add Setting</button>
                                                        <button type="button" id="cancelButton" class=" ms-4 btn btn-secondary">Cancel</button>
                                                    </form>
                                                </div>

                                                <div id="editSettingForm" class="edit-setting-form" style="display: none;">
                                                    <!-- Edit form content here -->
                                                    <form action="admin-editsetting" method="POST">
                                                        <h4 class="mb-3 p-4">Edit Settings</h4>
                                                        <input type="hidden" id="id" name="id" value ="${s.id}">
                                                        <div class="form-group p-4">
                                                            <label for="editSettingType">Type:</label>
                                                            <select id="editSettingType" name="editSettingType" required class="form-control">
                                                                <option value="">All Types</option>
                                                                <option value="user">User</option>
                                                                <option value="speciality">Speciality</option>
                                                                <option value="service">Service</option>
                                                                <option value="blog">Blog</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group  p-4">
                                                            <label for="editSettingValue">Value:</label>
                                                            <input type="text" id="editSettingValue" value="${s.note}" name="editSettingValue" required class="form-control">
                                                        </div>

                                                        <div class="form-group  p-4">
                                                            <label for="editSettingDescription">Description:</label>
                                                            <input type="text" id="editSettingDescription" placeholder="${s.description}" name="editSettingDescription" required class="form-control">
                                                        </div>

<!--                                                        <div class="form-group  p-4">
                                                            <label for="editSettingStatus">Status:</label>
                                                            <div class="form-group  p-4">
                                                                <label for="editSettingStatus">Status:</label>
                                                                <select id="editSettingStatus" name="editSettingStatus" class="form-control">
                                                                    <c:choose>
                                                                        <c:when test="${s.status == true}">
                                                                            <option value="Active" selected="selected">Active</option>
                                                                            <option value="Deactive">Deactive</option>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <option value="Active">Active</option>
                                                                            <option value="Deactive" selected="selected">Deactive</option>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </select>
                                                            </div>
                                                       </div>-->

                                                        <button type="submit" class="btn btn-primary ms-4">Save Changes</button>
                                                        <button type="button" id="cancelEditButton" class="ms-4 btn btn-secondary">Cancel</button>
                                                    </form>
                                                </div>

                                            </div>
                                        </div><!--end col-->

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div><!--end container-->
                </div>
            </main>
        </div>
        <!-- page-wrapper -->
        <!-- javascript -->
        <script src="${pageContext.request.contextPath}/frontend/template/assets/js/simplebar.min.js"></script>
        <!-- Icons -->
        <script src="${pageContext.request.contextPath}/frontend/template/assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="${pageContext.request.contextPath}/frontend/template/assets/js/app.js"></script>

        <script>
                                                                                var addMoreButton = document.getElementById("addMoreButton");
                                                                                var addSettingForm = document.getElementById("addSettingForm");
                                                                                addMoreButton.addEventListener("click", function () {
                                                                                    addSettingForm.style.display = "block";
                                                                                    var settingListForm = document.getElementById("settingListForm");
                                                                                    settingListForm.style.display = "none";
                                                                                });
                                                                                var submitButton = addSettingForm.querySelector("button[type='submit']");
                                                                                var cancelButton = addSettingForm.querySelector("button[type='button']");
                                                                                submitButton.addEventListener("click", function () {
                                                                                    addSettingForm.style.display = "none";
                                                                                    var settingListForm = document.getElementById("settingListForm");
                                                                                    settingListForm.style.display = "block";
                                                                                });
                                                                                cancelButton.addEventListener("click", function () {
                                                                                    addSettingForm.style.display = "none";
                                                                                    var settingListForm = document.getElementById("settingListForm");
                                                                                    settingListForm.style.display = "block";
                                                                                });


                                                                                var editButtons = document.querySelectorAll(".editButton");

                                                                                editButtons.forEach(function (button) {
                                                                                    button.addEventListener("click", function () {
                                                                                        // Show the Edit Setting Form
                                                                                        var editSettingForm = document.getElementById("editSettingForm");
                                                                                        editSettingForm.style.display = "block";

                                                                                        // Hide the Setting List Form
                                                                                        var settingListForm = document.getElementById("settingListForm");
                                                                                        settingListForm.style.display = "none";


//                                                                                  
                                                                                    });
                                                                                });

                                                                                // Add an event listener to the "Cancel" button in the Edit Setting Form
                                                                                var cancelEditButton = document.getElementById("cancelEditButton");

                                                                                cancelEditButton.addEventListener("click", function () {
                                                                                    // Hide the Edit Setting Form without saving changes
                                                                                    var editSettingForm = document.getElementById("editSettingForm");
                                                                                    editSettingForm.style.display = "none";

                                                                                    // Show the Setting List Form
                                                                                    var settingListForm = document.getElementById("settingListForm");
                                                                                    settingListForm.style.display = "block";
                                                                                });
                                                                                function editSetting(id, settingID, type, note, description, status) {
                                                                                    console.log("Edit button clicked.");

                                                                                    // Populate the edit form fields with the provided values
                                                                                    document.getElementById("id").value = id;
                                                                                    document.getElementById("editSettingType").value = type;
                                                                                    document.getElementById("editSettingValue").value = note;
                                                                                    document.getElementById("editSettingDescription").value = description;
                                                                                    document.getElementById("editSettingStatus").value = status;
                                                                                    console.log(status);
                                                                                    var editSettingForm = document.getElementById("editSettingForm");
                                                                                    editSettingForm.style.display = "block";

                                                                                    // Hide the Setting List Form
                                                                                    var settingListForm = document.getElementById("settingListForm");
                                                                                    settingListForm.style.display = "none";
                                                                                }

        </script>
    </body>


</html>