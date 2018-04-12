package securityFilter;

import database.DatabaseOps;
import org.securityfilter.realm.SimpleSecurityRealmBase;
import persons.Account;


public class SecurityRealm extends SimpleSecurityRealmBase {

    private DatabaseOps databaseOps = DatabaseOps.getInstance();

    public boolean booleanAuthenticate(String username, String password) {
        Account newUser = databaseOps.getUser(username);
        return newUser.getPassword().equals(password);
    }

    public boolean isUserInRole(String username, String role) {
        return true; //TODO ver como hacer para que distintos roles vean lo mismo
    }
}