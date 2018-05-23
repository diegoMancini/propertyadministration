package propertyAdmin.web.servlets.go;

import propertyAdmin.operations.DatabaseOps;
import propertyAdmin.structure.property.Property;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "GoToSpecificProperty", value = "/goToSpecificProperty")
public class GoToSpecificPropertyServlet extends HttpServlet {

    private DatabaseOps databaseOps = DatabaseOps.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer chosenProperty = Integer.valueOf(req.getParameter("chosenProperty"));
        String accountUsername = req.getParameter("username");
        Property property = databaseOps.getProperty(chosenProperty, accountUsername);
        req.setAttribute("chosenProperty", chosenProperty);
        req.setAttribute("property", property);
        req.setAttribute("propertyName", property.getName());
        req.setAttribute("username", accountUsername);
        req.getRequestDispatcher("specificProperty.jsp").forward(req,resp);
    }
}
