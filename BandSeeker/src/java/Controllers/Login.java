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
import javax.servlet.http.Cookie;
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
            String Remember = request.getParameter("remember");

            Class.forName(driver).newInstance();
            conn = (Connection) DriverManager.getConnection(url + dbName, "admin", "admin");
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

                boolean rememberMe = false;
                if (Remember != null && Remember.equalsIgnoreCase("on")) {
                    rememberMe = true;
                }
                
                if (rememberMe) {           //If checkbox value is true
                    Cookie cookieUsername = new Cookie("cookieLoginUser", Username);
                    Cookie cookiePassword = new Cookie("cookieLoginPassword",Password);
                    // Make the cookie last 2 days
                    cookieUsername.setMaxAge(60 * 60 * 24 * 2);
                    cookiePassword.setMaxAge(60 * 60 * 24 * 2);
                    response.addCookie(cookieUsername);
                    response.addCookie(cookiePassword);
                }

                /*Set Attribute to session client's username*/
                session.setAttribute("username", Username);

                response.sendRedirect("index.jsp");
            } else {
                /*handle invalid username or password*/
                HttpSession session = request.getSession();
                session.setAttribute("msg", "Sorry, invalid username or password");

                RequestDispatcher rd = request.getRequestDispatcher("Error.jsp");
                rd.forward(request, response);
            }
        } catch (Exception e) {
            pw.println(e);
        }
    }
}
