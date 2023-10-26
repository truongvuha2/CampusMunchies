<%-- 
    Document   : orderDetail
    Created on : Oct 19, 2023, 1:45:43 PM
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
    <link rel="stylesheet" href="css/orderDetail.css">
    <title>Order Details</title>
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
                    Order Details
                    <div class="order-id">
                        Order ID: 100
                    </div>
                    <div class="status">
                        Completed
                    </div>
                </div>

                <div class="user-info">
                    <p>Hey, <b><%= request.getSession().getAttribute("username") %></b></p>
                    <small class="text-muted">Admin</small>
                </div>
            </div>
            <!-- Orders Food Information Table -->
            <div class="orders-table">
                <h2 class="order-list">Order Food Information</h2>
                <table>
                    <thead>
                        <tr>
                            <th colspan="2">Food</th>
                            <th>Unit Price</th>
                            <th>Quantity</th>
                            <th>Total Price</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td class="food-info">
                                <a href="#">
                                    <img src="https://i.ibb.co/Nm3BsQt/Hamburger.png" alt="">
                                </a>
                            </td>
                            <td>Hamburger</td>
                            <td>23$</td>
                            <td>2</td>
                            <td>46$</td>
                        </tr>
                        <tr>
                            <td class="food-info">
                                <a href="#">
                                    <img src="https://i.ibb.co/Nm3BsQt/Hamburger.png" alt="">
                                </a>
                            </td>
                            <td>Hamburger</td>
                            <td>23$</td>
                            <td>2</td>
                            <td>46$</td>
                        </tr>
                        <tr>
                            <td class="food-info">
                                <a href="#">
                                    <img src="https://i.ibb.co/Nm3BsQt/Hamburger.png" alt="">
                                </a>
                            </td>
                            <td>Hamburger</td>
                            <td>23$</td>
                            <td>2</td>
                            <td>46$</td>
                        </tr>
                        <tr>
                            <td class="food-info">
                                <a href="#">
                                    <img src="https://i.ibb.co/Nm3BsQt/Hamburger.png" alt="">
                                </a>
                            </td>
                            <td>Hamburger</td>
                            <td>23$</td>
                            <td>2</td>
                            <td>46$</td>
                        </tr>
                    </tbody>
                </table>
                <div class="total-order">Total Order: 184$</div>
            </div>
            <!-- End of Food Order Information Orders -->
            <ul class="other-info">
                <li>
                    <div class="header-info">
                        <h2 class="customer-info">Customer</h2>
                        <a href="#">View Detail</a>
                    </div>
                    <span>
                        <p>Name: Johnny Dang</p>
                        <p>Phone: 0123456789</p>
                        <p>Address: 123, Nguyen Van Cu, Ninh Kieu, Can Tho, Viet Nam</p>
                    </span>
                </li>
                <li>
                        <h2 class="customer-info">Invoice Information</h2>
                    <span>
                        <p>Employee order: Alice  </p>
                        <p>Payment methods: Banking</p>
                        <p>Date Order: 7-7-2023</p>
                        <p>Note: </p>
                    </span>
                </li>
            </ul>

        </main>
        <!-- End of Main Content -->



    </div>
</body>

</html>