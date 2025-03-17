<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chọn Chức Năng Kiểm Định</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    <jsp:include page="../common/topnav.jsp"/>

    <div class="container">
        <h2 class="form-title">Chọn Chức Năng Kiểm Định</h2>

        <div class="options">
            <a href="Inspection?action=schedule" class="btn btn-primary">📅 Lên Lịch Kiểm Định</a>
            <a href="Inspection?action=history" class="btn btn-secondary">📜 Xem Lịch Sử Kiểm Định</a>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp"/>
</body>
</html>
