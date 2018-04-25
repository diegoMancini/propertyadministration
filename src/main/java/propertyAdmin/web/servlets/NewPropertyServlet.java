package propertyAdmin.web.servlets;

import propertyAdmin.database.DatabaseOps;
import propertyAdmin.web.property.structure.Property;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addproperty")
public class NewPropertyServlet extends HttpServlet {

    private DatabaseOps databaseOps = DatabaseOps.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String address = req.getParameter("address");
        String name = req.getParameter("name");
        String details = req.getParameter("details");
        Property property = new Property(name, details, address);

        databaseOps.addPropertyToDatabase(req.getRemoteUser(), property);

        resp.sendRedirect("/properties.jsp");
    }
}