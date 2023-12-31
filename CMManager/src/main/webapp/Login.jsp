<%-- 
    Document   : Login
    Created on : Oct 26, 2023, 10:09:39 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <title>Manager Campus Munchies</title>
    </head>
    <body>
        <header>
            <div class="logo">
                <img src="/img/logo.png" style="width: 120px;" alt=""/>
                <h1>
                    <span class="red-text">Campus</span>
                    <span class="white-text">Munchies</span>
                </h1>

            </div>
        </header>
        <div class="box">
            <span class="borderLine"></span>
            <form action="login" method="post">
                <h2>SIGN IN</h2>
                <div class="inputBox">
                    <input type="text" name="username" required="required">
                    <span>Username</span>
                    <i></i>
                </div>
                <div class="inputBox">
                    <input type="password" name="password" required="required">
                    <span>Password</span>
                    <i></i>
                </div>
                <p class="text-danger" style="margin-top: 20px; color: #c21010">${mess}</p>
                <div style="text-align: center; margin-top: 20px">
                    <input type="submit" value="Login">
                </div>
            </form>
        </div>
    </body>
</html>