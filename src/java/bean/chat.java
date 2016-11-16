package bean;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class chat extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InterruptedException {

        Connection con = ConnectionProvider.getCon();

        List messages = Collections.synchronizedList(new LinkedList());

        try (PrintWriter out = response.getWriter()) {
            String mode = request.getParameter("mode");
            int friendId;
            if (mode.equals("0")) {              
                Message msg = new Message(request.getParameter("message"),2, (int) request.getSession().getAttribute("user_id"));
                messages.add(msg);
            } else if (mode.equals("1")) {
                if(request.getParameter("id")!=null){
                    friendId = Integer.parseInt(request.getParameter("id"));
                    System.out.println(friendId);
                }
                else
                    System.out.println("Null here");
                
                if(!messages.isEmpty()) {
                    Message msg = (Message) messages.remove(0);
                    if ((int) request.getSession().getAttribute("user_id") == msg.getToId()) {
                        out.println(msg.getMessage());
                    }
                }
                
            }
        }
    }

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
        try {
            processRequest(request, response);
        } catch (InterruptedException ex) {
            Logger.getLogger(chat.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

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
        try {
            processRequest(request, response);
        } catch (InterruptedException ex) {
            Logger.getLogger(chat.class.getName()).log(Level.SEVERE, null, ex);
        }
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
