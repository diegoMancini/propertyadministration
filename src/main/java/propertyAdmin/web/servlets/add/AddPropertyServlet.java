package propertyAdmin.web.servlets.add;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AddPropertyServlet" , value = "/addProperty")

public class AddPropertyServlet extends HttpServlet {


   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String username = request.getParameter("account");
      request.setAttribute("account", username);
      request.getRequestDispatcher("newProperty.jsp").forward(request,response);
   }
}
