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
        <link href="/EmployeePage/css/login.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <header><%@include file="header.jsp" %></header>
          <form action="/employee" method="post" style="height: calc(100vh - 137px - 241px);">
            <div class="container-fluid d-flex justify-content-center py-5 mb-5">
                <div class="loginBox d-flex flex-column align-items-center px-5 py-1 w-25">
                    <div class="title py-4">Login</div>

                    <div class="phone py-1">
                        <input class="p-2" type="text" placeholder="Phone number" name="phone">
                    </div>
                    <div class="password py-1">
                        <input class="p-2" type="password" placeholder="Password" name="password">
                    </div>

                    <div class="d-flex justify-content-between align-items-center w-100 mb-5">
                        <div><input name="checkRememberMe" type="checkbox" class="me-1"><Span  style="color: #4D4D4D;">Remember Me</Span></div>
                        <div><a href="#">Forgot Your Password?</a></div>
                    </div>

                    <div class="btnLogin mb-4">
                        <button name="btnLogin" type="submit" value="login" class="px-5 py-2">Login</button>
                    </div>

                </div>
            </div>
        </form>  
        </main>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
        
    </body>
</html>
