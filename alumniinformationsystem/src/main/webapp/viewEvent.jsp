<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Events - Alumni Information System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" crossorigin="anonymous" />
    <style>
        /* Background gradient animation with light pastel shades */
        @keyframes backgroundGradient {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(270deg, #a8edea, #fed6e3, #fef9d7, #d0f4de);
            background-size: 800% 800%;
            animation: backgroundGradient 15s ease infinite;
            color: #555;
            user-select: none;
        }

        .container {
            text-align: left;
            width: 90%;
            max-width: 800px;
            padding: 40px;
            margin: 20px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 16px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.1);
            backdrop-filter: blur(8px);
        }

        h1 {
            margin-bottom: 20px;
            font-weight: 700;
            color: #444;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .button-container {
            display: flex;
            gap: 10px;
            justify-content: center;
        }

        .button-container a {
            background-color: #f0f8ff; /* Light cyan */
            color: #2f4f4f;
            padding: 10px 20px;
            border-radius: 8px;
            font-size: 16px;
            text-decoration: none;
            border: 2px solid #add8e6; /* Light blue border */
            transition: background-color 0.3s, transform 0.3s;
        }

        .button-container a:hover {
            background-color: #e0ffff; /* Light cyan hover */
            transform: scale(1.05);
        }

        .back-link {
            display: block;
            margin-top: 20px;
            text-align: center;
            color: #007bff;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Event List</h1>

    <div class="message">
        <%
            String msg = (String) session.getAttribute("message");
            if (msg != null) {
                out.println(msg);
                session.removeAttribute("message");
            }
        %>
    </div>

    <table>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Date</th>
            <th>Time</th>
            <th>Location</th>
            <th>Description</th>
            <th>Action</th>
        </tr>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/alumniinformationsystem", "root", "");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM events");
                int index = 1;
                while (rs.next()) {
        %>
        <tr>
            <td><%= index %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getDate("date") %></td>
            <td><%= rs.getTime("time") %></td>
            <td><%= rs.getString("location") %></td>
            <td><%= rs.getString("description") %></td>
           <td>
    <div class="button-container">
        <a href="updateEvent.jsp?id=<%= rs.getInt("id") %>">
            <i class="fas fa-edit"></i> Edit
        </a>
        <a href="deleteEvent.jsp?id=<%= rs.getInt("id") %>" 
           onclick="return confirm('Are you sure you want to delete this event?')">
            <i class="fas fa-trash-alt"></i> Delete
        </a>
    </div>
</td>

        </tr>
        <%
                    index++;
                }
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                out.println("<tr><td colspan='7'>Error: " + e.getMessage() + "</td></tr>");
            }
        %>
    </table>

    <a href="admindashboard.jsp" class="back-link">Back to home</a>
</div>

</body>
</html>
