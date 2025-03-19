/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dao.InspectorDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;
import model.InspectionRecord;
import model.Vehicle;

/**
 *
 * @author duong
 */
public class InspectorServlet extends HttpServlet {

    private InspectorDAO inspectionDAO;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InspectorServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InspectorServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    public void init() throws ServletException {
        // Lấy đối tượng Connection từ ServletContext (đã được thiết lập trong Listener)
        Connection conn = (Connection) getServletContext().getAttribute("DBConnection");
        inspectionDAO = new InspectorDAO(conn);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("viewHistory".equals(action)) {
            List<InspectionRecord> history = inspectionDAO.getInspectionHistory();
            request.setAttribute("inspectionHistory", history);
            request.getRequestDispatcher("/view/inspector/inspectionHistory.jsp").forward(request, response);
        } else {
            // Mặc định: hiển thị dashboard (danh sách xe cần kiểm định)
            List<Vehicle> pendingVehicles = inspectionDAO.getPendingInspections();
            System.out.println("gg");
            request.setAttribute("pendingVehicles", pendingVehicles);
            request.getRequestDispatcher("/view/inspector/dashboard.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Xử lý form kiểm định khí thải từ dashboard
        int vehicleId = Integer.parseInt(request.getParameter("vehicleId"));
        double co2Emission = Double.parseDouble(request.getParameter("co2Emission"));
        double hcEmission = Double.parseDouble(request.getParameter("hcEmission"));
        String result = request.getParameter("result");
        String comments = request.getParameter("comments");

        HttpSession session = request.getSession();
        // Lấy inspectorId từ session (giả sử session lưu thuộc tính userID cho Inspector)\n
        int inspectorId = (int) session.getAttribute("userID");
        // Giả sử stationId được xác định (có thể lấy từ session hoặc mặc định)\n
        int stationId = 1;

        boolean success = inspectionDAO.addInspectionRecord(vehicleId, stationId, inspectorId, co2Emission, hcEmission, result, comments);
        if (success) {
            response.sendRedirect(request.getContextPath() + "/inspection");
        } else {
            request.setAttribute("errorMessage", "Có lỗi khi thực hiện kiểm định!");
            request.getRequestDispatcher("/view/common/error.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
