package bean;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class chat extends HttpServlet {

    static Map<Integer, List<Message>> recievedMessages = new HashMap<>();
    static Map<Integer, List<Message>> sentMessages = new HashMap<>();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        try (PrintWriter out = response.getWriter()) {
            String mode = request.getParameter("mode");
            int friendId = Integer.parseInt(request.getParameter("id"));
            int userId = (int) request.getSession().getAttribute("user_id");
            if (mode.equals("0")) {

                Message msg = new Message(request.getParameter("message"), friendId, userId);

                if (recievedMessages.containsKey(friendId) == false) {
                    recievedMessages.put(friendId, new ArrayList<>());
                }

                recievedMessages.get(friendId).add(msg);

            } else if (mode.equals("1")) {
                if (recievedMessages.containsKey(userId)) {
                    for (Message m : recievedMessages.remove(userId)) {
                        out.println(m.getMessage());
                        if (!ChatModel.add(m)) {
                            System.out.println("failed");
                        }

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
        } catch (SQLException ex) {
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
        } catch (SQLException ex) {
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
