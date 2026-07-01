package com.miniproject;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    
	private static final long serialVersionUID = 1L;

	private static final String DB_URL = "jdbc:mysql://localhost:3306/alumniinformationsystem";
	private static final String DB_USER = "root";
	private static final String DB_PASSWORD = "";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    response.setContentType("text/html");
	    PrintWriter out = response.getWriter();

	    String name = request.getParameter("name");
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");
	    String gradYear = request.getParameter("gradYear");
	    String course = request.getParameter("course");
	    String contact = request.getParameter("contact");

	    Connection conn = null;
	    PreparedStatement checkStmt = null;
	    PreparedStatement insertStmt = null;

	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

	        // Check if email already exists
	        String checkQuery = "SELECT email FROM alumni WHERE email = ?";
	        checkStmt = conn.prepareStatement(checkQuery);
	        checkStmt.setString(1, email);
	        ResultSet rs = checkStmt.executeQuery();

	        if (rs.next()) {
	            out.println("<html><body>");
	            out.println("<h3 style='color:red;'>Email already registered. Please try another.</h3>");
	            out.println("<a href='register.jsp'>Back to Registration</a>");
	            out.println("</body></html>");
	        } else {
	            String insertQuery = "INSERT INTO alumni (name, email, password, gradYear, course, contact) VALUES (?, ?, ?, ?, ?, ?)";
	            insertStmt = conn.prepareStatement(insertQuery);
	            insertStmt.setString(1, name);
	            insertStmt.setString(2, email);
	            insertStmt.setString(3, password);
	            insertStmt.setString(4, gradYear);
	            insertStmt.setString(5, course);
	            insertStmt.setString(6, contact);

	            int rows = insertStmt.executeUpdate();

	            if (rows > 0) {
	                response.sendRedirect("login.jsp");
	            } else {
	                out.println("<html><body>");
	                out.println("<h3 style='color:red;'>Registration failed. Please try again.</h3>");
	                out.println("<a href='register.jsp'>Back</a>");
	                out.println("</body></html>");
	            }
	        }
	    } catch (ClassNotFoundException e) {
	        out.println("<h3 style='color:red;'>Database driver not found.</h3>");
	        e.printStackTrace(out);
	    } catch (SQLException e) {
	        out.println("<h3 style='color:red;'>Database error: " + e.getMessage() + "</h3>");
	        e.printStackTrace(out);
	    } finally {
	        try {
	            if (checkStmt != null) checkStmt.close();
	            if (insertStmt != null) insertStmt.close();
	            if (conn != null) conn.close();
	        } catch (SQLException e) {
	            e.printStackTrace(out);
	        }
	    }
	}
}