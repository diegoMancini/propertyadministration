package propertyAdmin.web.servlets.go;

import propertyAdmin.operations.DatabaseOps;
import propertyAdmin.structure.property.FunctionalUnit;
import propertyAdmin.structure.property.Property;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "GoToSpecificProperty", value = "goToSpecificProperty")
public class GoToSpecificPropertyServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer chosenProperty = Integer.parseInt(req.getParameter("chosenProperty"));
        Property property = DatabaseOps.getInstance().getProperty(chosenProperty, req.getRemoteUser());
        List<FunctionalUnit> list = property.getFunctionalUnits();
        req.setAttribute("chosenProperty", chosenProperty);
        req.setAttribute("property", property);
        req.setAttribute("propertyFU", list);
        req.setAttribute("propertyName", property.getName());
        String path = "specificProperty.jsp";
        req.getRequestDispatcher(path).forward(req, resp);
    }
}
