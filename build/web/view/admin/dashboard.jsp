<%-- 
    Document   : dashboard
    Created on : Mar 15, 2025
    Author     : [Your Name]
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard - Quản Trị Viên</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <jsp:include page="../common/header.jsp" />
        <jsp:include page="../common/topnav.jsp" />
        <main class="container">
            <h2 class="form-title">Chào Mừng ${sessionScope.user.fullName}</h2>
            <div class="vehicle-form">
                <h2>Chào Mừng Admin</h2>
                <p><strong>Xin chào: </strong> ${sessionScope.user.fullName}</p>
                <p><strong>ID: </strong> ${sessionScope.user.userID}</p>
                <p><strong>Email: </strong> ${sessionScope.user.email}</p>
                <p><strong>Vai trò: </strong> Administrator</p>
                <p><strong>Số điện thoại: </strong> ${sessionScope.user.phone}</p>
                <p><strong>Địa chỉ: </strong> ${sessionScope.user.address}</p>
                <p>Đây là trang quản trị hệ thống. Bạn có thể quản lý người dùng.</p>
            </div>
        </main>
        <jsp:include page="../common/footer.jsp" />
    </body>
</html>