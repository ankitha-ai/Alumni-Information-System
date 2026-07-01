<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Events - Alumni Information System</title>
    <link 
        rel="stylesheet" 
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" 
        crossorigin="anonymous" />
    <style>
        /* Background gradient animation with light pastel shades */
        @keyframes backgroundGradient {
            0% {
                background-position: 0% 50%;
            }
            50% {
                background-position: 100% 50%;
            }
            100% {
                background-position: 0% 50%;
            }
        }

        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(
                270deg, 
                #a8edea, 
                #fed6e3, 
                #fef9d7, 
                #d0f4de
            );
            background-size: 800% 800%;
            animation: backgroundGradient 15s ease infinite;
            color: #555;
            user-select: none;
        }

        .container {
            text-align: left; /* Align text to the left */
            width: 90%; /* Set width to 90% for responsiveness */
            max-width: 800px; /* Max width for larger screens */
            padding: 40px; /* Increased padding for spaciousness */
            margin: 20px; /* Margin around the container */
            background: rgba(255, 255, 255, 0.9); /* Slightly more opaque background */
            border-radius: 16px; /* Rounded corners */
            box-shadow: 0 8px 30px rgba(0,0,0,0.1); /* Subtle shadow for depth */
            backdrop-filter: blur(8px); /* Blur effect for background */
        }

        h1 {
            margin-bottom: 20px; /* Reduced margin for better spacing */
            font-weight: 700;
            color: #444;
            text-align: center; /* Center the main heading */
        }

        table {
            width: 100%; /* Full width for the table */
            border-collapse: collapse; /* Collapse borders */
            margin-top: 20px; /* Space above the table */
        }

        th, td {
            border: 1px solid #ccc; /* Border for table cells */
            padding: 10px; /* Padding for table cells */
            text-align: left; /* Align text to the left */
        }

        th {
            background-color: #f2f2f2; /* Light background for headers */
        }

        .back-link {
            display: block; /* Block display for the link */
            margin-top: 20px; /* Space above the link */
            text-align: center; /* Center the link */
            color: #007bff; /* Link color */
            text-decoration: none; /* Remove underline */
        }

        .back-link:hover {
            text-decoration: underline; /* Underline on hover */
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
        </tr>
        <%
                index++;
                }

                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
            }
        %>
    </table>

    <a href="dashboard.jsp" class="back-link">Back to Home</a>
</div>

</body>
</html>