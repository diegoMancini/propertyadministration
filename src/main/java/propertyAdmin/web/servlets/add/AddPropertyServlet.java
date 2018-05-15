package propertyAdmin.web.servlets.add;

import propertyAdmin.operations.DatabaseOps;
import propertyAdmin.structure.persons.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AddPropertyServlet", value = "addProperty")
public class AddPropertyServlet extends HttpServlet {
   private DatabaseOps databaseOps = DatabaseOps.getInstance();

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      Account account = databaseOps.getAccount(request.getParameter("account"));
      request.setAttribute("account",account);
      request.setAttribute("accountUsername", account.getUsername());
      request.getRequestDispatcher("newProperty.jsp").forward(request,response);
   }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

   }
}
