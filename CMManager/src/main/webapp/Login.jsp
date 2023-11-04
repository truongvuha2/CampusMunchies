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
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <title>Manager Login Page</title>
    </head>
    <body>
        <header>
            <div class="logo">
                <img src="https://i.ibb.co/XkHv4Fv/Campus-Munchies-Logo.png" alt="">        
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
                <p class="text-danger">${mess}</p>
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
                <div style="text-align: center; margin-top: 20px">
                    <input type="submit" value="Login">
                </div>
            </form>
        </div>
    </body>
</html>