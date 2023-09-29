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
                <div id="EditModal"class="mt-100" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header border-bottom p-3">
                                <h5 class="modal-title" id="exampleModalLabel">
                                    Edit Doctor</h5>
                               
                            </div>
                            <form>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="row align-items-center mb-4">
                                            <label class="form-label">Upload your picture <span
                                                    class="text-danger">*</span></label>
                                            <div class="col-3">
                                                <img src="../assets/images/doctors/01.jpg"
                                                     class="avatar avatar-md-md rounded-pill shadow mx-auto d-block" alt="">
                                            </div><!--end col-->
                                            <div class="col-6 text-lg-end text-center ">

                                                <input type="file" name="photo" size="50" />
                                            </div><!--end col-->
                                        </div><!--end row-->

                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Name<span class="text-danger">*</span></label>
                                                <input name="name" id="name" type="text" class="form-control"
                                                       placeholder="Full Name">
                                            </div>
                                        </div><!--end col-->
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Email <span class="text-danger">*</span></label>
                                                <input name="email" id="email" type="email" class="form-control"
                                                       placeholder="@gmail.com">
                                            </div>
                                        </div><!--end col-->
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Phone</label>
                                                <input name="phone" id="phone" class="form-control" placeholder="Phone">
                                            </div>
                                        </div><!--end col-->
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Speciality</label>
                                                <select class="form-select form-control" id="" placeholder ="Speciality">
                                                    <option value="1">All</option>
                                                    <option value="2">Two</option>
                                                    <option value="3">Three</option>
                                                </select>
                                            </div>
                                        </div><!--end col-->
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Position</label>
                                                <input name="postion" id="postion" class="form-control" placeholder="Position">
                                            </div>
                                        </div><!--end col-->
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Status</label>
                                                <input name="status" id="status" class="form-control" placeholder="Status">
                                            </div>
                                        </div><!--end col-->
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">Description</label>
                                                <textarea name="description" id="description" rows="4" class="form-control"
                                                          placeholder=""></textarea>
                                            </div>
                                        </div>
                                    </div><!--end row-->
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary">Save</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </main><!-- comment -->
        </div>
    </body>
</html>
