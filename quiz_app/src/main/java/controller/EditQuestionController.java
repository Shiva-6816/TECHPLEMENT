package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QuestionDao;
import dto.Question;

// Servlet handling the addition of new quiz questions.
@WebServlet("/Edit")
public class EditQuestionController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Retrieve question details from the request parameters
		String questions = req.getParameter("question");
		String optionA = req.getParameter("optA");
		String optionB = req.getParameter("optB");
		String optionC = req.getParameter("optC");
		String optionD = req.getParameter("optD");
		String correctAnswer = req.getParameter("correct");

		// Create a new Question object and set its properties
		Question question = new Question();
		question.setQuestionName(questions);
		question.setOptionA(optionA);
		question.setOptionB(optionB);
		question.setOptionC(optionC);
		question.setOptionD(optionD);
		question.setCorrectAnswer(correctAnswer);

		// Save the question to the database using QuestionDao
		QuestionDao questionDao = new QuestionDao();
		Question dbQuestion = questionDao.saveQuestion(question);

		/*
		 * If the question is successfully saved in the database, forward the user to
		 * the instruction page with a success message.
		 */
		if (dbQuestion != null) {
			req.setAttribute("log", "Successfully added question");
			RequestDispatcher requestDispatcher = req.getRequestDispatcher("instruction.jsp");
			requestDispatcher.forward(req, resp);
		}
	}
}
