<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<style>
    /* Body styling */
    body {
        font-family: 'Poppins', sans-serif;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background-color: #f0f4fc;
    }

    /* Card container */
    .card {
        background: #ffffff;
        border-radius: 15px;
        width: 400px;
        padding: 40px 30px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      position: relative;
        text-align: center;
    }
   /* Circle decoration */
    .circle {
        width: 90px;
        height: 90px;
        background-color: #6a11cb; /* Replace with actual color from the image */
        border-radius: 50%;
        position: absolute;
        top: -45px;
        left: calc(50% - 45px);
        display: flex;
        justify-content: center;
        align-items: center;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }
   .circle img {
        width: 50px;
        height: 50px;
    }

    /* Header styling */
    h1 {
        margin-top: 50px;
        margin-bottom: 20px;
        font-size: 22px;
       font-weight: 600;
        color: #333;
    }

    p {
        font-size: 14px;
        color: #555;
        margin-bottom: 20px;
    }

    /* Form styling */
    form {
        width: 100%;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    label {
        font-size: 14px;
        text-align: left;
        display: block;
        margin-bottom: 5px;
        color: #666;
        width: 100%;
       max-width: 300px;
    }
    input[type="tel"], input[type="password"] {
        width: 100%;
        max-width: 300px;
        padding: 12px 15px;
        margin-bottom: 20px;
        border: 1px solid #e0e0e0;
        border-radius: 8px;
        font-size: 14px;
        color: #333;
        outline: none;
        background-color: #f9f9f9;
        transition: border-color 0.3s ease, box-shadow 0.3s ease;
    }
    

    input[type="tel"]:focus, input[type="password"]:focus {
        border-color: #2575fc;
        box-shadow: 0 0 5px rgba(106, 17, 203, 0.3);
    }

   button {
        width: 100%;
        max-width: 300px;
        padding: 12px 15px;
        font-size: 16px;
        border: none;
        border-radius: 8px;
        background-color: #6a11cb; /* Match the circle color */
        color: white;
        font-weight: bold;
        cursor: pointer;
        transition: all 0.2s;
    }

    button:hover {
        background: linear-gradient(135deg, #d15b1b, #b51e1e);
    }

    /* Footer link */
    .footer {
        margin-top: 20px;
        font-size: 12px;
        color: #666;
    }

    .footer a {
        color: #2575fc;
        text-decoration: none;
        font-weight: bold;
    }

    .footer a:hover {
        text-decoration: underline;
    }

  /* Message Styling */
    h1.dynamic-message {
        font-size: 24px;
        font-weight: 700;
        text-align: center;
        color: #6a11cb;
        margin-bottom: 20px;
        background: linear-gradient(135deg, #6a11cb, #2575fc);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        text-transform: uppercase;
        letter-spacing: 1px;
        animation: fade-in 1s ease-in-out;
    }

    /* Animation */
    @keyframes fade-in {
        from {
            opacity: 0;
            transform: translateY(-10px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
  
</style>
</head>
<body>
<% String message =(String)request.getAttribute("key"); 
if(message != null){
%>
<h1 class="dynamic-message"><%=message%></h1>
<%} %>

<div class="card">
   <div class="circle">
        <img src="https://cdn.iconscout.com/icon/free/png-256/user-1648810-1401302.png" alt="User Icon">
    </div>
    <h1>Welcome to Quiz App </h1>
    <p>Please login to your account</p>
    <form action="logIn" method="post">
        <label for="phone">Phone:</label>
        <input type="tel" placeholder="Enter your phone" name="phone" id="phone">
        
        <label for="password">Password:</label>
        <input type="password" placeholder="Enter your password" name="password" id="password">
        <button type="submit">Login</button>
    </form>
    <div class="footer">
        <p>Don't have an account? <a href="signUp.jsp">Sign up</a></p>
    </div>
</div>

</body>
</html>
