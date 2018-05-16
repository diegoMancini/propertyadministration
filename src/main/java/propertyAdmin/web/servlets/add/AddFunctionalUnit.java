package propertyAdmin.web.servlets.add;

import propertyAdmin.operations.DatabaseOps;
import propertyAdmin.structure.property.FunctionalUnit;
import propertyAdmin.structure.property.Property;
import propertyAdmin.structure.property.specifics.BusinessPremise;
import propertyAdmin.structure.property.specifics.Garage;
import propertyAdmin.structure.property.specifics.LivingPlace;
import propertyAdmin.structure.property.specifics.Office;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="addFunctionalUnit", value = "/addFunctionalUnit")
public class AddFunctionalUnit extends HttpServlet {
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       Integer chosenProperty = Integer.parseInt(req.getParameter("chosenProperty"));
       String accountUsername = req.getParameter("account");
       Property property = DatabaseOps.getInstance().getProperty(chosenProperty, req.getRemoteUser());
       String name = req.getParameter("fuName");
      String address = req.getParameter("fuAddress");
      String type = req.getParameter("fuType");
       req.setAttribute("accountUsername", accountUsername);
       req.setAttribute("chosenProperty", chosenProperty);
       req.setAttribute("property", property);
       req.setAttribute("propertyName", property.getName());

      Property result = DatabaseOps.getInstance().getProperty(chosenProperty, req.getRemoteUser());
      FunctionalUnit functionalUnit = null;
      switch (type) {
         case "Vivienda" :
            functionalUnit = new LivingPlace(name, address);
            break;
         case "Local":
            functionalUnit = new BusinessPremise(name,address);
            break;
         case "Oficina":
            functionalUnit = new Office(name, address);
            break;
         case "Garage":
            functionalUnit = new Garage(name,address);
            break;
         default:
            break;
      }
      DatabaseOps.getInstance().addFunctionalUnitToDatabase(req.getRemoteUser(), result , functionalUnit);
      req.getRequestDispatcher("specificProperty.jsp").forward(req,resp);
   }

}
