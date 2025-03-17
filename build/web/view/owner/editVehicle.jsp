<%-- 
    Document   : editVehicle
    Created on : Mar 16, 2025, 10:00:00 AM
    Author     : [Your Name]
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="model.Vehicle" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Vehicle</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <jsp:include page="../common/header.jsp"/>
        <jsp:include page="../common/topnav.jsp"/>
        <jsp:useBean id="vehicleToEdit" class="model.Vehicle" scope="request"> </jsp:useBean>
            <div class="container">
                <h2 class="form-title">Chỉnh Sửa Phương Tiện</h2>
                <form action="Vehicles" method="POST">
                    <input type="hidden" name="action" value="edit">
                    <input type="hidden" name="vehicleID" value="<jsp:getProperty name="vehicleToEdit" property="vehicleID" />">
                <table>
                    <tr>
                        <td><label class="form-label">Mã Số Xe</label></td>
                        <td><input type="text" name="vehicleID" value="<jsp:getProperty name="vehicleToEdit" property="vehicleID"  /> " readonly></td>
                    </tr>
                    <tr>
                        <td><label class="form-label">Biển Số:</label></td>
                        <td><input type="text" name="plateNumber" value="<jsp:getProperty name="vehicleToEdit" property="plateNumber" />" required></td>
                    </tr>
                    <tr>
                        <td><label class="form-label">Hãng Xe:</label></td>
                        <td><input type="text" name="brand" value="<jsp:getProperty name="vehicleToEdit" property="brand" />" required></td>
                    </tr>
                    <tr>
                        <td><label class="form-label">Mẫu Xe:</label></td>
                        <td><input type="text" name="model" value="<jsp:getProperty name="vehicleToEdit" property="model" />" required></td>
                    </tr>
                    <tr>
                        <td><label class="form-label">Năm Sản Xuất:</label></td>
                        <td><input type="number" name="manufactureYear" value="<jsp:getProperty name="vehicleToEdit" property="manufactureYear" />" required></td>
                    </tr>
                    <tr>
                        <td><label class="form-label">Số Động Cơ:</label></td>
                        <td><input type="text" name="engineNumber" value="<jsp:getProperty name="vehicleToEdit" property="engineNumber" />" required></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <input type="submit" value="Cập Nhật" class="btn btn-primary">
                            <input type="button" value="Hủy" class="btn" style="color: white; background-color: #3498db; margin-top: 5px" 
                                   onclick="location.href = '${pageContext.request.contextPath}/view/owner/Vehicles?action=list'">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </body>
</html>