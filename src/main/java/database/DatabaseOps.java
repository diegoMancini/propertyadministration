package database;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import persons.Account;

public class DatabaseOps {

    private static DatabaseOps INSTANCE;
    private Configuration configuration = new Configuration();
    private SessionFactory sessionFactory = configuration.configure().buildSessionFactory();

    public Session openSession() {
        return sessionFactory.openSession();
    }

    public static DatabaseOps getInstance(){
        if (INSTANCE == null)  INSTANCE = new DatabaseOps();
        return INSTANCE;
    }

    public Account getUser(String username) {
        Session session = openSession();
        return session.get(Account.class, username);
    }

    public void addAccountToDatabase(String name, String surname, String id, String nationality, String maritalStatus, String address, String addressCountry, String addressProvince, String addressCity, String addressTown, String addressZipCode, String phone, String email, String password) {
        Account newUser = new Account(name, surname, id, nationality, maritalStatus, address, addressCountry, addressProvince, addressCity, addressTown, addressZipCode, phone, email, password);
        Session session = openSession();
        Transaction transaction = session.beginTransaction();
        session.saveOrUpdate(newUser);
        transaction.commit();
        session.close();
    }
//
//    public void addPropertyToDatabase(String address, String name) {
//        Property property = new Property(address, name);
//        Session session = openSession();
//        Transaction transaction = session.beginTransaction();
//        session.save(property);
//        transaction.commit();
//        session.close();
//    }
//
//    public void addFacilities(Integer baths, Integer rooms, Integer sqrMeter, String details, Property findProperty) {
//        Facilities facilities = new Facilities(baths, rooms, sqrMeter, details);
//        Session session = openSession();
//        Transaction transaction = session.beginTransaction();
//        findProperty.setFacilities(facilities);
//        session.update(findProperty);
//        transaction.commit();
//        session.close();
//
//    }
//
//    public void addTenant(Integer tenantID, String contractName, Date start, Date end) {
//        Tenant tenant = new Tenant(tenantID, )
//    }
}
