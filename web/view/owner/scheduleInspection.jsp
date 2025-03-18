<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đặt lịch kiểm định</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    </head>
    <body>
        <jsp:include page="../common/header.jsp"/>
        <jsp:include page="../common/topnav.jsp"/>

        <div class="container">
            <h2>Đặt Lịch Kiểm Định Khí Thải</h2>

            <div class="form-group">
                <form action="Inspection" method="POST">
                    <input type="hidden" name="action" value="add">
                    <table>
                        <tr>
                            <td><label class="form-label">Chọn phương tiện:</label></td>
                            <td>
                                <select name="vehicleId" class="form-input">
                                    <c:forEach var="vehicle" items="${vehicles}">
                                        <option value="${vehicle.vehicleID}">${vehicle.plateNumber} - ${vehicle.brand}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <td><label class="form-label">Chọn cơ sở kiểm định:</label></td>
                            <td>
                                <select name="stationId" class="form-input">
                                    <c:forEach var="station" items="${stations}">
                                        <option value="${station.stationId}">${station.name} - ${station.address}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <td><label class="form-label">Chọn ngày kiểm định:</label></td>
                            <td><input type="date" name="inspectionDate" class="form-input" required></td>
                        </tr>

                        <tr>
                            <td><label class="form-label">Chọn giờ kiểm định:</label></td>
                            <td><input type="time" name="inspectionTime" class="form-input" required></td>
                        </tr>

                        <tr>
                            <td></td>
                            <td><input type="submit" value="Xác nhận đặt lịch" class="btn btn-primary"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>

        <jsp:include page="../common/footer.jsp"/>
    </body>
</html>
