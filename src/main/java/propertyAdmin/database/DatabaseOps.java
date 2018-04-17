package propertyAdmin.database;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import propertyAdmin.app.exceptions.EmailAlreadyUsedException;
import propertyAdmin.persons.Account;
import propertyAdmin.property.structure.Property;

public class DatabaseOps {

    private static DatabaseOps INSTANCE;
    private Configuration configuration = new Configuration();
    private SessionFactory sessionFactory = configuration.configure().buildSessionFactory();

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

    public Account getUser(String username) {
        Session session = openSession();
        return session.get(Account.class, username);
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

    public void addAccountToDatabase(String name, String surname, String id, String nationality, String maritalStatus, String address, String addressCountry, String addressProvince, String addressCity, String addressTown, String addressZipCode, String phone, String email, String password) throws EmailAlreadyUsedException {
        Account newUser = new Account(name, surname, id, nationality, maritalStatus, address, addressCountry, addressProvince, addressCity, addressTown, addressZipCode, phone, email, password);
        Session session = openSession();
        Transaction transaction = beginTransaction(session);
        session.save(newUser);
        transaction.commit();
        session.close();
    }

    public void addCreatedAccountToDatabase(Account account) {
        Session session = openSession();
        Transaction transaction = beginTransaction(session);
        session.save(account);
        transaction.commit();
        session.close();
    }

    public void deleteCreatedAccountToDatabase(Account account) {
        Session session = openSession();
        Transaction transaction = beginTransaction(session);
        session.delete(account);
        transaction.commit();
        session.close();
    }

    public Configuration getConfiguration() {
        return configuration;
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void addPropertyToDatabase(String name, String description, String address) {
        Property property = new Property(name, description, address);
        Session session = openSession();
        Transaction transaction = session.beginTransaction();
        session.save(property);
        transaction.commit();
        session.close();
    }

    public void addPropertyToDatabase(String name, String description, String address, String mail) {
        Property property = new Property(name, description, address);
        Session session = openSession();
        Transaction transaction = session.beginTransaction();
        session.get(Account.class, mail).addProperty(property);
        session.save(property);
        transaction.commit();
        session.close();
    }

    public void removePropertyFromDatabase(String name) {
        Session session = openSession();
        Transaction transaction = session.beginTransaction();
        Property property = session.get(Property.class, name);
        session.delete(property);
        transaction.commit();
        session.close();
    }

    public void removePropertyFromDatabase(String name, String mail) {
        Session session = openSession();
        Transaction transaction = session.beginTransaction();
        Property property = session.get(Account.class, mail).getSpecificProperty(name);
        session.get(Account.class, mail).removeProperty(property);
        session.delete(property);
        transaction.commit();
        session.close();
    }

}
