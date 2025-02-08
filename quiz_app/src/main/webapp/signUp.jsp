<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Sign Up Page</title>
<style>
    /* Body styling with image background */
    body {
        font-family: 'Poppins', sans-serif;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background-image: url('https://cdn.dribbble.com/userupload/21451095/file/original-83af0ed1bda961310fde898a6e104523.jpg?resize=1024x768&vertical=center');
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
    }

    /* Form container styling (white card floating on background) */
    .form-container {
        width: 80%; /* Form container width */
        max-width: 900px;
        background: #ffffff;
        padding: 40px;
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        display: flex;
        justify-content: flex-start; /* Align form to left */
        align-items: center;
        position: relative;
    }

    /* Form section styling */
    .form-container .form-section {
        flex: 1;
        padding: 0 20px;
    }

    /* Header styling */
    h1 {
        font-size: 28px;
        color: #6a11cb;
        margin-bottom: 20px;
        text-align: center;
    }

    /* Input fields and labels */
    label {
        display: block;
        font-size: 14px;
        margin-bottom: 5px;
        color: #555;
    }

    input[type="text"], input[type="number"], input[type="tel"], 
    input[type="email"], input[type="password"] {
        width: 100%;
        padding: 12px;
        margin-bottom: 20px;
        border: 1px solid #ddd;
        border-radius: 8px;
        background-color: #f9f9f9;
        font-size: 14px;
        outline: none;
        transition: border 0.3s ease;
    }

    input[type="text"]:focus, input[type="number"]:focus, 
    input[type="tel"]:focus, input[type="email"]:focus, 
    input[type="password"]:focus {
        border-color: #6a11cb;
        box-shadow: 0 0 5px rgba(106, 17, 203, 0.3);
    }

    /* Button styling */
    button {
        width: 100%;
        padding: 12px;
        font-size: 16px;
        border: none;
        border-radius: 8px;
        background: linear-gradient(135deg, #6a11cb, #2575fc);
        color: white;
        font-weight: bold;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    button:hover {
        background: linear-gradient(135deg, #5a0eab, #1b6ad1);
    }

    /* Illustration section styling */
    .form-container .illustration-section {
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center;
        position: relative;
    }

    .illustration-section img {
        width: 80%; /* Reduce the size */
        max-width: 300px; /* Set a max-width */
        height: auto;
        border-radius: 10px;
        object-fit: cover;
    }

    /* Responsive adjustments for smaller screens */
    @media (max-width: 768px) {
        .form-container {
            width: 90%;
            padding: 30px;
        }

        h1 {
            font-size: 24px;
        }
    }
</style>
</head>
<body>

<!-- Form Container -->
<div class="form-container">
    <!-- Form Section -->
    <div class="form-section">
        <h1>Sign Up to Quiz App</h1>
        <form action="signUp" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" placeholder="Enter your name" name="name" required>

            <label for="age">Age:</label>
            <input type="number" id="age" placeholder="Enter your age" name="age" required>

            <label for="phone">Phone:</label>
            <input type="tel" id="phone" placeholder="Enter your phone" name="phone" required>

            <label for="email">Email:</label>
            <input type="email" id="email" placeholder="Enter your email" name="email" required>

            <label for="password">Password:</label>
            <input type="password" id="password" placeholder="Enter your password" name="password" required>

            <button type="submit">Sign Up</button>
        </form>
    </div>

    <!-- Illustration Section -->
    <div class="illustration-section">
        <img src="https://images.prismic.io/statrys/94ea7e33-5a25-43e7-9ee2-1699cab49a45_entrepreneur-working.png?ixlib=gatsbyFP&auto=compress%2Cformat&fit=max&rect=0%2C0%2C1361%2C1361&w=680&h=680" 
             alt="Sign Up Illustration">
    </div>
</div>

</body>
</html>