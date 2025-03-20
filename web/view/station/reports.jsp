<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Báo Cáo Kiểm Định Khí Thải</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <jsp:include page="../common/header.jsp" />
        <jsp:include page="../common/topnav.jsp" />
        <main class="container">
            <h2 class="form-title">Báo Cáo Kiểm Định Khí Thải</h2>


            <div class="statistics-section">
                <div class="stat-card">
                    <h3>Tổng số kiểm định</h3>
                    <p class="stat-value">${totalInspections}</p>
                </div>
                <div class="stat-card">
                    <h3>Số xe đạt</h3>
                    <p class="stat-value">${passCount}</p>
                </div>
                <div class="stat-card">
                    <h3>Số xe không đạt</h3>
                    <p class="stat-value">${failCount}</p>
                </div>
                <div class="stat-card">
                    <h3>Tỷ lệ đạt</h3>
                    <p class="stat-value">${passRate}%</p>
                </div>
            </div>

            <h3 class="table-title">Danh Sách Kiểm Định</h3>
            <table class="data-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Biển số xe</th>
                        <th>Cơ sở kiểm định</th>
                        <th>Ngày kiểm định</th>
                        <th>Kết quả</th>
                        <th>CO2 (%)</th>
                        <th>HC (ppm)</th>
                        <th>Ghi chú</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="record" items="${records}">
                        <tr>
                            <td>${record.recordID}</td>
                            <td>${record.plateNumber}</td>
                            <td>${record.stationName}</td>
                            <td>${record.inspectionDate}</td>
                            <td>${record.result}</td>
                            <td>${record.co2Emission}</td>
                            <td>${record.hcEmission}</td>
                            <td>${record.comments}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/view/station/viewRecord?id=${record.recordID}" class="btn btn-small">Chi tiết</a>
                                <a href="${pageContext.request.contextPath}/view/station/printCertificate?id=${record.recordID}" class="btn btn-small">In chứng nhận</a>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty records}">
                        <tr>
                            <td colspan="9" class="empty-table">Không có dữ liệu kiểm định</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
            <div class="summary-container">
                <h3>Tổng Kết</h3>
                <p>Tổng số xe kiểm tra: ${totalInspections}</p>
                <p>Số xe đạt: ${passCount} (${passRate}%)</p>
                <p>Số xe không đạt: ${failCount} (${failRate}%)</p>
            </div>
        </main>
        <jsp:include page="../common/footer.jsp" />
    </body>
</html>