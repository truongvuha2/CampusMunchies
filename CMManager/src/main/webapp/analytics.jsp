<%-- 
    Document   : analytics
    Created on : Oct 19, 2023, 10:56:13 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
=======
>>>>>>> 0e97c60adb008404fa0a182d50f04fc5295cb1b0
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
<<<<<<< HEAD
            <%@include file="sidebar.jsp" %>
=======
            <aside>
                <div class="sidebar">
                    <a href="#" class="logo-side">
                        <div class="logo-name">
                            <div class="Campus">Campus</div>
                            <div class="Munchines">Munchies</div>
                        </div>
                    </a>
                    <ul class="side-menu">
                        <li><a href="#"><i class='bx bx-analyse'></i> Analytics</a></li>

                        <li><a href="orderManagement.jsp"><i class='bx bx-box'></i> Order</a>
                            
                        </li>
                        <li><a href=""><i class='bx bx-food-menu'></i> Menu</a>
                        
                        <ul class="sub-menu">
                                <li><a href="addFood.jsp"> Add Food</a></li>
                                <li><a href="updateFood.jsp"> Update Food</a></li>
                                <li><a href="foodDetail.jsp"> Food Detail</a></li>
                                <li><a href="listMenu.jsp"> List Menu</a></li>
                            </ul>
                        
                        </li>
                        <li><a href="customerManagement.jsp"><i class='bx bxs-user-account'></i> Customer</a>
                        
                        </li>
                        
                        <li><a href="employeeManagement.jsp"><i class='bx bxs-user-detail'></i> Employee</a>
                         
                        </li>
                    </ul>
                    <ul class="side-menu">
                        <li>
                            <a href="#" class="logout">
                                <i class='bx bx-log-out-circle'></i>
                                Logout
                            </a>
                        </li>
                    </ul>
                </div>
            </aside>
>>>>>>> 0e97c60adb008404fa0a182d50f04fc5295cb1b0
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
<<<<<<< HEAD
                    <div class="user-info">
                        <p>Hey, <b><%= request.getSession().getAttribute("username") %></b></p>
=======

                    <div class="user-info">
                        <p>Hey, <b>Reza</b></p>
>>>>>>> 0e97c60adb008404fa0a182d50f04fc5295cb1b0
                        <small class="text-muted">Admin</small>
                    </div>
                </div>

                <!-- Insights -->
                <ul class="insights">
                    <li>
                        <i class='bx bx-user-circle'></i>
                        <div class="info">
                            <div class="text">
<<<<<<< HEAD
                                <h3>${totalUser}</h3>
=======
                                <h3>3,944</h3>
>>>>>>> 0e97c60adb008404fa0a182d50f04fc5295cb1b0
                                <p>Total Users</p>
                            </div>
                        </div>
                    </li>
                    <li>
                        <i class='bx bx-box'></i>
                        <span class="info">
                            <div class="text">
<<<<<<< HEAD
                                <h3>${totalOrder}</h3>
=======
                                <h3>14,721</h3>
>>>>>>> 0e97c60adb008404fa0a182d50f04fc5295cb1b0
                                <p>Paid Order</p>
                            </div>
                        </span>
                    </li>
                    <li><i class='bx bx-dollar-circle'></i>
                        <span class="info">
                            <div class="text">
<<<<<<< HEAD
                                <h3>$${totalRevenue}</h3>
                                <p>Total Revenue</p>
=======
                                <h3> $6,742</h3>
                                <p>Revenue</p>
>>>>>>> 0e97c60adb008404fa0a182d50f04fc5295cb1b0
                            </div>
                        </span>
                    </li>
                </ul>
                <!-- End of Insights -->

                <!-- New Users Section -->
                <div class="new-users">
                    <h2>New Users</h2>
                    <div class="user-list">
<<<<<<< HEAD
                        <c:forEach var="u" items="${requestScope.listNewUser}">
                            <div class="user">
                                <h2><a style="color: #000000" href="/customerDetails?cid=${u.phone}">${u.name}</a></h2>
                                <p>Customer</p>
                                <p>${u.time_ago}</p>
                            </div>
                        </c:forEach>
                    </div>
                    <a class="show" href="/customerManagement">Show All</a>
=======
                        <div class="user">
                            <h2>Jack</h2>
                            <p>Customer</p>
                            <p>54 Min Ago</p>
                        </div>
                        <div class="user">
                            <h2>Amir</h2>
                            <p>Customer</p>
                            <p>3 Hours Ago</p>
                        </div>
                        <div class="user">
                            <h2>Ember</h2>
                            <p>Customer</p>
                            <p>6 Hours Ago</p>
                        </div>
                        <div class="user">
                            <h2>More</h2>
                            <p>New User</p>
                        </div>
                    </div>
                    <a class="show" href="#">Show All</a>
>>>>>>> 0e97c60adb008404fa0a182d50f04fc5295cb1b0
                </div>
                <!-- End of New Users Section -->

                <!-- Recent Orders Table -->
                <div class="recent-orders">
                    <h2>Recent Orders</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Order ID</th>
<<<<<<< HEAD
                                <th>Customer Phone</th>
                                <th>Time Order</th>
                                <th>Status</th>
                                <th>Detail</th>
=======
                                <th>Customer</th>
                                <th>Time Order</th>
                                <th>Status</th>
                                <th></th>
>>>>>>> 0e97c60adb008404fa0a182d50f04fc5295cb1b0
                            </tr>
                        </thead>

                        <tbody>
<<<<<<< HEAD
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
=======
                            <tr>
                                <th>100</th>
                                <th>Johnny Dang</th>
                                <th>10/15/2023</th>
                                <th>Completed</th>
                            </tr>
                            <tr>
                                <th>101</th>
                                <th>Johnny Dang</th>
                                <th>10/15/2023</th>
                                <th>Completed</th>
                            </tr>
                            <tr>
                                <th>102</th>
                                <th>Johnny Dang</th>
                                <th>10/15/2023</th>
                                <th>Completed</th>
                            </tr>
                            <tr>
                                <th>103</th>
                                <th>Johnny Dang</th>
                                <th>10/15/2023</th>
                                <th>Completed</th>
                            </tr>
                        </tbody>

                    </table>
                    <a class="show" href="#">Show All</a>
>>>>>>> 0e97c60adb008404fa0a182d50f04fc5295cb1b0
                </div>
                <!-- End of Recent Orders -->
            </main>
            <!-- End of Main Content -->
        </div>

    </body>

</html>