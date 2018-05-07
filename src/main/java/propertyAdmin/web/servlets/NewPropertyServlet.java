package propertyAdmin.web.servlets;

import propertyAdmin.operations.DatabaseOps;
import propertyAdmin.structure.property.structure.Property;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addProperty")
public class NewPropertyServlet extends HttpServlet {

    private DatabaseOps databaseOps = DatabaseOps.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String address = req.getParameter("address");
        String name = req.getParameter("name");
        String details = req.getParameter("details");
        Double value = Double.parseDouble(req.getParameter("value"));
        Property property = new Property(name, details, address, value);

        databaseOps.addPropertyToDatabase(req.getRemoteUser(), property);

        resp.sendRedirect("/properties.jsp");
    }
}