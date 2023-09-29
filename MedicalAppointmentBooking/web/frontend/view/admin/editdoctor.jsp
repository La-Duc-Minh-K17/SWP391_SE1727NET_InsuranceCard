<%-- 
    Document   : adddoctor
    Created on : Sep 28, 2023, 1:54:24 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <div class="page-wrapper doctris-theme toggled">
            <jsp:include page="/frontend/common/adminSidebar.jsp" />
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
                <div class="mt-100" id="edit" role="tabpanel" aria-labelledby="edit">
                    <div class="card border-0 shadow overflow-hidden">
                        <div class="tab-content p-4" id="pills-tabContent">
                            <form action="" method="POST" enctype="multipart/form-data" onSubmit="document.getElementById('submit').disabled = true;">
                                <h5 class="mb-0">Edit Doctor :</h5>
                                <div>
                                    <p class="text-muted">Update Image.</p>
                                    <div id="myfileupload">
                                        <input type="file" name="image" id="uploadfile" name="ImageUpload" onchange="readURL(this);" />
                                    </div>
                                    <div id="thumbbox">
                                        <img class="rounded" height="20%" width="30%" alt="Thumb image" id="thumbimage" style="display: none" />
                                        <a class="removeimg" href="javascript:"></a>
                                    </div>
                                    <div id="boxchoice">
                                        <a href="javascript:" class="Choicefile"><i class="fas fa-cloud-upload-alt"></i> Chọn ảnh</a>
                                        <p style="clear:both"></p>
                                        <input type="submit" id="submit" style="display: none" name="send" class="Update btn btn-primary"
                                               value="Cập nhật">
                                        <p style="clear:both"></p>
                                    </div> 
                                </div>
                            </form>

                            <form action="" method="POST" class="mt-4" onSubmit="document.getElementById('submit').disabled = true;">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <label class="form-label">Name</label>
                                            <input name="name" oninvalid="CheckFullName(this);" oninput="CheckFullName(this);" id="name" type="text" class="form-control" value="${doctor.doctor_name}">
                                        </div>
                                    </div>

                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <label class="form-label">Gender</label>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td><input id="credit" name="gender" ${doctor.gender== 1?"checked":""} value="true" type="radio" class="form-check-input"
                                                                   checked required ></td>
                                                        <td><label class="form-check-label">Male</label></td>
                                                        <td></td>
                                                        <td><input id="debit" name="gender" ${doctor.gender==0 ?"checked":""} value="false" type="radio" class="form-check-input"
                                                                   required></td>
                                                        <td><label class="form-check-label">Female</label></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <label class="form-label">Phone</label>
                                            <input name="phone" oninvalid="" oninput="" id="number" type="text" class="form-control" value="">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <label class="form-label">Speciality</label>
                                            <select name="speciality" class="form-select">
                                                <c:forEach items="${speciality}" var="s">
                                                    <c:if test="">
                                                        
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <label class="form-label">Position</label>
                                            <input name="position"  type="text" onkeydown="return false" min="1922-01-01" max="2003-01-01" class="form-control" value="${doctor.DOB}">
                                        </div>
                                    </div>

                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <label class="form-label">Description</label>
                                            <input name="description" type="text" class="form-control" value="${doctor.description}">
                                        </div>
                                    </div>

                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <label class="form-label">Status <span class="text-danger"></span></label>
                                            <br>
                                            <input id="credit" name="status" ${doctor.status==true?"checked":""} value="true" type="radio" class="form-check-input"checked required >

                                            <label class="form-check-label">Active</label>

                                            <input id="debit" name="status" ${doctor.status==false?"checked":""} value="false" type="radio" class="form-check-input"
                                                   required>
                                            <label class="form-check-label">Inactive</label>

                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm-12">
                                        <input type="submit" id="submit" name="send" class="btn btn-primary"
                                               value="SAVE">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </main><!-- comment -->
        </div>
    </body>
    <script src="${pageContext.request.contextPath}/frontend/template/assets/js/bootstrap.bundle.min.js"></script>
    <!-- simplebar -->
    <script src="${pageContext.request.contextPath}/frontend/template/assets/js/simplebar.min.js"></script>
    <!-- Icons -->
    <script src="${pageContext.request.contextPath}/frontend/template/assets/js/feather.min.js"></script>
    <!-- Main Js -->
    <script src="${pageContext.request.contextPath}/frontend/template/assets/js/app.js"></script><
</html>
