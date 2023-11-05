<%-- 
    Document   : enterEmailChangePass
    Created on : Nov 5, 2023, 11:17:30 AM
    Author     : MY LAPTOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="/EmployeePage/css/enterEmailChangePass.css"/>
        <style>
            body{
                background-image: url('../img/chopsticks-asian-dish-red.jpg');
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center;
                background-attachment: fixed;
            }
        </style>
    </head>
    <body>
        <%@include file="/EmployeePage/header.jsp" %>
        <div style="height: 100vh; padding-top: 241px" class="container-fluid">
            <form class="mx-auto" action="/employee" method="post" style="width: 30%">
                <div class="top-header">
                    <div class="form-header">Forgot Password</div>
                </div>

                <div class="input-field">
                    <input type="email" id="email" name="email" class="input" placeholder="Enter your email..." required>
                    <i class='bx bx-envelope'></i>
                </div>
                <div class="error-message" id="error-message" style="display: none; text-align: center;">
                    Please enter your email!
                </div>
                <div class="error-message" style="text-align: center;">
                    <p style="color: white">${error}</p> 
                </div>

                <div class="input-field">
                    <button type="submit" class="submit" value="forgotPass" name="btnForgot">Reset Password</button>
                </div>
            </form>
        </div>
        <%@include file="/EmployeePage/footer.jsp" %>
        <script>
            document.querySelector('form').addEventListener('submit', function (event) {
                const email = document.getElementById('email').value;
                const errorMessage = document.getElementById('error-message');
                if (!email) {
                    errorMessage.innerHTML = 'Please enter all required information!';
                    errorMessage.style.display = 'block';
                    event.preventDefault();
                } else {
                    errorMessage.style.display = 'none';
                }
            });
        </script>
    </body>
</html>
