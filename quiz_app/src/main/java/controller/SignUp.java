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

/**
 * Servlet implementation for handling user sign-up requests.
 */
@WebServlet("/signUp")
public class SignUp extends HttpServlet {

    /**
     * Handles the HTTP POST request for user registration.
     * Retrieves user details from the form, creates a Person object,
     * and saves the user in the database.
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Retrieve user input from the form
        String name = req.getParameter("name");
        int age = Integer.parseInt(req.getParameter("age"));
        long phone = Long.parseLong(req.getParameter("phone"));
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        // Create a new Person object and set its attributes
        Person person = new Person();
        person.setName(name);
        person.setAge(age);
        person.setPhone(phone);
        person.setEmail(email);
        person.setPassword(password);

        // Save the user in the database using PersonDao
        PersonDao personDao = new PersonDao();
        Person dbPerson = personDao.savePerson(person);

        // If the user is successfully saved, redirect to login page with a success message
        if (dbPerson != null) {
            req.setAttribute("key", "Successfully Signed Up. Please Login.");
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("login.jsp");
            requestDispatcher.forward(req, resp);
        }
    }
}
