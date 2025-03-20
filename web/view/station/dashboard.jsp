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
                <h2>Chào Mừng Chủ Phương Tiện</h2>
                <p><strong>Xin chào: </strong> ${sessionScope.user.fullName}</p>
                <p><strong>ID: </strong> ${sessionScope.user.userID}</p>
                <p><strong>Email: </strong> ${sessionScope.user.email}</p>
                <p><strong>Vai trò: </strong> Chủ Phương Tiện</p>
                <p><strong>Số điện thoại: </strong> ${sessionScope.user.phone}</p>
                <p><strong>Địa chỉ: </strong> ${sessionScope.user.address}</p>
                <p>Chào mừng bạn đến với hệ thống quản lý phương tiện. Hãy kiểm tra thông báo dưới đây để cập nhật thông tin mới nhất.</p>
            </div>
            <div class="vehicle-form">
                <c:choose>
                    <c:when test="${empty station}">
                        <p style="color: red;">Không tìm thấy thông tin cơ sở kiểm định!</p>
                    </c:when>
                    <c:otherwise>
                        <h2>Thông tin cơ sở kiểm định</h2>
                        <p><strong>Tên:</strong> ${sessionScope.station.name}</p>
                        <p><strong>Địa chỉ:</strong> ${sessionScope.station.address}</p>
                        <p><strong>Số điện thoại:</strong> ${sessionScope.station.phone}</p>
                        <p><strong>Email:</strong> ${sessionScope.station.email}</p>
                    </c:otherwise>
                </c:choose>
            </div>
        </main>
        <jsp:include page="../common/footer.jsp" />
    </body>
</html>