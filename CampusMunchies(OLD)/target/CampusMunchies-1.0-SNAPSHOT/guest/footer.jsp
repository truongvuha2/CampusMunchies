<%-- 
    Document   : footer
    Created on : Oct 16, 2023, 7:44:53 AM
    Author     : khang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .footer {
                margin-top: 30px;
                background-color: #333;
                color: #fff;
                padding: 20px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                font-size: 14px;

            }

            /* Style cho phần footer bên trái (left-footer) */
            .left-footer {
                display: flex;
                align-items: center;
            }

            .left-footer .social-icon {
                font-size: 20px;
                margin-right: 10px;
                color: #fff;
            }

            /* Style cho phần footer bên phải (right-footer) */
            .right-footer {
                display: flex;
                align-items: center;
            }

            .right-footer .contact-info p {
                margin: 10px;
            }

            .right-footer .additional-info p {
                margin: 10px;
            }

        </style>
    </head>
    <body>
        <div class="footer">
            <div class="left-footer">
                <a href="#" class="social-icon"><i class="fab fa-facebook"></i></a>
                <a href="#" class="social-icon"><i class="fab fa-instagram"></i></a>
                <!-- Thêm các biểu tượng mạng xã hội khác tại đây -->
            </div>
            <div class="right-footer">
                <div class="contact-info">
                    <p>Contact Us: contact@example.com</p>
                    <p>Phone: (123) 456-7890</p>
                </div>
                <div class="additional-info">
                    <p>Address: 123 Street, City</p>
                    <p>&copy; 2023 Your Website Name. All rights reserved.</p>
                </div>
            </div>
        </div>
    </body>
</html>
