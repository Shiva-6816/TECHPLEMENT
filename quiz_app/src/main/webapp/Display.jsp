<%@page import="dao.QuestionDao"%>
<%@ page import="dto.Question" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quiz Page</title>
    <style>
        /* Copying exact CSS from signup.jsp */
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

        .quiz-container {
            width: 80%;
            max-width: 900px;
            background: #ffffff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            display: flex;
            justify-content: flex-start;
            align-items: center;
            position: relative;
            opacity: 0;
            transform: translateY(20px);
            animation: fadeIn 0.8s ease-out forwards;
        }

        @keyframes fadeIn {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .quiz-container .quiz-section {
            flex: 1;
            padding: 0 20px;
        }

        h2 {
            font-size: 28px;
            color: #6a11cb;
            margin-bottom: 20px;
            text-align: center;
        }

        /* Styling question text same as signup input fields */
        .question-text {
            display: block;
            font-size: 16px;
            margin-bottom: 5px;
            color: #555;
        }

        /* Matching input fields and radio buttons */
        input[type="radio"] {
            display: none;
        }

        .quiz-options {
            display: block;
            margin-bottom: 15px;
            font-size: 16px;
            color: #333;
            background: #f9f9f9;
            padding: 12px;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        .quiz-options:hover {
            background: #e3e3e3;
        }

        /* Selected option effect */
        .quiz-options.selected {
            background: #6a11cb;
            color: white;
            font-weight: bold;
        }

        /* Button styles */
    button {
    width: 100%;
    max-width: 300px;
    padding: 12px 15px;
    font-size: 16px;
    border: none;
    border-radius: 8px;
    background-color: #6a11cb; /* Match the login button */
    color: white;
    font-weight: bold;
    cursor: pointer;
    transition: all 0.2s;
}

button:hover {
    background: linear-gradient(135deg, #d15b1b, #b51e1e);
}
    

        /* Copying the same image placement from signup.jsp */
        .illustration-section {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        .illustration-section img {
            width: 80%;
            max-width: 300px;
            height: auto;
            border-radius: 10px;
            object-fit: cover;
        }

        @media (max-width: 768px) {
            .quiz-container {
                width: 90%;
                padding: 30px;
                flex-direction: column;
            }

            h2 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>

<%
    List<Question> list = (List<Question>) session.getAttribute("questions");
    int currentIndex = (Integer) session.getAttribute("currentIndex");
    int score = (Integer) session.getAttribute("score");
    Question question = list.get(currentIndex);
%>

<div class="quiz-container">
    <div class="quiz-section">
        <h2>Question <%= currentIndex + 1 %> of <%= list.size() %>:</h2>
        <label class="question-text"><%= question.getQuestionName() %></label>

        <form action="quiz" method="post">
            <label class="quiz-options">
                <input type="radio" name="answer" value="<%= question.getOptionA() %>" required> <%= question.getOptionA() %>
            </label>
            <label class="quiz-options">
                <input type="radio" name="answer" value="<%= question.getOptionB() %>"> <%= question.getOptionB() %>
            </label>
            <label class="quiz-options">
                <input type="radio" name="answer" value="<%= question.getOptionC() %>"> <%= question.getOptionC() %>
            </label>
            <label class="quiz-options">
                <input type="radio" name="answer" value="<%= question.getOptionD() %>"> <%= question.getOptionD() %>
            </label>

            <%
                if (currentIndex < list.size() - 1) {
            %>
                <button type="submit" name="next">Next</button>
            <%
                } else {
            %>
                <button type="submit" name="submit">Submit</button>
            <%
                }
            %>
        </form>
    </div>

    <!-- Illustration Section copied from signup.jsp -->
    <div class="illustration-section">
        <img src="https://images.prismic.io/statrys/94ea7e33-5a25-43e7-9ee2-1699cab49a45_entrepreneur-working.png?ixlib=gatsbyFP&auto=compress%2Cformat&fit=max&rect=0%2C0%2C1361%2C1361&w=680&h=680" 
             alt="Quiz Illustration">
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const options = document.querySelectorAll(".quiz-options");

        options.forEach(option => {
            option.addEventListener("click", function () {
                options.forEach(opt => opt.classList.remove("selected")); // Remove selection from all
                this.classList.add("selected"); // Highlight selected option
                this.querySelector("input").checked = true; // Select radio button
            });
        });
    });
</script>

</body>
</html>
