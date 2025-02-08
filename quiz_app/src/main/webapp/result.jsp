<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quiz Result</title>
    <style>
        /* General Reset */
        body, html {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background: #ffffff;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
        }

        /* Container for the result */
        .result-container {
            background: rgba(0, 0, 0, 0.05);
            padding: 60px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(10px);
            max-width: 600px;
            width: 90%;
            animation: fadeIn 1s ease-in-out;
        }

        /* Heading */
        h2 {
            font-size: 36px;
            margin-bottom: 20px;
            font-weight: 700;
            color: #333;
        }

        /* Progress Bar */
        .progress-bar {
            width: 100%;
            height: 25px;
            background: rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
            margin-bottom: 30px;
            position: relative;
        }

        .progress-bar-fill {
            height: 100%;
            background: linear-gradient(135deg, #28a745, #218838);
            border-radius: 10px;
            transition: width 1s ease-in-out;
        }

        /* Score Text */
        .score-text {
            font-size: 26px;
            font-weight: 600;
            margin-bottom: 30px;
        }

        /* Play Again Button */
        .play-again-btn {
            padding: 15px 35px;
            font-size: 20px;
            border: none;
            border-radius: 10px;
            background: linear-gradient(135deg, #ff6f61, #ff4b2b);
            color: #fff;
            cursor: pointer;
            transition: transform 0.3s ease, background 0.3s ease;
        }

        .play-again-btn:hover {
            background: linear-gradient(135deg, #ff4b2b, #ff6f61);
            transform: scale(1.05);
        }

        /* Animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>

<%
    Integer score = (Integer) session.getAttribute("score"); // Get score from session
    if (score == null) {
        score = 0; // Default to 0 if no score is found
    }
    int totalQuestions = 8; // Total number of questions
%>

<div class="result-container">
    <h2>Quiz Result</h2>
    <div class="progress-bar">
        <div class="progress-bar-fill" id="progressBarFill"></div>
    </div>
    <div class="score-text" id="scoreText">Your Score: <%= score %> / <%= totalQuestions %></div>
    <a href="instruction.jsp">
        <button class="play-again-btn">Play Again</button>
    </a>
</div>

<script>
    // JavaScript to animate the progress bar and display the score dynamically
    window.onload = function () {
        const score = JSON.stringify(<%= score %>);
        const totalQuestions = JSON.stringify(<%= totalQuestions %>);
        const progressBarFill = document.getElementById('progressBarFill');
        const scoreText = document.getElementById('scoreText');

        // Convert string values back to numbers
        const numericScore = Number(score);
        const numericTotalQuestions = Number(totalQuestions);

        // Calculate the percentage of the score
        const percentage = (numericScore / numericTotalQuestions) * 100;

        // Animate the progress bar
        progressBarFill.style.width = percentage + '%';

        // Optional: Add a delay to the score text for a smoother experience
        setTimeout(() => {
            scoreText.textContent = `Your Score: ${numericScore} / ${numericTotalQuestions}`;
        }, 500);
    };
</script>

</body>
</html>
