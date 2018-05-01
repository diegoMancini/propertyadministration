package propertyAdmin.web.securityFilter;

import propertyAdmin.operations.DatabaseOps;
import org.securityfilter.realm.SimpleSecurityRealmBase;
import propertyAdmin.structure.persons.Account;


public class SecurityRealm extends SimpleSecurityRealmBase {

    private DatabaseOps databaseOps = DatabaseOps.getInstance();

    public boolean booleanAuthenticate(String username, String password) {
        Account newUser = databaseOps.getAccount(username);
        return newUser.getPassword().equals(password);
    }

    public boolean isUserInRole(String username, String role) {
        return true; //TODO ver como hacer para que distintos roles vean lo mismo
    }
}