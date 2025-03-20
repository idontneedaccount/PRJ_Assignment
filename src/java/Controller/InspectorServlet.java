package Controller;

import dao.VehicleDAO;
import dao.InspectorDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import model.InspectionRecord;
import model.Vehicle;

public class InspectorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        // Nếu action = viewHistory => hiển thị trang lịch sử
        if ("viewHistory".equals(action)) {
            List<InspectionRecord> history = InspectorDAO.getInspectionHistory();
            System.out.println("List size: " + history.size());
            request.setAttribute("inspectionHistory", history);
            request.getRequestDispatcher("/view/inspector/inspectorHistory.jsp")
                    .forward(request, response);
        } else {
            // Ngược lại, hiển thị danh sách xe cần kiểm định
            List<Vehicle> pendingVehicles = InspectorDAO.getPendingInspections();
            request.setAttribute("pendingVehicles", pendingVehicles);
            // Chuyển sang trang inspect.jsp
            request.getRequestDispatcher("/view/inspector/inspect.jsp")
                    .forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Lấy dữ liệu từ form
            int vehicleId = Integer.parseInt(request.getParameter("vehicleId"));
            double co2Emission = Double.parseDouble(request.getParameter("co2Emission"));
            double hcEmission = Double.parseDouble(request.getParameter("hcEmission"));
            String result = request.getParameter("result");
            String comments = request.getParameter("comments");

            // Kiểm tra session
            HttpSession session = request.getSession();
            Integer inspectorId = (Integer) session.getAttribute("userID");
            if (inspectorId == null) {
                // Nếu chưa đăng nhập, chuyển về trang login
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }

            // Giả sử stationId = 1, tuỳ vào logic của bạn
            int stationId = 1;

            // Thêm bản ghi kiểm định vào DB
            boolean success = InspectorDAO.addInspectionRecord(
                    vehicleId, stationId, inspectorId,
                    co2Emission, hcEmission,
                    result, comments
            );

            if (success) {
                // Lấy thông tin xe để hiển thị ở trang kết quả
                Vehicle vehicle = VehicleDAO.getVehicleById(vehicleId);

                // Gửi dữ liệu sang result.jsp
                request.setAttribute("vehicle", vehicle);
                request.setAttribute("co2Emission", co2Emission);
                request.setAttribute("hcEmission", hcEmission);
                request.setAttribute("result", result);
                request.setAttribute("comments", comments);

                // Chuyển sang trang result.jsp
                request.getRequestDispatcher("/view/inspector/result.jsp")
                        .forward(request, response);
            } else {
                // Nếu thêm bản ghi thất bại, hiển thị thông báo lỗi
                request.setAttribute("errorMessage", "Có lỗi khi thực hiện kiểm định!");
                request.getRequestDispatcher("/view/common/error.jsp")
                        .forward(request, response);
            }
        } catch (NumberFormatException e) {
            // Trường hợp dữ liệu đầu vào không hợp lệ
            request.setAttribute("errorMessage", "Dữ liệu nhập vào không hợp lệ!");
            request.getRequestDispatcher("/view/common/error.jsp")
                    .forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "InspectorServlet - Xử lý kiểm định khí thải";
    }
}