<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Added Vehicle</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <jsp:include page="../common/header.jsp" />
        <jsp:include page="../common/topnav.jsp" />

        <div class="container">
            <h2 class="form-title">Kết Quả Thêm Phương Tiện</h2>

            <div class="result-section ${vehicle == null ? 'error' : ''}">
                <c:if test="${vehicle == null}">
                    <h3>Thêm phương tiện thất bại.</h3>
                </c:if>
                <c:if test="${vehicle != null}">
                    <h3>Thêm phương tiện thành công:</h3>
                    <h4><span>Biển Số:</span> <c:out value="${vehicle.plateNumber}"/></h4>
                    <h4><span>Hãng Xe:</span> <c:out value="${vehicle.brand}"/></h4>
                    <h4><span>Mẫu Xe:</span> <c:out value="${vehicle.model}"/></h4>
                    <h4><span>Năm Sản Xuất:</span> <c:out value="${vehicle.manufactureYear}"/></h4>
                    <h4><span>Số Động Cơ:</span> <c:out value="${vehicle.engineNumber}"/></h4>
                </c:if>
            </div>
            <div class="form-group" style="text-align: center;margin-top: 200px;">
                <div class='form-group'>
                    <a href='Vehicles?action=list' class='btn btn-primary'>Back to List</a>
                </div>
            </div>
        </div>

        <jsp:include page="../common/footer.jsp"/>
    </body>
</html>