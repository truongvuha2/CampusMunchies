<%-- 
    Document   : customerInfo
    Created on : Oct 20, 2023, 10:34:33 PM
    Author     : MY LAPTOP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="dao.CustomerDAO"%>
<%@page import="model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <link rel="stylesheet" href="/EmployeePage/css/customerInfo.css">
</head>

<body>
    <%@include file="/EmployeePage/header.jsp" %>
    <% 
        Customer customerInfo = (Customer)request.getAttribute("customerInfo");
    %>
  <div class="container-fluid">
    <div class="title mx-auto my-5">Customer Information</div>
    <div class="customer-info mx-auto p-4">
      <div class="d-flex">
        <div class="info-items m-3">Name</div>
        <div class="info-value m-3"><%= customerInfo.getName() %></div>
      </div>
      <div class="d-flex">
        <div class="info-items m-3">Phone</div>
        <div class="info-value m-3"><%= customerInfo.getPhone()%></div>
      </div>
      <div class="d-flex">
        <div class="info-items m-3">Address</div>
        <div class="info-value m-3" style="height: 12.5625rem; justify-content: start;">
          <%= customerInfo.getAddress()%>
        </div>
      </div>
      <div class="d-flex">
        <div class="info-items m-3">Birthday</div>
        <div class="info-value m-3"><%= customerInfo.getBirthday()%></div>
      </div>
      <div class="d-flex">
        <div class="info-items m-3">Cancel Count</div>
        <div class="info-value m-3"><%= customerInfo.getCancel_count()%></div>
      </div>
    </div>
      
    <div class="title mx-auto my-5">Orders</div>
    <div class="history-order w-75 mx-auto">
      <table class="table table-bordered" border="1">
        <thead class="table-header">
            
          <tr align="center">
            <th scope="col">Order ID</th>
            <th scope="col">Status</th>
            <th scope="col">Date</th>
          </tr>
        </thead>
        <tbody class="table-body">
            <%
                ResultSet order = (ResultSet) request.getAttribute("order");
                String orderDetailId = request.getAttribute("orderDetailId")+"";
                while(order.next()){
            %>
          <tr  align="center">
              <td><%= order.getString("ord_id") %></td>
            <td>
              <%= order.getString("ord_status") %>
            </td>
            <td><%= order.getString("ord_date") %></td>
          </tr>    
          <%
              }
          %>
        </tbody>
      </table>
    </div>

    <div class="btnBack mx-auto my-5">
        <a href="/orderDetail/<%= orderDetailId %>">
            <button>Back</button>
        </a>
    </div>
  </div>
    <%@include file="/EmployeePage/footer.jsp" %>
</body>

</html>
