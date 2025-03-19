<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Chi Tiết Người Dùng</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <jsp:include page="../common/header.jsp"/>
        <jsp:include page="../common/topnav.jsp"/>
        <main class="dashboard">
            <h2 class="form-title">Chi Tiết Người Dùng</h2>
            <c:if test="${not empty user}">
                <table class="user-details">
                    <tr>
                        <td><strong>ID:</strong></td>
                        <td>${user.userID}</td>
                    </tr>
                    <tr>
                        <td><strong>Họ và Tên:</strong></td>
                        <td>${user.fullName}</td>
                    </tr>
                    <tr>
                        <td><strong>Email:</strong></td>
                        <td>${user.email}</td>
                    </tr>
                    <tr>
                        <td><strong>Vai Trò:</strong></td>
                        <td>${user.role}</td>
                    </tr>
                    <tr>
                        <td><strong>Số Điện Thoại:</strong></td>
                        <td>${user.phone}</td>
                    </tr>
                    <tr>
                        <td><strong>Địa Chỉ:</strong></td>
                        <td>${user.address}</td>
                    </tr>
                </table>
                <div class="actions">
                    <button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/view/admin/Users?action=edit&id=${user.userID}'">Chỉnh Sửa</button>
                    <button class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/view/admin/Users?action=list'">Quay Lại</button>
                </div>
            </c:if>
            <c:if test="${empty user}">
                <p>Không tìm thấy thông tin người dùng.</p>
                <button class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/view/admin/Users?action=list'">Quay Lại</button>
            </c:if>
        </main>
        <jsp:include page="../common/footer.jsp"/>
    </body>
</html>