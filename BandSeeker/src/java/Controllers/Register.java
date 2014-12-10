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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author George Garyfallou
 */
public class Register extends HttpServlet {

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

        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        //String connectionURL = "jdbc:mysql://127.0.0.1:3306/newData";// newData is the database  
        //Connection connection;  
        Connection conn = null;
        String url = "jdbc:mysql://localhost:3306/";
        String dbName = "bandseeker";
        String driver = "com.mysql.jdbc.Driver";

        try {
            String AccountType=request.getParameter("account-type");
            pw.println(AccountType);
            //System.out.println(AccountType);
/*                    AccountType="band";
                }
                else{
                    AccountType="musician";
                }*/
            String Username = request.getParameter("username");
            String Password = request.getParameter("password");
            String firstName=request.getParameter("Fname");
            String lastName=request.getParameter("Lname");
            String Email=request.getParameter("email");

            Class.forName(driver).newInstance();
            conn = (Connection) DriverManager.getConnection(url + dbName, "gi0rikas", "%ge31705");
            PreparedStatement pst = (PreparedStatement) conn.prepareStatement("insert into bandseeker.users(type,username,password,Fname,Lname,email) values(?,?,?,?,?,?)");

            pst.setString(1,AccountType);  
            pst.setString(2,Username);        
            pst.setString(3, Password);
            pst.setString(4, firstName);
            pst.setString(5,lastName);
            pst.setString(6,Email);

            int i = pst.executeUpdate();
            //conn.commit(); 
            String msg = " ";
            if (i > 0) {
                //session.setAttribute("userid", Username);
                msg = "You have successfully signed up!";
                pw.println("<font size='6' color=black>" + msg + "</font>");

            } else {
                msg = "failed to insert the data";
                pw.println("<font size='3' color=black>" + msg + "</font>");
            }
            pst.close();
        } catch (Exception e) {
            //pw.println(AccountType);
            pw.println(e);
        }
        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.include(request, response);
    }

}
