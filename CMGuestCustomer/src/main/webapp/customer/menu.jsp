<%-- 
    Document   : menu
    Created on : Oct 17, 2023, 8:23:09 AM
    Author     : khang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>

            *{
                margin: 0;
                padding:0;
            }
            .food-item {
                height: 300px;
                text-align: center;
                margin-bottom: 15px;
            }

            .food-border {
                border: 2px #b4b4b4 solid;
                border-radius: 5px;
                padding: 5px;
                height:100%
            }

            .food-image {
                width: 100%;
            }

            .food-image img {
                width: 100%;
            }

            .name {
                font-weight: bold;
            }

            .food-button button {
                width: 50px;
                border-radius: 5px;
                border: none
            }

            .cart {
                background-color: rgb(254, 124, 17);
                margin-bottom: 3px
            }

            .detail {
                background-color: rgb(70, 70, 255);
            }
            button:hover{
                border: 2px #000 solid
            }
            @media screen and (max-width:576px) {
                .food-border{
                    display: flex;
                    text-align: left;
                    align-items: center;

                }
                .food-item{
                    height:200px
                }/*
                
                .food-image img{
                    height:100%
                }*/
            }

            @media screen and (min-width:1200px) {

                .food-item{
                    height:350px
                }/*
                
                .food-image img{
                    height:100%
                }*/
            }



            .search-box {
                margin-top: 100px;
                text-align: center;
                margin-bottom: 20px
            }


            .search-box input[type="text"] {
                padding: 10px;
                border: none;
                border-radius: 5px;
                width: 50%;
                border: #BDBBBB 2px solid;
            }

            #popup {
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: #fff;
                padding: 20px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
                display: none;
                animation: fadeOut 3s forwards;
            }

            @keyframes fadeOut {
                0% {
                    opacity: 1;
                }
                100% {
                    opacity: 0;
                }
            }

            .hidden {
                display: none;
            }


        </style>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
    </head>
    <body>
        <%@include file="header.jsp"%>

        <div class ="container">
            <div class="search-box">
                <input oninput="searchByName(this)" type="text" name = "txt" placeholder="Search food">
            </div>


            
            <div class="container">
                <div class="row" id="content">
                    <c:forEach var="food" items="${requestScope.foods}" >
                        <div class="food-item col-lg-3 col-md-4 col-sm-6 col-12">
                            <div class="food-border">
                                <div class="food-image col-lg-12 col-md-12 col-sm-12 col-4">
                                    <img src="${food.getImg()}" alt="" srcset="">
                                </div>
                                <div class="food-details col-lg-12 col-md-12 col-sm-12 col-8">
                                    <p class="name">${food.getName()}</p>
                                    <p class="price"> <c:choose>
                                            <c:when test="${food.getSale() == 0}">
                                                <c:out value="$${food.getPrice()}"></c:out>
                                            </c:when>
                                            <c:otherwise>
                                                $<fmt:formatNumber value="${food.getRealPrice()}" type="number" maxFractionDigits="2" minFractionDigits="2"/>
                                                <del>$${food.getPrice()}</del>
                                            </c:otherwise>
                                        </c:choose></p>
                                    <div class="food-button">
                                        <c:choose>
                                            <c:when test="${food.getStatus() eq 'Sold Out'}">
                                                <span style ="color:grey">Sold Out</span>
                                            </c:when>
                                            <c:otherwise>
                                                <button class="cart" onclick="addToCart('${food.getId()}')">
                                                    <i class="fas fa-shopping-cart cart-icon"></i>
                                                </button>
                                            </c:otherwise>    
                                        </c:choose>
                                        <button class="detail" onclick="getDetail('${food.getId()}')">
                                            <i class="fas fa-info-circle"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>



        <%@include file="footer.jsp"%>
        <div id="popup" class="hidden">
            <div id="popupContent">
                Add successfully!!!
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script>
                                            function getDetail(id) {
                                                window.location = "foodDetail?id=" + id;
                                            }
                                            function addToCart(id) {
                                                var popup = document.getElementById("popup");
                                                popup.style.display = "block";
                                                setTimeout(function () {
                                                    popup.style.display = "none";
                                                }, 1000);
                                                $.ajax({
                                                    url: "/CampusMunchies/customer/addToCart",
                                                    type: "get",
                                                    data: {
                                                        foodId: id
                                                    },
                                                    success: function (data) {


                                                    },
                                                    error: function (xhr) {
                                                        // Xử lý lỗi ở đây nếu cần
                                                        console.log(error);
                                                    }
                                                });
                                            }
                                            function searchByName(param) {
                                                var txtSearch = param.value;
                                                $.ajax({
                                                    url: "/CampusMunchies/customer/search",
                                                    type: "get",
                                                    data: {
                                                        txt: txtSearch
                                                    },
                                                    success: function (data) {
                                                        // Đảm bảo rằng bạn sử dụng document.getElementById thay vì document.getElementbyID
                                                        var row = document.getElementById("content");

                                                        // Sử dụng innerHTML để cập nhật nội dung của phần tử "content"
                                                        row.innerHTML = data;
                                                    },
                                                    error: function (xhr) {
                                                        // Xử lý lỗi ở đây nếu cần
                                                        console.log(error);
                                                    }
                                                });
                                            }

        </script>

    </body>
</html>
