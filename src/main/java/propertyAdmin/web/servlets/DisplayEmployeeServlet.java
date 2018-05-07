package propertyAdmin.web.servlets;

import propertyAdmin.operations.DatabaseOps;
import propertyAdmin.structure.persons.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Florencia Vimberg
 */
@WebServlet("/displayEmployee")
public class DisplayEmployeeServlet extends HttpServlet {
    DatabaseOps databaseOps = DatabaseOps.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer chosenEmployee = Integer.parseInt(req.getParameter("chosenEmployee"));
        Account user = databaseOps.getAccount(req.getRemoteUser());
//        Employee employee = user.getSpecificEmployee(chosenEmployee);
//        req.setAttribute("employee", employee);
        req.getRequestDispatcher("/displayEmployee.jsp").forward(req, resp);
    }
}
