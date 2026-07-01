package com.miniproject;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        int gradYear = Integer.parseInt(request.getParameter("gradYear"));
        String course = request.getParameter("course");
        String contact = request.getParameter("contact");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/alumniinformationsystem", "root", ""
            );
            PreparedStatement ps = conn.prepareStatement(
                "UPDATE alumni SET name=?, password=?, gradYear=?, course=?, contact=? WHERE email=?"
            );
            ps.setString(1, name);
            ps.setString(2, password);
            ps.setInt(3, gradYear);
            ps.setString(4, course);
            ps.setString(5, contact);
            ps.setString(6, email);

            int rowsUpdated = ps.executeUpdate();
            ps.close();
            conn.close();

            HttpSession session = request.getSession();
            if (rowsUpdated > 0) {
                session.setAttribute("message", "Profile updated successfully!");
            } else {
                session.setAttribute("message", "Update failed. Please try again.");
            }

            response.sendRedirect("profile.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("message", "An error occurred.");
            response.sendRedirect("profile.jsp");
        }
    }
}
