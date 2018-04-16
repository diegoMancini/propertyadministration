package propertyAdmin.servlets;

import propertyAdmin.database.DatabaseOps;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet("/addproperty")
public class NewPropertyServlet extends HttpServlet {

    private DatabaseOps databaseOps = DatabaseOps.getInstance();

//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String address = req.getParameter("address");
//        String name = req.getParameter("name");
//
//        databaseOps.addPropertyToDatabase(address, name);
//
//        resp.sendRedirect("/home.jsp");
//    }
}