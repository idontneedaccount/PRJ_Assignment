<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Dashboard - Cơ Sở Kiểm Định</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/topnav.jsp" />
    <main class="container">
        <h2 class="form-title">Thông Tin Cơ Sở Kiểm Định</h2>
        <div class="vehicle-form">
            <p><strong>Tên:</strong> ${station.name}</p>
            <p><strong>Địa chỉ:</strong> ${station.address}</p>
            <p><strong>Số điện thoại:</strong> ${station.phone}</p>
            <p><strong>Email:</strong> ${station.email}</p>
            <a href="${pageContext.request.contextPath}/view/station/manageStation" class="btn btn-primary">Chỉnh Sửa</a>
        </div>

        <h2 class="form-title">Thống Kê Kiểm Định</h2>
        <div>
            <p>Tổng số xe kiểm tra: ${totalInspections}</p>
            <p>Số xe đạt: ${passCount}</p>
            <p>Số xe không đạt: ${failCount}</p>
            <p>Tỷ lệ đạt: ${passRate}%</p>
            <a href="${pageContext.request.contextPath}/view/station/reports" class="btn btn-primary">Xem Báo Cáo Chi Tiết</a>
        </div>
    </main>
    <jsp:include page="../common/footer.jsp" />
</body>
</html>