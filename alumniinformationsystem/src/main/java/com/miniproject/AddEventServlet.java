package com.miniproject;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.HttpServlet;
@WebServlet("/AddEventServlet")
public class AddEventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DB_URL = "jdbc:mysql://localhost:3306/alumniinformationsystem";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("eventName");
        String date = request.getParameter("eventDate");
        String time = request.getParameter("eventTime");
        String location = request.getParameter("eventLocation");
        String description = request.getParameter("eventDescription");
        HttpSession session = request.getSession();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String sql = "INSERT INTO events (id,name, date, time, location, description) VALUES (?, ?, ?, ?, ?,?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, 0);
            stmt.setString(2, name);
            stmt.setString(3, date);
            stmt.setString(4, time);
            stmt.setString(5, location);
            stmt.setString(6, description);
            int rows = stmt.executeUpdate();
            if (rows > 0) {
            	List<String> emails = new ArrayList<>();
            	try {
            	    Statement stmt2 = conn.createStatement();
            	    ResultSet rs = stmt2.executeQuery("SELECT email FROM alumni");
            	    while (rs.next()) {
            	        emails.add(rs.getString("email"));
            	    }
            	    rs.close();
            	    stmt2.close();
            	    conn.close();
            	    String message="New Event Added: " + name +"\n\nAn event has been scheduled in the Alumni Information System.\n\nEvent: " + name + "\nDate: " + date + "\nTime: " + time + "\nLocation: " + location + "\nDescription: " + description;
            	              	    boolean sent = EmailSender.secretMail(message,"user1",emails);
            	    System.out.println("Emails sent: " + sent);
            	} catch (Exception e) {
            	    e.printStackTrace();
            	}
                session.setAttribute("message", "Event added successfully!");
            } else {
                session.setAttribute("message", "Failed to add event.");
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
