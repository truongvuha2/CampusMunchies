<%-- 
    Document   : home.jsp
    Created on : Oct 12, 2023, 11:06:55 AM
    Author     : khang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>

    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            /* Reset some default styles for better visual consistency */
            body,
            html {
                margin: 0;
                padding: 0;
                font-family: Arial, sans-serif;
            }

            /* Style the primary navigation bar */
            .navbar {
                background-color: #333;
                color: #fff;
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 10px 20px;
            }

            /* Style the logo */
            .logo img {
                height: 40px;
                /* Adjust the height as needed */
            }

            /* Style the search box */
            .search-box {
                flex: 1;
                display: flex;
                justify-content: center;
            }

            .search-box input[type="text"] {
                padding: 10px;
                border: none;
                border-radius: 5px;
                width: 50%;
            }

            .search-box button {
                background-color: #ff6600;
                color: #fff;
                border: none;
                border-radius: 5px;
                padding: 10px 20px;
                margin-left: 10px;
                cursor: pointer;
            }

            /* Style the logout button */
            .logout-button a {
                text-decoration: none;
                color: #ff6600;
                padding: 10px 20px;
                border: 2px solid #ff6600;
                border-radius: 5px;
                transition: background-color 0.3s, color 0.3s;
            }

            .logout-button a .hover-text {
                display: none;
            }

            .logout-button a:hover .original-text {
                display: none;
            }

            .logout-button a:hover .hover-text {
                display: inline-block;
            }

            .logout-button a:hover {
                background-color: #ff6600;
                color: #fff;
            }

            /* Style the secondary navigation bar */
            .secondary-navbar {
                background-color: #eee;
                display: flex;
                justify-content: center;
                padding: 10px;
            }

            .secondary-navbar a {
                color: #333;
                padding: 0 20px;
                text-decoration: none;
            }

            .secondary-navbar a:hover {
                background-color: #ddd;
                border-radius: 5px;
            }
        </style>
    </head>

    <body>
        <nav class="navbar">
            <div class="logo">
                <a  href="#">
                    <img style="width: 80px; height:80px" src="../img/logo.png" alt=""/>
                </a>
            </div>
            <div class="search-box">
                <input type="text" placeholder="Search food">
                <button type="submit">Search</button>
            </div>

            <div class="logout-button">
                <a href="/CampusMunchies/customer/logout">
                    <span class="original-text">${phone}</span>
                    <span class="hover-text">Log out</span>
                </a>
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

    </body>

</html>