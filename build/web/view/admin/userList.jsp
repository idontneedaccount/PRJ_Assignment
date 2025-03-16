<%-- 
    Document   : userList
    Created on : Mar 15, 2025
    Author     : [Your Name]
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản Lý Người Dùng</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <jsp:include page="../common/header.jsp" />
        <jsp:include page="../common/topnav.jsp" />
        <main class="container">
            <h2 class="form-title">Danh Sách Người Dùng</h2>
            <c:choose>
                <c:when test="${empty users}">
                    <p>Không có người dùng nào trong hệ thống.</p>
                </c:when>
                <c:otherwise>
                    <table>
                        <thead>
                            <tr>
                                <th>Tên</th>
                                <th>Email</th>
                                <th>Mật Khẩu</th>
                                <th>Vai Trò</th>
                                <th>Số Điện Thoại</th>
                                <th>Địa Chỉ</th>
                                <th>Hành Động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${users}">
                                <tr>
                                    <td>${user.fullName}</td>
                                    <td>${user.email}</td>
                                    <td>${user.password}</td>
                                    <td>${user.role}</td>
                                    <td>${user.phone}</td>
                                    <td>${user.address}</td>
                                    <td>
                                        <input type="button" value="Sửa" class="btn btn-primary"
                                               onclick="location.href = '${pageContext.request.contextPath}/admin?action=edit&userID=${user.userID}'"/>
                                        <input type="button" value="Xóa" class="btn btn-primary"
                                               onclick="location.href = '${pageContext.request.contextPath}/admin?action=delete&userID=${user.userID}'"/>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
            <input type="button" value="Thêm Người Dùng Mới" class="btn btn-primary" style="margin-top: 1rem;"
                   onclick="location.href = '${pageContext.request.contextPath}/admin?action=add'"/>
        </main>
        <jsp:include page="../common/footer.jsp" />
    </body>
</html>