<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm Người Dùng Mới</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <jsp:include page="../common/header.jsp" />
        <main class="container">
            <div class="vehicle-form">
                <h2 class="form-title">Thêm Người Dùng Mới</h2>
                <form action="${pageContext.request.contextPath}/admin" method="post">
                    <input type="hidden" name="action" value="add">
                    <div class="form-group">
                        <label class="form-label" for="fullName">Họ và Tên:</label>
                        <input class="form-input" type="text" id="fullName" name="fullName" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="email">Email:</label>
                        <input class="form-input" type="email" id="email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="password">Mật Khẩu:</label>
                        <input class="form-input" type="password" id="password" name="password" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="role">Vai Trò:</label>
                        <select class="form-input" id="role" name="role" required>
                            <option value="Owner">Chủ Phương Tiện</option>
                            <option value="Inspector">Công Nhân Kiểm Tra</option>
                            <option value="Station">Cơ Sở Kiểm Định</option>
                            <option value="Police">Cảnh Sát Giao Thông</option>
                        </select>
                    </div>
                    <input type="submit" value="Thêm Người Dùng" class="btn btn-primary">
                </form>
            </div>
        </main>
        <jsp:include page="../common/footer.jsp" />
    </body>
</html>