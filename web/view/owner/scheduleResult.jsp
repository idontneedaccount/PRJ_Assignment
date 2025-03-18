<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kết Quả Đặt Lịch Kiểm Định</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <jsp:include page="../common/header.jsp" />
        <jsp:include page="../common/topnav.jsp" />

        <div class="container">
            <h2 class="form-title">Kết Quả Đặt Lịch Kiểm Định</h2>

            <div class="result-section ${inspection == null ? 'error' : ''}">
                <c:if test="${inspection == null}">
                    <h3>Đặt lịch kiểm định thất bại.</h3>
                </c:if>
                <c:if test="${inspection != null}">
                    <h3>Đặt lịch kiểm định thành công:</h3>
                    <h4><span>Biển Số:</span> <c:out value="${inspection.vehicleName}"/></h4>
                    <h4><span>Cơ Sở Kiểm Định:</span> <c:out value="${inspection.stationName}"/></h4>
                    <h4><span>Ngày Kiểm Định:</span> <c:out value="${inspection.scheduledDate}"/></h4>
                    <h4><span>Trạng Thái:</span> <c:out value="${inspection.status}"/></h4>
                </c:if>
            </div>
            <div class="form-group" style="text-align: center;margin-top: 200px;">
                <div class='form-group'>
                    <a href='schedule.jsp' class='btn btn-primary'>Back to List</a>
                </div>
            </div>
        </div>

        <jsp:include page="../common/footer.jsp"/>
    </body>
</html>
