<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard - Cảnh Sát Giao Thông</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <jsp:include page="../common/header.jsp" />
        <jsp:include page="../common/topnav.jsp" />
        <main class="container">
            <div class="vehicle-form">
                <h2>Chào Mừng ${sessionScope.user.fullName}</h2>
                <p><strong>Xin chào: </strong> ${sessionScope.user.fullName}</p>
                <p><strong>ID: </strong> ${sessionScope.user.userID}</p>
                <p><strong>Email: </strong> ${sessionScope.user.email}</p>
                <p><strong>Vai trò: </strong> Cảnh sát</p>
                <p><strong>Số điện thoại: </strong> ${sessionScope.user.phone}</p>
                <p><strong>Địa chỉ: </strong> ${sessionScope.user.address}</p>
                <p>Chào mừng bạn đến với hệ thống quản lý phương tiện.</p>
            </div>
        </main>
        <jsp:include page="../common/footer.jsp" />
    </body>
</html>