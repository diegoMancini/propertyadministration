package propertyAdmin.web.servlets;

import propertyAdmin.operations.DatabaseOps;
import propertyAdmin.structure.property.Property;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/goToProperty")
public class GoToPropertyServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer chosenProperty = Integer.parseInt(req.getParameter("chosenProperty"));
        Property property = DatabaseOps.getInstance().getProperty(chosenProperty, req.getRemoteUser());
        req.setAttribute("chosenProperty", chosenProperty);
        req.setAttribute("property", property);
        req.setAttribute("propertyName", property.getName());
        String path = "/specificProperty.jsp";
        req.getRequestDispatcher(path).forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}