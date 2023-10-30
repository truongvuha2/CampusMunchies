<%-- 
    Document   : aboutUs
    Created on : Oct 26, 2023, 10:18:31 AM
    Author     : khang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Permanent+Marker&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
            rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>About Us</title>
        <style>
            *{
                padding: 0;
                margin: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }
            section{
                padding-top: 100px;
            }
            body{
                overflow-x: hidden;
            }
            .main-width{
                width: 1400px;
                max-width: 95%;
                margin: 0 auto;
            }
            .hero{
                height: 100%;
                width: 100%;
                min-height: 100vh;
                background: radial-gradient(#f9d349, 20%, #d57e12);
                position: relative;
            }
            .hero header .logo h2 a{
                display: block;
                font-size: 32px;
                font-weight: 600;
                text-decoration: none;
                color: white
            }
            .hero header{
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 40px 0 30px;
            }
            /*            nav ul li{
                            list-style: none;
                            display: inline-block;
                        }
                        nav ul li a{
                            text-decoration: none;
                            color: white;
                            margin-left: 60px;
                            font-size: 15px;
                            font-weight: 600;
                            border-bottom: 2px solid transparent;
                            transition: .4s;
                            -webkit-transition: .4s;
                            -moz-transition: .4s;
                            -ms-transition: .4s;
                            -o-transition: .4s;
                        }
                        nav ul li:not(:last-child) a:hover,
                        nav ul li:not(:last-child) a:focus{
                            border-bottom: 2px solid white;
                        }
                        nav ul li.active a{
                            border-bottom: 2px solid white;
                        }
                        nav ul li.btn a{
                            background: transparent;
                            color: white;
                            border: 1px solid #f5dca8;
                            padding: 9px 20px;
                            border-radius: 30px;
                            -webkit-border-radius: 30px;
                            -moz-border-radius: 30px;
                            -ms-border-radius: 30px;
                            -o-border-radius: 30px;
                            line-height: 1.4;
                            font-size: 14px;
                            font-weight: 500;
                            margin-left: 150px;
                        }
                        nav ul li.btn:hover a{
                            border: 1px solid white;
                            color: black;
                            background: white;
                            transition: .4s;
                            -webkit-transition: .4s;
                            -moz-transition: .4s;
                            -ms-transition: .4s;
                            -o-transition: .4s;
                        }*/
            .content{
                padding-top: 14px;
            }
            .content .main-text{
                position: relative;
                z-index: 2;
                margin-bottom: 50px;
            }
            .content .main-text h6{
                font-size: 14px;
                font-weight: 400;
                color: white;
                margin-bottom: 40px;
            }
            .content .main-text h1{
                font-size: 100px;
                line-height: 1;
                color: white;
                margin: 0px 0px 45px;
                font-family: 'Permanent Marker', cursive;
            }
            .content .main-text h3{
                font-size: 18px;
                font-weight: 600;
                color: white;
            }
            .content .main-text p{
                max-width: 100%;
                width: 480px;
                color: white;
                line-height: 1.8;
                font-size: 15px;
                margin-bottom: 50px;
            }
            .content .main-text a{
                display: inline-block;
                text-decoration: none;
                color: black;
                background: white;
                border: 1px solid white;
                padding: 9px 25px;
                line-height: 1.4;
                border-radius: 30px;
                -webkit-border-radius: 30px;
                -moz-border-radius: 30px;
                -ms-border-radius: 30px;
                -o-border-radius: 30px;
                font-size: 14px;
                font-weight: 500;
            }
            .content .main-text a:hover{
                transform: scale(1.2) ;
                -webkit-transform: scale(1.2) ;
                -moz-transform: scale(1.2) ;
                -ms-transform: scale(1.2) ;
                -o-transform: scale(1.2) ;
                border: 1px solid #f5dca8;
                background: transparent;
                color: white;
                transition: .4s;
                -webkit-transition: .4s;
                -moz-transition: .4s;
                -ms-transition: .4s;
                -o-transition: .4s;
            }
            .content .main-text a.cta{
                border: 1px solid #f5dca8;
                color: white;
                background: transparent;
            }
            .content .main-text a.cta i{
                margin-right: 12px;
            }
            .content .main-text a.cta:hover{
                color: black;
                background: white;
                border: 1px solid white;
                transition: .4s;
                -webkit-transition: .4s;
                -moz-transition: .4s;
                -ms-transition: .4s;
                -o-transition: .4s;
            }
            .image{
                position: absolute;
                width: 100%;
                height: 85%;
                bottom: 0;
                right: 0;
                text-align: right;
            }
            .image img{
                height: 100%;
            }
            .logo img{
                width: 200px;
            }
        </style>
    </head>

    <body>
        <%@include file="header.jsp"%>
        <section class="hero">
            <div class="main-width">


                <div class="content">
                    <div class="main-text">
                        <h3>Fast Food</h3>
                        <h1>Campus Munchies</h1>
                        <h3>Campus Munchies - Where Flavorful Delights are at Your Fingertips!</h3>
                        <p></p>
                        <p>Welcome to Campus Munchies, the place where you can explore a diverse world of delicious and convenient food right at your school or workplace. We are a team of food enthusiasts who understand that finding a satisfying meal in a busy life isn't always easy. That's why we've created Campus Munchies to cater to your culinary needs.</p>
                        <p>With Campus Munchies, you have the opportunity to experience a variety of delectable dishes from some of the most popular local restaurants in your area, all without leaving your workplace or school. We've established partnerships with numerous local eateries to ensure that you always have plenty of exciting choices to satisfy your taste buds.</p>
                        <p>Order online through our user-friendly website or mobile app, and we'll deliver fresh and delicious food right to your doorstep or workplace. No need to worry about missing an important meal or standing in long queues at food counters. Campus Munchies guarantees convenience and time-saving.</p>
                        <p>Furthermore, we continuously listen to customer feedback and strive to improve our services. Our goal is to provide you with the best online ordering experience, with a professional support team ready to assist you at any time.</p>
                        <p>Join Campus Munchies to explore the world of culinary delights at your fingertips. We're delighted to serve you and ensure that every meal you enjoy is a flavorful and convenient journey.</p>

                        <a href="#" class="cta"><i class="fa-solid fa-cart-shopping"></i>Order food</a>
                    </div>

                    <div class="image">
                        <img src="https://i.ibb.co/XzFbT71/a.png" alt="logo">
                    </div>
                </div>
            </div>
        </section>
    </body>

</html>
