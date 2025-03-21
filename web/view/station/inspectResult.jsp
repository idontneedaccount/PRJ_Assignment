<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản Lý Danh Sách Đăng Ký Kiểm Tra</title>
    </head>
    <body>
        <jsp:include page="../common/header.jsp" />
        <jsp:include page="../common/topnav.jsp" />
        <h2 class="form-title">Quản Lý Danh Sách Kiểm Tra</h2>
        <div class="table-container">
            <table class="data-table">
                <thead>
                    <tr>
                        <th>Mã Số</th>
                        <th>Biển Số Xe</th>
                        <th>Chủ Sở Hữu</th>
                        <th>Ngày Đăng Ký</th>
                        <th>Trạng Thái</th>
                        <th>Thao Tác</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="inspection" items="${inspections}">
                        <tr>
                            <td>${inspection.recordId}</td>
                            <td>${inspection.licensePlate}</td>
                            <td>${inspection.ownerName}</td>
                            <td>${inspection.inspectionDate}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${inspection.isActive == 1}">
                                        <span class="status-approved">Đã duyệt</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="status-pending">Chưa duyệt</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <c:if test="${inspection.isActive == 0}">
                                    <form action="${pageContext.request.contextPath}/approveInspection" method="post">
                                        <input type="hidden" name="recordId" value="${inspection.recordId}">
                                        <button type="submit" class="btn btn-small">Duyệt</button>
                                    </form>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </body>
</html>
