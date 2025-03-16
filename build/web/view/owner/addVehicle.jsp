<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Thêm Xe Mới</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <jsp:include page="../common/header.jsp"/>
        <jsp:include page="../common/topnav.jsp"/>
        <div class="container">
            <div class="vehicle-form">
                <h2 class="form-title">Thêm Phương Tiện</h2>
                <form action="Vehicles" method="POST">
                    <input type="hidden" name="action" value="add">
                    <div class="form-group">
                        <label class="form-label">Biển Số Xe:</label>
                        <input class="form-input" type="text" name="plateNumber" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Hãng Xe:</label>
                        <input class="form-input" type="text" name="brand" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Mẫu Xe:</label>
                        <input class="form-input" type="text" name="model" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Năm Sản Xuất:</label>
                        <input class="form-input" type="number" name="manufactureYear" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Số Động Cơ:</label>
                        <input class="form-input" type="text" name="engineNumber" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Add Vehicle</button>
                </form>
            </div>
        </div>
        <jsp:include page="../common/footer.jsp"/>
    </body>
</html>