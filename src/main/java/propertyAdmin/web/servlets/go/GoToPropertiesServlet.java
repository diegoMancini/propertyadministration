package propertyAdmin.web.servlets.go;

import propertyAdmin.operations.DatabaseOps;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "GoToProperties", value = "/goToProperties")
public class GoToPropertiesServlet extends HttpServlet {

   private DatabaseOps databaseOps = DatabaseOps.getInstance();

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//      String auxUsername = request.getParameter("account");
//      Account account = databaseOps.getAccount(request.getRemoteUser());
//      String username = account.getUsername();
//      List<Property> propertyList = account.getProperties();
      response.sendRedirect("properties.jsp");

   }

}
