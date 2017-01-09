package bean;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
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
    static Map<Integer, Map<Integer, List<Message>>> recievedMessages = new HashMap<>();
    //static Map<Integer, Map<Integer, List<Message>>> sentMessages = new HashMap<>();
    static Map<Integer, Map<Integer, List<Message>>> chatThreads = new HashMap<>();
    static Map<Integer, Map<Integer, Integer>> position = new HashMap<>();
    //initializing the static data structures to hold sent and recieved Chat//
    ///////////////////////////////////////////////////////////////////////////
    
    static void initialize(int userId) throws SQLException {

        ////each user has their own array of sent and recieved Chat
        recievedMessages.put(userId, new HashMap<>());
        //sentMessages.put(userId, new HashMap<>());
        chatThreads.put(userId, new HashMap<>());
        position.put(userId, new HashMap<>());

        PreparedStatement ps;
        Connection con = ConnectionProvider.getCon();
        //get all the friends of the user
        ps = con.prepareStatement("SELECT * FROM (SELECT * FROM friend_list WHERE user_id=?) f INNER JOIN user u ON f.friend_id=u.user_id");
        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            int friendId = rs.getInt("friend_id");
            if (recievedMessages.get(friendId) != null) {
                recievedMessages.get(friendId).put(userId, new ArrayList<>());
                recievedMessages.get(userId).put(friendId, new ArrayList<>());
            }
        }
        //Connection con = ConnectionProvider.getCon();
        //PreparedStatement ps1, ps2;
        //ResultSet rs1, rs2;
        //when the user logs in the sent messages are retrieved from database
        //ps1 = con.prepareStatement("SELECT * FROM chats WHERE user_id=?");
        //ps1.setInt(1, userId);
        //rs1 = ps1.executeQuery();
        //while (rs1.next()) {
        // Message m1 = new Message(rs1.getString("message"), rs1.getInt("friend_id"), rs1.getInt("user_id"));
        // sentMessages.get(userId).get(rs1.getInt("friend_id")).add(m1);
        // }
        ////////////////////
        //when the user logs in the recieved messages are retrieved from database
        //ps2 = con.prepareStatement("SELECT * FROM chats WHERE friend_id=?");
        //ps2.setInt(1, userId);
        //rs2 = ps2.executeQuery();
        /*while (rs2.next()) {
            Message m2 = new Message(rs2.getString("message"), rs2.getInt("friend_id"), rs2.getInt("user_id"));
            recievedMessages.get(userId).get(rs1.getInt("friend_id")).add(m2);
        }*/
    }
    
    static void terminate(int userId){
        recievedMessages.remove(userId);
        chatThreads.remove(userId);
    }
    
    ///////////////////////////////////////////////////////////////////////////
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

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

    //catch the get request from showUser() function
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            int init = Integer.parseInt(request.getParameter("init"));
            int friendId = Integer.parseInt(request.getParameter("id"));
            int userId = (int) request.getSession().getAttribute("user_id");
            //if the chat is not initialized the initChat() will be called
            if (init == 0) {
                initChat(out, userId, friendId);
            } else if (recievedMessages.get(userId).get(friendId) != null) {
                addToRecieved(out, userId, friendId);
            } else if (recievedMessages.get(userId).get(friendId) == null) {

            }
        }
    }

    synchronized private void addToRecieved(PrintWriter out, int userId, int friendId) {
        List<Message> chatThread = recievedMessages.get(userId).get(friendId);
        if (chatThread.size() > 0) {
            Message m = chatThread.get(0);
            if (Chat.chatThreads.get(userId).get(friendId) != null) {
                Chat.chatThreads.get(userId).get(friendId).add(m);
            } else {
                Chat.chatThreads.get(userId).put(friendId, new ArrayList<>());
                Chat.chatThreads.get(userId).get(friendId).add(m); 
            }
            chatThread.remove(m);
            out.println(m.getMessage());
        }
    }

    synchronized public void initChat(PrintWriter out, int userId, int friendId) {

        List<Message> chatThread;
        if(Chat.recievedMessages.get(friendId)==null)
            out.println("<font style='color:grey;'>user offline..</font>");
        else if (Chat.chatThreads.get(userId).get(friendId) != null) {
            chatThread = Chat.chatThreads.get(userId).get(friendId);
            //newList.sort((Message o1, Message o2) -> o1.getTimestamp().compareTo(o2.getTimestamp()));
            for (Message m : chatThread) {
                out.println("<div class='row'><div class='col - lg - 12'><div class='media'>");
                out.println("<a class='pull-left' href='#'>");
                out.println("<img class='media-object img-circle' src='http://lorempixel.com/30/30/people/7/' alt=''>");
                out.println("</a>");
                out.println("<div class='media-body'><h4 class='media-heading'>");
                out.println(LoginDao.onlineUsers.get(m.getFromId()));
                out.println("<font id='chat-friend'></font>");
                out.println("<span class='small pull-right'>12:39 PM"); 
                out.println("</span>");
                out.println("</h4><p>");
                out.println(m.getMessage());
                out.println("</p></div></div></div></div>");
            }
        }
        else{
         
            
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
        try (PrintWriter out = response.getWriter()) {
            String mode = request.getParameter("mode");
            int friendId = Integer.parseInt(request.getParameter("id"));
            int userId = (int) request.getSession().getAttribute("user_id");

            if (mode.equals("0")) {
                if (recievedMessages.get(friendId) != null) {
                    Message msg = new Message(request.getParameter("message"), friendId, userId);
                    recievedMessages.get(friendId).get(userId).add(msg);
                    if(chatThreads.get(userId).get(friendId)!=null)
                        chatThreads.get(userId).get(friendId).add(msg);
                    else{
                        chatThreads.get(userId).put(friendId,new ArrayList<>());
                        chatThreads.get(userId).get(friendId).add(msg);
                    }
                } else {
                    out.println("User is offline");
                }

            }
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
