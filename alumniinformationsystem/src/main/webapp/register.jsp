<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register - Alumni Information System</title>
    <link 
        rel="stylesheet" 
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" 
        crossorigin="anonymous" />
   <style>
    /* Apply box-sizing border-box universally */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

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
        font-size: 14px; /* Base font size */
    }

    .container {
        text-align: left;
        width: 90%;
        max-width: 600px; /* Maximum width */
        padding: 30px;
        background: rgba(255, 255, 255, 0.85);
        border-radius: 18px;
        box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
        backdrop-filter: blur(10px);
    }

    h1 {
        margin-bottom: 20px;
        font-weight: 700;
        color: #444;
        text-align: center;
        font-size: 1.5rem; /* Reduced heading size */
    }

    h2 {
        margin-bottom: 15px;
        font-weight: 600;
        color: #333;
        font-size: 1.2rem; /* Reduced subheading size */
    }

    .mb-3 {
        margin-bottom: 15px;
    }

    .form-label {
        display: block;
        margin-bottom: 5px;
        font-weight: 500;
    }

    .form-control {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 14px;
    }

    .button-container {
        display: flex;
        justify-content: space-between;
        gap: 10px;
        margin-bottom: 25px;
        flex-wrap: wrap;
    }

    a.button {
        background-color: #c1e1ec;
        color: #2f4f4f;
        padding: 12px 20px;
        border-radius: 12px;
        font-size: 14px;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        text-decoration: none;
        transition: transform 0.3s ease, box-shadow 0.3s ease, background-color 0.3s ease;
        box-shadow: 0 4px 15px rgba(193, 225, 236, 0.6);
        border: 2px solid transparent;
        border-color: #86b7c7;
    }

    a.button i {
        margin-right: 8px;
    }

    a.button:hover,
    a.button:focus {
        background-color: #e7f1f7;
        box-shadow: 0 0 12px 3px #92c3d4, 0 0 24px 6px #a6d0e0;
        transform: scale(1.06);
        border-color: #68a1b4;
        outline: none;
        color: #1f3838;
    }

    /* Responsive adjustments */
    @media (max-width: 768px) {
        .container {
            padding: 25px;
        }

        h1 {
            font-size: 1.3rem;
        }

        h2 {
            font-size: 1.1rem;
        }

        .form-control {
            font-size: 13px;
        }

        a.button {
            font-size: 13px;
            padding: 10px 18px;
            flex: 1 1 48%;
            justify-content: center;
        }
    }
</style>

</head>
<body>

<div class="container">
    <h1>Alumni Information System</h1>

    <div class="button-container">
    <a href="home.jsp" class="button"><i class="fas fa-home"></i>Home</a>
    <a href="register.jsp" class="button"><i class="fas fa-user-plus"></i>Register</a>
    <a href="login.jsp" class="button"><i class="fas fa-sign-in-alt"></i>Login</a>
    <a href="events.jsp" class="button"><i class="fas fa-calendar-alt"></i>Events</a>
    <a href="admin.jsp" class="button"><i class="fas fa-user-shield"></i>Admin</a>
</div>


    <h2>Register</h2>
    <form action="RegisterServlet" method="post">
        <div class="mb-3">
            <label class="form-label">Full Name</label>
            <input type="text" class="form-control" name="name" placeholder="Enter your full name" required />
        </div>
        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" class="form-control" name="email" placeholder="Enter your email" required />
        </div>
        <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" class="form-control" name="password" placeholder="Create a strong password" required />
        </div>
        <div class="mb-3">
            <label class="form-label">Graduation Year</label>
            <input type="number" class="form-control" name="gradYear" placeholder="YYYY format" required />
        </div>
        <div class="mb-3">
            <label class="form-label">Course</label>
            <input type="text" class="form-control" name="course" placeholder="e.g., Computer Science" required />
        </div>
        <div class="mb-3">
            <label class="form-label">Contact Number</label>
            <input type="tel" class="form-control" name="contact" placeholder="Enter your phone number" 
                   pattern="\d{10}" maxlength="10" title="Contact number must be exactly 10 digits" required />
        </div>

        <button type="submit" class="btn btn-success btn-custom w-100">Register</button>
        <div class="text-center mt-3">
            <a href="login.jsp">Already have an account? Login</a>
        </div>
    </form>

    <div class="text-center mt-3">
        <a href="index.jsp" class="text-light">Back to Home</a>
    </div>
</div>
</body>
</html>
