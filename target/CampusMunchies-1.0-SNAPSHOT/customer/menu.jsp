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
            .food{
                padding: 0 10%;
            }
            .food-row {
                display: flex;
                justify-content: space-between;
                margin-top: 20px;
            }

            /* Style cho mỗi món ăn trong hàng */
            .food-item {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: center;
                width: 23%; /* Để mỗi món ăn chiếm khoảng 23% của khung chứa */
                margin-right: 1%;
                position: relative;
            }

            .food-item:last-child {
                margin-right: 0;
            }

            .food-item .cart-icon {
                position: absolute;
                top: 10px;
                right: 10px;
                font-size: 20px;
                color: #ff6600;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp"%>


        <div class="food">
            <div class="best-seller">
                <h2>Menu</h2>
                <c:forEach var="food" items="${requestScope.foods}" varStatus="status">
                    <c:if test="${status.index % 4 == 0}">
                        <div class="food-row">
                        </c:if>
                        <div class="food-item">
                            <img sr="${food.getImg()}">
                            <h3>${food.getName()}</h3>
                            <p> <c:choose>
                                    <c:when test="${food.getSale() == 0 }">
                                        <c:out value="$${food.getPrice()}"></c:out>
                                    </c:when>
                                    <c:otherwise>
                                        $<fmt:formatNumber value="${food.getRealPrice()}" type="number" maxFractionDigits="2" minFractionDigits="2"/>
                                        <del>$${food.getPrice()}</del>
                                    </c:otherwise>
                                </c:choose></p>
                            <i class="fas fa-shopping-cart cart-icon"></i>
                        </div>
                        <c:if test="${status.index % 4 == 3 or status.index == fn:length(requestScope.foods) - 1}">
                        </div>
                    </c:if>
                </c:forEach>

            </div>
        </div>
    </div>
    <%@include file="footer.jsp"%>
</body>
</html>
