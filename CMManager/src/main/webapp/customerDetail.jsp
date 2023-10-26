<%-- 
    Document   : customerDetail
    Created on : Oct 19, 2023, 10:59:25 AM
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
</html>