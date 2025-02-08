<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quiz Instructions</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: url('https://assets.toptal.io/images?url=https%3A%2F%2Fbs-uploads.toptal.io%2Fblackfish-uploads%2Fcomponents%2Fblog_post_page%2F4088783%2Fcover_image%2Fretina_500x200%2Fcover-empty-state-ux-design-be008dc86eedd6126549e2899bb76d01.png') no-repeat center center/cover;
        }

        .quiz-instructions {
            width: 60%;
            max-width: 800px;
            background: #ffffff;
            padding: 50px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            text-align: left;
            font-family: 'Arial', sans-serif;
            color: #333;
        }

        .quiz-instructions h2 {
            color: #2575fc;
            font-size: 28px;
            margin-bottom: 25px;
            text-align: center;
            font-weight: 600;
        }

        .quiz-instructions ul {
            font-size: 18px;
            color: #333;
            margin-left: 30px;
            margin-bottom: 30px;
        }

        .quiz-instructions ul li {
            margin-bottom: 15px;
        }

        .button-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }

        .button-container form, 
        .button-container a {
            flex: 1;
            display: flex;
        }

        button {
            width: 100%;
            padding: 15px;
            font-size: 18px;
            border: none;
            border-radius: 10px;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .play-quiz {
            background: linear-gradient(135deg, #28a745, #218838);
        }

        .play-quiz:hover {
            background: linear-gradient(135deg, #218838, #28a745);
        }

        .create-quiz {
            background: linear-gradient(135deg, #dc3545, #c82333);
        }

        .create-quiz:hover {
            background: linear-gradient(135deg, #c82333, #dc3545);
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

<% String message = (String) request.getAttribute("log"); 
if (message != null) { %>
    <h1 class="dynamic-message"><%= message %></h1>
<% } %> 

<div class="quiz-instructions">
    <h2>Quiz Instructions</h2>
    
    <ul>
        <li><strong>Read Each Question Carefully:</strong> Take your time to read all answer options before choosing.</li>
        <li><strong>Time Limit:</strong> You have [insert time limit] to complete the quiz.</li>
        <li><strong>No External Help:</strong> Do not use notes or external assistance.</li>
        <li><strong>Submit Your Answers:</strong> Click "Submit" to finalize your responses.</li>
        <li><strong>Scoring:</strong> Correct answers earn points.</li>
    </ul>

    <div class="button-container">
        <form action="instruction">
            <button class="play-quiz">Play Quiz</button>
        </form>
        <a href="Edit.jsp">
            <button class="create-quiz">Create Quiz Question</button>
        </a>
    </div>
</div>

</body>
</html>
