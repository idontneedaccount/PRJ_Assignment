<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kết Quả Xóa Người Dùng</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <jsp:include page="../common/header.jsp" />
        <jsp:include page="../common/topnav.jsp" />

        <div class="container">
            <h2 class="form-title">Kết Quả Xóa Người Dùng</h2>

            <c:set var="user" value="${requestScope.user}" />
            <c:set var="success" value="${requestScope.success}" />

            <div class="result_section ${success ? '' : 'error'}">
                <c:choose>
                    <c:when test="${success}">
                        <table border="0">
                            <tr>
                                <td colspan="2" style="text-align: center">Xóa người dùng thành công!</td>
                            </tr>
                            <tr>
                                <td>ID Người Dùng:</td>
                                <td>${user.userID}</td>
                            </tr>
                            <tr>
                                <td>Họ và Tên:</td>
                                <td>${user.fullName}</td>
                            </tr>
                            <tr>
                                <td>Email:</td>
                                <td>${user.email}</td>
                            </tr>
                            <tr>
                                <td>Vai Trò:</td>
                                <td>${user.role}</td>
                            </tr>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <h3>Xóa người dùng thất bại!</h3>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="form-group" style="text-align: center; margin-top: 200px;">
                <div class='form-group'>
                    <a href='Users?action=list' class='btn btn-primary'>Quay lại danh sách</a>
                </div>
            </div>
        </div>

        <jsp:include page="../common/footer.jsp" />
    </body>
</html>