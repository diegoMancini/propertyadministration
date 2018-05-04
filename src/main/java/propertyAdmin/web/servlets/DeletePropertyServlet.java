package propertyAdmin.web.servlets;

import propertyAdmin.operations.DatabaseOps;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/deleteProperty")
public class DeletePropertyServlet extends HttpServlet {

    DatabaseOps databaseOps = DatabaseOps.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer propertyCode = Integer.parseInt(req.getParameter("propertyToDelete"));

        databaseOps.deleteProperty(req.getRemoteUser(), propertyCode);

        resp.sendRedirect("/properties.jsp");
    }
}
