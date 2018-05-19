package propertyAdmin.operations;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.services.drive.Drive;
import com.google.api.services.drive.DriveScopes;
import com.google.api.services.drive.model.File;
import com.google.api.services.drive.model.FileList;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.storage.Acl;
import com.google.cloud.storage.Acl.Role;
import com.google.cloud.storage.Acl.User;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;
import com.google.common.collect.ImmutableList;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.joda.time.DateTime;
import org.joda.time.DateTimeZone;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import propertyAdmin.structure.persons.Account;
import propertyAdmin.structure.persons.Tenant;
import propertyAdmin.structure.property.Contract;
import propertyAdmin.structure.property.FunctionalUnit;
import propertyAdmin.structure.property.Property;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class DatabaseOps {

    private StorageOptions storageOptions;

    {
        try {
            storageOptions = StorageOptions.newBuilder()
                        .setProjectId("10e02c3ff7bcc7079252aa055d374810e94fd7f4\t")
                        .setCredentials(GoogleCredentials.fromStream(new
                                FileInputStream("assets/filetransfer.json"))).build();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    //assets/filetransfer.json
   ///Users/DiegoMancini/IdeaProjects/propertyadministration/out/artifacts/propertyadministration_main_Web_exploded/WEB-INF/classes/filetransfer.json



    private Storage storage = storageOptions.getService();
    private static DatabaseOps INSTANCE;
    private Configuration configuration = new Configuration();
    private SessionFactory sessionFactory = configuration.configure().buildSessionFactory();
    private static final String APPLICATION_NAME = "Google Drive API Java Quickstart";
    private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();
    private static final String CREDENTIALS_FOLDER = "/credentials"; // Directory to store user credentials.
    private static final List<String> SCOPES = ImmutableList.of(DriveScopes.DRIVE, DriveScopes.DRIVE_METADATA, DriveScopes.DRIVE_FILE);
    private static final String CLIENT_SECRET_DIR = "client_secret.json";

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

    public Property getPropertyByID(int id, String username) {
        Session session = openSession();
        return session.get(Account.class, username).getSpecificPropertyById(id);
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
//        FunctionalUnit functionalUnit1 = account.getSpecificPropertyById(property.getId()).getSpecificFunctionalUnitById(functionalUnit.getId());
        functionalUnit.setContract(contract);
        session.saveOrUpdate(contract);
//        session.saveOrUpdate(contract.getLandlord());
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

    public File getImageProperty(Property property) throws GeneralSecurityException, IOException {
        Drive drive = getDriveOps();
        FileList fileList = drive.files().list().execute();
        File result = null;
        for (File file:fileList.getFiles()) {
            if (file.getId().equals(property.getImageLink())) {
                result = file;
            }
        }
        return result;
    }

    private Drive getDriveOps() throws GeneralSecurityException, IOException {
        final NetHttpTransport HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
        return new Drive.Builder(HTTP_TRANSPORT, JSON_FACTORY, getCredentials(HTTP_TRANSPORT))
                .setApplicationName(APPLICATION_NAME)
                .build();
    }

    private static Credential getCredentials(final NetHttpTransport HTTP_TRANSPORT) throws IOException {
        // Load client secrets.
        InputStream in = DatabaseOps.class.getResourceAsStream(CLIENT_SECRET_DIR);
        GoogleClientSecrets clientSecrets = GoogleClientSecrets.load(JSON_FACTORY, new InputStreamReader(in));

        // Build flow and trigger user authorization request.
        GoogleAuthorizationCodeFlow flow = new GoogleAuthorizationCodeFlow.Builder(
                HTTP_TRANSPORT, JSON_FACTORY, clientSecrets, SCOPES)
                .setDataStoreFactory(new FileDataStoreFactory(new java.io.File(CREDENTIALS_FOLDER)))
                .setAccessType("offline")
                .build();
        return new AuthorizationCodeInstalledApp(flow, new LocalServerReceiver()).authorize("user");
    }

// [START uploadFile]
    /**
     * Uploads a file to Google Cloud Storage to the bucket specified in the BUCKET_NAME
     * environment variable, appending a timestamp to end of the uploaded filename.
     */
    @SuppressWarnings("deprecation")
    private String uploadFile(Part filePart, final String bucketName) throws IOException {
        DateTimeFormatter dtf = DateTimeFormat.forPattern("-YYYY-MM-dd-HHmmssSSS");
        DateTime dt = DateTime.now(DateTimeZone.UTC);
        String dtString = dt.toString(dtf);
        final String fileName = dtString+filePart.getSubmittedFileName();
        // the inputstream is closed by default, so we don't need to close it here
        BlobInfo blobInfo =
                storage.create(
                        BlobInfo
                                .newBuilder(bucketName, fileName)
                                // Modify access list to allow all users with link to read file
                                .setAcl(new ArrayList<>(Arrays.asList(Acl.of(User.ofAllUsers(), Role.READER))))
                                .build(),
                        filePart.getInputStream());
        // return the public download link
        return blobInfo.getMediaLink();
    }
    // [END uploadFile]

    // [START getImageUrl]
    /**
     * Extracts the file payload from an HttpServletRequest, checks that the file extension
     * is supported and uploads the file to Google Cloud Storage.
     */
    public String getImageUrl(HttpServletRequest req, HttpServletResponse resp,
                              final String bucket) throws IOException, ServletException {
        Part filePart = req.getPart("propertyImage");
        final String fileName = filePart.getSubmittedFileName();
        String imageUrl = req.getParameter("imageUrl");
        // Check extension of file
        if (fileName != null && !fileName.isEmpty() && fileName.contains(".")) {
            final String extension = fileName.substring(fileName.lastIndexOf('.') + 1);
            String[] allowedExt = { "jpg", "jpeg", "png", "gif" };
            for (String s : allowedExt) {
                if (extension.equals(s)) {
                    return this.uploadFile(filePart, bucket);
                }
            }
            throw new ServletException("file must be an image");
        }
        return imageUrl;
    }
    // [END getImageUrl]

}
