package propertyAdmin.web.servlets;

import propertyAdmin.operations.DatabaseOps;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "j_security_check", value = "/j_security_check")
public class LogInServlet extends HttpServlet{

    private DatabaseOps databaseOps = DatabaseOps.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().setAttribute("account", req.getRemoteUser());
    }
}
