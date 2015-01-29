/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Uploader;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import java.io.File;
import java.io.IOException;
import java.sql.DriverManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author George Garyfallou
 */
public class FileUploader extends HttpServlet {

    private static final String SAVE_DIR = "UploadedImages";

    
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
        
        Connection conn = null;
        String url = "jdbc:mysql://localhost:3306/";
        String dbName = "bandseeker?autoReconnect=true";
        String driver = "com.mysql.jdbc.Driver";

        //process only if its multipart content
        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                // gets absolute path of the web application
                String appPath = request.getServletContext().getRealPath("");     //apothikeuei katw apo to build/web
                // constructs path of the directory to save uploaded file
                //String savePath = appPath +"\\..\\..\\web\\" + File.separator + SAVE_DIR;       //gurnaw pisw st web/
                String savePath = appPath + File.separator + SAVE_DIR;       //gurnaw pisw st web/

                // creates the save directory if it does not exists
                File fileSaveDir = new File(savePath);
                if (!fileSaveDir.exists()) {
                    fileSaveDir.mkdir();
                }

                for (Part part : request.getParts()) {
                    String fileName = extractFileName(part);
                    part.write(savePath + File.separator + fileName);
                   
                    /*Write info into DataBase--->bandseeker/images*/
                    
                    HttpSession session = request.getSession();

                    String[] fn  = fileName.split("[.]");
                    String stem ="";
                    String image_extension;
                    for (int i =0; i<fn.length;i++){
                        stem += fn[i];
                        if(i != fn.length -2){
                            stem+= ".";
                        }
                        else{
                            break;
                        }
                    }
                    image_extension = fn[fn.length-1];
                    
                    String owner = session.getAttribute("username").toString(); 


                    Class.forName(driver).newInstance();
                    conn = (Connection) DriverManager.getConnection(url + dbName, "admin", "admin");
                    PreparedStatement pst = (PreparedStatement) conn.prepareStatement("insert into bandseeker.images(stem,image_extension,owner) values(?,?,?)");


                    pst.setString(1,stem);
                    pst.setString(2,image_extension);
                    pst.setString(3,owner);

                    int i = pst.executeUpdate();
                    //conn.commit();
                    pst.close();

                    /***********************************************/
                    //File uploaded successfully
                    request.setAttribute("message", "Upload has been done successfully!");  // file name  = "+stem+"."+image_extension+ "  
                }
            
            } catch (Exception ex) {    //File upload failed
                request.setAttribute("message", "File Upload Failed ");  // due to " + ex 
            }

        } else {
            request.setAttribute("message","Sorry this Servlet only handles file upload request");
        }
        
        RequestDispatcher rd = request.getRequestDispatcher("ChangeProfile.jsp");
        rd.forward(request, response);

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
