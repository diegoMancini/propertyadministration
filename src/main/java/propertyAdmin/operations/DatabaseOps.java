package propertyAdmin.operations;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import propertyAdmin.structure.persons.Account;
import propertyAdmin.structure.persons.Tenant;
import propertyAdmin.structure.property.Contract;
import propertyAdmin.structure.property.FunctionalUnit;
import propertyAdmin.structure.property.Property;

import java.util.ArrayList;
import java.util.List;

public class DatabaseOps {

    private static DatabaseOps INSTANCE;
    private Configuration configuration = new Configuration();
    private SessionFactory sessionFactory = configuration.configure().buildSessionFactory();

    //BASIC

    public static DatabaseOps getInstance(){
        if (INSTANCE == null)  INSTANCE = new DatabaseOps();
        return INSTANCE;
    }

    public Session openSession() {
        return sessionFactory.openSession();
    }

    public Transaction beginTransaction(Session session) {
        return session.beginTransaction();
    }

    public void closeSession(Session session) {
        session.close();
    }
    public void closeSessionFactory() {
        sessionFactory.close();
    }

    //ACCOUNT

    public void addAccountToDatabase(Account account)  {
        Session session = openSession();
        Transaction transaction = beginTransaction(session);
        session.save(account);
        transaction.commit();
        session.close();
    }

    public void removeAccountFromDatabase(String email) {
        Session session = openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(session.get(Account.class, email));
        transaction.commit();
        session.close();
    }

    public List<Account> getAccountsInDatabase() {
        return null;
    }

    public Account getAccount(String username) {
        Session session = openSession();
        return session.get(Account.class, username);
    }

    public boolean hasAccount(String username) {
        Session session = openSession();
        if (session.contains("Account", session.get(Account.class, username))) return true;
        return false;
    }

    //PROPERTY

    public void addPropertyToDatabase(String mail , Property property) {
        Session session = openSession();
        Transaction transaction = session.beginTransaction();
        session.get(Account.class, mail).addProperty(property);
        session.save(property);
        transaction.commit();
        session.close();
    }

    public void removePropertyFromDatabase(int choice, String mail) {
        Session session = openSession();
        Transaction transaction = session.beginTransaction();
        Property property = session.get(Account.class,mail).getSpecificPropertyByIndex(choice);
        session.get(Account.class, mail).removeProperty(property);
        session.delete(property);
        transaction.commit();
        session.close();
    }


    public Property getProperty(int choice, String username) {
        Session session = openSession();
        return session.get(Account.class, username).getProperties().get(choice);
    }

    public List<Property> getAccountProperties(String username) {
        Account user = getAccount(username);
        return user.getProperties();
    }

    public List<FunctionalUnit> getAccountFunctionalUnits(String remoteUser) {
        List<FunctionalUnit> res = new ArrayList<>();
        Account account = getAccount(remoteUser);
        for(Property property: account.getProperties()) {
            res.addAll(property.getFunctionalUnits());
        }
        return res;
    }

    public List<Tenant> getAccountClients(String remoteUser) {
        List<Tenant> tenantList = new ArrayList<>();
        Account account = getAccount(remoteUser);
        for (int i = 0; i < account.getProperties().size(); i++) {
            for (int j = 0; j < account.getProperties().get(i).getFunctionalUnits().size(); j++) {
                if (account.getProperties().get(i).getFunctionalUnits().get(j).hasContract()) {
                    tenantList.add(account.getProperties().get(i).getFunctionalUnits().get(j).getContract().getTenant());
                }
            }
        } return tenantList;
    }

    //FUNCTIONAL UNITS

    public void addFunctionalUnitToDatabase(String email, Property aProperty, FunctionalUnit functionalUnit) {
        Session session = openSession();
        Transaction transaction = session.beginTransaction();
        Account account = session.get(Account.class, email);
        for (Property property : account.getProperties()) {
            if (property.getId().equals(aProperty.getId())) {
                property.addFunctionalUnit(functionalUnit);
            }
        }
        session.save(functionalUnit);
        transaction.commit();
        session.close();
    }

    public void addContractToFunctionalUnitToDatabase(String email, Property property, FunctionalUnit functionalUnit, Contract contract) {
        Session session = openSession();
        Transaction transaction = session.beginTransaction();
        Account account = session.get(Account.class, email);
        FunctionalUnit functionalUnit1 = account.getSpecificPropertyById(property.getId()).getSpecificFunctionalUnitById(functionalUnit.getId());
        functionalUnit1.setContract(contract);
        session.saveOrUpdate(contract);
        session.saveOrUpdate(contract.getLandlord());
        session.saveOrUpdate(contract.getTenant());
        session.saveOrUpdate(contract.getGuarantor());
        transaction.commit();
        closeSession(session);
    }

    public void removeFunctionalUnitFromDatabase(String email, Property aProperty, FunctionalUnit name) {
        Session session = openSession();
        Transaction transaction = session.beginTransaction();
        Account account = session.get(Account.class, email);
        for (int i = 0; i < account.getProperties().size(); i++) {
            if (account.getProperties().get(i).getName().equals(aProperty.getName())) {
                for (FunctionalUnit functionalUnit1 : account.getProperties().get(i).getFunctionalUnits()) {
                    if (functionalUnit1.getId().equals(name.getId()))
                        account.getProperties().get(i).getFunctionalUnits().remove(functionalUnit1);
                    session.delete(functionalUnit1);
                    transaction.commit();
                }
            }
        }
        session.close();
    }

    public FunctionalUnit getFunctionalUnit(int choice, Account account, Property aProperty) {
        Session session = openSession();
        FunctionalUnit functionalUnit = null;
        for (Property property : session.get(Account.class, account.getEmail()).getProperties() ) {
            if (property.getName().equals(aProperty.getName())) {
                functionalUnit = property.getFunctionalUnits().get(choice);
            } else {
                System.out.println("ERROR");
            }
        }
        return functionalUnit;
    }

    public Account doLogin(String mail, String password) {
        Account account = getAccount(mail);
        if (account.getPassword().equals(password)) {
            return account;
        } else {
            return null;
        }
    }

    public void removeContractFromFunctionalUnit(String email, Property aProperty, FunctionalUnit functionalUnit) {
        Session session = openSession();
        Transaction transaction = session.beginTransaction();
        Account account = getAccount(email);
        Property property = account.getSpecificPropertyById(aProperty.getId());
        FunctionalUnit functionalUnit1 = property.getSpecificFunctionalUnitById(functionalUnit.getId());
        functionalUnit1.setContract(null);
        session.update(functionalUnit1);
        transaction.commit();
        closeSession(session);
    }

    public String displayContractDetailsDatabase(String email, Property aProperty, FunctionalUnit functionalUnit) {
        Session session = openSession();
        Account account = getAccount(email);
        Property property = account.getSpecificPropertyById(aProperty.getId());
        FunctionalUnit functionalUnit1 = property.getSpecificFunctionalUnitById(functionalUnit.getId());
        String result = "";
        if (!functionalUnit1.getContract().equals(null)) {
            result += functionalUnit.getContract().toString();
        } else {
            result += "No tiene";
        }
        closeSession(session);
        return result;
    }

    public void deleteProperty(String remoteUser, Integer propertyCode) {

    }

    public List<Property> getSearchResult(String remoteUser, String searchInput) {
        return null;
    }

    public void addContactToDatabase(String occupation, String name, String surname, Integer phoneNumber, Integer chosenProperty, String remoteUser) {

    }

}
