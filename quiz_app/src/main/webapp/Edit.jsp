<%@page import="dto.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Question</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: url('https://mir-s3-cdn-cf.behance.net/project_modules/2800_opt_1/0041d2139950117.6239075b3d9d2.png') no-repeat center center/cover;
        }

        .form-container {
            width: 50%;
            max-width: 500px;
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            text-align: center;
        }

        h2 {
            color: #1a73e8;
            margin-bottom: 20px;
            font-weight: 600;
        }

        .input-group {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        input {
            width: 100%;
            padding: 12px;
            border: 2px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            outline: none;
            transition: border-color 0.3s ease-in-out;
        }

        input:focus {
            border-color: #1a73e8;
            box-shadow: 0 0 10px rgba(26, 115, 232, 0.3);
        }

        button {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            background: linear-gradient(135deg, #ff416c, #ff4b2b);
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
        }

        button:hover {
            background: linear-gradient(135deg, #ff4b2b, #ff416c);
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(255, 65, 108, 0.3);
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Add a New Question</h2>
    <form action="Edit" method="post">
        <div class="input-group">
            <input type="text" placeholder="Enter question" name="question" required>
            <input type="text" placeholder="Enter option A" name="optA" required>
            <input type="text" placeholder="Enter option B" name="optB" required>
            <input type="text" placeholder="Enter option C" name="optC" required>
            <input type="text" placeholder="Enter option D" name="optD" required>
            <input type="text" placeholder="Enter correct answer" name="correct" required>
        </div>
        <button type="submit">ADD</button>
    </form>
</div>

</body>
</html>
