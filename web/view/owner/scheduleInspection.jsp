<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lên lịch kiểm định</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    <jsp:include page="../common/topnav.jsp"/>

    <div class="container">
        <h2 class="form-title">Lên Lịch Kiểm Định</h2>

        <form action="ScheduleInspection" method="POST">
            <div class="form-group">
                <label for="vehicle">Chọn Phương Tiện:</label>
                <select name="vehicleID" id="vehicle" required>
                    <c:forEach var="vehicle" items="${vehicles}">
                        <option value="${vehicle.vehicleID}">${vehicle.plateNumber} - ${vehicle.brand} ${vehicle.model}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="station">Chọn Trạm Kiểm Định:</label>
                <select name="stationID" id="station" required>
                    <c:forEach var="station" items="${stations}">
                        <option value="${station.stationID}">${station.name} - ${station.address}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="date">Chọn Ngày Kiểm Định:</label>
                <input type="date" name="inspectionDate" id="date" required>
            </div>

            <button type="submit" class="btn btn-primary">Lên Lịch</button>
        </form>
    </div>

    <jsp:include page="../common/footer.jsp"/>
</body>
</html>
