<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    String email = (String) session.getAttribute("alumniEmail");

    // Redirect if not logged in
    if (email == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Initialize variables
    String name = "", password = "", course = "", contact = "";
    int gradYear = 0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/alumniinformationsystem", "root", ""
        );
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM alumni WHERE email = ?");
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            name = rs.getString("name");
            password = rs.getString("password");
            gradYear = rs.getInt("gradYear");
            course = rs.getString("course");
            contact = rs.getString("contact");
        }
        rs.close();
        ps.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Profile - Alumni Information System</title>
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
            width: 360px; /* Fixed width for the container */
            padding: 40px; /* Padding for the container */
            background: rgba(255, 255, 255, 0.8);
            border-radius: 16px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.1);
            backdrop-filter: blur(8px);
        }

        h1 {
            margin-bottom: 20px; /* Reduced margin for better spacing */
            font-weight: 700;
            color: #444;
            text-align: center; /* Center the main heading */
        }

        h2 {
            margin-bottom: 10px; /* Space between headings and inputs */
            font-weight: 600;
            color: #333;
        }

        .mb-3 {
            margin-bottom: 15px; /* Space between form fields */
        }

        .form-label {
            display: block; /* Ensure labels are block elements */
            margin-bottom: 5px; /* Space between label and input */
            font-weight: 500;
        }

        .form-control {
            width: 100%; /* Full width for inputs */
            padding: 10px; /* Padding for inputs */
            border: 1px solid #ccc; /* Border for inputs */
            border-radius: 5px; /* Rounded corners for inputs */
            margin-bottom: 15px; /* Space below each input */
        }

        input[type="submit"] {
            background-color: #c1e1ec; /* pastel blue */
            color: #2f4f4f; /* dark slate gray */
            padding: 14px 24px;
            border-radius: 12px;
            font-size: 17px;
            cursor: pointer;
            border: none; /* Remove border */
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #e7f1f7; /* Change background on hover */
        }

        .text-center {
            text-align: center; /* Center text */
            margin-top: 20px; /* Space above the link */
        }

        .back-link {
            color: #007bff; /* Link color */
            text-decoration: none; /* Remove underline */
        }

        .back-link:hover {
            text-decoration: underline; /* Underline on hover */
        }

        /* Responsive */
        @media (max-width: 600px) {
            .container {
                width: 90%; /* Full width on small screens */
                padding: 30px 20px; /* Adjust padding */
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Update Your Profile</h2>
    <form action="ProfileServlet" method="post">
        <div class="mb-3">
            <label class="form-label">Name</label>
            <input type="text" class="form-control" name="name" value="<%= name %>" required />
        </div>
        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" class="form-control" name="email" value="<%= email %>" readonly />
        </div>
        <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" class="form-control" name="password" value="<%= password %>" required />
        </div>
        <div class="mb-3">
            <label class="form-label">Graduation Year</label>
            <input type="number" class="form-control" name="gradYear" value="<%= gradYear %>" required />
        </div>
        <div class="mb-3">
            <label class="form-label">Course</label>
            <input type="text" class="form-control" name="course" value="<%= course %>" required />
        </div>
        <div class="mb-3">
            <label class="form-label">Contact Number</label>
            <input type="tel" class="form-control" name="contact" value="<%= contact %>" required />
        </div>
        <input type="submit" value="Update Profile" />
    </form>
    <div class="text-center">
        <a href="dashboard.jsp" class="back-link">Back to Dashboard</a>
    </div>
</div>
</body>
</html>