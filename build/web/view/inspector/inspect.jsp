<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.Vehicle" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Kiểm Định Xe</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <jsp:include page="/view/common/header.jsp"/>
        <jsp:include page="/view/common/topnav.jsp"/>
        <main class="dashboard">
            <c:if test="${not empty message}">
                <p style="color: green; font-weight: bold;">${message}</p>
            </c:if>

            <c:choose>
                <c:when test="${empty pendingVehicles}">
                    <p>Không có xe nào cần kiểm định hôm nay.</p>
                </c:when>
                <c:otherwise>
                    <h2 class="form-title">Danh sách xe cần kiểm định</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Biển số xe</th>
                                <th>Thực hiện kiểm định</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="vehicle" items="${pendingVehicles}">
                                <tr>
                                    <td>${vehicle.plateNumber}</td>
                                    <td>
                                        <form action="Inspector" method="post" onsubmit="return confirm('Bạn có chắc chắn muốn xác nhận kiểm định cho xe này?');">
                                            <input type="hidden" name="vehicleId" value="${vehicle.vehicleID}" />

                                            <div>
                                                <label for="co2Emission_${vehicle.vehicleID}">CO2 (g/km):</label>
                                                <input type="number" step="0.01" min="0" name="co2Emission" id="co2Emission_${vehicle.vehicleID}" required />
                                            </div>

                                            <div>
                                                <label for="hcEmission_${vehicle.vehicleID}">HC (g/km):</label>
                                                <input type="number" step="0.01" min="0" name="hcEmission" id="hcEmission_${vehicle.vehicleID}" required />
                                            </div>

                                            <div>
                                                <label for="result_${vehicle.vehicleID}">Kết quả:</label>
                                                <select name="result" id="result_${vehicle.vehicleID}" required>
                                                    <option value="Pass">Đạt</option>
                                                    <option value="Fail">Không Đạt</option>
                                                </select>
                                            </div>

                                            <div>
                                                <label for="comments_${vehicle.vehicleID}">Ghi chú:</label>
                                                <textarea name="comments" id="comments_${vehicle.vehicleID}" rows="2"></textarea>
                                            </div>

                                            <div>
                                                <button type="submit">Xác nhận kiểm định</button>
                                            </div>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
        </main>
        <jsp:include page="/view/common/footer.jsp"/>
    </body>
</html>