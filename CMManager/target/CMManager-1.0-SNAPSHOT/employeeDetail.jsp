<%-- 
    Document   : employeeDetail
    Created on : Oct 19, 2023, 1:43:17 PM
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
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    <link rel="stylesheet" href="css/employeeDetail.css">
    <title>Employee Details</title>
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
                    <li><a href="#"><i class='bx bx-analyse'></i> Analytics</a></li>
                    <li><a href="#"><i class='bx bx-box'></i> Order</a></li>
                    <li><a href="#"><i class='bx bx-food-menu'></i> Menu</a></li>
                    <li><a href="#"><i class='bx bxs-user-account'></i> Customer</a></li>
                    <li><a href="#"><i class='bx bxs-user-detail'></i> Employee</a></li>
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
                    Employee Details
                    <div class="order-id">
                        Employee ID: 100
                    </div>
                </div>

                <div class="user-info">
                    <p>Hey, <b>Reza</b></p>
                    <small class="text-muted">Admin</small>
                </div>
            </div>
            <!-- Employee Details Information -->
            <ul class="employee-details-info">
                <li>
                    <h2>Employee Information</h2>
                    <p>Name: Johnny Dang</p>
                    <p>Phone: 0123456789</p>
                    <p>Address: 123, Nguyen Van Cu, Ninh Kieu, Can Tho, Viet Nam</p>
                    <p>Brithday: 12/15/2003</p>
                    <p>Orders served: 34</p>
                </li>
                <li>
                    <h2>History Order Served</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Status</th>
                                <th>Date Order</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><a href="#">123</a></td>
                                <td>Completed</td>
                                <td>7/7/2023</td>
                            </tr>
                            <tr>
                                <td><a href="#">124</a></td>
                                <td>Completed</td>
                                <td>7/7/2023</td>
                            </tr>
                            <tr>
                                <td><a href="#">125</a></td>
                                <td>Completed</td>
                                <td>7/7/2023</td>
                            </tr>
                            <tr>
                                <td><a href="#">126</a></td>
                                <td>Completed</td>
                                <td>7/7/2023</td>
                            </tr>
                        </tbody>
                    </table>
                </li>
            </ul>
            <div class="btn-detail">
                <div class="btn-create-acc">
                    <button type="submit">
                        Create Account
                    </button>
                </div>
                <div class="btn-delete-cus">
                    <button type="submit">
                        Delete
                    </button>
                </div>
            </div>
            

        </main>
        <!-- End of Main Content -->



    </div>
</body>

</html>