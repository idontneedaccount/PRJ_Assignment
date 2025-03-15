<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng Ký - Quản Lý Đăng Kiểm</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styleLogin.css">
    </head>
    <body>
        <div class="login-container">
            <form action="${pageContext.request.contextPath}/Register" method="POST">
                <h2>Đăng Ký Tài Khoản</h2>

                <div class="form-group">
                    <label for="fullName">Họ và Tên</label>
                    <input type="text" id="fullName" name="fullName" placeholder="Nhập họ và tên" required>
                </div>

                <div class="form-group">
                    <label for="email">Email Đăng Ký</label>
                    <input type="email" id="email" name="email" placeholder="Nhập email đăng ký" required>
                </div>

                <div class="form-group">
                    <label for="password">Mật Khẩu</label>
                    <input type="password" id="password" name="password" placeholder="Nhập mật khẩu" required>
                </div>

                <div class="form-group">
                    <label for="confirmPassword">Xác Nhận Mật Khẩu</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Xác nhận mật khẩu" required>
                </div>

                <div class="form-group">
                    <label for="role">Vai Trò</label>
                    <select id="role" name="role" required>
                        <option value="Police">Cảnh Sát</option>
                        <option value="Station">Trạm Đăng Kiểm</option>
                        <option value="Inspector">Nhân Viên Đăng Kiểm</option>
                        <option value="Owner">Chủ Xe</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="phone">Số Điện Thoại</label>
                    <input type="text" id="phone" name="phone" placeholder="Nhập số điện thoại" required>
                </div>

                <div class="form-group">
                    <label for="address">Địa Chỉ</label>
                    <input type="text" id="address" name="address" placeholder="Nhập địa chỉ" required>
                </div>

                <button type="submit">Đăng Ký</button>

                <c:if test="${not empty error}">
                    <div class="error-message" style="color: red; text-align: center;">
                        ${error}
                    </div>
                </c:if>
            </form>

            <div style="text-align: center; margin-top: 10px;">
                <a href="${pageContext.request.contextPath}/view/login.jsp">Đã có tài khoản? Đăng nhập</a>
            </div>
        </div>
    </body>
</html>