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
import java.util.List;

@WebServlet("/displayProperties")
public class HomeServlet extends HttpServlet{

    private DatabaseOps databaseOps = DatabaseOps.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Account account = DatabaseOps.getInstance().getAccount(req.getRemoteUser());
        List<Property> properties = databaseOps.getAccountProperties(account.getUsername());
        req.setAttribute("username", account.getName() + account.getSurname());
        req.setAttribute("properties", properties);

        resp.sendRedirect("/properties.jsp");
    }
}
