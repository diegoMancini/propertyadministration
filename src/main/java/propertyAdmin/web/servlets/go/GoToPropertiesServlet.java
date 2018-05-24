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

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//      Account account = databaseOps.getAccount(request.getRemoteUser());
//      List<Property> propertyList = account.getProperties();
      String username = request.getRemoteUser();
      request.setAttribute("username", username);
      response.sendRedirect("properties.jsp");

   }

}
