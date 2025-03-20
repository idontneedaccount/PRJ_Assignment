<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Kiểm Tra Xe</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/topnav.jsp" />
    <main class="container">
        <h2 class="form-title">Kiểm Tra Xe</h2>
        <div class="vehicle-form">
            <form action="${pageContext.request.contextPath}/view/station/inspectVehicle" method="post">
                <input type="hidden" name="registrationId" value="${registrationId}">
                <input type="hidden" name="vehicleId" value="1"> 
                <input type="hidden" name="stationId" value="1"> 
                <div class="form-group">
                    <label for="co2Emission">CO2 (%):</label>
                    <input type="number" id="co2Emission" name="co2Emission" step="0.01" required>
                </div>
                <div class="form-group">
                    <label for="hcEmission">HC (ppm):</label>
                    <input type="number" id="hcEmission" name="hcEmission" step="0.01" required>
                </div>
                <div class="form-group">
                    <label for="status">Trạng thái:</label>
                    <select id="status" name="status" required>
                        <option value="Đạt">Đạt</option>
                        <option value="Không đạt">Không đạt</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="comment">Ghi chú:</label>
                    <textarea id="comment" name="comment"></textarea>
                </div>
                <div class="form-buttons">
                    <button type="submit" class="btn btn-primary">Lưu Kết Quả</button>
                    <a href="${pageContext.request.contextPath}/view/station/manageStation" class="btn btn-secondary">Quay Lại</a>
                </div>
            </form>
        </div>
    </main>
    <jsp:include page="../common/footer.jsp" />
</body>
</html>