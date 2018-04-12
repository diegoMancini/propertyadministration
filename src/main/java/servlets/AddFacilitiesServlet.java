package servlets;

import database.DatabaseOps;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet("/addfacilities")
public class AddFacilitiesServlet extends HttpServlet {

    private DatabaseOps databaseOps = DatabaseOps.getInstance();

//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        //facilities conviene que lo rellene
//        Integer amtBathrooms = (Integer) req.getAttribute("amtBathrooms");
//        Integer amtRooms = (Integer) req.getAttribute("amtRooms");
//        Integer sqrMeter = (Integer) req.getAttribute("sqrMeter");
//        String details = req.getParameter("details");
//
//        Property findProperty = (Property) req.getAttribute("property");
//        databaseOps.addFacilities(amtBathrooms, amtRooms, sqrMeter, details, findProperty);
//
//        resp.sendRedirect("/properties.jsp");
//    }
}
