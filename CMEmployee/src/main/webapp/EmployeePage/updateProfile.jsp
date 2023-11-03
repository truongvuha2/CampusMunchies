<%-- 
    Document   : updateProfile
    Created on : Oct 20, 2023, 11:37:00 PM
    Author     : MY LAPTOP
--%>

<%@page import="model.Employee"%>
<%@page import="dao.EmployeeDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="/EmployeePage/css/updateProfile.css">
        <style>

        </style>
    </head>
    <body>
        <%
            String phone = (String) session.getAttribute("phone");
            EmployeeDAO empDAO = new EmployeeDAO();
            Employee empInfo = empDAO.searchByPhone(phone);
        %>
        <%@include file="/EmployeePage/header.jsp" %>
        <div class="container-fluid">
            

            <div class="title mx-auto my-5">Employee Information</div>
            <form action="/employee" method="post">
                <div class="customer-info mx-auto p-4">
                    <div class="d-flex">
                        <div class="info-items m-3">Phone</div>
                        <div class="info-value m-3"><input required="" type="text" name="txtPhone" value="<%= empInfo.getPhone()%>" readonly></div>
                    </div>
                    <div class="d-flex">
                        <div class="info-items m-3">Name</div>
                        <div class="info-value m-3"><input required="" type="text" name="txtName" value="<%= empInfo.getName()%>"></div>
                    </div>

                    <div class="d-flex">
                        <div class="info-items m-3">Address</div>
                        <div class="info-value m-3" style="height: 12.5625rem; justify-content: start;">
                            <input type="text" required="" name="txtAddress" value="<%= empInfo.getAddress()%>">
                        </div>
                    </div>
                    <div class="d-flex">
                        <div class="info-items m-3">Birthday</div>
                        <div class="info-value m-3"><input type="date" required="" name="txtBirthday" value="<%= empInfo.getBirthday()%>"></div>
                    </div>
                    <div class="d-flex">
                        <div class="info-items m-3">Create Date</div>
                        <div class="info-value m-3"><input type="date" required="" name="txtCreateDay" value="<%= empInfo.getCreate()%>"></div>
                    </div>
                    <%
                        try {

                            String result = (String) request.getAttribute("result");
                            if (!result.equals("")) {
                    %>
                    <div class="d-flex justify-content-center result p-2 mx-auto"><%=result%></div>
                    <%
                            }
                        } catch (Exception e) {
                        }
                    %>
                </div>

                <div class="btnBack mx-auto my-5 d-flex">
                    <button type="submit" value="Update" name="btnUpdateProfile">Update</button>
                    <a href="/employee/orderList" class="align-items-center d-flex justify-content-center ms-2">Order List</a>
                </div>

            </form>
            
        </div>
                    <%@include file="/EmployeePage/footer.jsp" %>
    </body>
</html>
