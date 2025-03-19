<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Người Dùng</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    <jsp:include page="../common/topnav.jsp"/>

    <div class="container">
        <div class="form-group">
            <h2 style="text-align: center">Đăng Ký Người Dùng Mới</h2>
            <form action="Users" method="POST">
                <input type="hidden" name="action" value="add">
                <div class="form-group">
                    <label class="form-label">Họ và Tên:</label>
                    <input class="form-input" type="text" name="fullName" required>
                </div>
                <div class="form-group">
                    <label class="form-label">Email:</label>
                    <input class="form-input" type="email" name="email" required>
                </div>
                <div class="form-group">
                    <label class="form-label">Mật khẩu:</label>
                    <input class="form-input" type="password" name="password" required>
                </div>
                <div class="form-group">
                    <label class="form-label">Vai trò:</label>
                    <select class="form-input" name="role" required>
                        <option value="Owner">Chủ Phương Tiện</option>
                        <option value="Inspector">Công Nhân Kiểm Tra</option>
                        <option value="Station">Cơ Sở Kiểm Định</option>
                        <option value="Police">Cảnh Sát Giao Thông</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label">Số điện thoại:</label>
                    <input class="form-input" type="text" name="phone" required>
                </div>
                <div class="form-group">
                    <label class="form-label">Địa chỉ:</label>
                    <input class="form-input" type="text" name="address" required>
                </div>
                <button type="submit" class="btn btn-primary">Đăng Ký</button>
            </form>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp"/>
</body>
</html>
