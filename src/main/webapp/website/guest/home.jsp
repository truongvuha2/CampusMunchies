<%-- 
    Document   : home.jsp
    Created on : Oct 12, 2023, 11:06:55 AM
    Author     : khang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <link rel="stylesheet" type="text/css" href="css/home.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    </head>

    <body>
        <nav class="navbar">
            <div class="logo">
                <a href="#"><img
                        src="https://img.freepik.com/free-vector/bird-colorful-logo-gradient-vector_343694-1365.jpg"
                        alt="Logo"></a>
            </div>
            <div class="search-box">
                <input type="text" placeholder="Tìm kiếm">
                <button type="submit">Search</button>
            </div>
            <div class="login-button">
                <a href="login.jsp">Login</a>
            </div>
        </nav>

        <nav class="secondary-navbar">
            <a href="#">Home</a>
            <a href="#">Category</a>
            <a href="#">Menu</a>
            <a href="#">Order</a>
            <a href="#">Sale</a>
            <a href="#">About Us</a>
            <a href="#">Cart</a>
        </nav>

        <div class="banner">
            <div class="banner-slide">
                <img src="img/dual-monitor-wallpaper-10.jpg" alt=""/>
            </div>
        </div>

        <div class="food-section">
            <h2>Best Selling Food</h2>
            <div class="food-items">
                <div class="food-item">
                    <img src="food1.jpg" alt="Food 1">
                    <p>Food Item 1</p>
                    <button class="add-to-cart">
                        <i class="fas fa-shopping-cart"></i>
                    </button>
                </div>
                <div class="food-item">
                    <img src="food2.jpg" alt="Food 2">
                    <p>Food Item 2</p>
                    <button class="add-to-cart">
                        <i class="fas fa-shopping-cart"></i>
                    </button>
                </div>
                <div class="food-item">
                    <img src="food3.jpg" alt="Food 3">
                    <p>Food Item 3</p>
                    <button class="add-to-cart">
                        <i class="fas fa-shopping-cart"></i>
                    </button>
                </div>
                <div class="food-item">
                    <img src="food4.jpg" alt="Food 4">
                    <p>Food Item 4</p>
                    <button class="add-to-cart">
                        <i class="fas fa-shopping-cart"></i>
                    </button>
                </div>
            </div>
        </div>

        <div class="food-section">
            <h2>Latest Food</h2>
            <div class="food-items">
                <div class="food-item">
                    <img src="food5.jpg" alt="Food 5">
                    <p>Food Item 5</p>
                    <button class="add-to-cart">
                        <i class="fas fa-shopping-cart"></i>
                    </button>
                </div>
                <div class="food-item">
                    <img src="food6.jpg" alt="Food 6">
                    <p>Food Item 6</p>
                    <button class="add-to-cart">
                        <i class="fas fa-shopping-cart"></i>
                    </button>
                </div>
                <div class="food-item">
                    <img src="food7.jpg" alt="Food 7">
                    <p>Food Item 7</p>
                    <button class="add-to-cart">
                        <i class="fas fa-shopping-cart"></i>
                    </button>
                </div>
                <div class="food-item">
                    <img src="food8.jpg" alt="Food 8">
                    <p>Food Item 8</p>
                    <button class="add-to-cart">
                        <i class="fas fa-shopping-cart"></i>
                    </button>
                </div>
            </div>
        </div>

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

            // Hiển thị slide đầu tiên
            showSlide(currentIndex);

            // Tự động trượt sau mỗi 3 giây
            setInterval(nextSlide, 3000);
        });
    </script>


</html>