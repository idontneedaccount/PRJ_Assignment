<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Lịch sử đăng kiểm</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    </head>
    <body>
        <jsp:include page="../common/header.jsp"/>
        <jsp:include page="../common/topnav.jsp"/>

        <div class="container">
            <h2>Lịch sử đăng kiểm</h2>

            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Biển số</th>
                        <th>Cơ sở kiểm định</th>
                        <th>Ngày kiểm định</th>
                        <th>Kết quả</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="record" items="${inspectionRecords}">
                        <tr>
                            <td>${record.recordID}</td>
                            <td>${record.vehicleName}</td>
                            <td>${record.stationName}</td>
                            <td>${record.scheduledDate}</td>
                            <td>${record.status}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <jsp:include page="../common/footer.jsp"/>
    </body>
</html>
