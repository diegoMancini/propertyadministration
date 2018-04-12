public class PropertyTest {
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
//        Property property1 = new Property("3 de febrero", "casa flor");
//        Property property2 = new Property("11 de septiembre", "casa diego");
//
//        int id1 = (int) session.save(property1);
//        int id2 = (int) session.save(property2);
//
//        transaction.commit();
//
//        Property addedProperty1 = session.find(Property.class, id1);
//        Property addedProperty2 = session.find(Property.class, id2);
//
//        assert(addedProperty1.getAddress().equals("3 de febrero"));
//        assert(addedProperty2.getName().equals("casa diego"));
//
//
//        Transaction newTransaction = session.beginTransaction();
//        session.delete(property1);
//        session.delete(property2);
//        newTransaction.commit();
//    }
//    @After
//    public void after() {
//        session.close();
//        sessionFactory.close();
//    }

}