<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav>
    <ul>
        <c:choose>
            <c:when test="${sessionScope.role == 'Owner'}">
                <li><a href="${pageContext.request.contextPath}/view/owner/dashboard.jsp">Trang Chủ</a></li>
                <li><a href="${pageContext.request.contextPath}/view/owner/vehicle.jsp">Quản Lý Phương Tiện</a></li>
                <li><a href="${pageContext.request.contextPath}/view/owner/schedule.jsp">Quản Lý Kiểm Định</a></li>
                </c:when>
                <c:when test="${sessionScope.role == 'Inspector'}">
                <li><a href="${pageContext.request.contextPath}/view/inspector/dashboard.jsp">Trang Chủ</a></li>
                <li><a href="${pageContext.request.contextPath}/view/inspector/Inspector">Kiểm Định</a></li>
                <li><a href="${pageContext.request.contextPath}/view/inspector/Inspector?action=viewHistory">Lịch Kiểm Định</a></li>
                </c:when>
                <c:when test="${sessionScope.role == 'Station'}">
                <li><a href="${pageContext.request.contextPath}/view/station/dashboard.jsp">Trang Chủ</a></li>
                <li><a href="${pageContext.request.contextPath}/view/station/manageStation.jsp">Quản lý Cơ Sở</a></li>
                <li><a href="${pageContext.request.contextPath}/view/station/reports.jsp">Báo Cáo</a></li>
                </c:when>
                <c:when test="${sessionScope.role == 'Police'}">
                <li><a href="${pageContext.request.contextPath}/view/police/dashboard.jsp">Trang Chủ</a></li>
                <li><a href="${pageContext.request.contextPath}/view/police/SearchVehicle">Tra Cứu Xe</a></li>
                </c:when>
                <c:when test="${sessionScope.role == 'Admin'}">
                <li><a href="${pageContext.request.contextPath}/view/admin/dashboard.jsp">Trang Chủ</a></li>
                <li><a href="${pageContext.request.contextPath}/view/admin/user.jsp">Quản Lý Người Dùng</a></li>
                </c:when>
                <c:otherwise>
                <li><a href="${pageContext.request.contextPath}/home">Trang Chủ</a></li>
                </c:otherwise>
            </c:choose>
        <li><a href="${pageContext.request.contextPath}/Logout">Đăng xuất</a></li>
    </ul>
</nav>