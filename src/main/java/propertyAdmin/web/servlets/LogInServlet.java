package propertyAdmin.web.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/j_security_check")
public class LogInServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("checkbox") != null) {
            Cookie username = new Cookie("username", request.getParameter("j_username"));
            Cookie password = new Cookie("password" , request.getParameter("j_password"));
            username.setMaxAge(24*60*60);
            password.setMaxAge(24*60*60);
            response.addCookie(username);
            response.addCookie(password);// response is an instance of type HttpServletReponse
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie[] cookies = req.getCookies();     // request is an instance of type
        //HttpServletRequest
        boolean foundCookieUsername = false;
        boolean foundCookiePassword = false;

        for(int i = 0; i < cookies.length; i++) {
            Cookie c = cookies[i];
            if (c.getName().equals("username")) {
                String userId = c.getValue();
                foundCookieUsername = true;
            }
            if (c.getName().equals("password")) {
                String password = c.getValue();
                foundCookiePassword = true;
            }
        }
    }
}
