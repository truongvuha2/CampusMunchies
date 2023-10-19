<%-- 
    Document   : orderList
    Created on : Oct 18, 2023, 10:53:57 PM
    Author     : MY LAPTOP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="dao.OrderDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Campus Munchies</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="/EmployeePage/css/orderList.css"/>

    </head>
    <body>
        <%  %>
        <%@include file="/EmployeePage/header.jsp" %>
        <div class="container-fluid">
            <div class="d-flex justify-content-center">
                <div class="d-flex justify-content-center px-2 py-1 title my-3">Order List</div>
            </div>

            <div class="d-flex justify-content-end mb-2 mt-4">
                <div>
                    <label for="">From: </label><input type="date">
                    <label for="">To: </label><input type="date">
                </div>
                <a class="mx-2" href="" style="text-decoration: none;">
                    <!--<div class="search p-0 d-flex justify-content-center align-items-center">-->
                    <i class="fa-solid fa-magnifying-glass nav_acc_glass"></i>
                    <!--</div>-->
                </a>

            </div>



            <table class="table table-bordered" style="color: white">
                <thead>
                    <tr align="center">
                        <th scope="col">Order ID</th>
                        <th scope="col">Status</th>
                        <th scope="col">Order Date</th>
                        <th scope="col">Name</th>
                        <th scope="col">Phone</th>
                        <th scope="col">Type</th>
                        <th scope="col">Total</th>
                        <th scope="col">Detail</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        OrderDAO ordDAO = new OrderDAO();
                        String phone = request.getSession().getAttribute("phone")+"";
                        ResultSet rs = ordDAO.getOrderByPhone(phone);
//                        ResultSet rs =  ordDAO.getAll();
                        while (rs.next()) {


                    %>
                    <tr  align="center">
                        <td><%= rs.getString("ord_id")%></td>
                        <td>
                            <%
                                String status = rs.getString("ord_status");
                                if (status.equals("Preparing")) {
                            %>
                            <div class="btn btn-warning"><%= rs.getString("ord_status")%></div>
                            <%
                            } else if (status.equals("Completed")) {
                            %>
                            <div class="btn btn-success"><%= rs.getString("ord_status")%></div>
                            <%
                            } else {
                            %>
                            <div class="btn btn-danger"><%= rs.getString("ord_status")%></div>
                            <%
                                }
                            %>
                            
                        </td>
                        <td><%= rs.getString("ord_date")%></td>
                        <td><%= rs.getString("cus_name")%></td>
                        <td><%= rs.getString("cus_phone")%></td>
                        <td><%= rs.getString("ord_type")%></td>
                        <td><%= rs.getString("ord_total")%></td>
                        <td>View</td>
                    </tr>   
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
        <%@include file="/EmployeePage/footer.jsp" %>
    </body>
</html>
