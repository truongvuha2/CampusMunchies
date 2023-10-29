<%-- 
    Document   : profile
    Created on : Oct 26, 2023, 5:02:53 PM
    Author     : CNM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .container{
                margin-top: 100px
            }
            .ui-w-80 {
                width: 80px !important;
                height: auto;
            }

            .btn-default {
                border-color: rgba(24, 28, 33, 0.1);
                background: rgba(0, 0, 0, 0);
                color: #4E5155;
            }

            label.btn {
                margin-bottom: 0;
            }

            .btn-outline-primary {
                border-color: #26B4FF;
                background: transparent;
                color: #26B4FF;
            }

            .btn {
                cursor: pointer;
            }

            .text-light {
                color: #babbbc !important;
            }



            .card {
                background-clip: padding-box;
                box-shadow: 0 1px 4px rgba(24, 28, 33, 0.012);
            }

            .row-bordered {
                overflow: hidden;
            }

            .account-settings-fileinput {
                position: absolute;
                visibility: hidden;
                width: 1px;
                height: 1px;
                opacity: 0;
            }

            .account-settings-links .list-group-item.active {
                font-weight: bold !important;
            }

            html:not(.dark-style) .account-settings-links .list-group-item.active {
                background: transparent !important;
            }

            .account-settings-multiselect~.select2-container {
                width: 100% !important;
            }

            .light-style .account-settings-links .list-group-item {
                padding: 0.85rem 1.5rem;
                border-color: rgba(24, 28, 33, 0.03) !important;
            }

            .light-style .account-settings-links .list-group-item.active {
                color: #4e5155 !important;
            }

            .material-style .account-settings-links .list-group-item {
                padding: 0.85rem 1.5rem;
                border-color: rgba(24, 28, 33, 0.03) !important;
            }

            .material-style .account-settings-links .list-group-item.active {
                color: #4e5155 !important;
            }

            .dark-style .account-settings-links .list-group-item {
                padding: 0.85rem 1.5rem;
                border-color: rgba(255, 255, 255, 0.03) !important;
            }

            .dark-style .account-settings-links .list-group-item.active {
                color: #fff !important;
            }

            .light-style .account-settings-links .list-group-item.active {
                color: #4E5155 !important;
            }

            .light-style .account-settings-links .list-group-item {
                padding: 0.85rem 1.5rem;
                border-color: rgba(24, 28, 33, 0.03) !important;
            }

            .mt-3 {
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <div class="container light-style flex-grow-1 container-p-y">
            <h4 class="font-weight-bold py-3 mb-4">
                Customer Profile
            </h4>
            <div class="card overflow-hidden">
                
                <div class="row no-gutters row-bordered row-border-light">
                    <div class="col-md-3 pt-0">
                        <div class="list-group list-group-flush account-settings-links">
                            <a class="list-group-item list-group-item-action active" data-toggle="list"
                               href="#account-general">Info</a>
                            <a class="list-group-item list-group-item-action" data-toggle="list"
                               href="#account-change-password">Change password</a>

                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="tab-content">
                            <form action="/CampusMunchies/customer/updateProfile" method="post" class="tab-pane fade active show" id="account-general">

                                <hr class="border-light m-0">
                                <div class="card-body">
                                    <div class="form-group">
                                        <label class="form-label">Name</label>
                                        <input type="text" class="form-control mb-1" value="${customer.name}" name="name">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Phone</label>
                                        <input type="text" class="form-control" value="${customer.phone}" disabled>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Birthday</label>
                                        <input type="text" class="form-control" value="${customer.birthday}" name="birth">
                                    </div>

                                    <div class="form-group">
                                        <label class="form-label">Address</label>
                                        <input type="text" class="form-control" value="${customer.address}" name="address">
                                    </div>
                                    <strong class="text-success" style="color: green !important">${messU}</strong>
                                </div>
                                <div class="text-right mt-3">
                                    <button type="submit" class="btn btn-primary">Save changes</button>
                                    <button type="button" class="btn btn-default">Cancel</button>
                                </div>
                            </form>
                            <form action="/CampusMunchies/customer/changePassword" method="post" class="tab-pane fade" id="account-change-password">

                                <div class="card-body pb-2">
                                    <div class="form-group">
                                        <label class="form-label">Current password</label>
                                        <input type="password" id="password" class="form-control" name="currentPass">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">New password</label>
                                        <input type="password" id="password1" class="form-control" name="newPass"
                                               oninput="checkPasswords()">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Repeat new password</label>
                                        <input type="password" id="password2" class="form-control" name="repeatPass"
                                               oninput="checkPasswords()">
                                    </div>
                                    <strong class="text-warning" style="color: red !important">${messF}</strong>
                                    <strong class="text-success" style="color: green !important">${messS}</strong>
                                    <p id="message" style="color: red;"></p>
                                </div>
                                <div class="text-right mt-3">
                                    <button type="submit" id="saveChangesBtn" class="btn btn-primary" >Save
                                        changes</button>
                                    <button type="button" class="btn btn-default">Cancel</button>
                                </div>

                            </form>



                        </div>
                    </div>
                </div>
            </div>

        </div>
        <%@include file="footer.jsp"%>
        <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript"></script>


        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            function checkPasswords() {
                var password1 = document.getElementById("password1").value;
                var password2 = document.getElementById("password2").value;
                var message = document.getElementById("message");

                if (password1 === password2) {
                    message.innerHTML = "Passwords match!";
                    message.style.color = "green";
                } else {
                    message.innerHTML = "Passwords do not match. Please try again.";
                    message.style.color = "red";
                }
            }



        </script>
    </body>
</html>
