package propertyAdmin.web.servlets;

import propertyAdmin.operations.DatabaseOps;
import propertyAdmin.structure.persons.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/signup")
public class NewAccountServlet extends HttpServlet {

    private DatabaseOps databaseOps = DatabaseOps.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
        String identityNumber = req.getParameter("identityNumber"); //check
        String phoneNumber = req.getParameter("phoneNumber"); //idem
        String nationality = req.getParameter("nationality");
        String maritalStatus = req.getParameter("maritalStatus");
        String addressCountry = req.getParameter("addressCountry");
        String addressProvince = req.getParameter("addressProvince");
        String addressCity = req.getParameter("addressCity");
        String addressTown = req.getParameter("addressTown");
        String address = req.getParameter("address");
        String addressZipCode = req.getParameter("addressZipCode");
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        Account account = new Account(name, surname, identityNumber, nationality, maritalStatus, address, addressCountry, addressProvince,
                addressCity, addressTown, addressZipCode, phoneNumber, email, password, username);

        String page = "";
        if(!databaseOps.hasAccount(email)){
            databaseOps.addAccountToDatabase(account);
            page += "/propertyadmin/home.jsp";
        } else {
            page += "/propertyadmin/pages-register.jsp";
        }

        resp.sendRedirect(page);
    }
}
