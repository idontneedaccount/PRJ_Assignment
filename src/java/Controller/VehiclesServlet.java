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

public class VehiclesServlet extends HttpServlet {

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
            out.println("<title>Servlet VehiclesServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VehiclesServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userID = (Integer) session.getAttribute("userID");
        if (userID == null) {
            response.sendRedirect("Login");
        } else {
            response.setContentType("text/html;charset=UTF-8");
            String action = request.getParameter("action");
            ArrayList<Vehicle> vehicles = new ArrayList<>();

            if (action == null || action.equals("list")) {
                System.out.println("UserID :" + userID);
                vehicles = VehicleDAO.getVehiclesByOwner(userID);
                request.setAttribute("vehicles", vehicles);
                RequestDispatcher rs = request.getRequestDispatcher("vehicleList.jsp");
                rs.forward(request, response);
            } else if (action.equals("add")) {
                RequestDispatcher rs = request.getRequestDispatcher("addVehicle.jsp");
                rs.forward(request, response);
            } else if (action.equals("view")) {
                int vehicleID = Integer.parseInt(request.getParameter("id"));
                Vehicle vehicle = VehicleDAO.getVehicleById(vehicleID);
                printVehicle(request, response, vehicle);
            } else if (action.equals("edit")) {
                int vehicleID = Integer.parseInt(request.getParameter("id"));
                System.out.println("Vehicle ID" + vehicleID);
                Vehicle vehicle = VehicleDAO.getVehicleById(vehicleID);
                request.setAttribute("vehicleToEdit", vehicle);
                request.setAttribute("vehicles", VehicleDAO.getVehiclesByOwner(userID));
                RequestDispatcher rs = request.getRequestDispatcher("editVehicle.jsp");
                rs.forward(request, response);
            } else if (action.equals("delete")) {
                String vehicleID = request.getParameter("id");
                System.out.println(vehicleID);
                boolean success = VehicleDAO.deleteVehicle(vehicleID);
                try (PrintWriter out = response.getWriter()) {
                    if (!success) {
                        out.println("Deleting vehicle failed!");
                    } else {
                        out.println("<h3>Deleted vehicle</h3>");
                        out.println("<h4>Vehicle ID: " + vehicleID + "</h4>");
                    }
                    out.println("<a href='Vehicles?action=list'>Back to List</a>");
                }
            }
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        int ownerID = (int) session.getAttribute("userID");

        System.out.println(ownerID);

        if (action.equals("add")) {
            String plateNumber = request.getParameter("plateNumber");
            String brand = request.getParameter("brand");
            String model = request.getParameter("model");
            int manufactureYear = Integer.parseInt(request.getParameter("manufactureYear"));
            String engineNumber = request.getParameter("engineNumber");

            Vehicle vehicle = new Vehicle(ownerID, plateNumber, brand, model, manufactureYear, engineNumber);
            boolean success = VehicleDAO.addVehicle(vehicle);
            if (success) {
                request.setAttribute("vehicle", vehicle);
            }
            RequestDispatcher rs = request.getRequestDispatcher("addVehicleResult.jsp");
            rs.forward(request, response);
        } else if (action.equals("edit")) {
            String plateNumber = request.getParameter("plateNumber");
            String brand = request.getParameter("brand");
            String model = request.getParameter("model");
            int manufactureYear = Integer.parseInt(request.getParameter("manufactureYear"));
            String engineNumber = request.getParameter("engineNumber");
            int vehicleID = Integer.parseInt(request.getParameter("vehicleID"));
            Vehicle vehicle = new Vehicle(vehicleID, plateNumber, brand, model, manufactureYear, engineNumber);
            boolean success = VehicleDAO.updateVehicle(vehicle);
            request.setAttribute("vehicle", vehicle);
            RequestDispatcher rs = request.getRequestDispatcher("editVehicleResult.jsp");
            rs.forward(request, response);
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

    protected void printVehicle(HttpServletRequest request, HttpServletResponse response, Vehicle vehicle)
            throws IOException {
        try (PrintWriter out = response.getWriter()) {
            out.println("<html><head><link rel='stylesheet' href='./css/style.css'/></head><body>");
            if (vehicle != null) {
                out.println("<div class='container'>");
                out.println("<h1>Vehicle Details</h1>");
                out.println("<table border='1'>");
                out.println("<tr><td>Biển Số: </td><td>" + vehicle.getPlateNumber() + "</td></tr>");
                out.println("<tr><td>Hãng Xe: </td><td>" + vehicle.getBrand() + "</td></tr>");
                out.println("<tr><td>Mẫu Xe: </td><td>" + vehicle.getModel() + "</td></tr>");
                out.println("<tr><td>Năm Sản Xuất: </td><td>" + vehicle.getManufactureYear() + "</td></tr>");
                out.println("<tr><td>Số Động Cơ: </td><td>" + vehicle.getEngineNumber() + "</td></tr>");
                out.println("</table>");
                out.println("<div class='form-group'><a href='Vehicles?action=list' class='btn btn-primary'>Back to List</a></div>");
                out.println("</div>");
            } else {
                out.println("<h2>Vehicle not found!</h2>");
            }
            out.println("</body></html>");
        }
    }
}
