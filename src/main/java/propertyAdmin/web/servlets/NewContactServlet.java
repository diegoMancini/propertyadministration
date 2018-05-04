package propertyAdmin.web.servlets;

import propertyAdmin.operations.DatabaseOps;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Florencia Vimberg
 */
@WebServlet("/addContact")
public class NewContactServlet extends HttpServlet {
    private DatabaseOps databaseOps = DatabaseOps.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer chosenProperty = Integer.valueOf(req.getParameter("chosenProperty"));
        String occupation = req.getParameter("occupation");
        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
        Integer phoneNumber = Integer.parseInt(req.getParameter("phoneNumber"));

        databaseOps.addContactToDatabase(occupation, name, surname, phoneNumber, chosenProperty, req.getRemoteUser());

        resp.sendRedirect("/properties.jsp");
    }
}
