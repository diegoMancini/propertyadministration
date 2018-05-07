package propertyAdmin.web.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Florencia Vimberg
 */
@WebServlet("/chooseEmployee")
public class ChooseEmployeeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String chosenClient = req.getParameter("client");
        req.setAttribute("chosenClient", chosenClient);
        req.getRequestDispatcher("/addPropertyToEmployee.jsp").forward(req, resp);
    }
}
