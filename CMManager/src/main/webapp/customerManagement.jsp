<%-- 
    Document   : customerManagement
    Created on : Oct 19, 2023, 1:40:25 PM
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
        <link rel="stylesheet" href="css/customerManagement.css">
        <title>Customer Management</title>
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
                        <li><a href="orderManagement.jsp"><i class='bx bx-box'></i> Order</a></li>
                        <li><a href="#"><i class='bx bx-food-menu'></i> Menu</a>
                        
                            <ul class="sub-menu">
                                <li><a href="addFood.jsp"> Add Food</a></li>
                                <li><a href="updateFood.jsp"> Update Food</a></li>
                                <li><a href="foodDetai.jsp"> Food Detail</a></li>
                                <li><a href="listMenu.jsp"> List Menu</a></li>
                            </ul>
                        
                        </li>
                        <li><a href="customerManagement.jsp"><i class='bx bxs-user-account'></i> Customer</a></li>
                        <li><a href="employeeManagement.jsp"><i class='bx bxs-user-detail'></i> Employee</a></li>
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
                        Customer Management
                    </div>

                    <div class="user-info">
                        <p>Hey, <b>Reza</b></p>
                        <small class="text-muted">Admin</small>
                    </div>
                </div>
                <!-- Customer Management Table -->
                <div class="customer-table">
                    <div class="search-main">
                        <h2 class="customer-list">Customer List</h2>
                        <select class="select-box" id="filterSelect">
                            <option value="customerId" selected>Customer ID</option>
                            <option value="name">Name</option>
                            <option value="phone">Phone</option>
                            <option value="orders">Number Of Orders</option>

                        </select>
                        <div class="search-container">
                            <input type="text" class="search-box" id="searchInput" placeholder="Search...">
                        </div>
                    </div>
                    <div id="tableContainer">
                        <table>
                            <thead>
                                <tr>
                                    <th data-filter="customerId" onclick="sortTable(0)">Customer ID</th>
                                    <th data-filter="name" onclick="sortTable(1)">Name</th>
                                    <th data-filter="phone" onclick="sortTable(2)">Phone</th>
                                    <th data-filter="orders" onclick="sortTable(3)">Number Of Orders</th>
                                    <th data-filter="totalSpent" onclick="sortTable(4)">Total Spending</th>
                                    <th data-filter="details">Details</th>
                                </tr>
                            </thead>
                            <tbody id="itemList">
                                <tr>
                                    <td>101</td>
                                    <td>Johnny Dang</td>
                                    <td>0123456789</td>
                                    <td>12</td>
                                    <td>132$</td>
                                    <td><a class="view" href="#">View</a></td>
                                </tr>
                                <tr>
                                    <td>102</td>
                                    <td>Johnny Nguyen</td>
                                    <td>0123456788</td>
                                    <td>13</td>
                                    <td>136$</td>
                                    <td><a class="view" href="#">View</a></td>
                                </tr>
                                <tr>
                                    <td>103</td>
                                    <td>Johnny Tai</td>
                                    <td>0123456787</td>
                                    <td>15</td>
                                    <td>137$</td>
                                    <td><a class="view" href="#">View</a></td>
                                </tr>
                                <tr>
                                    <td>104</td>
                                    <td>Johnny Nhan</td>
                                    <td>0123456786</td>
                                    <td>14</td>
                                    <td>131$</td>
                                    <td><a class="view" href="#">View</a></td>
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
                <!-- Honor Customer -->
                <div class="other-info">
                    <div class="honor-customer-table">
                        <h2>Honor Customer</h2>
                        <table>
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Orders</th>
                                    <th>Total Spending</th>
                                    <th>Details</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Johnny Dang</td>
                                    <td>12</td>
                                    <td>132$</td>
                                    <td><a class="view" href="#">View</a></td>
                                </tr>
                                <tr>
                                    <td>Johnny Nguyen</td>
                                    <td>13</td>
                                    <td>136$</td>
                                    <td><a class="view" href="#">View</a></td>
                                </tr>
                                <tr>
                                    <td>Johnny Tai</td>
                                    <td>15</td>
                                    <td>137$</td>
                                    <td><a class="view" href="#">View</a></td>
                                </tr>
                                <tr>
                                    <td>Johnny Nhan</td>
                                    <td>14</td>
                                    <td>131$</td>
                                    <td><a class="view" href="#">View</a></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="black-list-table">
                        <h2>Black List</h2>
                        <table>
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Orders</th>
                                    <th>Cancel Orders</th>
                                    <th>Details</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Johnny Teo</td>
                                    <td>45</td>
                                    <td>13</td>
                                    <td><a class="view" href="#">View</a></td>
                                </tr>
                                <tr>
                                    <td>Anh Phan</td>
                                    <td>34</td>
                                    <td>12</td>
                                    <td><a class="view" href="#">View</a></td>
                                </tr>
                                <tr>
                                    <td>Baby Red</td>
                                    <td>13</td>
                                    <td>12</td>
                                    <td><a class="view" href="#">View</a></td>
                                </tr>
                                <tr>
                                    <td>Thai Nhan</td>
                                    <td>14</td>
                                    <td>13</td>
                                    <td><a class="view" href="#">View</a></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- End of Honor Customer -->
            </main>
            <!-- End of Main Content -->
        </div>
    </body>
    <script src="javascript/customerManagement.js" type="text/javascript"></script>
</html>