<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Dashboard - Cảnh Sát Giao Thông</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/topnav.jsp" />
    <main class="container">
        <h2 class="form-title">Tra Cứu Thông Tin Xe</h2>
        <div class="vehicle-form">
            <form action="${pageContext.request.contextPath}/view/police/searchVehicle" method="get">
                <div class="form-group">
                    <label class="form-label" for="plateNumber">Biển Số Xe:</label>
                    <input class="form-input" type="text" id="plateNumber" name="plateNumber" required>
                </div>
                <input type="submit" value="Tra Cứu" class="btn btn-primary">
            </form>
            <c:if test="${not empty vehicle}">
                <h3>Kết Quả Tra Cứu</h3>
                <p><strong>Biển Số:</strong> ${vehicle.plateNumber}</p>
                <p><strong>Chủ Xe:</strong> ${vehicle.owner.fullName}</p>
                <p><strong>Trạng Thái Kiểm Định:</strong> 
                    <c:set var="latestRecord" value="${vehicle.latestInspectionRecord}" />
                    <c:choose>
                        <c:when test="${empty latestRecord}">Chưa kiểm định</c:when>
                        <c:otherwise>${latestRecord.result}</c:otherwise>
                    </c:choose>
                </p>
            </c:if>
        </div>
    </main>
    <jsp:include page="../common/footer.jsp" />
</body>
</html>