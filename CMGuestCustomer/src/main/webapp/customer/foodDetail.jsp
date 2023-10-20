<%-- 
    Document   : foodDetail
    Created on : Oct 18, 2023, 10:02:22 PM
    Author     : Alien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <title>Food Details</title>
        <style>
            .food-card {
                background-color: #f2f2f2;
                border: none;
            }

            .food-image {
                max-width: 100%;
                height: auto;
            }
            .container{
                margin-top:100px
            }
            .food-details {
                text-align: left;
                margin-bottom: 100px;
            }

            .detail {
                margin-top: 50px;
            }

            .btn-add,
            .btn-buy {
                padding: 10px 20px;
                border-radius: 5px;
                border: none;
            }

            .btn-sub {
                background-color: #ffffff;
            }

            .btn-plus {
                background-color: #ffffff;
            }

            .btn-add {
                background-color: #b21313;
                color: #fff;
                margin-right: 10px;
            }

            .btn-buy {
                background-color: #ffd600;
                color: #000;
            }

            .quantity {
                border: 1px solid #000;
                padding: 12px;
                border-radius: 5px;
                margin-right: 50px;
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
    </head>

    <body>  
        <%@include file="header.jsp"%>
        <div class="container">
            <div class="food-detail">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card food-card">
                            <img src="${food.getImg()}" alt="Food Image" class="card-img-top food-image">
                        </div>
                    </div>
                    <div class="detail col-md-6">
                        <!-- Thông tin chi tiết sản phẩm -->
                        <h1 class="mt-3">${food.getName()}</h1>
                        <h2 class="text-success">$${food.getPrice()}</h2>
                        <p class="description mt-3 food-details">
                            ${food.getDescription()}
                        </p>
                        <div class="combo-button">
                            <box class="quantity mt-2">
                                <button class="btn btn-sub">-</button>
                                <span class="mx-2" id="quantity">1</span>
                                <button class="btn btn-plus">+</button>
                            </box>
                            <button class="btn-add mt-2" id="cartButton" onclick="addToCart('${food.getId()}')">Add to Cart</button>
                            <button class="btn-buy mt-2">Buy it Now</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp"%>
        <div id="popup" class="hidden">
            <div id="popupContent">
                Add successfully!!!
            </div>
        </div>

    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>



    </script>
    <script>
        const quantityText = document.querySelector(".quantity span");
        const minusButton = document.querySelector(".btn-sub");
        const plusButton = document.querySelector(".btn-plus");

        let quantity = 1;

        minusButton.addEventListener("click", () => {
            if (quantity > 1) {
                quantity--;
                quantityText.textContent = quantity;
            }
        });

        plusButton.addEventListener("click", () => {
            quantity++;
            quantityText.textContent = quantity;
        });

        function addToCart(id) {
            var popup = document.getElementById("popup");
            popup.style.display = "block";
            setTimeout(function () {
                popup.style.display = "none";
            }, 1000);

            var q = document.getElementById("quantity").innerText;
            $.ajax({
                url: "/CampusMunchies/customer/addToCart",
                type: "get",
                data: {
                    foodId: id,
                    quantity: q
                },
                success: function (data) {


                },
                error: function (xhr) {
                    // Xử lý lỗi ở đây nếu cần
                    console.log(error);
                }
            });
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
    crossorigin="anonymous"></script>
</body>

</html>
