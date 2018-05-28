package propertyAdmin.web.servlets.create;

import propertyAdmin.operations.DatabaseOps;
import propertyAdmin.structure.property.Property;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "NewPropertyServlet", value = "/newProperty")
@MultipartConfig
public class NewPropertyServlet extends HttpServlet {

    private DatabaseOps databaseOps = DatabaseOps.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("propertyName");
        String description = req.getParameter("propertyDescription");
        String address = req.getParameter("propertyAddress");
        String country = req.getParameter("propertyCountry");
        String province = req.getParameter("propertyProvince");
        String city = req.getParameter("propertyCity");
        String town = req.getParameter("propertyTown");
        Property property = new Property(name, description, country, province, city, town, address);
        property.setImageLink(databaseOps.getImageUrl(req, resp, "property-administration.appspot.com"));
        databaseOps.addPropertyToDatabase(req.getRemoteUser(), property);
        resp.sendRedirect("properties.jsp");

    }

}