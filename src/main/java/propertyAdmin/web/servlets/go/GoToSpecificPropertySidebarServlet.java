package propertyAdmin.web.servlets.go;

import propertyAdmin.operations.DatabaseOps;
import propertyAdmin.structure.persons.Account;
import propertyAdmin.structure.property.Property;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "GoToSpecificPropertySidebarServlet", value = "/goToSpecificPropertySidebar")
public class GoToSpecificPropertySidebarServlet extends HttpServlet {

    private DatabaseOps databaseOps = DatabaseOps.getInstance();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer chosenPropertyID = Integer.valueOf(req.getParameter("chosenPropertyID"));
        String accountUsername = req.getParameter("username");
        Account account = databaseOps.getAccount(accountUsername);
        Integer chosenProperty = null;
        for (int i = 0; i < account.getProperties().size(); i++) {
            if (account.getProperties().get(i).getId().equals(chosenPropertyID)) {
                chosenProperty = i;
            }
        }
        Property property = databaseOps.getPropertyByID(chosenPropertyID, accountUsername);
        req.setAttribute("chosenPropertyID", chosenPropertyID);
        req.setAttribute("chosenProperty", chosenProperty);
        req.setAttribute("property", property);
        req.setAttribute("propertyName", property.getName());
        req.setAttribute("username", accountUsername);
        req.getRequestDispatcher("specificProperty.jsp").forward(req,resp);
    }

}
