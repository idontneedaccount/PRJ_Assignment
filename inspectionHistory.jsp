<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/view/common/header.jsp" %>
<%@ include file="/view/common/topnav.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />

<div class="container">
    <h2>Lịch sử Kiểm Định</h2>
    <c:choose>
        <c:when test="${empty inspectionHistory}">
            <p>Không có lịch sử kiểm định nào.</p>
        </c:when>
        <c:otherwise>
            <table class="table" border="1">
                <tr>
                    <th>Mã Kiểm Định</th>
                    <th>Biển số xe</th>
                    <th>Ngày Kiểm Định</th>
                    <th>Kết quả</th>
                    <th>CO2 (g/km)</th>
                    <th>HC (g/km)</th>
                </tr>
                <c:forEach var="record" items="${inspectionHistory}">
                    <tr>
                        <td>${record.recordID}</td>
                        <td>${record.licensePlate}</td>
                        <td>${record.inspectionDate}</td>
                        <td>${record.result}</td>
                        <td>${record.co2Emission}</td>
                        <td>${record.hcEmission}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:otherwise>
    </c:choose>
</div>

<%@ include file="/view/common/footer.jsp" %>
