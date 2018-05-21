package propertyAdmin.web.servlets.create;

import propertyAdmin.operations.DatabaseOps;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "NewContractServlet", value = "/newContract")
public class NewContractServlet extends HttpServlet {

    private DatabaseOps databaseOps = DatabaseOps.getInstance();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      Integer chosenProperty = Integer.valueOf(request.getParameter("chosenProperty"));
      Integer chosenFunctionalUnit = Integer.valueOf(request.getParameter("chosenFunctionalUnit"));
      String propertyName = request.getParameter("propertyName");
      String username = request.getParameter("account");
      request.setAttribute("chosenProperty", chosenProperty);
      request.setAttribute("chosenFunctionalUnit", chosenFunctionalUnit);
      request.setAttribute("propertyName", propertyName);
      request.setAttribute("account", username);
       request.getRequestDispatcher("addContract.jsp").forward(request,response);

   }

}
