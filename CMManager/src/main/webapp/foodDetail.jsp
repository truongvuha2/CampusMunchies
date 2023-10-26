<%-- 
    Document   : foodDetail
    Created on : Oct 19, 2023, 1:44:40 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
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
                        Food ID: 123
                    </div>
                </div>
                <div class="user-info">
                    <p>Hey, <b><%= request.getSession().getAttribute("username") %></b></p>
                    <small class="text-muted">Admin</small>
                </div>
            </div>
            <!-- Food Detail -->
            <div class="main-food-details">
                <div class="food-detail">
                    <div class="food-img">
                        <img src="https://i.ibb.co/Nm3BsQt/Hamburger.png" alt="">
                    </div>
                    <div class="food-edit">
                        <p>Hamburger</p>
                        <p>Price: 23$</p>
                        <button type="button">Update</button>
                        <button type="button">Delete</button>
                    </div>
                </div>
                <div class="food-info-detail">
                    <h2>Food Information</h2>
                    <p>Food ID: 123</p>
                    <p>Food Name: Hamburger</p>
                    <p>Price: 23$</p>
                    <p>Desciption: Food is so good</p>
                    <p>Status: Availabel</p>
                    <p>Total Order: 89</p>
                    <p>Date Modify: 7-7-2023</p>
                </div>
            </div>
            <div class="btn-add-product">
                <button type="submit">
                    Add Product
                </button>
            </div>
            <!-- End Food Detail -->
            <!-- List Menu -->

            <ul class="list-menu">
                <li>
                    <a href="#">
                        <img src="https://i.ibb.co/Nm3BsQt/Hamburger.png" alt="">
                        <span>
                            <div class="name-food">
                                <p>Hamburger</p>
                    </a>
    </div>
    <div class="food-info">
        <p>Price: 23$</p>
        <p>Total Order: 123</p>
    </div>
    <div class="food-btn">
        <button type="submit">Update</button>
        <button type="submit">Delete</button>
    </div>
    </span>
    </li>
    <li>
        <a href="#">
            <img src="https://i.ibb.co/Nm3BsQt/Hamburger.png" alt="">
            <span>
                <div class="name-food">
                    <p>Hamburger</p>
        </a>
        </div>
        <div class="food-info">
            <p>Price: 23$</p>
            <p>Total Order: 123</p>
        </div>
        <div class="food-btn">
            <button type="submit">Update</button>
            <button type="submit">Delete</button>
        </div>
        </span>
    </li>
    <li>
        <a href="#">
            <img src="https://i.ibb.co/Nm3BsQt/Hamburger.png" alt="">
            <span>
                <div class="name-food">
                    <p>Hamburger</p>
        </a>
        </div>
        <div class="food-info">
            <p>Price: 23$</p>
            <p>Total Order: 123</p>
        </div>
        <div class="food-btn">
            <button type="submit">Update</button>
            <button type="submit">Delete</button>
        </div>
        </span>
    </li>
    <li>
        <a href="#">
            <img src="https://i.ibb.co/Nm3BsQt/Hamburger.png" alt="">
            <span>
                <div class="name-food">
                    <p>Hamburger</p>
        </a>
        </div>
        <div class="food-info">
            <p>Price: 23$</p>
            <p>Total Order: 123</p>
        </div>
        <div class="food-btn">
            <button type="submit">Update</button>
            <button type="submit">Delete</button>
        </div>
        </span>
    </li>
    </ul>

    <!-- End List Menu -->
    </main>
    <!-- End of Main Content -->



    </div>
</body>

</html>