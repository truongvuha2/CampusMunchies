<%-- 
    Document   : history
    Created on : Oct 24, 2023, 9:20:35 AM
    Author     : khang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

    <head>
        <meta charset="UTF-8">
        <title>Shopping Cart</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>

    <body>
        <%@include file = "header.jsp" %>

        <div style="margin-top:100px" class="shopping-cart" id="shoppingCart">
            <div class="px-4 px-lg-0">
                <div class="pb-5">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">
                                <!-- Shopping cart table -->
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="p-2 px-3 text-uppercase">ID</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Status</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Order Date</div>
                                                </th>

                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Total Payment</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Show Detail</div>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody id="body">
                                            <c:forEach  var="order" items="${requestScope.orders}">
                                                <tr>
                                                    <th scope="row" class="align-middle">
                                                        <div>
                                                            <div class="ml-2 d-inline-block align-top">
                                                                <h5>${order.getId()}</h5>
                                                            </div>
                                                        </div>
                                                    </th>
                                                    <td class="align-middle">
                                                        <div class="ml-2 d-inline-block align-top">
                                                            <h5>${order.getStatus()}</h5>
                                                        </div>
                                                    </td>
                                                    <td class="align-middle">
                                                        <div class="ml-0 d-inline-block align-top">
                                                            <h5>${order.getOrderDate()}</h5>
                                                        </div>
                                                    </td>

                                                    <td class="align-middle">
                                                        <div class="ml-4 d-inline-block align-top">
                                                            <h5>$ ${order.getTotal()}</h5>
                                                        </div>
                                                    </td>
                                                    <td class="mt-0">
                                                        <div class="container">
                                                            <button class="col-md-5 btn btn-primary" onclick= "viewOrder('${order.getId()}')"     class="btn btn-outline-secondary"
                                                                    >Show</button>
                                                            <c:choose>
                                                                <c:when test="${order.getStatus() eq 'Waiting'}">
                                                                    <button class="col-md-6 btn btn-primary" onclick= "deleteOrder('${order.getId()}')" class="btn btn-outline-secondary"
                                                                            >Cancel Order</button>
                                                                </c:when>
                                                            </c:choose>  
                                                        </div>

                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- End -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%@include file = "footer.jsp" %>
            <script src="https://code.jquery.com/jquery-3.2.1.min.js"
                    integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
                    integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
                    integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

            <script>
                                                                        function deleteOrder(id) {
                                                                            $.ajax({
                                                                                url: "/CampusMunchies/customer/cancelOrder",
                                                                                type: "get",
                                                                                data: {
                                                                                    id: id
                                                                                },
                                                                                success: function (data) {
                                                                                    location.reload();

                                                                                },
                                                                                error: function (xhr) {
                                                                                    Swal.fire({
                                                                                        icon: 'error',
                                                                                        text: 'Current Password is not correct'
                                                                                    });
                                                                                }
                                                                            });
                                                                        }
                                                                        function viewOrder(id){
                                                                            window.location= "/CampusMunchies/customer/historyDetail?id="+id
                                                                        }

                                                                        window.addEventListener('load', function () {
                                                                            // Gọi hàm updateHistory() sau khi trang đã tải hoàn toàn.
                                                                            checkForChanges();
                                                                        });
                                                                        function checkForChanges() {
                                                                            $.ajax({
                                                                                url: '/CampusMunchies/customer/updateHistory',
                                                                                type: 'GET',
                                                                               
                                                                                success: function (data) {
                                                                                    // Xử lý dữ liệu trả về từ API endpoint

                                                                                    // Cập nhật trang "history.jsp" nếu có thay đổi
                                                                                    document.getElementById("body").innerHTML = data;

                                                                                },
                                                                                complete: function () {
                                                                                    // Thiết lập một khoảng thời gian cho việc kiểm tra lại (đặt thời gian tùy ý)
                                                                                    setTimeout(checkForChanges, 5000); // Ví dụ: kiểm tra lại sau mỗi 5 giây
                                                                                }
                                                                            });
                                                                        }
//                                                                        function updateHistory(){
//                                                                            $.ajax({
//                                                                                url: "/CampusMunchies/customer/updateHistory",
//                                                                                type: "get",
//                                                                                data: {
//                                             
//                                                                                },
//                                                                                success: function (data) {
//                                                                                    var row = document.getElementById("body");
//                                                                                    row.innerHTML=data;
//                                                                                },
//                                                                                error: function (xhr) {
//                                                                                    
//                                                                                }
//                                                                            }); 
//                                                                            setInterval(updateHistory, 5000);
//                                                                        }
            </script>
    </body>

</html>