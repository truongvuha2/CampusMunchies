<%-- 
    Document   : register
    Created on : Oct 18, 2023, 7:32:37 AM
    Author     : CNM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-image: url('https://img.tastykitchen.vn/resize/764x-/2021/03/31/cong-thuc-che-bien-ga-chien-xu-don-gian-tai-nha-2-eeb7.jpg');
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
            }

            .container {
                max-width: 40%;
                margin: 8% auto;
                padding: 20px;
                background: #ffffff;
                border-radius: 5px;
                box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            }

            h1 {
                text-align: center;
            }

            .form-group {
                margin: 10px 0;
            }

            label {
                display: block;
            }

            input[type="text"],
            input[type="password"] {
                width: 90%;
                padding: 10px;
                margin-top: 5px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            .error-message {
                color: red;
            }

            .register-button {
                background: #ffae00;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 4px;
                cursor: pointer;
                display: block;
                margin: 0 auto;
            }
            .birthday-input {
                width: 90%;
                padding: 10px;
                margin-top: 5px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                float: left;
                color: gray
            }

        </style>
    </head>
    <body>
        <div class="container">
            <h1>Register</h1>
            <form action="/CampusMunchies/guest/register" method="post">

                <div class="form-group">
                    <label for="name">Your name</label>
                    <input type="text" id="name" name="name" placeholder="Enter your name...">
                </div>
                <div class="form-group">
                    <label for="phone">Phone number</label>
                    <input type="text" id="phone" name="phone" placeholder="Enter phone number...">
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Enter password...">
                </div>
                <div class="form-group">
                    <label for="confirmPassword">Confirm password</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Enter confirm password...">
                </div>
                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" id="address" name="address" placeholder="Enter address...">
                </div>
                <div class="form-group">
                    <label for="birthday">Birthday</label>
                    <input type="date" id="birthday" name="birthday" class="birthday-input" placeholder="Enter birthday (yyyy/mm/dd)">
                </div>

                <div class="form-group">
                    <button type="submit" class="register-button">Register</button>
                </div>
            </form>
        </div>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.all.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/pickadate.js/3.6.6/compressed/picker.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pickadate.js/3.6.6/compressed/picker.date.js"></script>
        <script>


            document.querySelector('.register-button').addEventListener('click', function (event) {
                event.preventDefault();
                const name = document.getElementById('name').value;
                const phone = document.getElementById('phone').value;
                const password = document.getElementById('password').value;
                const address = document.getElementById('address').value;
                const confirmPassword = document.getElementById('confirmPassword').value;
                const birthday = document.getElementById('birthday').value;
                if (!phone || !password || !confirmPassword || !name || !birthday || !address) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Invalid information',
                        text: 'Please fill in the required information and confirm your password!'
                    });
                } else if (!isValidName(name)) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Invalid name',
                        text: 'It must be between 2 and 50 characters.'
                    });
                } else if (!isValidPhone(phone)) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Invalid phone number',
                        text: 'It should have 10 digits and the first number should be 0.'
                    });
                } else if (!isValidPassword(password)) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Invalid password',
                        text: 'The password must be between 8 and 20 characters.'
                    });
                } else if (password !== confirmPassword) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Invalid password',
                        text: 'Password and confirm password confirm do not match.'
                    });
                } else if (!isValidAddress(address)) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Invalid address',
                        text: 'It must be more than 50 characters.'
                    });
                } else if (!isValidDate(birthday)) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Invalid birthday',
                        text: 'Please enter a valid date of birth in yyyy/mm/dd format.'
                    });

                }else {
                    // Nếu tất cả thông tin hợp lệ, cho phép form được submit
                    document.querySelector('form').submit();
                }

                
            });

            function isValidPhone(phone) {
                return /^[0-9]{10}$/.test(username) && username[0] === '0';
            }
            function isValidName(name) {
                return name.length >= 2 && name.length <= 50;
            }

            function isValidAddress(address) {
                return address.length >= 0 && address.length <= 50;
            }

            function isValidPassword(password) {
                return password.length >= 8 && password.length <= 20;
            }

            function isValidDate(birthday) {
                const dateRegex = /^\d{4}\/\d{2}\/\d{2}$/;
                return dateRegex.test(birthday);
            }
        </script>
    </body>
</html>
