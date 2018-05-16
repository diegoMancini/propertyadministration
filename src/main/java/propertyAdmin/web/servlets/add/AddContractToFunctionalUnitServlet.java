package propertyAdmin.web.servlets.add;

import org.joda.time.LocalDateTime;
import propertyAdmin.operations.DatabaseOps;
import propertyAdmin.structure.persons.Guarantor;
import propertyAdmin.structure.persons.Tenant;
import propertyAdmin.structure.property.Contract;
import propertyAdmin.structure.property.FunctionalUnit;
import propertyAdmin.structure.property.Property;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AddContractToFunctionalUnitServlet", value = "/addContract")
public class AddContractToFunctionalUnitServlet extends HttpServlet {

    private DatabaseOps databaseOps = DatabaseOps.getInstance();

   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       Integer chosenProperty = Integer.parseInt(req.getParameter("chosenProperty"));
       Integer chosenFunctionalUnit = Integer.valueOf(req.getParameter("chosenFunctionalUnit"));
       String accountUsername = req.getParameter("account");
       Property property = DatabaseOps.getInstance().getProperty(chosenProperty, req.getRemoteUser());
       FunctionalUnit functionalUnit = property.getSpecificFunctionalUnitByIndex(chosenFunctionalUnit);
       req.setAttribute("accountUsername", accountUsername);
       req.setAttribute("chosenProperty", chosenProperty);
       req.setAttribute("property", property);
       req.setAttribute("propertyName", property.getName());
       String contractName = req.getParameter("contractName");
       Integer contractPrice = Integer.valueOf(req.getParameter("contractPrice"));
       Integer contractMonthsInflationPeriod = Integer.valueOf(req.getParameter("contractInflationMonths"));
       Integer contractInflationRate= Integer.valueOf(req.getParameter("contractInflationRate"));
       LocalDateTime contractStartDate = LocalDateTime.parse(req.getParameter("contractStartDate"));
       LocalDateTime contractEndDate = LocalDateTime.parse(req.getParameter("contractEndDate"));
       LocalDateTime today = LocalDateTime.now();
       String tenantName = req.getParameter("tenantName");
       String tenantSurname = req.getParameter("tenantSurname");
       String tenantId = req.getParameter("tenantId");
       String tenantPhone = req.getParameter("tenantPhone");
       String tenantEmail = req.getParameter("tenantEmail");
       String guarantorName = req.getParameter("guarantorName");
       String guarantorPhone = req.getParameter("guarantorId");
       String guarantorId = req.getParameter("guarantorPhone");
       Tenant tenant = new Tenant(tenantName, tenantSurname, tenantId, tenantPhone, tenantEmail);
       Guarantor guarantor = new Guarantor(guarantorName, guarantorPhone, guarantorId);
       Contract contract = new Contract(contractName, contractStartDate, contractEndDate, tenant, guarantor, contractPrice, contractMonthsInflationPeriod, contractInflationRate);

       databaseOps.addContractToFunctionalUnitToDatabase(accountUsername, property, functionalUnit, contract);

       req.getRequestDispatcher("specificProperty.jsp").forward(req,resp);
   }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

   }
}
