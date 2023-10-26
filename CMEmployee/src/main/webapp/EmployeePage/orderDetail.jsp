<%-- 
    Document   : orderDetail
    Created on : Oct 20, 2023, 8:31:42 PM
    Author     : MY LAPTOP
--%>

<%@page import="dao.OrderDetailDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="/EmployeePage/css/orderDetail.css">
    </head>
    <body>
        <%@include file="/EmployeePage/header.jsp" %>
        <div class="container-fluid my-4">
            <div class="title d-flex justify-content-center mb-4">
                <div class="text d-flex align-items-center justify-content-center">Order Detail</div>
            </div>
            <%
                String orderId = request.getAttribute("orderId") + "";
                ResultSet customerInfo = (ResultSet) request.getAttribute("orderInfo");
                int status = 0;
                if (customerInfo.next()) {
                    if (customerInfo.getString("ord_status").equals("Preparing")) {
                        status = 1;
                    } else if (customerInfo.getString("ord_status").equals("Completed")) {
                        status = 2;
                    } else if (customerInfo.getString("ord_status").equals("Cancelled")) {
                        status = 3;
                    }

            %>
            <div class="box1 d-flex justify-content-around mx-auto" style="height: 22.1875rem">
                <form method="post" action="/employee?orderId=<%= orderId %>">
                    <div class="order-status mt-5">
                        <div class="preparing">
                            <input type="radio" value="Preparing" name="status" <%= status == 1 ? "checked" : ""%>>
                            Preparing
                        </div>
                        <div class="completed">
                            <input type="radio" value="Completed" name="status" <%= status == 2 ? "checked" : ""%>>
                            Completed
                        </div>
                        <div class="cancel">
                            <input type="radio" value="Cancelled" name="status" <%= status == 3 ? "checked" : ""%>>
                            Cancelled
                        </div>

                        <div class="btnUpdate mt-3">
                            <button name="btnUpdateStatus" type="submit" value="Update">Update</button>
                        </div>

                    </div>
                </form> 
                <div class="customer-info mt-5">
                    <div class="">

                        <div>Customer: <%= customerInfo.getString("cus_name")%> <a id="more" href="/employee/customerInfo/<%=orderId%>/<%= customerInfo.getString("cus_phone")%>"><i class="fa-solid fa-circle-info"></i></a></div>
                        <div>Address: <%= customerInfo.getString("cus_address")%></div>
                        <div>Phone: <%= customerInfo.getString("cus_phone")%></div>
                        <div>Payment: <%= customerInfo.getString("ord_pay")%></div>
                        <div>Type: <%= customerInfo.getString("ord_type")%></div>
                        <div>Order date: <%= customerInfo.getString("ord_date")%></div>

                        <div>Note: <%= customerInfo.getString("ord_note")%></div>
                        <%
                            }
                        %>
                    </div>
                </div>

            </div>
            <div class="order-detail mx-auto mt-4">
                <table class="table table-bordered custom-table " border="1">
                    <thead>
                        <tr align="center">
                            <th scope="col">Food ID</th>
                            <th scope="col">Food Name</th>
                            <th scope="col">Price</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Sum</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            ResultSet detailList = (ResultSet) request.getAttribute("orderDetailList");
                            //                OrderDetailDAO odd = new OrderDetailDAO();
                            //                ResultSet detailList = odd.getListOrderDetailById("ORD001");
                            double total = 0;
                            while (detailList.next()) {
                        %>
                        <tr  align="center">
                            <td><%=detailList.getString("foo_id")%></td>
                            <td>
                                <%= detailList.getString("foo_name")%>
                            </td>
                            <td><%= detailList.getDouble("foo_price")%></td>
                            <td><%= detailList.getInt("quantity")%></td>
                            <td><%= detailList.getDouble("foo_price") * detailList.getInt("quantity")%></td>
                        </tr>    
                        <%
                                total += detailList.getDouble("foo_price") * detailList.getInt("quantity");
                            }
                        %>
                    </tbody>
                    <tr class="total" align="center">
                        <th colspan="4">Total</th>
                        <th><%=total%></th>
                    </tr>  
                </table>
            </div>
            <div class="btnBack mx-auto">
                <a href="/employee/orderList"><button>Back</button></a>               
            </div>
        </div>
        <%@include file="/EmployeePage/footer.jsp" %>

    </body>
</html>