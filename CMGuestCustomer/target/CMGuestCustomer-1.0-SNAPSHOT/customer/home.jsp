<%-- 
    Document   : home
    Created on : Oct 16, 2023, 7:35:00 AM
    Author     : khang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Campus Munchies</title>
    </head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
    <style>
        .banner{
            margin-bottom: 20px;
            margin-top: 83px;
        }
        .banner-slide img {
            width: 100%
        }

        .food{
            padding: 0 10%;
        }
        .food-row {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        /* Style cho mỗi món ăn trong hàng */
        .food-item {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
            width: 23%; /* Để mỗi món ăn chiếm khoảng 23% của khung chứa */
            margin-right: 1%;
            position: relative;
        }

        .food-item:last-child {
            margin-right: 0;
        }

        .food-item .cart-icon {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 20px;
            color: #ff6600;
        }
    </style>
    <body>
        <%@include file="header.jsp"%>

        <div class="banner">
            <div class="banner-slide">
                <img src="../img/Banner1.png" alt=""/>
            </div>
            <div class="banner-slide">
                <img src="../img/dual-monitor-wallpaper-10.jpg" alt=""/>
            </div>
        </div>

        <div class="food">
            <div class="best-seller">
                <h2>Best Seller</h2>
                <div class="food-row">
                    <c:forEach items="${requestScope.topFoods}" var="food">
                        <div class="food-item">
                            <img style="width:100%" src="${food.getImg()}">
                            <h3>${food.getName()}</h3>
                            <p>${food.getRealPrice()}</p>
                            <a href="/CampusMunchies/guest/foodDetail?id=${food.getId()}"><i class="fas fa-shopping-cart cart-icon"></i></a>
                        </div>
                    </c:forEach>
                </div>
            </div>


            <div class="latest-food">
                <h2>New Food</h2>
                <div class="food-row">
                    <c:forEach items="${requestScope.latestFoods}" var="food">
                        <div class="food-item">
                            <img style="width:100%" src="${food.getImg()}">
                            <h3>${food.getName()}</h3>
                            <p>${food.getRealPrice()}</p>
                            <a href="/CampusMunchies/customer/foodDetail?id=${food.getId()}"><i class="fas fa-shopping-cart cart-icon"></i></a>
                        </div>
                    </c:forEach>

                </div>
            </div>

        </div>
        <%@include file="footer.jsp"%>
    </body>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            var currentIndex = 0;
            var slides = $(".banner-slide");

            function showSlide(index) {
                slides.hide();
                slides.eq(index).fadeIn();
            }

            function nextSlide() {
                currentIndex = (currentIndex + 1) % slides.length;
                showSlide(currentIndex);
            }

            showSlide(currentIndex);

            setInterval(nextSlide, 5000);
        });
    </script>
</html>
