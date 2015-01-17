/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Listeners;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Web application lifecycle listener.
 *
 * @author George Garyfallou
 */
public class SessionCounter implements HttpSessionListener {
    /*Total number of sessions in the life of this Web application*/
    private int totalSessionCount = 0;
    /*Number of sessions currently in memory*/
    private int currentSessionCount = 0;
    /*Maximum number of sessions that have ever been inmemory at any one time*/
    private int maxSessionCount = 0;
    
    //private ServletContext context = null; /*Remove comments to print SessionCounter info*/

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        totalSessionCount++;
        currentSessionCount++;
        // Print the counter.
        System.out.println("Number of sessions currently in memory:(after create)" + currentSessionCount );
        if (currentSessionCount > maxSessionCount) {
            maxSessionCount = currentSessionCount;
        }
        
        /*Remove comments to print SessionCounter info*/
        /*
        if (context == null) {
            storeInServletContext(se);
        }
        */
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        currentSessionCount--;
        System.out.println("Number of sessions currently in memory(after destoy):" + currentSessionCount );
    }

    /**
     * The total number of sessions created.
     *
     * @return
     */
    public int getTotalSessionCount() {
        return (totalSessionCount);
    }

    /**
     * The number of sessions currently in memory.
     *
     * @return
     */
    public int getCurrentSessionCount() {
        return (currentSessionCount);
    }

    /**
     * The largest number of sessions ever in memory at any one time.
     *
     * @return
     */
    public int getMaxSessionCount() {
        return (maxSessionCount);
    }

    // Register self in the servlet context so that
    // servlets and JSP pages can access the session counts.
    /*Remove comments to print SessionCounter info*/
    /*
    private void storeInServletContext(HttpSessionEvent event) {
        HttpSession session = event.getSession();
        context = session.getServletContext();
        context.setAttribute("sessionCounter", this);
    }
    */

}
