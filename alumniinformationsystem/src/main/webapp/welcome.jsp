<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
    HttpSession Session = request.getSession(false);
    if (session == null || session.getAttribute("email") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String name = (String) session.getAttribute("alumniName");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard - Alumni Info System</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
     <style>
        body {
            background: linear-gradient(135deg, #ff9a9e, #fad0c4);
            color: #333;
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
        }
        .glass-card {
            background: rgba(255, 255, 255, 0.3);
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        .btn-custom {
            padding: 12px 35px;
            border-radius: 30px;
            font-size: 18px;
            transition: 0.3s;
        }
        .btn-custom:hover {
            background: rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4">
    <a class="navbar-brand" href="welcome.jsp">Alumni System</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navMenu">
        <ul class="navbar-nav ms-auto">
            <li class="nav-item"><a class="nav-link" href="profile.jsp">Profile</a></li>
            <li class="nav-item"><a class="nav-link" href="change_password.jsp">Change Password</a></li>
            <li class="nav-item"><a class="nav-link text-danger" href="logout.jsp">Logout</a></li>
        </ul>
    </div>
</nav>

<div class="container d-flex flex-column justify-content-center align-items-center" style="min-height: 100vh;">
    <div class="card text-center">
        <h2>Welcome, <%= name != null ? name : "Alumni" %>!</h2>
        <p class="lead">You are now logged in to the Alumni Information System.</p>
        <div class="mt-4">
            <a href="profile.jsp" class="btn btn-light btn-custom me-3">Profile</a>
            <a href="change_password.jsp" class="btn btn-outline-light btn-custom me-3">Change Password</a>
            <a href="logout.jsp" class="btn btn-danger btn-custom">Logout</a>
        </div>
    </div>
</div>
</body>
</html>
