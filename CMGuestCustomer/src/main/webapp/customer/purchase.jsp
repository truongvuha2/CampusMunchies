<%-- 
    Document   : purchase
    Created on : Oct 22, 2023, 12:19:25 PM
    Author     : khang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style>
            .container{
                height: 80vh;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div style = "margin-top:100px" class = "container">
            <h2>Your Order </h2>
            <form action="finishOrder">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th class = "col-lg-6 col-md-6 col-sm-4 col-4">Food</th>
                            <th class = "col-lg-3 col-md-3 col-sm-4  col-4">Quantity</th>
                            <th class = "col-lg-3 col-md-3 col-sm-4  col-4">Price</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach var="cart" items="${requestScope.carts}">
                            <tr>
                                <fmt:formatNumber var="price" value="${cart.getQuantity()*cart.getFood().getRealPrice()}" maxFractionDigits="2" minFractionDigits="2"/>
                                <td  >${cart.getFood().getName()}</td>
                                <td >${cart.getQuantity()}</td>
                                <td >$ ${price}</td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td><strong>Total</strong></td>
                            <td></td>
                            <td>
                                $ <input style="border:none; width: 50%; background-color: transparent;" type="text" name="total" value="${total}" readonly />
                            </td>

                        </tr>
                    </tbody>
                </table>

                <table class="table">
                    <tr>
                        <td><strong>Your name:</strong></td>
                        <td>${customer.getName()}</td>
                    </tr>
                    <tr>
                        <td><strong>Your phone:</strong></td>
                        <td>${customer.getPhone()}</td>
                    </tr>
                    <tr>
                        <td><strong>Delivery:</strong></td>
                        <td>
                            <select class="input" name="delivery">
                                <option value="Delivery">${customer.getAddress()}</option>
                                <option value="Takeout">At shop</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>Pay by:</strong></td>
                        <td>
                            <select class="input" name="pay">
                                <option value="COD">COD</option>
                                <option value="Online">Online Banking</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>Description:</strong></td>
                        <td>
                            <input style="width: 100%" type="text" name="description" placeholder="Example: I want more spicy" />
                        </td>
                    </tr>
                    <tr>
                        <td><strong>Is your information correct?</strong></td>
                        <td>
                            <button type="submit" class="btn btn-success">Yes, order now!!!</button>
                        </td>
                    </tr>
                </table>
            </form>

        </div>
    </table>
    <%@include file="footer.jsp" %>
</body>
<script>
    function getOrder() {
        window.location = "/CampusMunchies/customer/finishOrder";
    }
</script>
</html>
