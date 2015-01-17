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
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
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
public class Search extends HttpServlet {

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

        try {
            Connection conn = null;
            String url = "jdbc:mysql://localhost:3306/";
            String dbName = "bandseeker";
            String driver = "com.mysql.jdbc.Driver";

            String AccountType = request.getParameter("account-type");
            String MusicianType = request.getParameter("musician-type-select");

            Class.forName(driver).newInstance();
            conn = (Connection) DriverManager.getConnection(url + dbName, "admin", "admin");

            ResultSet resultSet = null;
            if (AccountType.equals("musician") && MusicianType.equals("null")) {
                PreparedStatement pst = (PreparedStatement) conn.prepareStatement("select * from bandseeker.users where type='" + AccountType + "'");
                resultSet = pst.executeQuery();
                System.out.println("RS1");
            } else {
                PreparedStatement pst = (PreparedStatement) conn.prepareStatement("select * from bandseeker.users where type='" + AccountType + "' and instrument='" + MusicianType + "'");
                resultSet = pst.executeQuery();
                System.out.println("RS2");
            }

            /*elegxos*/
            ResultSetMetaData rsmd = resultSet.getMetaData();
            int columnsNumber = rsmd.getColumnCount();

            ArrayList arrayList = new ArrayList();
            boolean j = false;
            while (resultSet.next()) {
                int i = 1;
                j = true;
                Map user = new HashMap();
                while (i <= columnsNumber) {
                    if (i == 2) {
                        user.put("username", resultSet.getString(i));
                    } else if (i == 4) {
                        user.put("email", resultSet.getString(i));
                    } else if (i == 5) {
                        user.put("Fname", resultSet.getString(i));
                    } else if (i == 6) {
                        user.put("Lname", resultSet.getString(i));
                    } else if (i == 7) {
                        user.put("instrument", resultSet.getString(i));
                    } else if (i == 8) {
                        user.put("type", resultSet.getString(i));
                    } else if (i == 9) {
                        user.put("about", resultSet.getString(i));
                    }
                    i++;
                }
                arrayList.add(user);
            }

            if (columnsNumber != 0 && j == true) {
                HttpSession session = request.getSession();
                if (session.isNew()) {
                    /*No session available*/
                    System.out.println("No session avlb");
                } else {
                    /*Sesion already exists*/
                    System.out.println("welcome back");
                }

                String msg = "Here are your results!";

                /*Set Attribute to session client's username*/
                session.setAttribute("message", msg);
                session.setAttribute("results", arrayList);

                /*edw mporei an thelei allagh se request dispatcher*/
                response.sendRedirect("ResultsPage.jsp");

            } else {
                HttpSession session = request.getSession();
                session.setAttribute("message", "Sorry no resuts for this query...");
                session.setAttribute("results", null);
                response.sendRedirect("ResultsPage.jsp");
            }
        } catch (Exception e) {

        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Proccess the search info and return the results";
    }

}
