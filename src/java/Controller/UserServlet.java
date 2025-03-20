/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dao.UserDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.User;

/**
 *
 * @author PC
 */
public class UserServlet extends HttpServlet {

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
            out.println("<title>Servlet UserServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserServlet at " + request.getContextPath() + "</h1>");
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
        Integer adminID = (Integer) session.getAttribute("userID");
        if (adminID == null) {
            response.sendRedirect("Login");
        } else {
            response.setContentType("text/html;charset=UTF-8");
            String action = request.getParameter("action");
            System.out.println("action"+ action);
            ArrayList<User> users = new ArrayList<>();

            if (action == null || action.equals("list")) {
                users = UserDAO.getAllUsers();
                request.setAttribute("users", users);
                RequestDispatcher rs = request.getRequestDispatcher("userList.jsp");
                rs.forward(request, response);
            } else if (action.equals("view")) {
                int userID = Integer.parseInt(request.getParameter("id"));
                User user = UserDAO.getUserById(userID);
                request.setAttribute("user", user);
                RequestDispatcher rs = request.getRequestDispatcher("viewUser.jsp");
                rs.forward(request, response);
            } else if (action.equals("edit")) {
                int userID = Integer.parseInt(request.getParameter("id"));
                User user = UserDAO.getUserById(userID);
                request.setAttribute("userToEdit", user);
                RequestDispatcher rs = request.getRequestDispatcher("editUser.jsp");
                rs.forward(request, response);
            } else if (action.equals("delete")) {
                String email = request.getParameter("email");
                boolean success = UserDAO.deleteUser(email);
                System.out.println("success" + success);
                User user = UserDAO.getUserByEmail(email);
                request.setAttribute("userDelete", user);
                request.setAttribute("success", success);
                RequestDispatcher rs = request.getRequestDispatcher("deleteResult.jsp");
                rs.forward(request, response);
            } else if (action.equals("add")) {
                RequestDispatcher rs = request.getRequestDispatcher("addUser.jsp");
                rs.forward(request, response);

            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        System.out.println("action" + action);
        if (action.equals("edit")) {
            int userID = Integer.parseInt(request.getParameter("userID"));
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String role = request.getParameter("role");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            User user = new User(userID,fullName, email, password, role, phone, address);
            boolean success = UserDAO.updateUser(user);
            System.out.println(success);
            request.setAttribute("user", user);
            RequestDispatcher rs = request.getRequestDispatcher("editUserResult.jsp");
            rs.forward(request, response);
        } else if (action.equals("add")) {
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String role = request.getParameter("role");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");

            if (fullName != null && email != null && role != null && phone != null && address != null) {
                UserDAO userDAO = new UserDAO();
                User user = new User(fullName, email, password, role, phone, address);
                boolean success = UserDAO.addUser(user);

                if (success) {
                    response.sendRedirect("Users?action=list");
                } else {
                    request.setAttribute("errorMessage", "Thêm người dùng thất bại!");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
            }
        }
    }

}
