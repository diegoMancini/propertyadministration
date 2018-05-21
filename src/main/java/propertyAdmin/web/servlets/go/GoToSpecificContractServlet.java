package propertyAdmin.web.servlets.go;

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

@WebServlet(name = "GoToSpecificContractServlet", value = "/goToSpecificContract")
public class GoToSpecificContractServlet extends HttpServlet {

    private DatabaseOps databaseOps = DatabaseOps.getInstance();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer chosenProperty = Integer.parseInt(req.getParameter("chosenProperty"));
        Integer chosenFunctionalUnit = Integer.valueOf(req.getParameter("chosenFunctionalUnit"));
        String accountUsername = req.getParameter("account");
        Property property = DatabaseOps.getInstance().getProperty(chosenProperty, req.getRemoteUser());
        FunctionalUnit functionalUnit = property.getSpecificFunctionalUnitByIndex(chosenFunctionalUnit);
        Contract contract = functionalUnit.getContract();
        Tenant tenant = contract.getTenant();
        Guarantor guarantor = contract.getGuarantor();
        req.setAttribute("accountUsername", accountUsername);
        req.setAttribute("chosenProperty", chosenProperty);
        req.setAttribute("property", property);
        req.setAttribute("propertyName", property.getName());
        req.setAttribute("functionalUnit", functionalUnit);
        req.setAttribute("contract", contract);
        req.setAttribute("tenant", tenant);
        req.setAttribute("guarantor", guarantor);
        req.getRequestDispatcher("specificContract.jsp").forward(req,resp);
    }
}
