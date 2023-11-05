<%-- 
    Document   : aboutUs
    Created on : Oct 26, 2023, 10:18:31 AM
    Author     : khang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link href="css/home.css" rel="stylesheet" type="text/css"/>
        <title>Menu</title>
    </head>

    <body>
        <%@include file="header.jsp"%>
        <div class="banner" style="margin-top:160px">
            <div class="banner-slide">
                <img src="../img/Banner1.png" alt=""/>
            </div>
            <div class="banner-slide">
                <img src="../img/Burger.png" alt=""/>
            </div>
            <div class="banner-slide">
                <img src="../img/Delicous.png" alt=""/>
            </div>
        </div>
        <!-- Best Seller -->
        <div class="best-seller-logo">
            <img src="../img/Left_BestSeller.png" alt=""/>
            <img src="../img/BestSeller_Header.png" alt=""/>
            <img src="../img/Right_BestSeller.png" alt=""/>
        </div>
        <div class="container">
            <!-- Sidebar -->

            <!-- End of Sidebar -->
            <!-- Main Content -->
            <main>
                <div class="list-menu row">
                    <c:forEach items="${requestScope.topFourSeller}" var="food">
                        <div class="col-md-3">
                            <div class="best-seller ">

                                <div class="best-seller-image abc">
                                    <img src="${food.getImg()}" alt="">
                                </div>
                                <div class="best-seller-image">
                                    <img src="../img/BestSeller_OnFood.png" alt=""/>
                                </div>
                                <div class="name-food">
                                    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

                                    <c:choose>
                                        <c:when test="${fn:length(food.getName()) > 15}">
                                            ${fn:substring(food.getName(), 0, 15)}...
                                        </c:when>
                                        <c:otherwise>
                                            ${food.getName()}
                                        </c:otherwise>
                                    </c:choose> 
                                </div>
                                </a>
                                <div class="food-info">
                                    <div class="price-section">
                                        <p>Price:</p>
                                        <c:choose>
                                            <c:when test="${food.getSale() == 0}">
                                                <p class="discounted-price">${food.getRealPrice()}$</p>
                                            </c:when>
                                            <c:otherwise>
                                                <p class="original-price">${food.getPrice()}$</p>
                                                <p class="discounted-price">${food.getRealPrice()}$</p>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <p>Units Sold: (15+)</p>
                                </div>
                                <div class="food-btn">
                                    <button onclick="viewFood('${food.getId()}')">View</button>
                                    <button  onclick="addToCart('${food.getId()}')"><ion-icon style="font-size: 22px;" name="cart"></ion-icon></button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <!-- End Best Seller -->
                <!-- List Food -->
                <div style="text-align: center; margin:50px 0" class="new">
                    <img src="../img/NEW FOOD.png" alt=""/>
                </div>
                <div class="list-menu row" id="foodList">
                    <c:forEach items="${requestScope.topFourLatest}" var="food">
                        <div class="col-md-3">
                            <div class="best-seller ">

                                <div class="new-food-img">
                                    <img src="${food.getImg()}" alt="">
                                </div>
                                <div class="new-food">
                                    <c:choose>
                                        <c:when test="${fn:length(food.getName()) > 15}">
                                            ${fn:substring(food.getName(), 0, 15)}...
                                        </c:when>
                                        <c:otherwise>
                                            ${food.getName()}
                                        </c:otherwise>
                                    </c:choose> 
                                </div>

                                <div class="food-info">
                                    <div class="price-section">
                                        <p>Price:</p>

                                        <c:choose>
                                            <c:when test="${food.getSale() == 0}">

                                                <p class="discounted-price">${food.getRealPrice()}$</p>
                                            </c:when>
                                            <c:otherwise>
                                                <p class="original-price">${food.getPrice()}$</p>
                                                <p class="discounted-price">${food.getRealPrice()}$</p>
                                            </c:otherwise>
                                        </c:choose>

                                    </div> <p>Units Sold: (15+)</p>
                                    <!--                                <p>Units Sold: (99+)</p>-->
                                </div>
                                <div class="food-btn">
                                    <button onclick="viewFood('${food.getId()}')">View</button>
                                    <button  onclick="addToCart('${food.getId()}')"><ion-icon style="font-size: 22px;" name="cart"></ion-icon></button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <!-- End List Food -->
            </main>
        </div>
        <%@include file="footer.jsp"%>

        <!-- End of Main Content -->
    </body>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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

                                        function viewFood(id) {
                                            window.location = "/guest/foodDetail?id=" + id;
                                        }
                                        function addToCart(id) {
                                            Swal.fire({
                                                title: '',
                                                text: "You have to login to add to cart",
                                                icon: 'warning',
                                                showCancelButton: true,
                                                confirmButtonColor: '#3085d6',
                                                cancelButtonColor: '#d33',
                                                confirmButtonText: 'Log in now'
                                            }).then((result) => {
                                                if (result.isConfirmed) {
                                                    window.location = "/guest/login";
                                                    f
                                                }
                                            })
                                        }
    </script>

</html>