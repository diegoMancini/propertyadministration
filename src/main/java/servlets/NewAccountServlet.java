package servlets;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import persons.Account;
import persons.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/signup.jsp")
public class NewAccountServlet extends HttpServlet {
    @Override

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
        String identityNumber = req.getParameter("identityNumber"); //check
        String nationality = req.getParameter("nationality");
        String maritalStatus = req.getParameter("maritalStatus");
        String address = req.getParameter("address");
        String addressCountry = req.getParameter("addressCountry");
        String addressProvince = req.getParameter("addressProvince");
        String addressCity = req.getParameter("addressCity");
        String addressTown = req.getParameter("addressTown");
        String addressZipCode = req.getParameter("addressZipCode");
        String phoneNumber = req.getParameter("phoneNumber"); //idem
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        SessionFactory sessionFactory;
        Session session;
        Transaction transaction;

        Configuration configuration = new Configuration();
        sessionFactory = configuration.configure().buildSessionFactory();
        session = sessionFactory.openSession();
        transaction = session.beginTransaction();

        Account user1 = new Account(name, surname,identityNumber, nationality, maritalStatus, address, addressCountry, addressProvince, addressCity, addressTown, addressZipCode, phoneNumber, email, password);

        session.save(user1);

        transaction.commit();
        session.close();
        sessionFactory.close();

        resp.sendRedirect("/home.jsp");
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getParameter("name");
    }
}
