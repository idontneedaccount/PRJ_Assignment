<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lịch Sử Kiểm Định</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    <jsp:include page="../common/topnav.jsp"/>

    <div class="container">
        <h2 class="form-title">Lịch Sử Kiểm Định</h2>

        <table class="table">
            <thead>
                <tr>
                    <th>Ngày Kiểm Định</th>
                    <th>Phương Tiện</th>
                    <th>Kết Quả</th>
                    <th>CO2 Emission</th>
                    <th>HC Emission</th>
                    <th>Ghi Chú</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty records}">
                        <c:forEach var="record" items="${records}">
                            <tr>
                                <td>${record.inspectionDate}</td>
                                <td>${record.vehicleInfo}</td>
                                <td>${record.result}</td>
                                <td>${record.CO2Emission}</td>
                                <td>${record.HCEmission}</td>
                                <td>${record.comments}</td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="6">Không có dữ liệu kiểm định.</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>

    <jsp:include page="../common/footer.jsp"/>
</body>
</html>
