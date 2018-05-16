package propertyAdmin.web.servlets;

import propertyAdmin.operations.DatabaseOps;
import propertyAdmin.structure.persons.Account;
import propertyAdmin.structure.property.Property;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeServlet", value = "/homeServlet")
public class HomeServlet extends HttpServlet {

   private DatabaseOps databaseOps = DatabaseOps.getInstance();

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      Account account = databaseOps.getAccount(request.getRemoteUser());
      String username = account.getUsername();
      String email = account.getEmail();
      List<Property> propertyList = account.getProperties();
      request.setAttribute("account", account);
      request.setAttribute("username", username);
      request.setAttribute("email", email);
      request.setAttribute("properties", propertyList);
   }


}
