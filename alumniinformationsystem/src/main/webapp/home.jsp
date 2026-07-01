<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Alumni Information System</title>
    <link 
        rel="stylesheet" 
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" 
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
            text-align: center;
            width: 360px;
            padding: 40px;
            background: rgba(255, 255, 255, 0.8);
            border-radius: 16px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.1);
            backdrop-filter: blur(8px);
        }

        h1 {
            margin-bottom: 40px;
            font-weight: 700;
            color: #444;
            text-shadow: none;
        }

        /* Button container with horizontal layout */
        .button-container {
            display: flex;
            flex-direction: row; /* Side by side layout */
            justify-content: center;
            gap: 12px; /* Spacing between buttons */
            flex-wrap: wrap; /* Wrap to next line on narrow screens */
        }

        a.button {
            background-color: #c1e1ec;  /* pastel blue */
            color: #2f4f4f;             /* dark slate gray */
            padding: 14px 24px;
            border-radius: 12px;
            font-size: 17px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            text-decoration: none;
            transition: transform 0.3s ease, box-shadow 0.3s ease, background-color 0.3s ease;
            box-shadow: 0 4px 15px rgba(193, 225, 236, 0.6);
            border: 2px solid transparent;
            user-select: none;
            border-color: #86b7c7;
        }

        a.button i {
            margin-right: 10px;
            font-size: 18px;
            transition: transform 0.3s ease;
        }

        a.button:hover,
        a.button:focus {
            background-color: #e7f1f7;
            box-shadow:
                0 0 12px 3px #92c3d4,
                0 0 24px 6px #a6d0e0;
            transform: scale(1.06);
            border-color: #68a1b4;
            outline: none;
            color: #1f3838;
        }

        a.button:hover i,
        a.button:focus i {
            transform: translateY(-5px) rotate(15deg);
        }

        a.button:active {
            transform: scale(0.98);
            box-shadow: 0 0 8px 2px #89b0c1;
        }

        /* Responsive */
        @media (max-width: 600px) {
            .container {
                width: 90%;
                padding: 30px 20px;
            }
            .button-container {
                flex-wrap: wrap;
                gap: 10px;
            }
            a.button {
                font-size: 15px;
                padding: 12px 16px;
                flex: 1 1 45%; /* Adjust width on small screens */
                justify-content: center;
            }
            a.button i {
                font-size: 16px;
                margin-right: 8px;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Welcome to the Alumni Information System</h1>

    <div class="button-container">
        <a href="home.jsp" class="button"><i class="fas fa-home"></i>Home</a>
        <a href="register.jsp" class="button"><i class="fas fa-user-plus"></i>Register</a>
        <a href="login.jsp" class="button"><i class="fas fa-sign-in-alt"></i>Login</a>
        <a href="events.jsp" class="button"><i class="fas fa-calendar-alt"></i>Events</a>
        <a href="admin.jsp" class="button"><i class="fas fa-user-shield"></i>Admin</a>
    </div>

    <div class="message">
        <%
            String message = (String) session.getAttribute("message");
            if (message != null) {
                out.println(message);
                session.removeAttribute("message");
            }
        %>
    </div>

    <div class="abstract">
        <h2>About the Alumni Information System</h2>
        <p>The Alumni Information System is designed to connect alumni with their peers and the institution. It provides a platform for alumni to:</p>
        <ul>
            <li>Register for events and networking opportunities.</li>
            <li>Update their profiles with personal and professional information.</li>
            <li>Provide feedback and suggestions to improve alumni relations.</li>
            <li>Access resources and support from the institution.</li>
        </ul>
        <p>Join us in fostering a strong alumni community!</p>
    </div>
</div>

</body>
</html>
