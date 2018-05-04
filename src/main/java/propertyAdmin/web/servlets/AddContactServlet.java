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
@WebServlet("/chooseContact")
public class AddContactServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer chosenProperty = Integer.valueOf(req.getParameter("chosenProperty"));
        req.setAttribute("chosenProperty", chosenProperty);
        req.getRequestDispatcher("/addContact.jsp").forward(req, resp);
    }
}
