<%-- 
    Document   : analytics
    Created on : Oct 19, 2023, 10:56:13 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="css/analytics.css"> 
        <title>Analytics</title>
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
                        <img src="https://drive.google.com/uc?id=1oi7OnKZyo4ooOq0ebaJpejenlpcyOKns" alt="Logo Campus Munchies">
                    </div>

                    <div class="name-tittle">
                        Analytics
                    </div>

                    <div class="user-info">
                        <p>Hey, <b><%= request.getSession().getAttribute("username") %></b></p>

                        <small class="text-muted">Admin</small>
                    </div>
                </div>

                <!-- Insights -->
                <ul class="insights">
                    <li>
                        <i class='bx bx-user-circle'></i>
                        <div class="info">
                            <div class="text">

                                <h3>${totalUser}</h3>

                                <p>Total Users</p>
                            </div>
                        </div>
                    </li>
                    <li>
                        <i class='bx bx-box'></i>
                        <span class="info">
                            <div class="text">

                                <h3>${totalOrder}</h3>

                                <p>Paid Order</p>
                            </div>
                        </span>
                    </li>
                    <li><i class='bx bx-dollar-circle'></i>
                        <span class="info">
                            <div class="text">

                                <h3>$${totalRevenue}</h3>
                                <p>Total Revenue</p>

                            </div>
                        </span>
                    </li>
                </ul>
                <!-- End of Insights -->

                <!-- New Users Section -->
                <div class="new-users">
                    <h2>New Users</h2>
                    <div class="user-list">

                        <c:forEach var="u" items="${requestScope.listNewUser}">
                            <div class="user">
                                <h2><a style="color: #000000" href="/customerDetails?cid=${u.phone}">${u.name}</a></h2>
                                <p>Customer</p>
                                <p>${u.time_ago}</p>
                            </div>
                        </c:forEach>
                    </div>
                    <a class="show" href="/customerManagement">Show All</a>

                </div>
                <!-- End of New Users Section -->

                <!-- Recent Orders Table -->
                <div class="recent-orders">
                    <h2>Recent Orders</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Order ID</th>

                                <th>Customer Phone</th>
                                <th>Time Order</th>
                                <th>Status</th>
                                <th>Detail</th>

                            </tr>
                        </thead>

                        <tbody>

                            <c:forEach var="r" items="${requestScope.listRecentOrder}">
                                <tr>
                                    <th>${r.ord_id}</th>
                                    <th>${r.cus_phone}</th>
                                    <th>${r.ord_date}</th>
                                    <th>${r.ord_status}</th>
                                    <th><a class="view" href="/orderDetails?oid=${r.ord_id}">View</a></th>
                                </tr>
                            </c:forEach>
                        </tbody>

                    </table>
                    <a class="show" href="/orderManagement">Show All</a>

                </div>
                <!-- End of Recent Orders -->
            </main>
            <!-- End of Main Content -->
        </div>

    </body>

</html>