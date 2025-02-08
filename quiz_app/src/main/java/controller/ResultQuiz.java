package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Question;

// Servlet handling quiz result processing.
@WebServlet("/quiz")
public class ResultQuiz extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Retrieve the list of questions, current index, and score from the session
        List<Question> questions = (List<Question>) session.getAttribute("questions");
        int currentIndex = (int) session.getAttribute("currentIndex");
        int score = (int) session.getAttribute("score");

        // Get the selected answer from the user
        String selectedAnswer = request.getParameter("answer");
        Question currentQuestion = questions.get(currentIndex);

        /*
         * Check if the selected answer matches the correct answer of the current question.
         * If correct, increment the score.
         */
        if (selectedAnswer != null && selectedAnswer.equalsIgnoreCase(currentQuestion.getCorrectAnswer())) {
            score++;
        }

        // Update the score in the session
        session.setAttribute("score", score);

        /*
         * If there are more questions remaining, move to the next question by updating
         * the currentIndex in the session and redirecting to the display page.
         * Otherwise, redirect to the result page.
         */
        if (currentIndex < questions.size() - 1) {
            session.setAttribute("currentIndex", currentIndex + 1);
            response.sendRedirect("Display.jsp");
        } else {
            response.sendRedirect("result.jsp");
        }
    }
}
