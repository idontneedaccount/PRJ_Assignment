<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Chủ Phương Tiện</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <jsp:include page="../common/header.jsp" />
        <jsp:include page="../common/topnav.jsp" />

        <main class="dashboard">
            <div class="parent">
                <div class="vehicle-form div1">
                    <h2>Thông Báo Mới</h2>
                    <c:choose>
                        <c:when test="${empty notifications}">
                            <p>Không có thông báo nào hiện tại.</p>
                        </c:when>
                        <c:otherwise>
                            <ul>
                                <c:forEach var="notification" items="${notifications}">
                                    <li>${notification.message} - <em>${notification.sentDate}</em></li>
                                    </c:forEach>
                            </ul>
                        </c:otherwise>
                    </c:choose>
                </div>

                <div class="vehicle-form div2">
                    <h2>Chào Mừng Chủ Phương Tiện</h2>
                    <p><strong>Xin chào: </strong> ${sessionScope.user.fullName}</p>
                    <p><strong>ID: </strong> ${sessionScope.user.userID}</p>
                    <p><strong>Email: </strong> ${sessionScope.user.email}</p>
                    <p><strong>Vai trò: </strong> Chủ Phương Tiện</p>
                    <p><strong>Số điện thoại: </strong> ${sessionScope.user.phone}</p>
                    <p><strong>Địa chỉ: </strong> ${sessionScope.user.address}</p>
                    <p>Chào mừng bạn đến với hệ thống quản lý phương tiện. Hãy kiểm tra thông báo dưới đây để cập nhật thông tin mới nhất.</p>
                </div>
            </div>
        </main>
        <jsp:include page="../common/footer.jsp" />
    </body>
</html>
