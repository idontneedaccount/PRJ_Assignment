<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng Nhập - Quản Lý Đăng Kiểm</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styleLogin.css">

    </head>
    <body>
        <div class="login-container">
            <form action="Login" method="POST">
                <h2>Đăng Nhập Hệ Thống</h2>
                <div class="form-group">
                    <label for="email">Email Đăng Nhập</label>
                    <input type="text" id="email" name="email" placeholder="Nhập email đăng nhập" required>
                </div>

                <div class="form-group">
                    <label for="password">Mật Khẩu</label>
                    <input type="password" id="password" name="password" placeholder="Nhập mật khẩu" required>
                </div>
                <button type="submit">Đăng Nhập</button>
                <c:if test="${not empty error}">
                    <div class="error-message" style="color: red; text-align: center;">
                        ${error}
                    </div>
                </c:if>
            </form>
        </div>
    </body>
</html>