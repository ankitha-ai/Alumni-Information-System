package com.miniproject;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/alumniinformationsystem";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "SELECT name FROM alumni WHERE email = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet res = stmt.executeQuery();

            if (res.next()) {
                String name = res.getString("name");
                HttpSession session = request.getSession();
                session.setAttribute("alumniName", name);
                session.setAttribute("alumniEmail", email); // Add this
                response.sendRedirect("dashboard.jsp"); // Change this if you have a profile page
            } else {
                out.println("<h3 style='color:red;'>Invalid email or password.</h3>");
                out.println("<a href='login.jsp'>Try Again</a>");
            }

            stmt.close();
            conn.close();
        } catch (Exception e) {
            out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
            e.printStackTrace(out);
        }
    }
}
