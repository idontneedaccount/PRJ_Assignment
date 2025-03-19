<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/view/common/header.jsp" %>
<%@ include file="/view/common/topnav.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />

<div class="container">
    <h2>Kiểm Định Xe</h2>
    <h3>Danh sách xe cần kiểm định</h3>
    <c:choose>
        <c:when test="${empty pendingVehicles}">
            <p>Không có xe nào cần kiểm định hôm nay.</p>
        </c:when>
        <c:otherwise>
            <table class="table" border="1">
                <tr>
                    <th>Biển số xe</th>
                    <th>Thực hiện kiểm định</th>
                </tr>
                <c:forEach var="vehicle" items="${pendingVehicles}">
                    <tr>
                        <td>${vehicle.plateNumber}</td>
                        <td>
                            <!-- Form thực hiện kiểm định trực tiếp tại Dashboard -->
                            <form action="${pageContext.request.contextPath}/inspection" method="post">
                                <input type="hidden" name="vehicleId" value="${vehicle.vehicleId}" />
                                <div class="form-group">
                                    <label for="co2Emission_${vehicle.vehicleId}">CO2 (g/km):</label>
                                    <input type="number" step="0.01" name="co2Emission" id="co2Emission_${vehicle.vehicleId}" required />
                                </div>
                                <div class="form-group">
                                    <label for="hcEmission_${vehicle.vehicleId}">HC (g/km):</label>
                                    <input type="number" step="0.01" name="hcEmission" id="hcEmission_${vehicle.vehicleId}" required />
                                </div>
                                <div class="form-group">
                                    <label for="result_${vehicle.vehicleId}">Kết quả:</label>
                                    <select name="result" id="result_${vehicle.vehicleId}" required>
                                        <option value="Đạt">PASS</option>
                                        <option value="Không đạt">FAIL</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="comments_${vehicle.vehicleId}">Ghi chú:</label>
                                    <textarea name="comments" id="comments_${vehicle.vehicleId}" rows="2"></textarea>
                                </div>
                                <div class="form-group">
                                    <button type="submit">Xác nhận kiểm định</button>
                                </div>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:otherwise>
    </c:choose>
    <hr />
</div>

<%@ include file="/view/common/footer.jsp" %>
