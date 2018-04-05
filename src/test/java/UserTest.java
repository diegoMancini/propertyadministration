
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class UserTest {
//    private SessionFactory sessionFactory;
//    private Session session = null;
//    private Transaction transaction;
//    @Before
//    public void before() {
//        // setup the session factory
//        Configuration configuration = new Configuration();
//        sessionFactory = configuration.configure().buildSessionFactory();
//        session = sessionFactory.openSession();
//        transaction = session.beginTransaction();
//    }
//
//    @Test
//    public void testUser() {
//        // create the objects needed for testing
//        User user1 = new User("Florencia", "Vimberg","florvimberg@gmail.com","41222712","1541596291", "owner", "flor");
//        User user2 = new User("Diego", "Mancini","diegomancini@gmail.com","38654723","1523750444", "owner","perrito1");
//
//        session.save(user1);
//        // storing the objects for the test in the database
//        int id1 = (int) session.save(user1);
//        int id2 = (int) session.save(user2);
//
//        transaction.commit();
//
//        User addedUser1 = session.find(User.class, id1);
//        User addedUser2 = session.find(User.class, id2);
//
//        assert(addedUser1.getMail().equals("florvimberg@gmail.com"));
//        assert(addedUser2.getName().equals("Diego"));
//
//
//        Transaction newTransaction = session.beginTransaction();
//        session.delete(user1);
//        session.delete(user2);
//        newTransaction.commit();
//    }
//    @After
//    public void after() {
//        session.close();
//        sessionFactory.close();
//    }
}