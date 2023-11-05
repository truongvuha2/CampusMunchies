<%-- 
    Document   : changePassword
    Created on : Nov 1, 2023, 12:52:24 AM
    Author     : MY LAPTOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Campus Munchies</title>
        <link rel="stylesheet" href="/EmployeePage/css/changePassword.css"/>
    </head>
    <body>
        <%@include file="/EmployeePage/header.jsp" %>
        <div class="container-fluid" style="height: 100vh; padding-top: 100px;">
            <div class="title mx-auto my-5">Changing Password</div>
            <form action="/employee" method="post" onsubmit="return validateForm()">
                <div class="customer-info mx-auto p-4 d-flex flex-column justify-content-center" style="border: none">
                    <div class="d-flex justify-content-around">
                        <div class="info-items m-3">Old Password</div>
                        <div class="info-value m-3"><input required="" type="password" name="txtOldPassword"></div>
                    </div>
                    <div class="d-flex justify-content-around">
                        <div class="info-items m-3">New Password</div>
                        <div class="info-value m-3"><input required="" type="password" name="txtNewPassword"></div>
                    </div>
                    <div class="d-flex justify-content-around">
                        <div class="info-items m-3">Confirm New Password</div>
                        <div class="info-value m-3"><input required="" type="password" name="txtNewPassword1"></div>
                    </div>
                    <%
                        try {

                            String result = (String) request.getAttribute("result");
                            if (!result.equals("")) {
                    %>
                    <div class="d-flex justify-content-center result p-2 mx-auto"><%=result%></div>
                    <%
                            }
                        } catch (Exception e) {
                        }
                    %>
                </div>
                <div class="btnBack mx-auto my-5 d-flex">
                    <button type="submit" value="ChangePassword" name="btnChangePassword">Change</button>
                    <a href="/employee/orderList" class="align-items-center d-flex justify-content-center ms-2">Order List</a>
                </div>
            </form>

        </div>
        <%@include file="/EmployeePage/footer.jsp" %>
        <script>
            function validateForm() {
                var newPassword = document.getElementsByName("txtNewPassword")[0].value;
                var confirmPassword = document.getElementsByName("txtNewPassword1")[0].value;
                if (newPassword != confirmPassword) {
                    alert("New Password and Confirm New Password must match");
                    return false;
                }
            }
        </script>
    </body>
</html>
