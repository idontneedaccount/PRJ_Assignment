<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Danh Sách Người Dùng</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <jsp:include page="../common/header.jsp"/>
        <jsp:include page="../common/topnav.jsp"/>
        <main class="dashboard">
            <c:choose>
                <c:when test="${empty users}">
                    <p>Chưa có người dùng nào trong hệ thống.</p>
                </c:when>
                <c:otherwise>
                    <h2 class="form-title">Danh Sách Người Dùng</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Họ và Tên</th>
                                <th>Email</th>
                                <th>Vai Trò</th>
                                <th>Số Điện Thoại</th>
                                <th>Địa Chỉ</th>
                                <th colspan="3">Hành Động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${users}">
                                <tr>
                                    <td>${user.userID}</td>
                                    <td>${user.fullName}</td>
                                    <td>${user.email}</td>
                                    <td>${user.role}</td>
                                    <td>${user.phone}</td>
                                    <td>${user.address}</td>
                                    <td>
                                        <input type="button" value="View" class="btn btn-primary"
                                               onclick="location.href = '${pageContext.request.contextPath}/view/admin/Users?action=view&id=${user.userID}'"/>
                                    </td>
                                    <td>
                                        <input type="button" value="Edit" class="btn btn-primary"
                                               onclick="location.href = '${pageContext.request.contextPath}/view/admin/Users?action=edit&id=${user.userID}'"/>
                                    </td>
                                    <td>
                                        <input type="button" value="Delete" class="btn btn-primary"
                                               onclick="if (confirm('Bạn có chắc chắn muốn xóa?'))
                                                           location.href = '${pageContext.request.contextPath}/view/admin/Users?action=delete&email=${user.email}'"/>
                                    </td>
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