package propertyAdmin.web.servlets.add;

import propertyAdmin.operations.DatabaseOps;
import propertyAdmin.structure.property.Contract;
import propertyAdmin.structure.property.FunctionalUnit;
import propertyAdmin.structure.property.Property;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AddPDFToContractServlet", value = "/addPDFToContract")
@MultipartConfig

public class AddPDFToContractServlet extends HttpServlet {
   private DatabaseOps databaseOps = DatabaseOps.getInstance();

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      Integer chosenProperty = Integer.valueOf(request.getParameter("chosenProperty"));
      Integer chosenFunctionalUnit = Integer.valueOf(request.getParameter("chosenFunctionalUnit"));
      Property property = databaseOps.getProperty(chosenProperty, request.getRemoteUser());
       FunctionalUnit functionalUnit = (FunctionalUnit) request.getAttribute("functionalUnit");

      request.setAttribute("chosenProperty", chosenProperty);
      request.setAttribute("chosenFunctionalUnit", chosenFunctionalUnit);
      request.setAttribute("property", property);
      request.setAttribute("propertyName", property.getName());
      request.setAttribute("username", request.getRemoteUser());

      Contract contract = functionalUnit.getContract();
      contract.setImageLink(databaseOps.getImageUrl(request, response, "property-administration.appspot.com"));
      request.getRequestDispatcher("specificProperty.jsp").forward(request,response);
   }

}
