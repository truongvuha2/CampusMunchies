<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>Shopping Cart</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    </head>

    <body>
        <%@include file="header.jsp"%>
        <div style="margin-top:100px" class="shopping-cart" id="shoppingCart">
            <div class="px-4 px-lg-0">

                <div class="pb-5">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">
                                <div class="col-lg-12 p-2 bg-info text-light rounded shadow-sm mb-2">
                                    <h2>Information Order</h2>
                                </div>

                                <!-- Shopping cart table -->
                                <div class="table-responsive">
                                    <table class="table">

                                        <thead>
                                            <tr>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="p-2 px-3 text-uppercase">Order</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="p-2 px-3 text-uppercase"></div>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody id="body">


                                        <td class="align-middle">
                                            <h5>Order ID: ${order.id}</h5>
                                        </td>
                                        <td class="align-middle">
                                            <h5>Date created: ${order.orderDate}</h5>
                                        </td>


                                        </tbody>
                                    </table>
                                    <table class="table">
                                        <h4>Customer information</h4>
                                        <thead>
                                            <tr>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="p-2 px-3 text-uppercase">Address</div>
                                                </th>

                                            </tr>
                                        </thead>
                                        <tbody id="body">


                                        <td class="align-middle">
                                            <div>${cus.address}</div>
                                        </td>


                                        </tbody>
                                    </table>
                                    <div>

                                    </div>

                                    <table class="table">
                                        <h4>Food information</h4>
                                        <thead>
                                            <tr>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="p-2 px-3 text-uppercase">Food</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Quantity</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Unit price</div>
                                                </th>

                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Total</div>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody id="body">

                                            <c:forEach items="${detail}" var="o">
                                                <tr>
                                                    <th class="align-middle">
                                                        <div class="ml-0 d-inline-block align-top">${o.foodName}</div>
                                                    </th>
                                                    <td class="align-middle">
                                                        <div class="ml-3 d-inline-block align-top">${o.quantity}</div>
                                                    </td>
                                                    <td class="align-middle">
                                                        <div class="ml-3 d-inline-block align-top">
                                                            <fmt:formatNumber value="${o.price / o.quantity}" type="number" pattern="0.00" />
                                                        </div>
                                                    </td>
                                                    <td class="align-middle">
                                                        <div class="ml-3 d-inline-block align-top">${o.price}</div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            

                                            </tbody>
                                    </table>
                                </div>
                                <!-- End -->
                            </div>
                        </div>

                        <div class="row py-5 p-4 bg-white rounded shadow-sm">
                            <div class="col-lg-6">

                            </div>
                            <div class="col-lg-6">
                                <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Total Payment
                                </div>
                                <div class="p-4">
                                    <ul class="list-unstyled mb-4">
                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong
                                                class="text-muted">Price</strong><strong id="totalPrice">${sum}</strong></li>
                                       
                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong
                                                class="text-muted">Total</strong><strong id="totalPrice">${sum}</strong></li>


                                    
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>
        <%@include file="footer.jsp"%>

        <script src="https://code.jquery.com/jquery-3.2.1.min.js"
                integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
                integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
                integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
    </body>

</html>