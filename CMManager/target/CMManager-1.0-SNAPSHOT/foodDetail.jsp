<%-- 
    Document   : foodDetail
    Created on : Oct 19, 2023, 1:44:40 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link rel="stylesheet" href="css/foodDetail.css">
        <title>Food Detail</title>
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
                        Food Details
                        <div class="food-id">
                            Food ID: ${infoFood.id}
                        </div>
                    </div>
                    <div class="user-info">
                        <p>Hey, <b><%= request.getSession().getAttribute("username")%></b></p>

                        <small class="text-muted">Admin</small>
                    </div>
                </div>
                <!-- Food Detail -->
                <div class="main-food-details">
                    <div class="food-detail">
                        <div class="food-img">
                            <img src="${infoFood.img}" alt="">
                        </div>
                        <div class="food-edit">
                            <p>${infoFood.name}</p>
                            <p><span class="bold-numbers">Sale Price: </span> ${infoFood.getRealPrice()}$</p>
                            <button type="submit" onclick="updateFood('${infoFood.id}')">Update</button>
                            <button type="submit" onclick="confirmDeleteFood('${infoFood.id}')">
                                Delete
                            </button>
                        </div>
                    </div>
                    <div class="food-info-detail">
                        <h2>Food Information</h2>
                        <hr>
                        <p><span class="bold-numbers">Food ID:</span> ${infoFood.id}</p>
                        <p><span class="bold-numbers">Food Name:</span> ${infoFood.name}</p>
                        <p><span class="bold-numbers">Category Name:</span> ${infoFood.caterogyName}</p>
                        <p><span class="bold-numbers">Historical Cost: </span> ${infoFood.price}$</p>
                        <p><span class="bold-numbers">Sale:</span> ${infoFood.sale}%</p>
                        <p><span class="bold-numbers">Description:</span> ${infoFood.description}</p>
                        <p><span class="bold-numbers">Status:</span> ${infoFood.status}</p>
                        <p><span class="bold-numbers">Total Order:</span> ${infoFood.numOrder}</p>
                    </div>
                </div>

                <div class="btn-add-product">
                    <button type="submit" onclick="addFood()">
                        Add Food
                    </button>
                </div>
                <!-- End Food Detail -->
                <!-- List Menu -->

                <div class="list-menu row">
                    <c:forEach var="s" items="${requestScope.suggestList}">
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

                <!-- End List Menu -->
            </main>
            <!-- End of Main Content -->



        </div>
    </body>
    <script>
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
        function addFood() {
            window.location = "addFood";
        }
    </script>
</html>