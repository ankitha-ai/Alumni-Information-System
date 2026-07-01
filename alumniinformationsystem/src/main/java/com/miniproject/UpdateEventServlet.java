package com.miniproject;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import javax.servlet.http.HttpServlet;

@WebServlet("/UpdateEventServlet")
public class UpdateEventServlet extends HttpServlet {
    
	private static final long serialVersionUID = 1L;
	private static final String DB_URL = "jdbc:mysql://localhost:3306/alumniinformationsystem";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id=Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("eventName");
        String date = request.getParameter("eventDate");
        String time = request.getParameter("eventTime");
        String location = request.getParameter("eventLocation");
        String description = request.getParameter("eventDescription");

        HttpSession session = request.getSession();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "update events set name=?, date=?, time=?, location=?, description=? where id=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            
            stmt.setString(1, name);
            stmt.setString(2, date);
            stmt.setString(3, time);
            stmt.setString(4, location);
            stmt.setString(5, description);
            stmt.setInt(6, id);
            int rows = stmt.executeUpdate();
            if (rows > 0) {
                session.setAttribute("message", "Event updated successfully!");
            } else {
                session.setAttribute("message", "Failed to update event.");
            }

            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("message", "❌ Error: " + e.getMessage());
        }

        response.sendRedirect("addEvent.jsp");
    }
}
