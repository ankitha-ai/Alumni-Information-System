<%@page import="java.sql.ResultSet"%>
<%@page import="com.miniproject.DBConnection"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Event - Alumni Information System</title>
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
            width: 360px;
            padding: 40px;
            background: rgba(255, 255, 255, 0.8);
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

        .form-label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 15px;
        }

        .form-control:focus {
            outline: none;
            border-color: #68a1b4;
            box-shadow: 0 0 8px #a6d0e0;
        }

        button[type="submit"] {
            width: 100%;
            padding: 14px;
            background-color: #c1e1ec;
            border: 2px solid #86b7c7;
            border-radius: 12px;
            font-size: 17px;
            color: #2f4f4f;
            cursor: pointer;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }

        button[type="submit"]:hover {
            background-color: #e7f1f7;
            box-shadow: 0 0 12px 3px #92c3d4, 0 0 24px 6px #a6d0e0;
            transform: scale(1.06);
            border-color: #68a1b4;
            outline: none;
            color: #1f3838;
        }

        a {
            display: block;
            margin-top: 20px;
            text-align: center;
            color: #444;
            text-decoration: none;
            font-weight: 600;
        }

        a:hover {
            color: #68a1b4;
        }

        /* Responsive */
        @media (max-width: 600px) {
            .container {
                width: 90%;
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Add Event</h1>

    <div class="message">
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            ResultSet rs = DBConnection.getStatement("SELECT * FROM events WHERE id=" + id).executeQuery();
            if (rs.next()) {
        %>
    </div>

    <form action="UpdateEventServlet" method="post">
        <input type="hidden" name="id" value="<%= rs.getInt(1) %>">

        <label for="eventName" class="form-label">Event Name</label>
        <input type="text" id="eventName" name="eventName" value="<%= rs.getString("name") %>" class="form-control" required>

        <label for="eventDate" class="form-label">Event Date</label>
        <input type="date" id="eventDate" name="eventDate" value="<%= rs.getString("date") %>" class="form-control" required>

        <label for="eventTime" class="form-label">Event Time</label>
        <input type="time" id="eventTime" name="eventTime" value="<%= rs.getString("time") %>" class="form-control" required>

        <label for="eventLocation" class="form-label">Event Location</label>
        <input type="text" id="eventLocation" name="eventLocation" value="<%= rs.getString("location") %>" class="form-control" required>

        <label for="eventDescription" class="form-label">Event Description</label>
        <input type="text" id="eventDescription" name="eventDescription" value="<%= rs.getString("description") %>" class="form-control" required>

        <button type="submit">Update Event</button>
    </form>

    <%
            }
        %>

    <a href="admindashboard.jsp">Back to Dashboard</a>
</div>

</body>
</html>
