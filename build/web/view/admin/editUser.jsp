<%-- 
    Document   : editUser
    Created on : Mar 15, 2025
    Author     : [Your Name]
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chỉnh Sửa Người Dùng</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <jsp:include page="../common/header.jsp" />
        <jsp:include page="../common/topnav.jsp" />
        <main class="container">
            <div class="vehicle-form">
                <h2 class="form-title">Chỉnh Sửa Thông Tin Người Dùng</h2>
                <jsp:useBean id="user" class="model.User" scope="request" />
                <form action="Users" method="post">
                    <input type="hidden" name="action" value="edit">
                    <input type="hidden" name="userID" value="${userToEdit.userID}">
                    <div class="form-group">
                        <label class="form-label" for="fullName">Họ và Tên:</label>
                        <input class="form-input" type="text" id="fullName" name="fullName" value="${userToEdit.fullName}" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="email">Email:</label>
                        <input class="form-input" type="email" id="email" name="email" value="${userToEdit.email}" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="password">Mật Khẩu:</label>
                        <input class="form-input" type="text" id="password" name="password" value="${userToEdit.password}" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="role">Vai Trò: ${userToEdit.role}</label>
                        <select class="form-input" id="role" name="role" required>
                            <option value="Owner" <c:if test="${userToEdit.role == 'Owner'}">selected</c:if>>Chủ Phương Tiện</option>
                            <option value="Inspector" <c:if test="${userToEdit.role == 'Inspector'}"></c:if>>Công Nhân Kiểm Tra</option>
                            <option value="Station" <c:if test="${userToEdit.role == 'Station'}">selected</c:if>>Cơ Sở Kiểm Định</option>
                            <option value="Police" <c:if test="${userToEdit.role == 'Police'}">selected</c:if>>Cảnh Sát Giao Thông</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="phone">Số Điện Thoại:</label>
                        <input class="form-input" type="text" id="phone" name="phone" value="${userToEdit.phone}" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="address">Địa Chỉ:</label>
                        <textarea class="form-input" id="address" name="address" required>${userToEdit.address}</textarea>
                    </div>
                    <input type="submit" value="Cập Nhật" class="btn btn-primary">
                </form>
            </div>
        </main>
        <jsp:include page="../common/footer.jsp" />
    </body>
</html>