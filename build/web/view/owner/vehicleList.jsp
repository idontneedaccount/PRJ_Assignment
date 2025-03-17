<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="model.Vehicle" %>
<%@page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Danh Sách Xe</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <jsp:include page="../common/header.jsp"/>
        <jsp:include page="../common/topnav.jsp"/>
        <main class="dashboard">
            <c:choose>
                <c:when test="${empty vehicles}">
                    <p>Chưa có phương tiện nào trong danh sách của bạn.</p>
                </c:when>
                <c:otherwise>
                    <h2 class="form-title">Danh Sách Xe</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Biển Số</th>
                                <th>Hãng Xe</th>
                                <th>Mẫu Xe</th>
                                <th>Năm Sản Xuất</th>
                                <th>Số Động Cơ</th>
                                <th colspan="3" >Hành Động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="vehicle" items="${vehicles}">
                                <tr>
                                    <td>${vehicle.plateNumber}</td>
                                    <td>${vehicle.brand}</td>
                                    <td>${vehicle.model}</td>
                                    <td>${vehicle.manufactureYear}</td>
                                    <td>${vehicle.engineNumber}</td>
                                    <td>
                                        <input type="button" value="View" class="btn btn-primary"
                                               onclick="location.href = '${pageContext.request.contextPath}/view/owner/Vehicles?action=view&id=${vehicle.vehicleID}'"/>
                                    </td>
                                    <td>
                                        <input type="button" value="Edit" class="btn btn-primary"
                                               onclick="location.href = '${pageContext.request.contextPath}/view/owner/Vehicles?action=edit&id=${vehicle.vehicleID}'"/>
                                        <input type="hidden" id="id" name="id" value="${vehicle.vehicleID}">
                                    </td>
                                    <td>
                                        <input type="button" value="Delete" class="btn btn-primary"
                                               onclick="if (confirm('Are you sure?'))
                                                           location.href = '${pageContext.request.contextPath}/view/owner/Vehicles?action=delete&id=${vehicle.plateNumber}'"/>
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