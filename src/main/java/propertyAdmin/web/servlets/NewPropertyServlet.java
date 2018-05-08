package propertyAdmin.web.servlets;

import propertyAdmin.operations.DatabaseOps;
import propertyAdmin.structure.property.Property;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;

@WebServlet("/addProperty")
@MultipartConfig
public class NewPropertyServlet extends HttpServlet {

    private DatabaseOps databaseOps = DatabaseOps.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("properrtName");
        String address = req.getParameter("propertyAddress");
        String description = req.getParameter("propertyDescription");
        Double value = Double.parseDouble(req.getParameter("value"));
        Part filePart = req.getPart("propertyImage");
        Property property = new Property(name, description, address, value);
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        InputStream fileContent = filePart.getInputStream();
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        byte[] buffer = new byte[10240];
        for (int length = 0 ; (length = fileContent.read(buffer)) > 0;) output.write(buffer, 0, length);
        property.setImage(output.toByteArray(), fileName);
        DatabaseOps.getInstance().addPropertyToDatabase(req.getRemoteUser(), property);
        resp.sendRedirect("/propertyadmin/properties.jsp");

    }
}