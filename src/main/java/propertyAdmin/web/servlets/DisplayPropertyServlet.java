package propertyAdmin.web.servlets;

import propertyAdmin.operations.DatabaseOps;
import propertyAdmin.structure.persons.Account;
import propertyAdmin.structure.property.structure.Property;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Florencia Vimberg
 */
@WebServlet("/displayDetails")
public class DisplayPropertyServlet extends HttpServlet {

    DatabaseOps databaseOps = DatabaseOps.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer chosenProperty = Integer.parseInt(req.getParameter("chosenProperty"));
        Property property = null;
            Account user = databaseOps.getAccount(req.getRemoteUser());
            property = user.getSpecificProperty(chosenProperty);

        req.setAttribute("property", property);
        req.setAttribute("chosenProperty", chosenProperty);
        req.getRequestDispatcher("/displayDetails.jsp").forward(req, resp);
    }
}
