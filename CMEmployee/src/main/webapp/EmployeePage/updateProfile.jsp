<%-- 
    Document   : updateProfile
    Created on : Oct 20, 2023, 11:37:00 PM
    Author     : MY LAPTOP
--%>

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
</head>
<body>
  <div class="container-fluid">
    <div class="title mx-auto my-5">Employee Information</div>
    <div class="customer-info mx-auto p-4">
      <div class="d-flex">
        <div class="info-items m-3">Name</div>
        <div class="info-value m-3">Nguyen Khanh</div>
      </div>
      <div class="d-flex">
        <div class="info-items m-3">Phone</div>
        <div class="info-value m-3">0986321547</div>
      </div>
      <div class="d-flex">
        <div class="info-items m-3">Address</div>
        <div class="info-value m-3" style="height: 12.5625rem; justify-content: start;">
          Nguyen Van Cu, Ninh Kieu, Can Tho
        </div>
      </div>
      <div class="d-flex">
        <div class="info-items m-3">Birthday</div>
        <div class="info-value m-3">09/08/2003</div>
      </div>
      <div class="d-flex">
        <div class="info-items m-3">Create Date</div>
        <div class="info-value m-3">07/07/2023</div>
      </div>
    </div>

    <div class="btnBack mx-auto my-5">
      <button>Update</button>
    </div>
  </div>
</body>
</html>
