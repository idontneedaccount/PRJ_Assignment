<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.Vehicle" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Kết Quả Kiểm Định</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="/view/common/header.jsp"/>
    <jsp:include page="/view/common/topnav.jsp"/>

    <main class="dashboard">
        <div class="container">
            <h2 class="form-title">Kết Quả Kiểm Định</h2>
            
            <div class="result-section ${result == 'Đạt' ? '' : 'error'}">
                <h3>${result == 'Đạt' ? 'Xe Đạt Tiêu Chuẩn!' : 'Xe Không Đạt Tiêu Chuẩn!'}</h3>

                <h4><span>Biển số xe:</span> ${vehicle.plateNumber}</h4>
                <h4><span>CO2 Emission:</span> ${co2Emission} g/km</h4>
                <h4><span>HC Emission:</span> ${hcEmission} g/km</h4>
                <h4><span>Kết quả:</span> ${result}</h4>
                
                <c:if test="${not empty comments}">
                    <h4><span>Ghi chú:</span> ${comments}</h4>
                </c:if>
            </div>

            <a href="${pageContext.request.contextPath}/Inspector" class="btn btn-primary">Quay lại danh sách kiểm định</a>
        </div>
    </main>

    <jsp:include page="/view/common/footer.jsp"/>
</body>
</html>
