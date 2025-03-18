<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tra cứu kiểm định</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
</head>
<body>

    <jsp:include page="../common/header.jsp"/>
    <jsp:include page="../common/topnav.jsp"/>

    <div class="container">
        <h2>Tra cứu kiểm định khí thải</h2>

        <div class="form-group">
            <form action="SearchVehicle" method="post">
                <input type="hidden" name="action" value="search">
                <table>
                    <tr>
                        <td><label class="form-label">Chọn biển số xe:</label></td>
                        <td>
                            <select name="plateNumber" required class="form-control">
                                <option value="">-- Chọn biển số xe --</option>
                                <c:forEach var="plate" items="${plateNumbers}">
                                    <option value="${plate}" ${plate eq selectedPlate ? 'selected' : ''}>${plate}</option>
                                </c:forEach>
                            </select>
                        </td>
                        <td>
                            <input type="submit" value="TRA CỨU" class="btn btn-primary">
                        </td>
                    </tr>
                </table>
            </form>
        </div>

        <c:if test="${not empty record}">
            <div class="result">
                <h3>Kết quả kiểm định</h3>
                <table class="inspection-table">
                    <tr>
                        <td><strong>Biển số xe:</strong></td>
                        <td>${selectedPlate}</td>
                    </tr>
                    <tr>
                        <td><strong>Trạm kiểm định:</strong></td>
                        <td>${record.stationName}</td>
                    </tr>
                    <tr>
                        <td><strong>Ngày kiểm định:</strong></td>
                        <td>${record.scheduledDate}</td>
                    </tr>
                    <tr>
                        <td><strong>Kết quả:</strong></td>
                        <td>
                            <span style="color: ${record.status eq 'Đạt' ? 'green' : 'red'}">
                                ${record.status}
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>CO2 Emission:</strong></td>
                        <td>${record.cO2Emission} g/km</td>
                    </tr>
                    <tr>
                        <td><strong>HC Emission:</strong></td>
                        <td>${record.hCEmission} g/km</td>
                    </tr>
                    <tr>
                        <td><strong>Ghi chú:</strong></td>
                        <td>${record.comment}</td>
                    </tr>
                </table>
            </div>
        </c:if>

        <c:if test="${empty record and not empty selectedPlate}">
            <div class="alert alert-danger">
                Không tìm thấy kết quả kiểm định cho biển số xe <strong>${selectedPlate}</strong>.
            </div>
        </c:if>
    </div>

    <jsp:include page="../common/footer.jsp"/>

</body>
</html>
