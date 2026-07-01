<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" crossorigin="anonymous">
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

        .button-container {
            display: flex;
            flex-direction: column;
            gap: 16px;
            margin-top: 20px;
        }

        a.button {
            background-color: #c1e1ec;
            color: #2f4f4f;
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

        a.button:hover, a.button:focus {
            background-color: #e7f1f7;
            box-shadow: 0 0 12px 3px #92c3d4, 0 0 24px 6px #a6d0e0;
            transform: scale(1.06);
            border-color: #68a1b4;
            outline: none;
            color: #1f3838;
        }

        /* Responsive */
        @media (max-width: 600px) {
            .container {
                width: 90%;
                padding: 30px 20px;
            }
            .button-container {
                gap: 10px;
            }
            a.button {
                font-size: 15px;
                padding: 12px 16px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Admin Dashboard</h1>
        <div class="button-container">
            <a href="admindashboard.jsp" class="button"><i class="fas fa-tachometer-alt"></i> Home</a>
            <a href="addEvent.jsp" class="button"><i class="fas fa-calendar-plus"></i> Add Event</a>
            <a href="viewEvent.jsp" class="button"><i class="fas fa-calendar-check"></i> View Event</a>
            <a href="logout.jsp" class="button"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </div>
</body>
</html>
