<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Vehicle" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Vehicle Result</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <jsp:include page="../common/header.jsp" />
        <jsp:include page="../common/topnav.jsp" />
        <jsp:useBean id="vehicle" class="model.Vehicle" scope="request"> </jsp:useBean>
            <div class="container">
                <h2 class="form-title">Kết Quả Chỉnh Sửa Phương Tiện</h2>

            <c:set var="vehicle" value="${requestScope.vehicle}" />
            <div class="result_section ${vehicle == null ? 'error' : ''}">
                <c:choose>
                    <c:when test="${vehicle == null}">
                        <h3>Chỉnh sửa phương tiện thất bại</h3>
                    </c:when>
                    <c:otherwise>
                        <table border="0">
                            <tr>
                                <td colspan="2">Kết quả chỉnh sửa phương tiện:</td>
                            </tr>
                            <tr>
                                <td>Mã phương tiện:</td>
                                <td>${vehicle.vehicleID}</td>
                            </tr>
                            <tr>
                                <td>Biển Số:</td>
                                <td>${vehicle.plateNumber}</td>
                            </tr>
                            <tr>
                                <td>Hãng Xe:</td>
                                <td>${vehicle.brand}</td>
                            </tr>
                            <tr>
                                <td>Mẫu Xe:</td>
                                <td>${vehicle.model}</td>
                            </tr>
                            <tr>
                                <td>Năm Sản Xuất:</td>
                                <td>${vehicle.manufactureYear}</td>
                            </tr>
                            <tr>
                                <td>Số Động Cơ:</td>
                                <td>${vehicle.engineNumber}</td>
                            </tr>
                        </table>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="form-group" style="text-align: center;margin-top: 200px;">
                <div class='form-group'>
                    <a href='Vehicles?action=list' class='btn btn-primary'>Back to List</a>
                </div>
            </div>
        </div>

        <jsp:include page="../common/footer.jsp" />
    </body>
</html>
