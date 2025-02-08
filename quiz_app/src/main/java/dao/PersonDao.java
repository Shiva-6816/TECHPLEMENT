package dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

import dto.Person;

// Data Access Object (DAO) for managing Person entities.
public class PersonDao {
    EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("shiva");
    EntityManager entityManager = entityManagerFactory.createEntityManager();
    EntityTransaction entityTransaction = entityManager.getTransaction();

    // Saves a Person entity in the database.
    // Takes a Person object and returns the saved object.
    public Person savePerson(Person person) {
        entityTransaction.begin();
        entityManager.persist(person);
        entityTransaction.commit();
        return person;
    }

    // Fetches a Person entity from the database using the phone number.
    // Returns the Person object if found, otherwise returns null.
    public Person fetchByPhone(long phone) {
        try {
            Query query = entityManager.createQuery("SELECT o FROM Person o WHERE o.phone = ?1");
            query.setParameter(1, phone);
            return (Person) query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }
}
