<%-- 
    Document   : createAccEmployee
    Created on : Oct 19, 2023, 1:41:59 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link href="css/createAccEmployee.css" rel="stylesheet" type="text/css"/>
        <title>Create Account</title>
    </head>

    <body>

        <div class="container-i">
            <!-- Sidebar -->
            <%@include file="sidebar.jsp" %>
            <!-- End of Sidebar -->
            <!-- Main Content -->
            <main>
                <div class="header">
                    <div class="logo-tittle">
                        <img src="https://drive.google.com/uc?id=1oi7OnKZyo4ooOq0ebaJpejenlpcyOKns"
                             alt="Logo Campus Munchies">
                    </div>

                    <div class="name-tittle">
                        Create Account
                    </div>

                    <div class="user-info">
                        <p>Hey, <b><%= request.getSession().getAttribute("username") %></b></p>
                        <small class="text-muted">Admin</small>
                    </div>
                </div>
                <!-- Add Food Table -->
                <h2>Enter Account Information</h2>
                <form action="createAccount" method="POST">
                    <div class="acc-info">
                        <div class="left-info">
                            <ul>
                                <li><label>Name: *</label><input type="text" name="name" value></li>
                                <li><label>Phone: *</label><input type="number" name="phone" value></li>
                                <li><label>Password: *</label><input type="text" name="password" value="1"></li>
                            </ul>
                        </div>
                        <div class="right-info">
                            <ul>
                                <li><label>Birthday: </label><input type="date" name="birthday" value placeholder="dd/MM/yyyy"></li>
                                <li><label>Address: </label>
                                    <textarea cols="30" rows="3" name="address"></textarea>
                                </li>
                            </ul>
                            <div class="btn-product">
                                <div class="btn-add-product">
                                    <button type="submit">
                                        Add Account
                                    </button>
                                </div>
                                <div class="btn-cancel-product">
                                    <button type="reset">
                                        Cancel
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </main>
            <!-- End of Main Content -->
        </div>
    </body>

</html>