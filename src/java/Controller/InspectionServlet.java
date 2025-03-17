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
import model.*;
import dao.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;


/**
 *
 * @author PC
 */
public class InspectionServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet InspectionServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InspectionServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userID = (Integer) session.getAttribute("userID");
        if (userID == null) {
            response.sendRedirect("Login");
            return;
        }
        
        String action = request.getParameter("action");
        if (action == null || action.equals("choose")) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("inspectionChoice.jsp");
            dispatcher.forward(request, response);
        } else if (action.equals("schedule")) {
            ArrayList<Vehicle> vehicles = VehicleDAO.getVehiclesByOwner(userID);
            ArrayList<InspectionStation> stations = InspectionStationDAO.getAllStations();
            request.setAttribute("vehicles", vehicles);
            request.setAttribute("stations", stations);
            RequestDispatcher dispatcher = request.getRequestDispatcher("scheduleInspection.jsp");
            dispatcher.forward(request, response);
        } else if (action.equals("history")) {
            ArrayList<InspectionRecord> records = InspectionRecordDAO.getInspectionHistoryByUser(userID);
            request.setAttribute("records", records);
            RequestDispatcher dispatcher = request.getRequestDispatcher("inspectionHistory.jsp");
            dispatcher.forward(request, response);
        }
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        Integer userID = (Integer) session.getAttribute("userID");
        
        if (userID == null) {
            response.sendRedirect("Login");
            return;
        }
        
        if (action.equals("schedule")) {
            int vehicleID = Integer.parseInt(request.getParameter("vehicleID"));
            int stationID = Integer.parseInt(request.getParameter("stationID"));
            String date = request.getParameter("date");
            boolean success = InspectionRecordDAO.scheduleInspection(vehicleID, stationID, date);
            request.setAttribute("success", success);
            RequestDispatcher dispatcher = request.getRequestDispatcher("scheduleResult.jsp");
            dispatcher.forward(request, response);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
