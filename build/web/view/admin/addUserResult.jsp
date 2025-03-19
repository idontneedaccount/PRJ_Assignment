<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kết Quả Thêm Người Dùng</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    <jsp:include page="../common/topnav.jsp"/>

    <div class="container">
        <h2 class="form-title">Kết Quả Thêm Người Dùng</h2>

        <div class="result-section ${user == null ? 'error' : ''}">
            <c:if test="${user == null}">
                <h3>Thêm người dùng thất bại.</h3>
            </c:if>
            <c:if test="${user != null}">
                <h3>Thêm người dùng thành công:</h3>
                <h4><span>Họ và Tên:</span> <c:out value="${user.fullName}"/></h4>
                <h4><span>Email:</span> <c:out value="${user.email}"/></h4>
                <h4><span>Vai Trò:</span> <c:out value="${user.role}"/></h4>
                <h4><span>Số Điện Thoại:</span> <c:out value="${user.phone}"/></h4>
                <h4><span>Địa Chỉ:</span> <c:out value="${user.address}"/></h4>
            </c:if>
        </div>
        <div class="form-group" style="text-align: center;margin-top: 20px;">
            <div class='form-group'>
                <a href='Users?action=list' class='btn btn-primary'>Quay lại danh sách</a>
            </div>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp"/>
</body>
</html>
