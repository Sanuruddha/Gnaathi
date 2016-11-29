package bean;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

public class Chat extends HttpServlet {
    
    /// data structures to hold Chat tempororaly
    
    static Map<Integer, List<Message>> recievedMessages = new HashMap<>();
    static Map<Integer, List<Message>> sentMessages = new HashMap<>();

    
    //initializing the static data structures to hold sent and recieved Chat//
    ///////////////////////////////////////////////////////////////////////////
    static void initialize(int userId) throws SQLException {
        
        ////each user has their own array of sent and recieved Chat
        recievedMessages.put(userId, new ArrayList<>());
        sentMessages.put(userId, new ArrayList<>());
        
        Connection con = ConnectionProvider.getCon();

        PreparedStatement ps1, ps2;
        ResultSet rs1, rs2;
        
        //when the user logs in the sent messages are retrieved from database
        
        ps1 = con.prepareStatement("SELECT * FROM chat WHERE user_id=?");
        ps1.setInt(1, userId);
        
        rs1 = ps1.executeQuery();
        while (rs1.next()) {
            Message m1 = new Message(rs1.getString("message"), rs1.getInt("friend_id"), rs1.getInt("user_id"));
            sentMessages.get(userId).add(m1);
        }
        
        ////////////////////
        
         //when the user logs in the recieved messages are retrieved from database
         
        ps2 = con.prepareStatement("SELECT * FROM chat WHERE friend_id=?");
        ps2.setInt(1, userId);
        rs2 = ps2.executeQuery();
        
        while (rs2.next()) {
            Message m2 = new Message(rs2.getString("message"), rs2.getInt("friend_id"), rs2.getInt("user_id"));
            recievedMessages.get(userId).add(m2);
        }
        /////////////////

    }

    ///////////////////////////////////////////////////////////////////////////
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        try (PrintWriter out = response.getWriter()) {
            String mode = request.getParameter("mode");
            int friendId = Integer.parseInt(request.getParameter("id"));
            int userId = (int) request.getSession().getAttribute("user_id");
            if (mode.equals("0")) {

                Message msg = new Message(request.getParameter("message"), friendId, userId);

                sentMessages.get(userId).add(msg);
                recievedMessages.get(friendId).add(msg);

            } else if (mode.equals("1")) {
                for (Message m : recievedMessages.get(userId)) {
                    out.println(m.getMessage());
                    if (!ChatModel.add(m)) {
                        System.out.println("failed");
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
            Logger.getLogger(Chat.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Chat.class.getName()).log(Level.SEVERE, null, ex);
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
