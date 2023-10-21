<%-- 
    Document   : listMenu
    Created on : Oct 19, 2023, 1:44:52 PM
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    <link rel="stylesheet" href="css/listMenu.css">
    <title>Menu</title>
</head>

<body>

    <div class="container-i">
        <!-- Sidebar -->
        <aside>
            <div class="sidebar">
                <a href="#" class="logo-side">
                    <div class="logo-name">
                        <div class="Campus">Campus</div>
                        <div class="Munchines">Munchines</div>
                    </div>
                </a>
                <ul class="side-menu">
                    <li><a href="#"><i class='bx bx-analyse'></i> Analytics</a></li>
                    <li><a href="#"><i class='bx bx-box'></i> Order</a></li>
                    <li><a href="#"><i class='bx bx-food-menu'></i> Menu</a></li>
                    <li><a href="#"><i class='bx bxs-user-account'></i> Customer</a></li>
                    <li><a href="#"><i class='bx bxs-user-detail'></i> Employee</a></li>
                </ul>
                <ul class="side-menu">
                    <li>
                        <a href="#" class="logout">
                            <i class='bx bx-log-out-circle'></i>
                            Logout
                        </a>
                    </li>
                </ul>
            </div>
        </aside>
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
                    <p>Hey, <b>Reza</b></p>
                    <small class="text-muted">Admin</small>
                </div>
            </div>
            <!-- Best Seller -->
            <h2>Best Seller</h2>
            <div class="list-menu row">
                <div class="best-seller col-md-3">
                    <a href="#">
                        <img src="https://i.ibb.co/Nm3BsQt/Hamburger.png" alt="">
                        <div class="name-food">
                            <p>Hamburger</p>
                        </div>
                    </a>
                    <div class="food-info">
                        <p>Price: 23$</p>
                        <p>Total Order: 123</p>
                    </div>
                    <div class="food-btn">
                        <button type="submit">Update</button>
                        <button type="submit">Delete</button>
                    </div>
                </div>
                <div class="best-seller col-md-3">
                    <a href="#">
                        <img src="https://i.ibb.co/Nm3BsQt/Hamburger.png" alt="">
                        <div class="name-food">
                            <p>Hamburger</p>
                        </div>
                    </a>
                    <div class="food-info">
                        <p>Price: 23$</p>
                        <p>Total Order: 123</p>
                    </div>
                    <div class="food-btn">
                        <button type="submit">Update</button>
                        <button type="submit">Delete</button>
                    </div>
                </div>
                <div class="best-seller col-md-3">
                    <a href="#">
                        <img src="https://i.ibb.co/Nm3BsQt/Hamburger.png" alt="">
                        <div class="name-food">
                            <p>Hamburger</p>
                        </div>
                    </a>
                    <div class="food-info">
                        <p>Price: 23$</p>
                        <p>Total Order: 123</p>
                    </div>
                    <div class="food-btn">
                        <button type="submit">Update</button>
                        <button type="submit">Delete</button>
                    </div>
                </div>
                <div class="best-seller col-md-3">
                    <a href="#">
                        <img src="https://i.ibb.co/Nm3BsQt/Hamburger.png" alt="">
                        <div class="name-food">
                            <p>Hamburger</p>
                        </div>
                    </a>
                    <div class="food-info">
                        <p>Price: 23$</p>
                        <p>Total Order: 123</p>
                    </div>
                    <div class="food-btn">
                        <button type="submit">Update</button>
                        <button type="submit">Delete</button>
                    </div>
                </div>
                <div class="best-seller col-md-3">
                    <a href="#">
                        <img src="https://i.ibb.co/Nm3BsQt/Hamburger.png" alt="">
                        <div class="name-food">
                            <p>Hamburger</p>
                        </div>
                    </a>
                    <div class="food-info">
                        <p>Price: 23$</p>
                        <p>Total Order: 123</p>
                    </div>
                    <div class="food-btn">
                        <button type="submit">Update</button>
                        <button type="submit">Delete</button>
                    </div>
                </div>
                <div class="best-seller col-md-3">
                    <a href="#">
                        <img src="https://i.ibb.co/Nm3BsQt/Hamburger.png" alt="">
                        <div class="name-food">
                            <p>Hamburger</p>
                        </div>
                    </a>
                    <div class="food-info">
                        <p>Price: 23$</p>
                        <p>Total Order: 123</p>
                    </div>
                    <div class="food-btn">
                        <button type="submit">Update</button>
                        <button type="submit">Delete</button>
                    </div>
                </div>
                <div class="best-seller col-md-3">
                    <a href="#">
                        <img src="https://i.ibb.co/Nm3BsQt/Hamburger.png" alt="">
                        <div class="name-food">
                            <p>Hamburger</p>
                        </div>
                    </a>
                    <div class="food-info">
                        <p>Price: 23$</p>
                        <p>Total Order: 123</p>
                    </div>
                    <div class="food-btn">
                        <button type="submit">Update</button>
                        <button type="submit">Delete</button>
                    </div>
                </div>
                <div class="best-seller col-md-3">
                    <a href="#">
                        <img src="https://i.ibb.co/Nm3BsQt/Hamburger.png" alt="">
                        <div class="name-food">
                            <p>Hamburger</p>
                        </div>
                    </a>
                    <div class="food-info">
                        <p>Price: 23$</p>
                        <p>Total Order: 123</p>
                    </div>
                    <div class="food-btn">
                        <button type="submit">Update</button>
                        <button type="submit">Delete</button>
                    </div>
                </div>
            </div>
            <!-- End Best Seller -->
            <!-- List Food -->
            <h2>List Food</h2>
            <div class="search-main">
                <div class="search-container">
                    <input type="text" class="search-box" id="searchInput" placeholder="Search Name Food...">
                </div>
                <div class="sort-food">
                    <label>Sort: </label>
                    <select class="select-box">
                        <option value="price" selected>Price</option>
                        <option value="name">Name</option>
                        <option value="dateOrder">Date Create</option>
                    </select>
                    <button id="sortButton">Sort <ion-icon name="arrow-down-outline"></ion-icon>
                        <ion-icon name="arrow-up-outline"></ion-icon>
                    </button>
                </div>
            </div>
            <div class="list-menu row" id="foodList">

                <div class="food col-md-3"  data-price="23" data-id="100">
                    <a href="#">
                        <img src="https://i.ibb.co/Nm3BsQt/Hamburger.png" alt="">
                        <div class="name-food">
                            <p>A</p>
                        </div>
                    </a>
                    <div class="food-info">
                        <p>Price: 23$</p>
                        <p>Total Order: 123</p>
                    </div>
                    <div class="food-btn">
                        <button type="submit">Update</button>
                        <button type="submit">Delete</button>
                    </div>
                </div>

                <div class="food col-md-3" data-price="24" data-id="102">
                    <a href="#">
                        <img src="https://i.ibb.co/Nm3BsQt/Hamburger.png" alt="">
                        <div class="name-food">
                            <p>Banh Canh</p>
                        </div>
                    </a>
                    <div class="food-info">
                        <p>Price: 24$</p>
                        <p>Total Order: 123</p>
                    </div>
                    <div class="food-btn">
                        <button type="submit">Update</button>
                        <button type="submit">Delete</button>
                    </div>
                </div>
                <div class="food col-md-3" data-price="25" data-id="101">
                    <a href="#">
                        <img src="https://i.ibb.co/Nm3BsQt/Hamburger.png" alt="">
                        <div class="name-food">
                            <p>C</p>
                        </div>
                    </a>
                    <div class="food-info">
                        <p>Price: 25$</p>
                        <p>Total Order: 123</p>
                    </div>
                    <div class="food-btn">
                        <button type="submit">Update</button>
                        <button type="submit">Delete</button>
                    </div>
                </div>
                <div class="food col-md-3" data-price="26" data-id="104">
                    <a href="#">
                        <img src="https://i.ibb.co/Nm3BsQt/Hamburger.png" alt="">
                        <div class="name-food">
                            <p>Xoi</p>
                        </div>
                    </a>
                    <div class="food-info">
                        <p>Price: 26$</p>
                        <p>Total Order: 123</p>
                    </div>
                    <div class="food-btn">
                        <button type="submit">Update</button>
                        <button type="submit">Delete</button>
                    </div>
                </div>
                <div class="food col-md-3" data-price="27" data-id="103">
                    <a href="#">
                        <img src="https://i.ibb.co/Nm3BsQt/Hamburger.png" alt="">
                        <div class="name-food">
                            <p>Banh Mi</p>
                        </div>
                    </a>
                    <div class="food-info">
                        <p>Price: 27$</p>
                        <p>Total Order: 123</p>
                        <div class="id" style="display: none;">
                            <p>100</p>
                        </div>
                    </div>
                    <div class="food-btn">
                        <button type="submit">Update</button>
                        <button type="submit">Delete</button>
                    </div>
                </div>
                <div class="food col-md-3" data-price="28"  data-id="105">
                    <a href="#">
                        <img src="https://i.ibb.co/Nm3BsQt/Hamburger.png" alt="">
                        <div class="name-food">
                            <p>Coca</p>
                        </div>
                    </a>
                    <div class="food-info">
                        <p>Price: 28$</p>
                        <p>Total Order: 123</p>
                        <div class="id" style="display: none;">
                            <p>100</p>
                        </div>
                    </div>
                    <div class="food-btn">
                        <button type="submit">Update</button>
                        <button type="submit">Delete</button>
                    </div>
                </div>
                <div class="food col-md-3" data-price="29" data-id="106">
                    <a href="#">
                        <img src="https://i.ibb.co/Nm3BsQt/Hamburger.png" alt="">
                        <div class="name-food">
                            <p>Bit Tet</p>
                        </div>
                    </a>
                    <div class="food-info">
                        <p>Price: 29$</p>
                        <p>Total Order: 123</p>
                        <div class="id" style="display: none;">
                            <p>100</p>
                        </div>
                    </div>
                    <div class="food-btn">
                        <button type="submit">Update</button>
                        <button type="submit">Delete</button>
                    </div>
                </div>
                <div class="food col-md-3" data-price="30" data-id="107">
                    <a href="#">
                        <img src="https://i.ibb.co/Nm3BsQt/Hamburger.png" alt="">
                        <div class="name-food">
                            <p>Banh Bo</p>
                        </div>
                    </a>
                    <div class="food-info">
                        <p>Price: 30$</p>
                        <p>Total Order: 123</p>
                        <div class="id" style="display: none;">
                            <p>100</p>
                        </div>
                    </div>
                    <div class="food-btn">
                        <button type="submit">Update</button>
                        <button type="submit">Delete</button>
                    </div>
                </div>
            </div>
            <div class="not-found" style="display: none;">
                <p>Not found !</p>
            </div>
            <!-- End List Food -->
        </main>
    </div>
    <!-- End of Main Content -->
</body>
<script src="javascript/listMenu.js" type="text/javascript"></script>

</html>