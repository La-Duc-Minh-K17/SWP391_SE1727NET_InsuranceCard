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
            background-color: #D3D3D3;
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
        .add-setting-form {
            background-color: #red; /* Màu nền */
            border: 1px solid #ccc; /* Viền */
            padding: 20px; /* Khoảng cách giữa nội dung và viền */
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2); /* Hiệu ứng bóng đổ */
        }
        .add-setting-form h4{
            text-align:  center;
        }
        .add-setting-form label{
            text-align: left;
        }
        .add-setting-form input{
            border: 1px solid #ccc;
            
        }
        
        #addSettingForm {
            display: none;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 20px;
            z-index: 1;
        }

        /* CSS để điều chỉnh hiển thị của biểu mẫu "settinglist" */
        #settingListForm {
            margin-top: 100px; /* Điều chỉnh khoảng cách giữa biểu mẫu thêm setting và "settinglist" */
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
                <button type="button" id="addMoreButton">Add more</button>
            </div>
        </form>

        <div id="addSettingForm" class="add-setting-form" style="display: none;">
            <form action="addSetting" method="POST">
                <h4>Add Settings</h4>
                <label for="settingType">Type:</label>
                <br><br>
                <input type="text" id="settingType" placeholder="Type" name="settingType" required>
                 <br><br>
                <label for="settingValue">Value:</label>
                  <br><br>
                <input type="text" id="settingValue" placeholder="Value" name="settingValue" required>
                  <br><br>
                <label for="settingDescription"> Description:</label>
                  <br><br>
                <input type="text" id="settingDescription" placeholder="Description" name="settingDescription"required>
                  <br><br>
                <label for="settingStatus">Status:</label>
                <select id="settingStatus" name="settingStatus">
                    <option value="Active">Active</option>
                    <option value="Deactive">Deactive</option>
                </select>
                  <br><br>
                <button type="submit">Add Setting</button>
                <button type="button" id="cancelButton">Cancel</button>
            </form>
        </div>
        <div id="settingListForm" class="container">
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

        </div>

        <script src= "<c:url value= '/frontend/template/assets/js/bootstrap.bundle.min.js'/>"></script>
        <!-- Icons -->

        <script src= "<c:url value= '/frontend/template/assets/js/feather.min.js'/>"></script>
        <!-- Main Js -->

        <script src= "<c:url value= '/frontend/template/assets/js/app.js'/>"></script>
        <script>
            var addMoreButton = document.getElementById("addMoreButton");
            var addSettingForm = document.getElementById("addSettingForm");

            // Thêm sự kiện khi nhấn nút "Add more"
            addMoreButton.addEventListener("click", function () {
                // Hiển thị biểu mẫu thêm setting
                addSettingForm.style.display = "block";

                // Ẩn biểu mẫu "settinglist"
                var settingListForm = document.getElementById("settingListForm");
                settingListForm.style.display = "none";
            });

            // Thêm sự kiện khi nhấn nút "Thêm Setting" hoặc "Hủy"
            var submitButton = addSettingForm.querySelector("button[type='submit']");
            var cancelButton = addSettingForm.querySelector("button[type='button']");

            submitButton.addEventListener("click", function () {
                // Ẩn biểu mẫu thêm setting khi nút "Thêm Setting" được nhấn
                addSettingForm.style.display = "none";

                // Hiển thị lại biểu mẫu "settinglist"
                var settingListForm = document.getElementById("settingListForm");
                settingListForm.style.display = "block";

                // Thêm mã xử lý để gửi dữ liệu setting lên máy chủ (phía server) ở đây
            });

            cancelButton.addEventListener("click", function () {
                // Ẩn biểu mẫu thêm setting khi nút "Hủy" được nhấn
                addSettingForm.style.display = "none";

                // Hiển thị lại biểu mẫu "settinglist"
                var settingListForm = document.getElementById("settingListForm");
                settingListForm.style.display = "block";
            });
        </script>
    </body>

</html>
