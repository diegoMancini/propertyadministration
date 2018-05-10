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
      int propertyID = Integer.parseInt(req.getParameter("specificProperty"));
      Property property = DatabaseOps.getInstance().getPropertyByID(propertyID, req.getRemoteUser());
      req.setAttribute("propertyId", propertyID);
      req.setAttribute("chosenProperty", property);
      req.getRequestDispatcher("/newFunctionalUnit.jsp").forward(req,resp);
   }
}
