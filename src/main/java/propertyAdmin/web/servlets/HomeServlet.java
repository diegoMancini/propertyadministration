package propertyAdmin.web.servlets;

import propertyAdmin.database.DatabaseOps;
import propertyAdmin.structure.property.structure.Property;

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
        List<Property> properties = databaseOps.getAccountProperties(req.getRemoteUser());
        req.setAttribute("username", databaseOps.getAccount(req.getRemoteUser()).getName() + databaseOps.getAccount(req.getRemoteUser()).getSurname());
        req.setAttribute("properties", properties);

        resp.sendRedirect("/properties.jsp");
    }
}
