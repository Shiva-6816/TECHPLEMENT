package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import dto.Question;

// DAO class for handling database operations related to the Question entity.
public class QuestionDao {

    // Creating EntityManagerFactory, EntityManager, and EntityTransaction for database operations
    EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("shiva");
    EntityManager entityManager = entityManagerFactory.createEntityManager();
    EntityTransaction entityTransaction = entityManager.getTransaction();

    // Saves a new question to the database.
    // Takes a Question object and returns the saved object.
    public Question saveQuestion(Question question) {
        entityTransaction.begin(); // Begin transaction
        entityManager.persist(question); // Persist the question entity
        entityTransaction.commit(); // Commit transaction
        return question;
    }

    // Fetches a list of randomly selected questions from the database.
    // Takes the number of questions to fetch and returns a list of Question objects.
    public List<Question> fetchAllQuestions(int numberOfQuestions) {
        Query query = entityManager.createQuery("SELECT q FROM Question q ORDER BY FUNCTION('RAND')");
        query.setMaxResults(numberOfQuestions); // Limiting the number of results dynamically
        return query.getResultList();
    }
}
