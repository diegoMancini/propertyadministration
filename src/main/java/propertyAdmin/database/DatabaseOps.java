package propertyAdmin.database;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import propertyAdmin.persons.Account;
import propertyAdmin.property.structure.FunctionalUnit;
import propertyAdmin.property.structure.Property;
import propertyAdmin.property.structure.specifics.BusinessPremise;
import propertyAdmin.property.structure.specifics.Garage;
import propertyAdmin.property.structure.specifics.LivingPlace;
import propertyAdmin.property.structure.specifics.Office;

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

    public void closeSessionFactory() {
        sessionFactory.close();
    }

    //ACCOUNT

    public void addAccountToDatabase(String name, String surname, String id, String nationality, String maritalStatus, String address, String addressCountry, String addressProvince, String addressCity, String addressTown, String addressZipCode, String phone, String email, String password)  {
        Account newUser = new Account(name, surname, id, nationality, maritalStatus, address, addressCountry, addressProvince, addressCity, addressTown, addressZipCode, phone, email, password);
        Session session = openSession();
        Transaction transaction = beginTransaction(session);
        session.save(newUser);
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

    public void addCreatedAccountToDatabase(Account account) {
        Session session = openSession();
        Transaction transaction = beginTransaction(session);
        session.save(account);
        transaction.commit();
        session.close();
    }

    public Account getUser(String username) {
        Session session = openSession();
        return session.get(Account.class, username);
    }

    //PROPERTY

    public void addPropertyToDatabase(String name, String description, String address, String mail) {
        Property property = new Property(name, description, address);
        Session session = openSession();
        Transaction transaction = session.beginTransaction();
        session.get(Account.class, mail).addProperty(property);
        session.save(property);
        transaction.commit();
        session.close();
    }

    public void removePropertyFromDatabase(String name, String mail) {
        Session session = openSession();
        Transaction transaction = session.beginTransaction();
        Property property = session.get(Account.class,mail).getSpecificProperty(name);
        session.get(Account.class, mail).removeProperty(property);
        session.delete(property);
        transaction.commit();
        session.close();
    }

    public Property getProperty(String name, String username) {
        Session session = openSession();
        for (Property property : session.get(Account.class, username).getProperties() ) {
            if (property.getName().equals(name)) {
                return property;
            } else {
                System.out.println("ERROR");
            }
        }
        return null;
    }

    //FUNCTIONAL UNITS

    public void addFunctionalUnitToDatabase(String email, Property aProperty, String name, String type, String address) {
        Session session = openSession();
        Transaction transaction = session.beginTransaction();
        Account account = session.get(Account.class, email);
        FunctionalUnit functionalUnit = null;
        switch (type) {
            case "Living Place":
                functionalUnit = new LivingPlace(name, type, address);
                break;
            case "Office":
                functionalUnit = new Office(name, type, address);
                break;
            case "Business Premise":
                functionalUnit = new BusinessPremise(name, type, address);
                break;
            case "Garage":
                functionalUnit = new Garage(name, type, address);
                break;
            default:
                System.out.println("AZA");
                break;
        }
        for (Property property : account.getProperties()) {
            if (property.getName().equals(aProperty.getName())) {
                property.addFunctionalUnit(functionalUnit);
            }
        }
        session.save(functionalUnit);
        transaction.commit();
        session.close();
    }

    public void removeFunctionalUnitFromDatabase(String email, Property aProperty, String name) {
        Session session = openSession();
        Transaction transaction = session.beginTransaction();
        Account account = session.get(Account.class, email);
        for (int i = 0; i < account.getProperties().size(); i++) {
            if (account.getProperties().get(i).getName().equals(aProperty.getName())) {
                for (FunctionalUnit functionalUnit1 : account.getProperties().get(i).getFunctionalUnits()) {
                    if (functionalUnit1.getName().equals(name))
                        account.getProperties().get(i).getFunctionalUnits().remove(functionalUnit1);
                    session.delete(functionalUnit1);
                    transaction.commit();
                }
            }
        }
        session.close();
    }

    public FunctionalUnit getFunctionalUnit(String choice, Account account, Property aProperty) {
        Session session = openSession();
        for (Property property : session.get(Account.class, account.getEmail()).getProperties() ) {
            if (property.getName().equals(aProperty.getName())) {
                for (FunctionalUnit functionalUnit : property.getFunctionalUnits()) {
                    if (functionalUnit.getName().equals(choice)) {
                        return functionalUnit;
                    }
                }
            } else {
                System.out.println("ERROR");
            }
        }
        return null;
    }

//
//    public void addPropertyToDatabase(String name, String description, String address) {
//        Property property = new Property(name, description, address);
//        Session session = openSession();
//        Transaction transaction = session.beginTransaction();
//        session.save(property);
//        transaction.commit();
//        session.close();
//    }
//
//    public void removePropertyFromDatabase(String name) {
//        Session session = openSession();
//        Transaction transaction = session.beginTransaction();
//        Property property = session.get(Property.class, name);
//        session.delete(property);
//        transaction.commit();
//        session.close();
//    }

}
