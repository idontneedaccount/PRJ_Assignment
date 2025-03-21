<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Quản Lý Cơ Sở Kiểm Định</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/topnav.jsp" />
    <main class="container">
        <h2 class="form-title">Quản Lý Thông Tin Cơ Sở Kiểm Định</h2>
        <div class="vehicle-form">
            <form action="${pageContext.request.contextPath}/view/station/updateStation" method="post">
                <input type="hidden" name="stationId" value="${station.stationId}">
                <div class="form-group">
                    <label for="name">Tên cơ sở:</label>
                    <input type="text" id="name" name="name" value="${station.name}" required>
                </div>
                <div class="form-group">
                    <label for="address">Địa chỉ:</label>
                    <input type="text" id="address" name="address" value="${station.address}" required>
                </div>
                <div class="form-group">
                    <label for="phone">Số điện thoại:</label>
                    <input type="text" id="phone" name="phone" value="${station.phone}" required>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="${station.email}" required>
                </div>
                <div class="form-buttons">
                    <button type="submit" class="btn btn-primary">Cập Nhật</button>
                    <a href="${pageContext.request.contextPath}/view/station/dashboard" class="btn btn-secondary" style="text-align: center">Quay Lại</a>
                </div>
            </form>
        </div>
    </main>
    <jsp:include page="../common/footer.jsp" />
</body>
</html>