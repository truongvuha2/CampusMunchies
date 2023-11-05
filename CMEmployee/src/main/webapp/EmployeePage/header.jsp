<%-- 
    Document   : newHeader.jsp
    Created on : Nov 4, 2023, 9:36:47 PM
    Author     : MY LAPTOP
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
        <link rel="stylesheet" href="/EmployeePage/css/header.css">
        <title>Campus Munchies</title>
        <style>
            body{
                background-image: url('/img/chopsticks-asian-dish-red.jpg');
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center;
                background-attachment: fixed;
            }
        </style>
    </head>



    <body>
        <div id="wrapper">
            <header>
                <div class="inner-header container-fluid" style="max-width: 1700px">
                    <img style="width: 120px;" src="https://drive.google.com/uc?id=1oi7OnKZyo4ooOq0ebaJpejenlpcyOKns"
                         alt="Logo Campus Munchies">
                    <a href="/employee/orderList" id="logo">
                        <div class="Campus">
                            Campus
                        </div>
                        <div>
                            Munchies
                        </div>
                    </a>
                    <%
                        boolean OrderList = Boolean.parseBoolean(request.getParameter("isOrderList"));
                        pageContext.setAttribute("OrderList", OrderList);
                    %>
                    <c:choose>
                        <c:when test="${OrderList}">
                            <div class="search d-flex mx-5">
                                <div class="searchText">
                                    <input name="orderId" type="text" placeholder="Search Order By ID">
                                </div>
                                <div class="searchButton" >
                                    <button>Search</button>
                                </div>
                            </div>    
                        </c:when>
                        <c:otherwise>
                            <div style="width: 46em;" class="mx-5"></div>
                        </c:otherwise>
                    </c:choose>
                    <nav>
                        <ul id="main-menu">
                            <li>
                                <c:choose>
                                    <c:when test="${sessionScope.phone!=null}">
                                        <a href="/employee/orderList">Order List</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="/employee/login">Order List</a>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                            <li>
                                <a href="/employee/newOrderList">New Order</a>
                            </li>
                            <%
                                String name = request.getSession().getAttribute("phone") + "";
                                if (name.equals("") || name.equals("null")) {
                            %>
                            <li>
                                <a href="">My Account</a>
                                <ul class="sub-menu">
                                    <li><a href="/employee/login">Login</a></li>
                                </ul>
                            </li>
                            <%} else {%>
                            <li>
                                <a href="">Hello, ${sessionScope.fullname}</a>
                                <ul class="sub-menu">
                                    <li><a href="/employee/updateProfile">Profile</a></li>
                                    <li><a href="/employee/changePassword" >Change Password</a></li>
                                    <li><a href="/employee/logout">Logout <ion-icon style=" display: inline-block; vertical-align: middle; margin-left: 2px; font-size: 24px;" name="log-out-outline"></ion-icon></a></li>
                                </ul>
                            </li>
                            <%}%>
                        </ul>
                    </nav>
                </div>
            </header>
        </div>

        <!-- End of Main Content -->
    </body>
    <script src="index.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script>
        $(document).ready(function () {
            $(window).scroll(function () {
                if ($(this).scrollTop()) {
                    $('header').addClass('sticky');
                } else {
                    $('header').removeClass('sticky');
                }
            });
        });
    </script>

</html>
