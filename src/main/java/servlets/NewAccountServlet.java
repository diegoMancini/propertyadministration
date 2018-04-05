package servlets;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import persons.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/signup")
public class NewAccountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
        String identityNumber = req.getParameter("identityNumber"); //check
        String phoneNumber = req.getParameter("phoneNumber"); //idem
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String role = req.getParameter("role");

        SessionFactory sessionFactory;
        Session session;
        Transaction transaction;

        Configuration configuration = new Configuration();
        sessionFactory = configuration.configure().buildSessionFactory();
        session = sessionFactory.openSession();
        transaction = session.beginTransaction();

        User newUser = new User(name, surname,email, identityNumber, phoneNumber, role, password);

        session.save(newUser);

        transaction.commit();
        session.close();
        sessionFactory.close();

        resp.sendRedirect("/home.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getParameter("name");
    }
}
