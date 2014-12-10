/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author George Garyfallou
 */
public class Login extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        
        /*define connection-to-database variables*/
        Connection conn = null;
        String url = "jdbc:mysql://localhost:3306/";
        String dbName = "bandseeker";
        String driver = "com.mysql.jdbc.Driver";

        try {
            String Username = request.getParameter("username");
            String Password = request.getParameter("password");

            Class.forName(driver).newInstance();
            conn = (Connection) DriverManager.getConnection(url + dbName, "gi0rikas", "%ge31705");
            PreparedStatement pst = (PreparedStatement) conn.prepareStatement("select * from bandseeker.users where username='" + Username + "' and password='" + Password + "'");
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                HttpSession session = request.getSession();
                if (session.isNew()) {
                    /*No session available*/
                    System.out.println("No session avlb");
                } else {
                    /*Sesion already exists*/
                    System.out.println("welcome back");
                }
                
                String msg = "You have successfully signed in!";
                pw.println("<font size='10' color=#000>" + msg + "</font>");
                
                /*Set Attribute to session client's username*/
                session.setAttribute("username", Username);
                //out.println("welcome " + userid);
                //out.println("<a href='logout.jsp'>Log out</a>");
                response.sendRedirect("index.jsp");
            } else {
                /*handle invalid username or password*/
            }
        } catch (Exception e) {
            pw.println(e);
        }
    }
}
