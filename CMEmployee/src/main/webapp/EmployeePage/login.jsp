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
    <style>
        
    </style>
    <body>
        <header><%@include file="/EmployeePage/header.jsp" %></header>
        <form action="/employee" method="post" style="height: 100vh; padding-top: 241px;">
            <div class="container-fluid d-flex justify-content-center py-5 mb-5" >
                <div class="loginBox d-flex flex-column align-items-center px-5 py-1 w-25" style="border: none">
                    <div class="title py-4">Login</div>

                    <div class="phone py-1">
                        <input class="p-2" type="text" placeholder="Phone number" name="phone">
                    </div>
                    <div class="password py-1">
                        <input class="p-2" type="password" placeholder="Password" name="password">
                    </div>

                    <div class="d-flex justify-content-between align-items-center w-100">
                        <div><input name="checkRememberMe" type="checkbox" class="me-1"><Span  style="color: #4D4D4D;">Remember Me</Span></div>
                        <div><a href="/employee/forgotPass">Forgot Your Password?</a></div>
                    </div>
                    <%
                        String invalid = "";
                        try {
                            invalid = request.getAttribute("loginError")+"";
                        } catch (Exception e) {
                        }
                        if (invalid != "" && !invalid.equals("null")) {
                    %>
                    <div>The phone or password is incorrect!</div>
                    <%       
                        }
                    %>
                    <div class="btnLogin my-4">
                        <button name="btnLogin" type="submit" value="login" class="px-5 py-2">Login</button>
                    </div>

                </div>
            </div>
        </form>  
    </main>
    <footer>
        <%@include file="/EmployeePage/footer.jsp" %>
    </footer>
    <script>
            function validateForm() {
                var phone = document.getElementsByName('phone')[0].value;
                var password = document.getElementsByName('password')[0].value;

                var phoneRegex = /^0\d{9}$/; // Regular expression for phone number starting with 0 and having 10 digits

                if (phone === "") {
                    alert("Phone number must be filled out");
                    return false;
                }

                if (!phone.match(phoneRegex)) {
                    alert("Invalid phone number. Phone number should start with 0 and be 10 digits long.");
                    return false;
                }

                if (password === "") {
                    alert("Password must be filled out");
                    return false;
                }
                // Add other validation rules as needed
                return true;
            }

            var form = document.getElementsByTagName('form')[0];
            form.onsubmit = function() {
                return validateForm();
            };
        </script>
</body>
</html>
