
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Đăng Kiểm Khí Thải Xe Máy</title>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <!-- Header -->
    <header>
        <h1>Quản Lý Đăng Kiểm Khí Thải Xe Máy</h1>
    </header>

    <!-- Navigation -->
    <nav>
        <ul>
            <li><a href="#">Trang Chủ</a></li>
            <li><a href="#">Thêm Xe Máy</a></li>
            <li><a href="#">Danh Sách Xe</a></li>
            <li><a href="${pageContext.request.contextPath}/Logout">Đăng xuất</a></li>
        </ul>
    </nav>

    <!-- Main content -->
    <div class="container">
        <h2>Thêm Thông Tin Xe Máy</h2>
        <form>
            <div class="form-group">
                <label for="bienSo">Biển Số Xe</label>
                <input type="text" id="bienSo" name="bienSo" placeholder="VD: 29A-123.45" required>
            </div>

            <div class="form-group">
                <label for="chuXe">Chủ Xe</label>
                <input type="text" id="chuXe" name="chuXe" placeholder="Nhập tên chủ xe" required>
            </div>

            <div class="form-group">
                <label for="loaiXe">Loại Xe</label>
                <select id="loaiXe" name="loaiXe" required>
                    <option value="">Chọn loại xe</option>
                    <option value="xeGa">Xe Ga</option>
                    <option value="xeSo">Xe Số</option>
                </select>
            </div>

            <div class="form-group">
                <label for="ngayDangKiem">Ngày Đăng Kiểm</label>
                <input type="date" id="ngayDangKiem" name="ngayDangKiem" required>
            </div>

            <button type="submit">Thêm Xe</button>
        </form>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 - Ứng dụng Quản lý Đăng kiểm Khí thải Xe máy</p>
    </footer>
</body>
</html>
