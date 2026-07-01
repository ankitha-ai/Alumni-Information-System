<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Event - Alumni Information System</title>
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

        h2 {
            margin-bottom: 10px;
            font-weight: 600;
            color: #333;
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
        }

        .button-container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            gap: 12px;
            margin-top: 20px;
        }

        a.button {
            background-color: #c1e1ec;
            color: #2f4f4f;
            padding: 14px 24px;
            border-radius: 12px;
            font-size: 17px;
            text-align: center;
            cursor: pointer;
            text-decoration: none;
            transition: transform 0.3s ease, box-shadow 0.3s ease, background-color 0.3s ease;
            box-shadow: 0 4px 15px rgba(193, 225, 236, 0.6);
            border: 2px solid transparent;
            user-select: none;
            border-color: #86b7c7;
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
                flex: 1 1 45%;
                justify-content: center;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Add Event</h1>

    <div class="message">
        <%
            // Display any messages from the session
            String message = (String) session.getAttribute("message");
            if (message != null) {
                out.println(message);
                session.removeAttribute("message"); // Clear the message after displaying
            }
        %>
    </div>

    <form action="AddEventServlet" method="post">
        <div class="mb-3">
            <label for="eventName" class="form-label">Event Name</label>
            <input type="text" id="eventName" name="eventName" class="form-control" required>
        </div>

        <div class="mb-3">
            <label for="eventDate" class="form-label">Event Date</label>
            <input type="date" id="eventDate" name="eventDate" class="form-control" required>
        </div>

        <div class="mb-3">
            <label for="eventTime" class="form-label">Event Time</label>
            <input type="time" id="eventTime" name="eventTime" class="form-control" required>
        </div>

        <div class="mb-3">
            <label for="eventLocation" class="form-label">Event Location</label>
            <input type="text" id="eventLocation" name="eventLocation" class="form-control" required>
        </div>

        <div class="mb-3">
            <label for="eventDescription" class="form-label">Event Description</label>
            <textarea id="eventDescription" name="eventDescription" class="form-control" rows="4" required></textarea>
        </div>

        <button type="submit" class="form-control">Add Event</button>
    </form>

    <div class="button-container">
        <a href="admindashboard.jsp" class="button">Back to Dashboard</a>
    </div>
</div>

</body>
</html>
