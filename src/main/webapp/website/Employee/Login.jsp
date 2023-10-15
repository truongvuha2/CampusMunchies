<%-- 
    Document   : Login
    Created on : Oct 14, 2023, 1:29:51 AM
    Author     : MY LAPTOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Campus Munchies</title>
        <link rel="stylesheet" href="../../css/Employee/login.css"/>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container-fluid d-flex justify-content-center py-5 my-5">
            <div class="loginBox d-flex flex-column align-items-center px-5 py-1 w-25">
                <div class="title py-4">Login</div>
                <div class="phone py-1">
                    <input class="p-2" type="text" placeholder="Phone number">
                </div>
                <div class="password py-1">
                    <input class="p-2" type="password" placeholder="Password">
                </div>
                <div class="py-2">
                    <a href="#">Forgot Your Password?</a>
                </div>
                <div class="btnLogin py-2">
                    <button class="px-5 py-2">Login</button>
                </div>
                <div class="py-2 mb-5">
                    <a href="#">Create Account</a>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>