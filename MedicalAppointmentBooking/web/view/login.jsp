<%-- 
    Document   : login
    Created on : Aug 10, 2023, 10:55:18 AM
    Author     : sonnt
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Form</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f0f0;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
            }

            .login-container {
                background-color: #ffffff;
                padding: 20px;
                padding-right: 40px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
                width: 300px;
            }

            .login-container h2 {
                margin-bottom: 20px;
                text-align: center;
                color: #333;
            }

            .login-form label {
                display: block;
                margin-bottom: 8px;
                font-weight: bold;
                color: #555;
            }

            /* Set a fixed width for all input fields */
            .login-form input[type="text"],
            .login-form input[type="password"],
            .login-form input[type="submit"] {
                width: 100%; /* Make input fields full width */
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 3px;
                color: #555;
            }

            .login-form input[type="submit"] {
                background-color: #007bff; /* Change button color to blue */
                color: white;
                border: none;
                padding: 10px 20px;
                border-radius: 3px;
                cursor: pointer;
                width: 100%;
                transition: background-color 0.3s ease;
            }

            .login-form input[type="submit"]:hover {
                background-color: #0056b3; /* Change hover color */
            }
        </style>


    </head>
    <body>

        <div class="login-container">
            <h2>Login</h2>

            <form class="login-form" action="login" method="post">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
                <div style="color: red">
                    <c:if test="${param.error eq 1}">
                        Email or password is invalid
                    </c:if>
                </div>
                <input type="submit" value="Login">
                <p>You don't have account <a href="register">Register here</a></p>
            </form>

        </div>

    </body>
</html>
