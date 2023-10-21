<%-- 
    Document   : orderManagement
    Created on : Oct 19, 2023, 1:46:05 PM
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
        <link rel="stylesheet" href="css/orderManagement.css">
        <title>Order Management</title>
    </head>

    <body>

        <div class="container-i">
            <!-- Sidebar -->
            <aside>
                <div class="sidebar">
                    <a href="#" class="logo-side">
                        <div class="logo-name">
                            <div class="Campus">Campus</div>
                            <div class="Munchines">Munchines</div>
                        </div>
                    </a>
                    <ul class="side-menu">
                        <li><a href="analytics.jsp"><i class='bx bx-analyse'></i> Analytics</a></li>
                        <li><a href="orderManagement.jsp"><i class='bx bx-box'></i> Order</a>
                        
                           
                        
                        </li>
                        <li><a href="#"><i class='bx bx-food-menu'></i> Menu</a>
                        
                            <ul class="sub-menu">
                                <li><a href="addFood.jsp"> Add Food</a></li>
                                <li><a href="updateFood.jsp"> Update Food</a></li>
                                <li><a href="foodDetai.jsp"> Food Detail</a></li>
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
            <!-- End of Sidebar -->
            <!-- Main Content -->
            <main>
                <div class="header">
                    <div class="logo-tittle">
                        <img src="https://drive.google.com/uc?id=1oi7OnKZyo4ooOq0ebaJpejenlpcyOKns"
                             alt="Logo Campus Munchies">
                    </div>

                    <div class="name-tittle">
                        Order Management
                    </div>

                    <div class="user-info">
                        <p>Hey, <b>Reza</b></p>
                        <small class="text-muted">Admin</small>
                    </div>
                </div>
                <!-- Food Management Table -->
                <div class="orders-table">
                    <div class="search-main">
                        <h2 class="order-list">Order List</h2>
                        <select class="select-box" id="filterSelect">
                            <option value="orderId" selected>Order ID</option>
                            <option value="phone">Phone</option>
                            <option value="paymentMethods">Payment Methods</option>
                            <option value="dateOrder">Date Order</option>
                        </select>
                        <div class="search-container">

                            <input type="text" class="search-box" id="searchInput" placeholder="Search...">
                        </div>
                    </div>
                    <div id="tableContainer">
                        <table>
                            <thead>
                                <tr>
                                    <th data-filter="orderId" onclick="sortTable(0)">Order ID</th>
                                    <th data-filter="status" onclick="sortTable(1)">Status</th>
                                    <th data-filter="dateOrder" onclick="sortTable(2)">Date Order</th>
                                    <th data-filter="phone" onclick="sortTable(3)">Phone</th>
                                    <th data-filter="paymentMethods" onclick="sortTable(4)">Payment Methods</th>
                                    <th data-filter="total" onclick="sortTable(5)">Total</th>
                                    <th data-filter="details">Details</th>
                                </tr>
                            </thead>

                            <tbody id="itemList">
                                <tr>
                                    <td>123</td>
                                    <td class="status">Completed</td>
                                    <td>8-7-2023</td>
                                    <td>0123456789</td>
                                    <td>COD</td>
                                    <td>23$</td>
                                    <td class="view-link"><a href="#" class="view">View</a></td>
                                </tr>
                                <tr>
                                    <td>124</td>
                                    <td class="status">Completed</td>
                                    <td>7-7-2023</td>
                                    <td>0123456789</td>
                                    <td>COD</td>
                                    <td>23$</td>
                                    <td class="view-link"><a href="#" class="view">View</a></td>
                                </tr>
                                <tr>
                                    <td>125</td>
                                    <td class="status">Completed</td>
                                    <td>9-7-2023</td>
                                    <td>0123456666</td>
                                    <td>COD</td>
                                    <td>23$</td>
                                    <td class="view-link"><a href="#" class="view">View</a></td>
                                </tr>
                                <tr>
                                    <td>126</td>
                                    <td class="status">Completed</td>
                                    <td>10-7-2023</td>
                                    <td>0123456789</td>
                                    <td>COD</td>
                                    <td>23$</td>
                                    <td class="view-link"><a href="#" class="view">View</a></td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="btn-pagination" id="pagination">
                            <button id="prevButton"><i class='bx bx-left-arrow-circle'></i></button>
                            <button id="nextButton"><i class='bx bx-right-arrow-circle'></i></button>
                        </div>
                    </div>
                </div>
                <!-- End of Food Management Orders -->

            </main>
            <!-- End of Main Content -->
        </div>
    </body>
    <script src="javascript/orderManagement.js" type="text/javascript"></script>
</html>