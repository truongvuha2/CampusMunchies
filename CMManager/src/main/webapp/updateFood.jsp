<%-- 
    Document   : updateFood
    Created on : Oct 19, 2023, 1:45:16 PM
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
    <link rel="stylesheet" href="css/updateFood.css">
    <title>Update Food</title>
</head>

<body>

    <div class="container-i">
        <!-- Sidebar -->
        <%@include file="sidebar.jsp" %>
        <!-- End of Sidebar -->
        <!-- Main Content -->
        <main>
            <div class="header">
                <div class="logo-tittle">
                    <img src="https://drive.google.com/uc?id=1oi7OnKZyo4ooOq0ebaJpejenlpcyOKns"
                        alt="Logo Campus Munchies">
                </div>

                <div class="name-tittle">
                    Update Food
                </div>

                <div class="user-info">
                    <p>Hey, <b><%= request.getSession().getAttribute("username") %></b></p>
                    <small class="text-muted">Admin</small>
                </div>
            </div>
            <!-- Add Food Table -->
            <h2>Enter Food Information</h2>
            <div class="food-info">
                <div class="left-info">
                    <ul>
                        <li><label>Food ID: </label><input type="text" name="food_id" value="124" readonly></li>

                        <li><label>Food Name: </label><input type="text" name="food_name" value></li>
                        <li><label>Price: </label><input type="number" name="price" value><label>$</label></li>
                        <li><label>Sale: </label><input type="number" name="sale" value><label>$</label></li>
                        <li>
                            <label>Select file image: </label>
                            <input type="file" id="fileInput" accept="image/*" value />
                            <label style="color: black; margin-left: 7%;" for="fileInput">Choose File Image</label>

                        </li>
                        <li style="width: 200px;"><img style="width: 200px;height: 200px;" id="imagePreview" src>
                        </li>
                        <div class="upload">
                            <button onclick="uploadImage()">Upload Cloud</button>
                        </div>
                        <li>
                            <p id="status"></p>
                            <p id="directLink"></p>
                        </li>
                    </ul>
                </div>
                <div class="right-info">
                    <ul>
                        <li>
                            <label>Category Food: </label>
                            <select class="select-box">
                                <option value>Desserts</option>
                                <option value>F Food</option>
                                <option value>Sandwich</option>
                            </select>
                            <div class="icon-container">
                                <i class="fa-solid fa-caret-down"></i>
                            </div>
                        </li>
                        <li><label>Description: </label>
                            <textarea cols="30" rows="3"></textarea>
                        </li>
                        <li><label>Status: </label>
                            <select class="select-box">
                                <option value selected>Available</option>
                                <option value>Sold Out</option>
                            </select>
                        </li>
                    </ul>
                    <div class="btn-product">
                        <div class="btn-add-product">
                            <button type="submit">
                                Update Food
                            </button>
                        </div>
                        <div class="btn-cancel-product">
                            <button type="reset">
                                Cancel
                            </button>
                        </div>
                    </div>
                </div>
            </div>

        </main>
        <!-- End of Main Content -->
        <script>
            // Lắng nghe sự kiện khi người dùng chọn file
            const fileInput = document.getElementById('fileInput');
            const imagePreview = document.getElementById('imagePreview');

            fileInput.addEventListener('change', function () {
                const selectedFile = fileInput.files[0];

                if (selectedFile) {
                    // Tạo một đối tượng FileReader để đọc file hình ảnh
                    const reader = new FileReader();

                    reader.onload = function (event) {
                        // Đặt src của thẻ <img> thành URL của hình ảnh đã chọn
                        imagePreview.src = event.target.result;
                    };

                    // Đọc file hình ảnh
                    reader.readAsDataURL(selectedFile);
                }
            });

            function uploadImage() {
                const apiKey = '7792a8dba108037602d51b7ee5c91eb9'; //api key
                const apiUrl = 'https://api.imgbb.com/1/upload';

                const statusText = document.getElementById('status');
                const directLinkText = document.getElementById('directLink');

                statusText.textContent = 'Đang tải lên...';
                directLinkText.textContent = '';  // Xóa liên kết trực tiếp cũ nếu có.

                const imageInput = document.getElementById('fileInput');
                const file = imageInput.files[0];

                if (!file) {
                    statusText.textContent = 'Vui lòng chọn một tệp hình ảnh.';
                    return;
                }

                const formData = new FormData();
                formData.append('image', file);
                formData.append('key', apiKey);

                fetch(apiUrl, {
                    method: 'POST',
                    body: formData
                })
                    .then(response => response.json())
                    .then(data => {
                        if (data.data && data.data.url) {
                            const imageUrl = data.data.url;
                            statusText.textContent = 'Hình ảnh đã được tải lên thành công!';
                            directLinkText.innerHTML = 'Liên kết trực tiếp: <a href="' + imageUrl + '" target="_blank">' + imageUrl + '</a>';
                        } else if (data.error) {
                            statusText.textContent = 'Lỗi: ' + data.error.message;
                        }
                    })
                    .catch(error => {
                        statusText.textContent = 'Lỗi: ' + error.message;
                    });
            }
        </script>

    </div>
</body>


</html>