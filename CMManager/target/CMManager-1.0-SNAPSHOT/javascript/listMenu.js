const searchInput = document.getElementById('searchInput');
const foodItems = document.querySelectorAll('.food');
const notFoundMessage = document.querySelector('.not-found'); // Lấy phần tử thông báo "Not found"

searchInput.addEventListener('input', () => {
    const searchTerm = searchInput.value.toLowerCase();

    foodItems.forEach((foodItem) => {
        const nameFood = foodItem.querySelector('.name-food p').textContent.toLowerCase();
        if (nameFood.includes(searchTerm)) {
            foodItem.style.display = ''; // Hiển thị món ăn nếu tên thức ăn khớp
        } else {
            foodItem.style.display = 'none'; // Ẩn món ăn nếu tên thức ăn không khớp
        }
    });

    // Kiểm tra xem có kết quả nào được tìm thấy hay không và hiển thị thông báo "Not found" nếu cần
    const resultsFound = [...foodItems].some((foodItem) => {
        return foodItem.style.display !== 'none';
    });

    if (resultsFound) {
        notFoundMessage.style.display = 'none'; // Ẩn thông báo "Not found"
    } else {
        notFoundMessage.style.display = ''; // Hiển thị thông báo "Not found"
    }
});

//sort price
// Lấy các phần tử DOM
const sortButton = document.getElementById("sortButton");
const selectBox = document.querySelector(".select-box");
const foodList = document.getElementById("foodList");
let ascendingSort = true;

// Hàm sắp xếp dựa trên data-price
const sortFoodItems = () => {
    const foodItems = Array.from(foodList.getElementsByClassName("food"));

    foodItems.sort((a, b) => {
        const priceA = parseFloat(a.getAttribute("data-price"));
        const priceB = parseFloat(b.getAttribute("data-price"));

        if (ascendingSort) {
            return priceA - priceB;
        } else {
            return priceB - priceA;
        }
    });

    foodList.innerHTML = ""; // Xóa danh sách món ăn

    // Thêm lại món ăn đã sắp xếp
    foodItems.forEach((foodItem) => {
        foodList.appendChild(foodItem);
    });

    // Đảo hướng sắp xếp cho lần sau
    ascendingSort = !ascendingSort;
};

// Sự kiện click nút Sort
sortButton.addEventListener("click", sortFoodItems);

// Sự kiện khi chọn tùy chọn trong select
selectBox.addEventListener("change", (event) => {
    if (event.target.value === "price") {
        sortFoodItems();
    }
});

// Gọi hàm sắp xếp ban đầu khi trang web tải
sortFoodItems();

//Sort Name

let ascendingSortByName = false;

sortButton.addEventListener("click", () => {
    if (selectBox.value === "name") {
        sortFoodItemsByName();
    }
});

function sortFoodItemsByName() {
    const foodItems = Array.from(foodList.querySelectorAll(".food"));

    foodItems.sort((a, b) => {
        const nameA = a.querySelector(".name-food p").textContent.toUpperCase();
        const nameB = b.querySelector(".name-food p").textContent.toUpperCase();

        if (ascendingSortByName) {
            if (nameA < nameB) return 1;
            if (nameA > nameB) return -1;
        } else {
            if (nameA < nameB) return -1;
            if (nameA > nameB) return 1;
        }

        return 0;
    });

    foodList.innerHTML = "";

    foodItems.forEach((foodItem) => {
        foodList.appendChild(foodItem);
    });

    ascendingSortByName = !ascendingSortByName;
}

// Xử lý sự kiện khi thay đổi tùy chọn select
selectBox.addEventListener("change", () => {
    // Reset thứ tự sắp xếp khi chuyển sang tùy chọn khác
    ascendingSortByName = false;
    if (selectBox.value === "name") {
        sortFoodItemsByName();
    }
});



//Sort Date Create

let ascendingSortById = false;

sortButton.addEventListener("click", () => {
    sortFoodItemsById();
});

function sortFoodItemsById() {
    const foodItems = Array.from(foodList.querySelectorAll(".food"));

    foodItems.sort((a, b) => {
        const idA = parseInt(a.getAttribute("data-id"));
        const idB = parseInt(b.getAttribute("data-id"));

        if (ascendingSortById) {
            return idA - idB;
        } else {
            return idB - idA;
        }
    });

    foodList.innerHTML = "";

    foodItems.forEach((foodItem, index) => {
        // Cập nhật id mới
        foodItem.setAttribute("data-id", index + 1);
        foodList.appendChild(foodItem);
    });

    ascendingSortById = !ascendingSortById;
}
