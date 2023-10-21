<%-- 
    Document   : managerProfile
    Created on : Oct 19, 2023, 1:44:06 PM
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
    <link rel="stylesheet" href="css/managerProfile.css">
    <title>Manager Profile</title>
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
                    <li><a href="#"><i class='bx bxs-user-account'></i>
                            Customer</a></li>
                    <li><a href="#"><i class='bx bxs-user-detail'></i>
                            Employee</a></li>
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
                    My Profile
                </div>

                <div class="user-info">
                    <p>Hey, <b>Reza</b></p>
                    <small class="text-muted">Admin</small>
                </div>
            </div>
            <!-- Add Food Table -->
            <h2>Profile Information</h2>
            <div class="acc-info">
                <div class="left-info">
                    <ul>
                        <li><label>Username: *</label><input type="text" name="name" value></li>
                    </ul>
                </div>
                <div class="right-info">
                    <ul>
                        <li><label>Password: *</label><input type="password" name="password" value="1"></li>
                    </ul>
                    <div class="btn-acc">
                        <div class="btn-update-acc">
                            <button type="submit">
                                Update Account
                            </button>
                        </div>
                        <div class="btn-cancel-acc">
                            <button type="reset">
                                Cancel
                            </button>
                        </div>
                    </div>
                </div>
            </div>

        </main>
        <!-- End of Main Content -->
    </div>
</body>

</html>