
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import persons.Account;

public class UserTest {
    private SessionFactory sessionFactory;
    private Session session = null;
    private Transaction transaction;
    @Before
    public void before() {
        // setup the session factory
        Configuration configuration = new Configuration();
        sessionFactory = configuration.configure().buildSessionFactory();
        session = sessionFactory.openSession();
        transaction = session.beginTransaction();
    }

    @Test
    public void testUser() {
        // create the objects needed for testing
        Account user1 = new Account("Diego", "Mancini","38931523","Argentino","Soltero", "Saravi 104", "Argentina", "Buenos Aires" , "Pilar" , "La Lonja" , "1629", "1154645662", "diegonfx@gmail.com" , "Perrito1");

        session.save(user1);
        // storing the objects for the test in the database
        session.save(user1);

        int id1 = (int) session.save(user1);

        transaction.commit();

        Account addedUser1 = session.find(Account.class, id1);

        assert(addedUser1.getEmail().equals("diegonfx@gmail.com"));

        Transaction newTransaction = session.beginTransaction();
        session.delete(user1);
        newTransaction.commit();
    }
    @After
    public void after() {
        session.close();
        sessionFactory.close();
    }
}