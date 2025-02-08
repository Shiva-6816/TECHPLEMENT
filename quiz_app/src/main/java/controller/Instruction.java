package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.QuestionDao;
import dto.Question;

// Servlet handling user login functionality.
@WebServlet("/instruction")
public class Instruction extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        QuestionDao questionDao = new QuestionDao();

        // Fetch a list of 8 random questions from the database
        List<Question> listOfQuestions = questionDao.fetchAllQuestions(8);

        /*
         * We use session attributes instead of request attributes because:
         * - Session attributes persist across multiple requests, whereas request attributes
         *   are valid only for a single request.
         * - The quiz involves multiple pages (questions), and we need to retain data such
         *   as the list of questions, the current question index, and the score throughout
         *   the session until the quiz is completed.
         */
        
        if (listOfQuestions != null && !listOfQuestions.isEmpty()) {
            HttpSession session = req.getSession();
            session.setAttribute("questions", listOfQuestions);
            session.setAttribute("currentIndex", 0);
            session.setAttribute("score", 0);
            req.getRequestDispatcher("Display.jsp").forward(req, resp);

        } else {
            req.setAttribute("key", "No questions are present. Please add questions.");
            RequestDispatcher dispatcher = req.getRequestDispatcher("instruction.jsp");
            dispatcher.forward(req, resp);
        }
    }
}