<%-- 
    Document   : cart
    Created on : Oct 21, 2023, 10:56:01 AM
    Author     : khang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <link href="css/cart.css" rel="stylesheet" type="text/css"/>
        <title>Cart</title>
    </head>

    <body>
        <%@include file="header.jsp"%>
        <div style="margin-top:160px"></div>
        <div class="container">
            <!-- Sidebar -->

            <!-- End of Sidebar -->
            <!-- Main Content -->
            <main id="shoppingCart">
                <div class="header">           
                    <div class="name-tittle">
                        Cart
                    </div>
                </div>
                <!-- Orders Food Information Table -->
                <div class="orders-table">
                    <table>
                        <thead>
                            <tr>
                                <th colspan="2">Food</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th colspan="2"></th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach var="cart" items="${requestScope.carts}">
                                <tr>
                                    <td class="food-info">
                                        <img src="${cart.getFood().getImg()}" alt="">
                                    </td>
                                    <td style="font-size: 23px;"> <a href="#">${cart.getFood().getName()}</a> </td>
                                    <fmt:formatNumber maxFractionDigits="2"  var="abc" value="${cart.getFood().getRealPrice()*cart.getQuantity()}"/>
                                    <td>${abc}$</td>
                                    <td>
                            <box class="quantity mt-2">
                                <button style="font-weight: 100; color: black;" class="btn btn-sub" onclick="decQuantity(${cart.getQuantity()}, '${cart.getFood().getId()}')">-</button>
                                <span style="margin-top: 30px;padding: 20px;" id="quantity" class="mx-2" >${cart.getQuantity()}</span>
                                <button style="font-weight: 600; color: black;" class="btn btn-plus" onclick="incQuantity(${cart.getQuantity()}, '${cart.getFood().getId()}')">+</button>
                            </box>
                            </td>
                            <td>
                                <!-- View detail -->

                                <a class="btn" href="foodDetail?id=${cart.getFood().getId()}">
                                    <ion-icon style="font-size: 28px;" name="create"></ion-icon>
                                </a>
                            </td>
                            <td>
                                <button style="background-color:transparent; border:none"  onclick="deleteFood(${cart.getQuantity()}, '${cart.getFood().getId()}')">
                                    <ion-icon style="font-size: 28px;" name="trash-bin"></ion-icon>
                                </button>
                            </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- End of Food Order Information Orders -->
                <ul class="other-info">
                    <li>
                        <h2 style="font-weight: 600; color: #C21010;" class="customer-info">Voucher</h2>
                        <div class="search-main">
                            <div class="search-container">
                                <input type="text" class="search-box" id="searchInput" placeholder="Enter Voucher...">
                                <button class="voucher"><ion-icon name="gift"></ion-icon>Use</button>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="header-info">
                            <h2 style=" font-weight: 600; color: #C21010;" class="customer-info">Total Payment</h2>
                        </div>
                        <span>
                            <div class="info">
                                <p style="font-size: 20px;"><span class="bold-numbers">Total Food Cost: </span>${sum}$</p>
                            </div>
                            <div class="info">
                                <p style="font-size: 20px; "><span class="bold-numbers">Voucher: </span>-0$</p>
                            </div>
                            <hr>
                            <p style="font-size: 25px; font-weight: 500; color: #C21010;"><span class="bold-numbers">Total
                                    Order:</span>${sum}$</p>
                        </span>
                        <c:choose>
                            <c:when test="${not empty requestScope.carts}">
                                <div class="btn-order">
                                    <button onclick="order()" style="font-size: 20px;">Order</button>
                                </div>
                            </c:when>
                           
                        </c:choose>
                    </li>
                </ul>
            </main>
            <!-- End of Main Content -->

        </div>
    </body>
    <%@include file="footer.jsp"%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js">

    </script>
    <script>
        function deleteFood(quantity, id) {
            $.ajax({
                url: "/customer/changeQuantity",
                type: "get",
                data: {
                    foodId: id,
                    quantity: quantity,
                    status: "x"
                },
                success: function (data) {
                    var row = document.getElementById("shoppingCart");
                    row.innerHTML = data;

                },
                error: function (xhr) {
                    // Xử lý lỗi ở đây nếu cần
                    console.log(error);
                }
            });

        }
        function decQuantity(quantity, id) {
            $.ajax({
                url: "/customer/changeQuantity",
                type: "get",
                data: {
                    foodId: id,
                    quantity: quantity,
                    status: "false"
                },
                success: function (data) {
                    var row = document.getElementById("shoppingCart");
                    row.innerHTML = data;

                },
                error: function (xhr) {
                    // Xử lý lỗi ở đây nếu cần
                    console.log(error);
                }
            });

        }
        function incQuantity(quantity, id) {
            $.ajax({
                url: "/customer/changeQuantity",
                type: "get",
                data: {
                    foodId: id,
                    quantity: quantity,
                    status: "true"
                },
                success: function (data) {
                    var row = document.getElementById("shoppingCart");
                    row.innerHTML = data;
                },
                error: function (xhr) {
                    // Xử lý lỗi ở đây nếu cần
                    console.log(error);
                }
            });

        }
        function order() {

            window.location = "/customer/purchase";
        }

    </script>
    <script>
        window.addEventListener("pageshow", function (event) {
            var historyTraversal = event.persisted ||
                    (typeof window.performance != "undefined" &&
                            window.performance.navigation.type === 2);
            if (historyTraversal) {
                // Khi người dùng trở lại từ trang chi tiết, làm mới trang giỏ hàng.
                location.reload();
            }
        });

    </script>
</html>