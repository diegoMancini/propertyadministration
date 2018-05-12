package propertyAdmin.web.servlets;

import propertyAdmin.operations.DatabaseOps;
import propertyAdmin.structure.property.Property;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "newProperty", value = "/newProperty")
@MultipartConfig
public class NewPropertyServlet extends HttpServlet {

    private DatabaseOps databaseOps = DatabaseOps.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("propertyName");
        String address = req.getParameter("propertyAddress");
        String description = req.getParameter("propertyDescription");
        String value = req.getParameter("propertyValue");
        Property property = new Property(name, description, address, value);
        property.setImageLink(databaseOps.getImageUrl(req, resp, "property-administration.appspot.com"));
        databaseOps.addPropertyToDatabase(req.getRemoteUser(), property);
        resp.sendRedirect("/properties.jsp");
    }

}