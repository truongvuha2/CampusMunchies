<%-- 
    Document   : listMenu
    Created on : Oct 19, 2023, 1:44:52 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.all.min.js"></script>
        <link rel="stylesheet" href="css/listMenu.css">
        <title>Menu</title>
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
                        Menu
                    </div>
                    <div class="user-info">
                        <p>Hey, <b><%= request.getSession().getAttribute("username")%></b></p>

                        <small class="text-muted">Admin</small>
                    </div>
                </div>
                <!-- Best Seller -->
                <h2>Best Seller</h2>
                <div class="list-menu row">
                    <c:forEach var="s" items="${requestScope.bestSeller}">
                        <div class="best-seller col-md-3">
                            <a href="foodDetails?fid=${s.id}">
                                <img src="${s.img}" alt="">
                                <div class="name-food">
                                    <p>
                                        <c:choose>
                                            <c:when test="${fn:length(s.name) > 14}">
                                                ${fn:substring(s.name, 0, 14)}...
                                            </c:when>
                                            <c:otherwise>
                                                ${s.name}
                                            </c:otherwise>
                                        </c:choose>
                                    </p>
                                </div>
                            </a>
                            <div class="food-info">
                                <hr>
                                <c:choose>
                                    <c:when test="${s.status eq 'Sold Out'}">
                                        <div class="price-section">
                                            <p style="color: #888">Price:</p>
                                            <c:if test="${s.sale ne 0}">
                                                <p class="original-price">${s.price}$</p>
                                            </c:if>
                                            <p  style="color: #888" class="discounted-price">${s.getRealPrice()}$</p>
                                        </div>
                                        <p style="color: #888">Status: ${s.status}</p>
                                        <p style="color: #888">Total Order: ${s.numOrder}</p>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="price-section">
                                            <p>Price:</p>
                                            <c:if test="${s.sale ne 0}">
                                                <p class="original-price">${s.price}$</p>
                                            </c:if>
                                            <p class="discounted-price">${s.getRealPrice()}$</p>
                                        </div>
                                        <p>Status: ${s.status}</p>
                                        <p>Total Order: ${s.numOrder}</p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="food-btn">
                                <button type="submit" onclick="updateFood('${s.id}')">Update</button>
                                <button type="submit" onclick="confirmDeleteFood('${s.id}')">
                                    Delete
                                </button>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <!-- End Best Seller -->
                <!-- List Food -->
                <h2>List Food</h2>
                <div class="search-main">
                    <div class="search-container">
                        <input type="text" class="search-box" id="searchInput" placeholder="Search Name Food...">
                    </div>
                    <div class="filter"> 
                        <label>Category filter: </label>
                        <select class="select-box">
                            <option value="All" selected>All</option>
                            <option value="CAT001">Noodle</option>
                            <option value="CAT002">Chicken</option>
                            <option value="CAT003">Bread</option>
                            <option value="CAT004">Side Dish</option>
                            <option value="CAT005">Drink</option>
                            <option value="CAT006">Rice</option>
                            <option value="CAT007">Combo</option>

                        </select>

                    </div>
                </div>
                <div class="list-menu row" id="foodList">
                    <c:forEach var="m" items="${requestScope.menu}">
                        <div class="food col-md-3">
                            <a href="foodDetails?fid=${m.id}">
                                <img  src="${m.img}" alt="">
                                <div class="name-food">
                                    <p>
                                        <c:choose>
                                            <c:when test="${fn:length(m.name) > 14}">
                                                ${fn:substring(m.name, 0, 14)}...
                                            </c:when>
                                            <c:otherwise>
                                                ${m.name}
                                            </c:otherwise>
                                        </c:choose>
                                    </p>
                                </div>
                            </a>

                            <div class="food-info">
                                <hr>


                                <c:choose>
                                    <c:when test="${m.status eq 'Sold Out'}">
                                        <div class="price-section">
                                            <p style="color: #888">Price:</p>
                                            <c:if test="${m.sale ne 0}">
                                                <p class="original-price">${m.price}$</p>
                                            </c:if>
                                            <p  style="color: #888" class="discounted-price">${m.getRealPrice()}$</p>
                                        </div>
                                        <p style="color: #888">Status: ${m.status}</p>
                                        <p style="color: #888">Total Order: ${m.numOrder}</p>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="price-section">
                                            <p>Price:</p>
                                            <c:if test="${m.sale ne 0}">
                                                <p class="original-price">${m.price}$</p>
                                            </c:if>
                                            <p class="discounted-price">${m.getRealPrice()}$</p>
                                        </div>
                                        <p>Status: ${m.status}</p>
                                        <p>Total Order: ${m.numOrder}</p>
                                    </c:otherwise>
                                </c:choose>


                            </div>
                            <div class="food-btn">
                                <button type="submit" onclick="updateFood('${m.id}')">Update</button>
                                <button type="submit" onclick="confirmDeleteFood('${m.id}')">
                                    Delete
                                </button>
                            </div>
                            <div class="categoryId" style="display: none;">
                                <p>${m.categoryId}</p>
                            </div>
                        </div>
                    </c:forEach>

                </div>
                <div class="not-found" style="display: none;">
                    <p>Not found !</p>
                </div>
                <!-- End List Food -->
            </main>

        </div>
        <!-- End of Main Content -->
    </body>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const foodItems = document.querySelectorAll('.food');
            const searchInput = document.getElementById('searchInput');
            const selectBox = document.querySelector('.select-box');
            const notFoundMessage = document.querySelector('.not-found');

            // Lưu trữ danh sách ban đầu
            const originalFoodList = Array.from(foodItems);

            selectBox.addEventListener('change', function () {
                const selectedCategory = selectBox.value;
                const searchTerm = searchInput.value.toLowerCase();

                originalFoodList.forEach(foodItem => {
                    const categoryId = foodItem.querySelector('.categoryId').textContent.trim();
                    const nameFood = foodItem.querySelector('.name-food p').textContent.toLowerCase();

                    if (
                            (selectedCategory === 'All' || categoryId === selectedCategory) &&
                            (nameFood.includes(searchTerm))
                            ) {
                        foodItem.style.display = '';
                    } else {
                        foodItem.style.display = 'none';
                    }
                });

                const resultsFound = originalFoodList.some(foodItem => {
                    return foodItem.style.display !== 'none';
                });

                if (resultsFound) {
                    notFoundMessage.style.display = 'none';
                } else {
                    notFoundMessage.style.display = '';
                }
            });

            searchInput.addEventListener('input', function () {
                const searchTerm = searchInput.value.toLowerCase();
                const selectedCategory = selectBox.value;

                originalFoodList.forEach(foodItem => {
                    const categoryId = foodItem.querySelector('.categoryId').textContent.trim();
                    const nameFood = foodItem.querySelector('.name-food p').textContent.toLowerCase();

                    if (
                            (selectedCategory === 'All' || categoryId === selectedCategory) &&
                            (nameFood.includes(searchTerm))
                            ) {
                        foodItem.style.display = '';
                    } else {
                        foodItem.style.display = 'none';
                    }
                });

                const resultsFound = originalFoodList.some(foodItem => {
                    return foodItem.style.display !== 'none';
                });

                if (resultsFound) {
                    notFoundMessage.style.display = 'none';
                } else {
                    notFoundMessage.style.display = '';
                }
            });
        });

        function confirmDeleteFood(foodId) {
            Swal.fire({
                title: 'Are you sure?',
                text: 'Do you really want to delete this food?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Yes, delete it!',
                cancelButtonText: 'No, cancel!',
                reverseButtons: false
            }).then((result) => {
                if (result.isConfirmed) {
                    // Nếu người dùng xác nhận xóa
                    window.location = "deleteFood?fid=" + foodId;
                }
            });
        }

        function updateFood(foodId) {
            window.location = "updateFood?fid=" + foodId;
        }
    </script>
</html>