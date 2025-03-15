/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author PC
 */
public class RegisterServlet extends HttpServlet {

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
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String role = request.getParameter("role").trim();
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        System.out.println("Full Name: " + fullName);
        System.out.println("Email: " + email);
        System.out.println("Password: " + password);
        System.out.println("Role: " + role);
        System.out.println("Phone: " + phone);
        System.out.println("Address: " + address);

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu và xác nhận mật khẩu không khớp!");
            request.getRequestDispatcher("/view/register.jsp").forward(request, response);
            return;
        }

        // Tạo đối tượng User
        User user = new User();
        user.setFullName(fullName);
        user.setEmail(email);
        user.setPassword(password); // Lưu ý: Nên hash mật khẩu trước khi lưu
        user.setRole(role);
        user.setPhone(phone);
        user.setAddress(address);

        // Thêm người dùng vào cơ sở dữ liệu
        boolean success = UserDAO.addUser(user);
        System.out.println("Success: " + success); // Debug: In ra kết quả

        if (success) {
            // Đăng ký thành công, chuyển hướng đến trang đăng nhập
            response.sendRedirect(request.getContextPath() + "/view/login.jsp");
        } else {
            // Đăng ký thất bại, hiển thị thông báo lỗi
            request.setAttribute("error", "Đăng ký thất bại. Vui lòng thử lại!");
            request.getRequestDispatcher("/view/register.jsp").forward(request, response);
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
