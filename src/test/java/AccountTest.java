import database.DatabaseOps;
import org.junit.Test;
import persons.Account;

public class AccountTest {

   private DatabaseOps databaseOps = DatabaseOps.getInstance();

    @Test
    public void testUser() {
        Account user1 = new Account("Diego", "Mancini","38931523","Argentino","Soltero", "Saravi 104", "Argentina", "Buenos Aires" , "Pilar" , "La Lonja" , "1629", "1154645662", "diegonfx@gmail.com" , "Perrito1");
        databaseOps.addCreatedAccountToDatabase(user1);
        Account addedUser1 = databaseOps.getSession().find(Account.class, "email");

        assert(addedUser1.getEmail().equals("diegonfx@gmail.com"));

        databaseOps.deleteCreatedAccountToDatabase(user1);

        databaseOps.closeSessionFactory();
    }

}