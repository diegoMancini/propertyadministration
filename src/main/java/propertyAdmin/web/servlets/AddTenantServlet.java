package propertyAdmin.web.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Florencia Vimberg
 */
//add tenant y contract ambos al mismo tiempo
@WebServlet("/createtenant")
public class AddTenantServlet extends HttpServlet{

//    private DatabaseOps databaseOps = DatabaseOps.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        //pasar el id
//        Integer tenantId = (Integer) req.getAttribute("tenant"); //funcionara?
//        if(tenantId != null){
//            //buscarlo en la base de datos
//        } else {
//            //tomar los datos de create tenant
//        }
//        //contract
//        String contractName = (String) req.getAttribute("contractName");
//        //File contractFile = req.getParameter("contractFile");
//        Date startDate = (Date) req.getAttribute("startDate");
//        Date endDate = (Date) req.getAttribute("endDate");
//
//        SessionFactory sessionFactory;
//        Session session;
//        Transaction transaction;
//
//        Configuration configuration = new Configuration();
//        sessionFactory = configuration.configure().buildSessionFactory();
//        session = sessionFactory.openSession();
//        transaction = session.beginTransaction();
//
//        Tenant tenant = session.find(Tenant.class, tenantId);
//        Contract contract = new Contract(contractName, new File("/fakefile"), startDate, endDate);
//        Property findProperty = (Property) req.getAttribute("propertyAdmin.web.property");
//
//        findProperty.setTenant(tenant);
//        findProperty.setContract(contract);
//
//        session.save(findProperty);
//
//        transaction.commit();
//        session.close();
//        sessionFactory.close();
//
//        resp.sendRedirect("/properties.jsp");
    }
}