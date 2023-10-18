<%-- 
    Document   : login.jsp
    Created on : Oct 12, 2023, 11:11:31 AM
    Author     : khang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>Đăng nhập</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('https://img.tastykitchen.vn/resize/764x-/2021/03/31/cong-thuc-che-bien-ga-chien-xu-don-gian-tai-nha-2-eeb7.jpg'); /* Đường dẫn đến hình ảnh nền */
            background-size: cover; /* Thay đổi kích thước ảnh để nó phù hợp với cửa sổ trình duyệt */
            background-repeat: no-repeat; /* Không lặp lại ảnh nền */
            background-attachment: fixed; /* Để hình ảnh nền cố định và không cuộn khi bạn cuộn trang web */
            
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

        .remember-me {
            display: flex;
            align-items: flex-start;
        }

        .forgot-password {
            text-align: center;
            margin-top: 10px;
        }

        .login-button {
            background: #ffae00;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            display: block;
            margin: 0 auto; /* Để nút ở giữa */
        }
        
    </style>
</head>

<body>
    <div class="container">
        <h1>Login</h1>
        <form action="#" method="post">
            <div class="form-group">
                <label for="username">Your phone</label>
                <input type="text" id="username" name="phone" placeholder="Enter your phone..." >
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter password..." >
            </div>

            <div class="form-group remember-me">
                <input type="checkbox" id="remember" name="remember">
                <label for="remember">Remember me</label>
            </div>

            <div class="error-message" id="error-message" style="display: none; text-align: center;">
               Please enter your phone and password!
            </div>

            <div class="form-group" >
                <button type="submit" class="login-button">Login</button>
            </div>
            <div class="forgot-password">
                <a href="#">Forget password</a>
            </div>
            <div class="register">
                <p>If you don't have account, <a href="">click here</a></p>
                
            </div>
            

        </form>
    </div>

    <script>
        document.querySelector('form').addEventListener('submit', function (event) {
            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;
            const errorMessage = document.getElementById('error-message');

            if (!username || !password) {
                errorMessage.style.display = 'block';
                event.preventDefault();
            } else {
                errorMessage.style.display = 'none';
            }
        });
    </script>
</body>

</html>
