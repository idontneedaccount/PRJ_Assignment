<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Nhật Ký Hoạt Động</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/topnav.jsp" />
    <main class="container">
        <h2 class="form-title">Nhật Ký Hoạt Động</h2>
        <c:choose>
            <c:when test="${empty logs}">
                <p>Không có bản ghi nhật ký nào trong hệ thống.</p>
            </c:when>
            <c:otherwise>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Người Dùng</th>
                            <th>Hành Động</th>
                            <th>Thời Gian</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="log" items="${logs}">
                            <tr>
                                <td>${log.logID}</td>
                                <td>${log.user.fullName} (ID: ${log.userID})</td>
                                <td>${log.action}</td>
                                <td>${log.timestamp}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </main>
    <jsp:include page="../common/footer.jsp" />
</body>
</html>