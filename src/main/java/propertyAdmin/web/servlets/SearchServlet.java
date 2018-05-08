package propertyAdmin.web.servlets;

import propertyAdmin.operations.DatabaseOps;
import propertyAdmin.structure.property.Property;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {

    DatabaseOps databaseOps = DatabaseOps.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Property> searchedProperties = databaseOps.getSearchResult(req.getRemoteUser(),req.getParameter("searchInput"));
        req.setAttribute("searchedProperties", searchedProperties);
        req.getRequestDispatcher("/searchResult.jsp").forward(req, resp);
    }
}
