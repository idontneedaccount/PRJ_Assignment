<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Lỗi</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/topnav.jsp" />
    <main class="container">
        <h2>Đã xảy ra lỗi</h2>
        <p>${errorMessage}</p>
    </main>
    <jsp:include page="../common/footer.jsp" />
</body>
</html>