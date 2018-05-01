import propertyAdmin.operations.DatabaseOps;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import propertyAdmin.structure.persons.Account;

public class AccountTest {

   private DatabaseOps databaseOps = DatabaseOps.getInstance();

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
        Account user1 = new Account("Diego", "Mancini","38931523","Argentino","Soltero", "Saravi 104", "Argentina", "Buenos Aires" , "Pilar" , "La Lonja" , "1629", "1154645662", "diego@hotmail.com" , "Perrito1");
        session.save(user1);
        transaction.commit();
//        Account addedUser1 = databaseOps.getSession().find(Account.class, "email");
        assert(session.get(Account.class,"diego@hotmail.com").getId().equals("38931523"));
        session.delete(user1);
        transaction.commit();
    }
    @After
     public void after() {
        session.close();
        sessionFactory.close();
   }

}