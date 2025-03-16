<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard - Nhân Viên Kiểm Định</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <jsp:include page="../common/header.jsp" />
        <jsp:include page="../common/topnav.jsp" />
        <main class="container">
            <h2 class="form-title">Lịch Kiểm Định Hôm Nay</h2>
            <c:choose>
                <c:when test="${empty scheduledInspections}">
                    <p>Không có lịch kiểm định nào hôm nay.</p>
                </c:when>
                <c:otherwise>
                    <table>
                        <thead>
                            <tr>
                                <th>Biển Số Xe</th>
                                <th>Chủ Xe</th>
                                <th>Cơ Sở Kiểm Định</th>
                                <th>Ngày Lên Lịch</th>
                                <th>Trạng Thái</th>
                                <th>Hành Động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="schedule" items="${scheduledInspections}">
                                <tr>
                                    <td>${schedule.vehicle.plateNumber}</td>
                                    <td>${schedule.owner.fullName}</td>
                                    <td>${schedule.station.name}</td>
                                    <td>${schedule.inspectionDate}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${schedule.result != null}">
                                                <c:out value="${schedule.result}" />
                                            </c:when>
                                            <c:otherwise>
                                                <c:out value="Chưa có kiểm định" />
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:if test="${schedule.result == null}">
                                            <a href="${pageContext.request.contextPath}/view/inspector/performInspection?recordID=${schedule.recordID}" class="btn btn-primary">Thực Hiện</a>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
        </main>
        <jsp:include page="../common/footer.jsp" />
    </body>
</html>