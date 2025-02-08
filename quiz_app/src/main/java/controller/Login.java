package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PersonDao;
import dto.Person;

// Servlet for handling login requests

@WebServlet("/logIn")
public class Login extends HttpServlet {

	// Handles HTTP POST requests for user login
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// Retrieving phone number and password from the login form
			long frontEndPhone = Long.parseLong(req.getParameter("phone"));
			String frontEndPassword = req.getParameter("password");

			// Creating an instance of PersonDao to interact with the database
			PersonDao personDao = new PersonDao();

			// Fetching the person details from the database using the provided phone number
			Person dbPerson = personDao.fetchByPhone(frontEndPhone);

			// Checking if the user exists in the database
			if (dbPerson != null) {
				// Verifying the password
				if (dbPerson.getPassword().equals(frontEndPassword)) {
					// If credentials are correct, forward the user to the instruction page
					RequestDispatcher requestDispatcher = req.getRequestDispatcher("instruction.jsp");
					requestDispatcher.forward(req, resp);
				} else {
					// If the password is incorrect, set an error message and redirect to login page
					req.setAttribute("key", "Invalid Phone or Password. Please enter valid credentials.");
					RequestDispatcher requestDispatcher = req.getRequestDispatcher("login.jsp");
					requestDispatcher.forward(req, resp);
				}
			} else {
				// If no user is found, set an error message and redirect to login page
				req.setAttribute("key", "Invalid Phone or Password. Please enter valid credentials.");
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("login.jsp");
				requestDispatcher.forward(req, resp);
			}
		} catch (NumberFormatException e) {
			// Handling case where phone number is not valid (e.g., empty or non-numeric
			// input)
			req.setAttribute("key", "Invalid Phone Number. Please enter a valid numeric value.");
			RequestDispatcher requestDispatcher = req.getRequestDispatcher("login.jsp");
			requestDispatcher.forward(req, resp);
		}
	}
}
