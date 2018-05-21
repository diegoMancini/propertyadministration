package propertyAdmin.web.servlets.go;

import propertyAdmin.operations.DatabaseOps;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "goToSpecificFunctionalUnit", value = "/goToSpecificFunctionalUnit")
public class GoToSpecificFunctionalUnitServlet extends HttpServlet {

    private DatabaseOps databaseOps = DatabaseOps.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
