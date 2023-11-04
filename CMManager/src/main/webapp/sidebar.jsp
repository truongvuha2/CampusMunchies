<%-- 
    Document   : sidebar
    Created on : Oct 26, 2023, 9:41:45 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            aside {
                width: 250px;
                background-color: #333;
                color: #fff;
                text-align: center;
                position: relative;
            }

            /* Thiết lập cho thanh sidebar */
            .Campus{
                color: #C21010;
                font-size: 2.1875rem;
                font-style: italic;
                font-weight: 800;
                line-height: normal;
                font-family: Arial, sans-serif;
            }

            .Munchines{
                color: #ffffff;
                font-size: 2.1875rem;
                font-style: italic;
                font-weight: 800;
                line-height: normal;
            }

            .sidebar {
                position: fixed;
                width: 250px;
                height: 100%;
                background-color: #000000;
                padding-top: 20px;
            }

            .sidebar .logo-side {
                text-align: center;
                color: #ecf0f1;
                font-size: 24px;
                margin-bottom: 50px;
            }

            .sidebar .side-menu {
                list-style: none;
                padding: 0;
                text-align: left;
                font-family: 'Poppins', sans-serif;
            }
            .sidebar .side-menu .sub-menu{
                list-style: none;
                padding: 0;
                text-align: left;
                font-family: 'Poppins', sans-serif;
            }

            .sidebar .side-menu li {
                margin: 10px 0;
            }


            .sidebar .side-menu a {
                color: #ffffff;
                display: block;
                padding: 10px;
                transition: 0.3s;
                font-size: 18px;
            }
            .sidebar .side-menu .sub-menu{
                color: #ffffff;
                display: block;
                padding: 10px;
                transition: 0.3s;
                font-size: 18px;
                display: none;
            }
            .sidebar li:hover .sub-menu{
                display: block;
            }



            .sidebar .side-menu a:hover {
                background-color: #C21010;
                color: #ecf0f1;
                border-left: 4px solid #C21010;
                padding-left: 6px;
            }
            .sidebar .side-menu a:hover .sub-menu{
                background-color: #C21010;
                color: #ecf0f1;
                border-left: 4px solid #C21010;
                padding-left: 6px;
            }
            a {
                display: inline-block;
                text-decoration: none;
                color: #007bff;
            }
        </style>
    </head>
    <body>
        <aside>
            <div class="sidebar">
                <a href="analytics" class="logo-side">
                    <div class="logo-name">
                        <div class="Campus">Campus</div>
                        <div class="Munchines">Munchies</div>
                    </div>
                </a>
                <ul class="side-menu">
                    <li><a href="analytics"><i class='bx bx-analyse'></i> Analytics</a></li>

                    <li><a href="orderManagement"><i class='bx bx-box'></i> Order</a>

                    </li>
                    <li><a href="listMenu"><i class='bx bx-food-menu'></i> Menu</a>
                        <ul class="sub-menu">
                            <li><a href="listMenu"> List Menu</a></li>
                            <li><a href="addFood"> Add Food</a></li>
                        </ul>
                    </li>
                    

                    <li><a href="employeeManagement"><i class='bx bxs-user-detail'></i> Employee</a>
                        <ul class="sub-menu">
                            <li><a href="employeeManagement"> List Employee</a></li>
                            <li><a href="createAccount"> Create Account</a></li>
                        </ul>
                    </li>
                    
                    <li><a href="customerManagement"><i class='bx bxs-user-account'></i> Customer</a>

                    </li>
                </ul>
                <ul class="side-menu">
                    <li>
                        <a href="login" class="logout">
                            <i class='bx bx-log-out-circle'></i>
                            Logout
                        </a>
                    </li>
                </ul>
            </div>
        </aside>

    </body>
</html>
