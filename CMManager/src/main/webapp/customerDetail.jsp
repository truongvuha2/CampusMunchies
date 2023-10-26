<%-- 
    Document   : customerDetail
    Created on : Oct 19, 2023, 10:59:25 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.all.min.js"></script>
        <link rel="stylesheet" href="css/customerDetail.css">
        <title>Customer Details</title>
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
                        Customer Details
                        <div class="order-id">
                            Phone: ${phoneCus}
                        </div>
                    </div>

                    <div class="user-info">
                        <p>Hey, <b><%= request.getSession().getAttribute("username") %></b></p>
                        <small class="text-muted">Admin</small>
                    </div>
                </div>
                <!-- Customer Details Information -->
                <ul class="customer-details-info">
                    <li>
                        <h2>Customer Information</h2>
                        <p>Name: ${infoCus.name}</p>
                        <p>Phone: ${infoCus.phone}</p>
                        <p>Address: ${infoCus.address}</p>
                        <p>Birthday: ${birthday}</p>
                        <p>Number of orders: ${infoCus.numberOrder}</p>
                        <p>Total spending: ${infoCus.totalSpending}$</p>
                        <p>Cancel order: ${infoCus.cancel_count}</p>
                        <p>Account Creation Date: ${dateCreate}</p>
                        <p>Account Status: ${infoCus.cus_status}</p>
                    </li>
                    <li>
                        <h2>Order History</h2>
                        <table>
                            <thead>
                                <tr>
                                    <th>Order ID</th>
                                    <th>Status</th>
                                    <th>Date Order</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="h" items="${requestScope.historyOrder}">
                                    <tr>
                                        <td><a href="/customerDetails?cid=${h.getOrd_id()}">${h.getOrd_id()}</a></td>
                                        <td>${h.getOrd_status()}</td>
                                        <td>${h.getOrd_date()}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </li>
                </ul>
                <div class="btn-detail">
                    <div class="btn-block-cus">
                        <c:choose>
                            <c:when test="${statusAcc eq 'Available'}">
                                <button type="submit"  onclick="blockCus('${phoneCus}', '${statusAcc}')">
                                    Block
                                    <ion-icon name="lock-closed-outline"></ion-icon>
                                    </c:when>
                                    <c:when test="${statusAcc eq 'Blocked'}">
                                    <button type="submit"  onclick="blockCus('${phoneCus}', '${statusAcc}')">
                                        Unblock
                                        <ion-icon name="lock-open-outline"></ion-icon>
                                    </c:when>
                                </c:choose>
                            </button>

                    </div>
                    <div class="btn-delete-cus">
                        <c:choose>
                            <c:when test="${statusAcc ne 'Deleted'}">
                                <button type="submit" onclick="deleteCus('${phoneCus}')">
                                    Delete
                                </button>
                            </c:when>
                        </c:choose>
                    </div>
                </div>


            </main>
            <!-- End of Main Content -->



        </div>
    </body>
    <script>
        function deleteCus(phone) {
            Swal.fire({
                title: 'Are you sure?',
                text: 'Do you really want to delete this customer?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Yes, delete it!',
                cancelButtonText: 'No, cancel!',
                reverseButtons: false
            }).then((result) => {
                if (result.isConfirmed) {
                    // Nếu người dùng xác nhận xóa
                    window.location = "/deleteCustomer?cid=" + phone;
                }
            });
        }

        function blockCus(phone, status) {
            {
                const action = status === "Available" ? "block" : "unblock";

                Swal.fire({
                    title: "Are you sure you want to " + action + " this customer?",
                    text: "This will " + action + " the customer's account.",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: "Yes, " + action + " it!",
                    cancelButtonText: 'No, cancel',
                    reverseButtons: false
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location = "/blockCustomer?cid=" + phone + "&st=" + status;
                    }
                });
            }
        }
    </script>
=======
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    <link rel="stylesheet" href="css/customerDetail.css">
    <title>Customer Details</title>
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
                    Customer Details
                    <div class="order-id">
                        Customer ID: 100
                    </div>
                </div>

                <div class="user-info">
                    <p>Hey, <b>Reza</b></p>
                    <small class="text-muted">Admin</small>
                </div>
            </div>
            <!-- Customer Details Information -->
            <ul class="customer-details-info">
                <li>
                    <h2>Customer Information</h2>
                    <p>Name: Johnny Dang</p>
                    <p>Phone: 0123456789</p>
                    <p>Address: 123, Nguyen Van Cu, Ninh Kieu, Can Tho, Viet Nam</p>
                    <p>Brithday: 12/15/2003</p>
                    <p>Number of orders: 34</p>
                    <p>Total spending: 345$</p>
                    <p>Cancel order: 3</p>
                </li>
                <li>
                    <h2>Order History</h2>
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
                <div class="btn-block-cus">
                    <button type="submit">
                        Block
                        <ion-icon name="lock-closed-outline"></ion-icon>
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

>>>>>>> 0e97c60adb008404fa0a182d50f04fc5295cb1b0
</html>