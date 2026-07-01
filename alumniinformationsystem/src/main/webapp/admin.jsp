<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Admin Login</title>
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

      /* Button styles */
      .button {
          display: inline-block; /* Inline block for buttons */
          background-color: transparent; /* Transparent background */
          color: #2f4f4f; /* Dark slate gray */
          padding: 14px 24px;
          border: 2px solid #86b7c7; /* Border for buttons */
          border-radius: 12px; /* Rounded corners */
          font-size: 17px;
          text-align: center; /* Center text */
          text-decoration: none; /* Remove underline */
          transition: background-color 0.3s ease, border-color 0.3s ease;
          margin: 5px; /* Space between buttons */
      }

      .button:hover {
          background-color: #e7f1f7; /* Change background on hover */
          border-color: #68a1b4; /* Change border color on hover */
      }

      input[type="submit"], button {
          background-color: #c1e1ec; /* pastel blue */
          color: #2f4f4f; /* dark slate gray */
          padding: 14px 24px;
          border-radius: 12px;
          font-size: 17px;
          cursor: pointer;
          border: 2px solid #86b7c7; /* Add border */
          transition: background-color 0.3s ease, border-color 0.3s ease;
      }

      input[type="submit"]:hover, button:hover {
          background-color: #e7f1f7; /* Change background on hover */
          border-color: #68a1b4; /* Change border color on hover */
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

      /* Navigation button container */
      .nav-buttons {
          display: flex; /* Use flexbox for horizontal layout */
          justify-content: center; /* Center the buttons */
          flex-wrap: wrap; /* Allow wrapping on smaller screens */
          margin-bottom: 20px; /* Space below the buttons */
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
    <h1> Alumni Information System</h1>

    <div class="nav-buttons">
         <a href="home.jsp" class="button" tabindex="1"><i class="fas fa-home"></i>Home</a>
      <a href="register.jsp" class="button" tabindex="2"><i class="fas fa-user-plus"></i>Register</a>
      <a href="login.jsp" class="button" tabindex="3"><i class="fas fa-sign-in-alt"></i>Login</a>
      <a href="events.jsp" class="button" tabindex="4"><i class="fas fa-calendar-alt"></i>Events</a>
      <a href="admin.jsp" class="button" tabindex="5"><i class="fas fa-user-shield"></i>Admin</a>
    </div>

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

    <%
        String msg = request.getParameter("msg");
        if (msg != null) {
            out.println("<script>alert('Invalid username and password');</script>");
        }
    %>

    <h2>Admin Login</h2>
    <form action="admindashboard.jsp" method="post">
        <div class="mb-3">
            <label for="username" class="form-label">Username</label>
            <input type="text" name="username" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" name="password" class="form-control" required>
        </div>
        <button type="submit">Login</button>
    </form>
</div>

</body>
</html>
