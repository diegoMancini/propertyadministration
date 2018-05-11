package propertyAdmin.web.servlets;

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

@WebServlet("/addFunctionalUnit")
public class AddFunctionalUnit extends HttpServlet {
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       Integer chosenProperty = Integer.parseInt(req.getParameter("propertyIndex"));
       String name = req.getParameter("fuName");
      String address = req.getParameter("fuAddress");
      String addressTown = req.getParameter("fuAddressTown");
      String addressCity = req.getParameter("fuAddressCity");
      String addressProvince = req.getParameter("fuAddressProvince");
      String addressCountry = req.getParameter("fuAddressCountry");
      String type = req.getParameter("fuType");

      Property result = DatabaseOps.getInstance().getProperty(chosenProperty, req.getRemoteUser());
      FunctionalUnit functionalUnit = null;
      switch (type) {
         case "Vivienda" :
            functionalUnit = new LivingPlace(name, addressCountry, addressProvince, addressCity, addressTown ,address);
            break;
         case "Local":
            functionalUnit = new BusinessPremise(name, addressCountry, addressProvince, addressCity, addressTown ,address);
            break;
         case "Oficina":
            functionalUnit = new Office(name, addressCountry, addressProvince, addressCity, addressTown, address);
            break;
         case "Garage":
            functionalUnit = new Garage(name, addressCountry, addressProvince, addressCity, addressTown, address);
            break;
         default:
            break;
      }
      DatabaseOps.getInstance().addFunctionalUnitToDatabase(req.getRemoteUser(), result , functionalUnit);
      resp.sendRedirect("properties.jsp");
   }

}
