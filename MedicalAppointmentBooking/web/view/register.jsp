<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Sign Up</title>
        <style>
            /* Center the form */
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }

            /* Style the form */
            form {
                background-color: white;
                padding: 50px;
                padding-right: 70px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
                text-align: center;
            }

            label {
                font-weight: bold;
                text-align: left;
                display: block;
            }

            .form-group {
                display: flex;
                flex-direction: column;
                margin-bottom: 10px;
            }

            .form-group label,
            .form-group input {
                width: 100%;
                margin-bottom: 10px;
            }

            input[type="text"],
            input[type="email"],
            input[type="password"],
            input[type="radio"], /* Added for radio buttons */
            input[type="submit"] { /* Added for the button */
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 3px;
            }

            span {
                color: red;
            }

            input[type="submit"] {
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 3px;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #0056b3;
            }

            /* Added to display radio buttons and button inline */
            .radio-group {
                display: flex;
                align-items: center;
            }

            .radio-group input[type="radio"] {
                margin-right: 10px;
            }
        </style>
    </head>
    <body>

        <form action="register" method="POST">
            <h1>Sign Up</h1>
            <div class="form-group">
                <label for="firstName">First Name <span>*</span></label>
                <input type="text" id="firstName" name="firstName" required>
            </div>

            <div class="form-group">
                <label for="lastName">Last Name <span>*</span></label>
                <input type="text" id="lastName" name="lastName" required>
            </div>

            <label>Gender <span>*</span></label>
            <br>
            <div class="radio-group"> <!-- Group for radio buttons -->
                <label for="male">Male</label>
                <input type="radio" id="male" checked="checked" name="gender" value="Male" required>

                <label for="female">Female</label>
                <input type="radio" id="female" name="gender" value="Female" required>
            </div>
            <br>
            <div class="form-group">
                <label for="email">Email <span>*</span></label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="mobile">Phone <span>*</span></label>
                <input type="text" id="mobile" name="mobile" required pattern="[0-9]{10}" title="Please enter a 10-digit phone number">
            </div>
            <div class="form-group">
                <label for="username">Username <span>*</span></label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password <span>*</span></label>
                <input type="password" id="password" name="password" required>
            </div>

            <input type="submit" value="Sign Up">
        </form>
    </body>
</html>
