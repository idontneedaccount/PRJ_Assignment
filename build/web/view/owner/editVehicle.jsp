<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chỉnh Sửa Người Dùng</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    <jsp:include page="../common/topnav.jsp"/>

    <div class="container">
        <h2 class="form-title">Chỉnh Sửa Người Dùng</h2>
        <form action="Users" method="POST">
            <input type="hidden" name="action" value="edit">
            <input type="hidden" name="userID" value="<c:out value='${user.userID}'/>">
            
            <div class="form-group">
                <label class="form-label">Họ và Tên:</label>
                <input type="text" name="fullName" value="<c:out value='${user.fullName}'/>" required>
            </div>
            
            <div class="form-group">
                <label class="form-label">Email:</label>
                <input type="email" name="email" value="<c:out value='${user.email}'/>" required>
            </div>
            
            <div class="form-group">
                <label class="form-label">Vai Trò:</label>
                <select name="role" required>
                    <option value="Owner" ${user.role == 'Owner' ? 'selected' : ''}>Chủ Phương Tiện</option>
                    <option value="Inspector" ${user.role == 'Inspector' ? 'selected' : ''}>Công Nhân Kiểm Tra</option>
                    <option value="Station" ${user.role == 'Station' ? 'selected' : ''}>Cơ Sở Kiểm Định</option>
                    <option value="Police" ${user.role == 'Police' ? 'selected' : ''}>Cảnh Sát Giao Thông</option>
                </select>
            </div>
            
            <div class="form-group">
                <label class="form-label">Số Điện Thoại:</label>
                <input type="text" name="phone" value="<c:out value='${user.phone}'/>" required>
            </div>
            
            <div class="form-group">
                <label class="form-label">Địa Chỉ:</label>
                <input type="text" name="address" value="<c:out value='${user.address}'/>" required>
            </div>
            
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Cập Nhật</button>
                <button type="button" class="btn" style="color: white; background-color: #3498db; margin-top: 5px" 
                        onclick="location.href = 'Users?action=list'">Hủy</button>
            </div>
        </form>
    </div>

    <jsp:include page="../common/footer.jsp"/>
</body>
</html>
