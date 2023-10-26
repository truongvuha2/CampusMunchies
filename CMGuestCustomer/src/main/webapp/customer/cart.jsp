<%-- 
    Document   : cart
    Created on : Oct 21, 2023, 10:56:01 AM
    Author     : khang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>Shopping Cart</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>

    <body>
        <%@include file="header.jsp"%>
        <div style="margin-top:100px" class="shopping-cart" id="shoppingCart">
            <div class="px-4 px-lg-0">

                <div class="pb-5">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">

                                <!-- Shopping cart table -->
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="p-2 px-3 text-uppercase">Food</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Price</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Quantity</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Delete</div>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody id="body">
                                            <c:set var = "totalPrice" scope = "session" value = "0"/>
                                            <c:forEach  items="${requestScope.carts}"  var="o">
                                                <c:if test = "${o!=null}">

                                                    <tr>
                                                        <th scope="row">
                                                            <div class="p-2">
                                                                <img src="${o.getFood().getImg()}" alt="" width="70" class="img-fluid rounded shadow-sm">
                                                                <div class="ml-3 d-inline-block align-middle">
                                                                    <h5 class="mb-0"> <a href="foodDetail?id=${o.getFood().getId()}" class="text-dark d-inline-block">${o.getFood().getName()}</a></h5><span class="text-muted font-weight-normal font-italic"></span>
                                                                </div>
                                                            </div>
                                                        </th>
                                                        <c:set var="realPrice" value="${o.getFood().getRealPrice()}" />
                                                        <c:set var="quantity" value="${o.getQuantity()}" />
                                                        <fmt:formatNumber var= "totalPriceProduct" value="${realPrice * quantity}" type="number" maxFractionDigits="2" minFractionDigits="2" />
                                                        <td class="align-middle" ><strong id="price">$${totalPriceProduct}</strong></td>
                                                        <c:set var = "totalPrice" scope = "session" value = "${totalPrice + totalPriceProduct}"/>

                                                        <td class="align-middle">
                                                            <button onclick="decQuantity('${o.getQuantity()}', '${o.getFood().getId()}')" class="btnSub btn ">-</button>
                                                            <strong>${o.getQuantity()}</strong>
                                                            <button onclick="incQuantity('${o.getQuantity()}', '${o.getFood().getId()}')" class="btnAdd btn ">+</button>
                                                        </td>
                                                        <td class="align-middle">
                                                            <button type="button" class="btn btn-danger" onclick="deleteFood('${o.getQuantity()}', '${o.getFood().getId()}')" >X</button>
                                                        </td>
                                                    </tr> 
                                                </c:if>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- End -->
                            </div>
                        </div>

                        <div class="row py-5 p-4 bg-white rounded shadow-sm">
                            <div class="col-lg-6">
                                <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Voucher</div>
                                <div class="p-4">
                                    <div class="input-group mb-4 border rounded-pill p-2">
                                        <input type="text" placeholder="Enter Voucher" aria-describedby="button-addon3" class="form-control border-0">
                                        <div class="input-group-append border-0">
                                            <button id="button-addon3" type="button" class="btn btn-dark px-4 rounded-pill"><i class="fa fa-gift mr-2"></i>Use</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Total Payment</div>
                                <div class="p-4">
                                    <ul class="list-unstyled mb-4">
                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Price</strong><strong id ="totalPrice"></strong></li>

                                    </ul><a href="/CampusMunchies/customer/purchase" class="btn btn-dark rounded-pill py-2 btn-block">Buy</a>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div><%@include file="footer.jsp"%>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js">

        </script>
        <script>
            function deleteFood(quantity, id) {
                $.ajax({
                    url: "/CampusMunchies/customer/changeQuantity",
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
                    url: "/CampusMunchies/customer/changeQuantity",
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
                    url: "/CampusMunchies/customer/changeQuantity",
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

            }</script>
        <script>

            document.addEventListener("DOMContentLoaded", function () {
                let priceElements = document.querySelectorAll("#price");

// Khởi tạo biến để lưu tổng giá trị
                let totalPrice = 0;

// Duyệt qua danh sách các phần tử có id "price" và cộng giá trị từ mỗi phần tử
                for (var i = 0; i < priceElements.length; i++) {
                    let priceText = priceElements[i].textContent;
                    let price = parseFloat(priceText.replace("$", "")); // Chuyển đổi văn bản thành số
                    totalPrice += price;
                }

                document.getElementById("totalPrice").innerHTML = "$" + totalPrice.toFixed(2);
            });

            // Trang giỏ hàng
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
        <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>

</html>