<<<<<<< HEAD
// Lấy tham chiếu đến các phần tử HTML trong phần customer-table
const customerTable = document.querySelector('.customer-table');
const searchInput = customerTable.querySelector('.search-box');
const filterSelect = customerTable.querySelector('.select-box');
const tableRows = customerTable.querySelectorAll('tbody tr');
=======
// Lấy tham chiếu đến các phần tử HTML
const searchInput = document.getElementById('searchInput');
const filterSelect = document.getElementById('filterSelect');
const tableRows = document.querySelectorAll('tbody tr');
>>>>>>> 0e97c60adb008404fa0a182d50f04fc5295cb1b0

// Lắng nghe sự kiện input trên thanh tìm kiếm và change trên select
searchInput.addEventListener('input', filterTable);
filterSelect.addEventListener('change', filterTable);
<<<<<<< HEAD
filterSelect.addEventListener('change', function () {
=======
filterSelect.addEventListener('change', function() {
>>>>>>> 0e97c60adb008404fa0a182d50f04fc5295cb1b0
  searchInput.value = ''; // Đặt lại giá trị thanh tìm kiếm về chuỗi trống
  filterTable();
});
function filterTable() {
  const searchTerm = searchInput.value.toLowerCase();
  const selectedOption = filterSelect.value;

  tableRows.forEach(row => {
    const cells = row.querySelectorAll('td');
    let shouldDisplay = false;

    if (selectedOption === 'all') {
      shouldDisplay = Array.from(cells).some(cell => cell.textContent.toLowerCase().includes(searchTerm));
    } else {
      const column = document.querySelector(`th[data-filter="${selectedOption}"`);
      const columnIndex = Array.from(column.parentElement.children).indexOf(column);
      shouldDisplay = cells[columnIndex].textContent.toLowerCase().includes(searchTerm);
    }

    row.style.display = shouldDisplay ? 'table-row' : 'none';
  });
}

// Pavigation

const itemList = document.getElementById('itemList');
const prevButton = document.getElementById('prevButton');
const nextButton = document.getElementById('nextButton');
const rows = itemList.querySelectorAll('tr');

const rowsPerPage = 10;
let currentPage = 1;

function showPage(pageNumber) {
<<<<<<< HEAD
    rows.forEach((row, index) => {
        if (index >= (pageNumber - 1) * rowsPerPage && index < pageNumber * rowsPerPage) {
            row.style.display = 'table-row';
        } else {
            row.style.display = 'none';
        }
    });
=======
  rows.forEach((row, index) => {
    if (index >= (pageNumber - 1) * rowsPerPage && index < pageNumber * rowsPerPage) {
      row.style.display = 'table-row';
    } else {
      row.style.display = 'none';
    }
  });
>>>>>>> 0e97c60adb008404fa0a182d50f04fc5295cb1b0
}

showPage(currentPage);

prevButton.addEventListener('click', () => {
<<<<<<< HEAD
    if (currentPage > 1) {
        currentPage--;
        showPage(currentPage);
        searchInput.value = '';
    }
});

nextButton.addEventListener('click', () => {
    const totalPages = Math.ceil(rows.length / rowsPerPage);
    if (currentPage < totalPages) {
        currentPage++;
        showPage(currentPage);
        searchInput.value = '';
    }
});

// Sort
// Định nghĩa biến lưu trạng thái sắp xếp mặc định
let currentSortColumn = null;
    let ascending = true;

    function sortTable(columnIndex) {
        const table = document.querySelector("table");
        const tbody = table.querySelector("tbody");
        const rows = Array.from(tbody.getElementsByTagName("tr"));

        rows.sort((a, b) => {
            const aValue = a.getElementsByTagName("td")[columnIndex].textContent.trim();
            const bValue = b.getElementsByTagName("td")[columnIndex].textContent.trim();

            if (ascending) {
                return aValue.localeCompare(bValue);
            } else {
                return bValue.localeCompare(aValue);
            }
        });

        while (tbody.firstChild) {
            tbody.removeChild(tbody.firstChild);
        }

        rows.forEach(row => {
            tbody.appendChild(row);
        });

        ascending = !ascending;

        // Hủy sắp xếp trường cũ nếu có
        if (currentSortColumn !== null) {
            table.rows[0].cells[currentSortColumn].classList.remove(ascending ? "asc" : "desc");
        }

        // Đánh dấu trường đang sắp xếp và cập nhật biến currentSortColumn
        currentSortColumn = columnIndex;
        table.rows[0].cells[columnIndex].classList.add(ascending ? "asc" : "desc");
    }

=======
  if (currentPage > 1) {
    currentPage--;
    showPage(currentPage);
  }
});

nextButton.addEventListener('click', () => {
  const totalPages = Math.ceil(rows.length / rowsPerPage);
  if (currentPage < totalPages) {
    currentPage++;
    showPage(currentPage);
  }
});

// Sort
  // Biến để theo dõi trạng thái sắp xếp
  let sortDirection = 1; // 1: tăng dần, -1: giảm dần

  // Hàm để sắp xếp bảng dựa trên cột được chọn
  function sortTable(column) {
      const table = document.querySelector("table");
      const tbody = document.querySelector("#itemList");
      const rows = Array.from(tbody.querySelectorAll("tr"));

      // Sắp xếp các hàng dữ liệu
      rows.sort((a, b) => {
          const aValue = a.querySelector(`td:nth-child(${column + 1}`).textContent;
          const bValue = b.querySelector(`td:nth-child(${column + 1}`).textContent;
          return aValue.localeCompare(bValue) * sortDirection;
      });

      // Xóa các hàng hiện tại
      while (tbody.firstChild) {
          tbody.removeChild(tbody.firstChild);
      }

      // Thêm lại các hàng đã sắp xếp
      rows.forEach(row => {
          tbody.appendChild(row);
      });

      // Đảo chiều sắp xếp cho lần nhấn tiếp theo
      sortDirection *= -1;
  }
>>>>>>> 0e97c60adb008404fa0a182d50f04fc5295cb1b0

