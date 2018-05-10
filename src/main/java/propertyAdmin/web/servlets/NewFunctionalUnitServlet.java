package propertyAdmin.web.servlets;

import propertyAdmin.operations.DatabaseOps;
import propertyAdmin.structure.property.Property;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/newFunctionalUnit")
public class NewFunctionalUnitServlet extends HttpServlet {

   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      Integer propertyID = Integer.parseInt(req.getParameter("specificProperty"));
      Integer propertyIndex = Integer.parseInt(req.getParameter("propertyIndex"));
      Property property = DatabaseOps.getInstance().getPropertyByID(propertyID, req.getRemoteUser());
      Property property1 = DatabaseOps.getInstance().getProperty(propertyIndex, req.getRemoteUser());
      req.setAttribute("propertyId", propertyID);
      req.setAttribute("propertyIndex", propertyIndex);
      req.setAttribute("propertyObject", property);
      req.setAttribute("propertyObject1", property1);
      req.getRequestDispatcher("/newFunctionalUnit.jsp").include(req,resp);
   }

}
