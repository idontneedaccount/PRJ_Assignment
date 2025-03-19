<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Người Dùng</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    <jsp:include page="../common/topnav.jsp"/>

    <div class="container">
        <h2>Quản Lý Người Dùng</h2>

        <div class="form-group">
            <form action="Users" method="GET">
                <input type="hidden" name="action" value="list">
                <table>
                    <tr>
                        <td><label class="form-label">Danh sách người dùng:</label></td>
                        <td><input type="submit" value="LẤY DANH SÁCH NGƯỜI DÙNG" class="btn btn-primary"></td>
                    </tr>
                </table>
            </form>
        </div>

        <div class="form-group">
            <input type="button" value="ĐĂNG KÝ NGƯỜI DÙNG MỚI" class="btn btn-primary" onclick="location.href='Users?action=add'">
        </div>
    </div>

    <jsp:include page="../common/footer.jsp"/>
</body>
</html>
