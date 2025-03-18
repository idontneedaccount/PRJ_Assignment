/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.*;
import jakarta.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.ArrayList;
import model.InspectionRecord;
import model.InspectionStation;
import model.Vehicle;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author PC
 */
public class InspectionServlet extends HttpServlet {

    private InspectionDAO inspectionDAO;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InspectionServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InspectionServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userID = (Integer) session.getAttribute("userID");
        if (userID == null) {
            response.sendRedirect("Login");
        } else {
            response.setContentType("text/html;charset=UTF-8");
            String action = request.getParameter("action");
            if (action.equals("list")) {
                ArrayList<InspectionRecord> records = InspectionDAO.getInspectionRecords();
                request.setAttribute("inspectionRecords", records);
                request.getRequestDispatcher("inspectionList.jsp").forward(request, response);
            } else if (action.equals("add")) {
                ArrayList<Vehicle> vehicles = VehicleDAO.getVehiclesByOwner(userID);
                ArrayList<InspectionStation> stations = InspectionDAO.getInspectionStations();
                request.setAttribute("vehicles", vehicles);
                request.setAttribute("stations", stations);
                request.getRequestDispatcher("scheduleInspection.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int vehicleId = Integer.parseInt(request.getParameter("vehicleId"));
        int stationId = Integer.parseInt(request.getParameter("stationId"));

        String dateStr = request.getParameter("inspectionDate");
        String timeStr = request.getParameter("inspectionTime");

        Timestamp dateTime = convertToTimestamp(dateStr, timeStr);
        InspectionRecord inspection = InspectionDAO.addInspection(vehicleId, stationId, dateTime);
        if (inspection != null) {
            request.setAttribute("inspection", inspection);
            
        } else {
            request.setAttribute("inspection", null);
        }

        request.getRequestDispatcher("scheduleResult.jsp").forward(request, response);
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

    private Timestamp convertToTimestamp(String date, String time) {
        try {
            String dateTimeStr = date + " " + time;
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
            LocalDateTime localDateTime = LocalDateTime.parse(dateTimeStr, formatter);
            return Timestamp.valueOf(localDateTime);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
