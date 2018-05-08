package propertyAdmin.web.servlets;

import propertyAdmin.operations.DatabaseOps;
import propertyAdmin.structure.persons.Account;
import propertyAdmin.structure.property.Property;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/displayDetails")
public class DisplayPropertyServlet extends HttpServlet {

    DatabaseOps databaseOps = DatabaseOps.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer chosenProperty = Integer.parseInt(req.getParameter("chosenProperty"));
        Account user = databaseOps.getAccount(req.getRemoteUser());
        Property property = user.getSpecificProperty(chosenProperty);
        req.setAttribute("property", property);
        req.getRequestDispatcher("/displayDetails.jsp").forward(req, resp);
    }
}
