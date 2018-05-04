package propertyAdmin.web.servlets;

import propertyAdmin.operations.DatabaseOps;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.nio.file.Paths;

/**
 * @author Florencia Vimberg
 */
@WebServlet("/upload")
@MultipartConfig
public class UploadServlet extends HttpServlet{

    private DatabaseOps databaseOps = DatabaseOps.getInstance();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String propertyName = (String) request.getAttribute("newPropertyName");
        String description = request.getParameter("description"); // Retrieves <input type="text" name="description">
        Part filePart = request.getPart("file"); // Retrieves <input type="file" name="file">
        byte[] bytes = Paths.get(filePart.getSubmittedFileName()).getFileName().toString().getBytes();
        BufferedReader in = new BufferedReader(new FileReader(new File("images")));
//        File file = new File(filePart);
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
        InputStream fileContent = filePart.getInputStream();

//        databaseOps.addFileToFacilities(request.getRemoteUser(), propertyName, fileContent);
    }
}
