/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Uploader;

import com.mysql.jdbc.Connection;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author George Garyfallou
 */
public class FileUploader extends HttpServlet {

    private static final String SAVE_DIR = "UploadedImages";

    /*    @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response)
     throws ServletException, IOException {

     for (Part part : request.getParts()) {
     /*
     Connection conn = null;
     String url = "jdbc:mysql://localhost:3306/";
     String dbName = "bandseeker";
     String driver = "com.mysql.jdbc.Driver";
     */
    /**
     * ***************************************************************
     */
    /*  String name = part.getName();

     String contentType = part.getContentType();

     if (!contentType.equals("image/png")) {
     out.println("Only png format image files supported");
     continue;
     }

     InputStream is = request.getPart(name).getInputStream();
     File uploadDir = new File("C:\\Users\\George\\Desktop\\Web Dev\\NetBeans-Java Projects\\My Projects\\BandSeeker\\web\\UploadedImages");
     File file = File.createTempFile("img", ".png", uploadDir);

     FileOutputStream fos = new FileOutputStream(file);

     int data = 0;
     while ((data = is.read()) != -1) {
     fos.write(data);
     }

     fos.close();
     is.close();

     out.println("Written file to " + file.getAbsolutePath());
     }

     out.println("Completed.");

     }
     */
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //process only if its multipart content
        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                // gets absolute path of the web application
                /////////String appPath = request.getContextPath().toString();  ///pws tha ginei
                String appPath = request.getServletContext().getRealPath("");     //apothikeuei katw apo to build/web
                // constructs path of the directory to save uploaded file
                String savePath = appPath + File.separator + SAVE_DIR;

                // creates the save directory if it does not exists
                File fileSaveDir = new File(savePath);
                if (!fileSaveDir.exists()) {
                    fileSaveDir.mkdir();
                }

                for (Part part : request.getParts()) {
                    String fileName = extractFileName(part);
                    part.write(savePath + File.separator + fileName);
                }

                request.setAttribute("message", "Upload has been done successfully! in " + appPath);

            } catch (Exception ex) {
                request.setAttribute("message", "File Upload Failed due to " + ex);
            }

        } else {
            request.setAttribute("message",
                    "Sorry this Servlet only handles file upload request");
        }
        //File uploaded successfully
        //request.setAttribute("message", "File Uploaded Successfully");
        

        request.getRequestDispatcher("/ChangeProfile.jsp").forward(request, response);

    }
    
    /**
    * Extracts file name from HTTP header content-disposition
    */
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
