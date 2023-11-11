<%-- 
    Document   : editservice
    Created on : Oct 13, 2023, 2:25:40 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Service</title>
        <link rel="shortcut icon" href="/frontend/template/assets/images/favicon.ico.png">
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
        <script type="text/javascript" src="<c:url value='https://cdn.ckeditor.com/4.7.0/standard/ckeditor.js'/>"></script>
        <script src="${pageContext.request.contextPath}/frontend/template/assets/js/jquery.min.js"></script>
        <script type="text/javascript" src="<c:url value='https://cdn.ckeditor.com/4.7.0/standard/ckeditor.js'/>"></script>
        <script src="${pageContext.request.contextPath}/frontend/template/assets/js/jquery.min.js"></script>
    </head>
    <body>
        <div class="page-wrapper doctris-theme toggled">
            <jsp:include page="/frontend/common/manager_side_bar.jsp" />
            <main class="page-content">
                <div class="top-header">
                    <div class="header-bar d-flex justify-content-between border-bottom">
                        <div class="d-flex align-items-center">
                            <a href="#" class="logo-icon">
                                <img src="frontend/template/assets/images/logo-icon.png" height="30" class="small" alt="">
                                <span class="big">
                                    <img src="frontend/template/assets/images/logo-dark.png" height="24" class="logo-light-mode" alt="">
                                    <img src="frontend/template/assets/images/logo-light.png" height="24" class="logo-dark-mode" alt="">
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
                                            src="frontend/template/assets/images/doctors/01.jpg"
                                            class="avatar avatar-ex-small rounded-circle" alt=""></button>
                                    <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3"
                                         style="min-width: 200px;">
                                        <a class="dropdown-item d-flex align-items-center text-dark"
                                           href="https://shreethemes.in/doctris/layouts/admin/profile.html">
                                            <img src="../assets/images/doctors/01.jpg"
                                                 class="avatar avatar-md-sm rounded-circle border shadow" alt="">
                                            <div class="flex-1 ms-2">
                                                <span class="d-block mb-1">Calvin Carlo</span>
                                                <small class="text-muted">Orthopedic</small>
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
                <c:set value="${requestScope.service}" var="s"></c:set>
                    <div class="mt-100" id="edit" role="tabpanel" aria-labelledby="edit">
                        <div class="card border-0 shadow overflow-hidden">
                            <div class="tab-content p-4" id="pills-tabContent">
                                <form action="<c:url value='/manage-service?action=edit-info&service_id=${s.service_id}'/>" method="POST" enctype="multipart/form-data">
                                <h5 class="mb-0">Edit Service Information.</h5>
                                <div>
                                    <p class="text-muted">Update Image.</p>
                                    <div id="thumbbox" class="mt-5 mb-3">
                                        <img class="rounded" height="20%" width="30%" alt="Thumb image" id="thumbImage"  src="data:image/jpg;base64,${s.service_image}" />
                                    </div>
                                    <div id="myfileupload" class="mt-5 mb-5">
                                        <input type="file" name="image" id="uploadfile" name="ImageUpload" onchange="displayThumbnail(this);" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <label class="form-label">Title</label>
                                            <input name="service_name" id="name" type="text" class="form-control" value="${s.service_name}" required placeholder="Service Name" oninput="validateInput(this)" required placeholder="Enter the Service Name">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <label class="form-label">Price</label>
                                            <div class="input-group">
                                                <span class="input-group-text">$</span>
                                                <input name="service_fee" type="text" class="form-control" value="${s.fee}" required placeholder="Service Fee" oninput="validateInput(this)" pattern="^[0-9.]*$" required placeholder="Enter the Service Fee">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-12">
                                        <div class="mb-3 custom-box">
                                            <label class="form-label">Description</label>
                                            <input name="service_description" type="text" class="form-control" value="${s.service_description}" required placeholder="Service Description" oninput="validateInput(this)" required placeholder="Enter the Service Description">
                                        </div>
                                    </div>

                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <label class="form-label">Category</label>
                                            <select name="category_id" class="form-select">
                                                <c:forEach items="${requestScope.cateList}" var="c">
                                                    <option value="${c.sc_id}">${c.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="mb-3 custom-box">
                                            <label class="form-label">Detail</label>
                                            <textarea id="detail" name="service_details" cols="50" rows="30"class="form-control"  required placeholder="Service Details">${s.service_details} </textarea>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <label class="form-label">Status</label>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td><input id="" name="status" ${s.service_status== 1?"checked":""} value="1" type="radio" class="form-check-input m-3 "
                                                                   checked required ></td>
                                                        <td><label class="form-check-label mt-3 mb-3">Activate</label></td>
                                                        <td></td>
                                                        <td><input id="" name="status" ${s.service_status==0 ?"checked":""} value="0" type="radio" class="form-check-input m-3"
                                                                   required></td>
                                                        <td><label class="form-check-label mt-3 mb-3">Inactivate</label></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class=" col-lg-9">
                                        <a href="<c:url value='/manage-service?action=view-all'/> " class="btn btn-primary mt-5 ">Return</a>
                                    </div>
                                    <div class="col-lg-3">
                                        <input type="submit" id="submit" name="send" class="btn btn-primary mt-5"value="SAVE">
                                    </div>

                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </main><!-- comment -->
        </div>
    </body>
    <script type="text/javascript">
        CKEDITOR.replace('detail');
    </script>
    <script>
        function displayThumbnail() {
            const input = document.getElementById("uploadfile");
            const thumbnail = document.getElementById("thumbImage");

            // Check if a file has been selected
            if (input.files && input.files[0]) {
                const reader = new FileReader();

                reader.onload = function (e) {
                    thumbnail.src = e.target.result;
                };

                reader.readAsDataURL(input.files[0]);
            } else {
                thumbnail.src = "";
            }
        }

        function validateInput(inputElement) {
            var inputValue = inputElement.value;
            var pattern = /^[a-zA-Z0-9 ]*$/; // Only allow alphanumeric characters and spaces

            if (!pattern.test(inputValue)) {
                alert("Special characters are not allowed in this field.");
                inputElement.value = inputValue.replace(/[^a-zA-Z0-9 ]/g, ''); // Remove special characters
            }
        }
    </script>

    <script src="${pageContext.request.contextPath}/frontend/template/assets/js/bootstrap.bundle.min.js"></script>
    <!-- simplebar -->
    <script src="${pageContext.request.contextPath}/frontend/template/assets/js/simplebar.min.js"></script>
    <!-- Icons -->
    <script src="${pageContext.request.contextPath}/frontend/template/assets/js/feather.min.js"></script>
    <!-- Main Js -->
    <script src="${pageContext.request.contextPath}/frontend/template/assets/js/app.js"></script><
</html>

