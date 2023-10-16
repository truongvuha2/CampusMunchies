<%-- 
    Document   : home
    Created on : Oct 16, 2023, 7:35:00 AM
    Author     : khang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Campus Munchies</title>
    </head>
    <style>
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
                    <div class="food-item">
                        <h3>Item 1</h3>
                        <p>Price: $10.99</p>
                        <i class="fas fa-shopping-cart cart-icon"></i>
                    </div>
                    <div class="food-item">
                        <h3>Item 1</h3>
                        <p>Price: $10.99</p>
                        <i class="fas fa-shopping-cart cart-icon"></i>
                    </div>
                    <div class="food-item">
                        <h3>Item 1</h3>
                        <p>Price: $10.99</p>
                        <i class="fas fa-shopping-cart cart-icon"></i>
                    </div>
                    <div class="food-item">
                        <h3>Item 1</h3>
                        <p>Price: $10.99</p>
                        <i class="fas fa-shopping-cart cart-icon"></i>
                    </div>
                </div>

            </div>


            <div class="latest-food">
                <h2>Latest Food</h2>
                <div class="food-row">
                    <div class="food-item">
                        <h3>Item 1</h3>
                        <p>Price: $12.99</p>
                        <i class="fas fa-shopping-cart cart-icon"></i>
                    </div>
                    <div class="food-item">
                        <h3>Item 1</h3>
                        <p>Price: $12.99</p>
                        <i class="fas fa-shopping-cart cart-icon"></i>
                    </div>
                    <div class="food-item">
                        <h3>Item 1</h3>
                        <p>Price: $12.99</p>
                        <i class="fas fa-shopping-cart cart-icon"></i>
                    </div>
                    <div class="food-item">
                        <h3>Item 1</h3>
                        <p>Price: $12.99</p>
                        <i class="fas fa-shopping-cart cart-icon"></i>
                    </div>

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
