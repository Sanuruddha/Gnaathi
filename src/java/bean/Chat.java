package bean;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Chat extends HttpServlet {

    /// data structures to hold Chats tempororaly
    static Map<Integer, Map<Integer, List<Message>>> recievedMessages = new HashMap<>();

    static Map<Integer, Map<Integer, List<Message>>> chatThreads = new HashMap<>();

    //this is called when user logs in
    static void initialize(int userId) throws SQLException {

        recievedMessages.put(userId, new HashMap<>());
        chatThreads.put(userId, new HashMap<>());

        PreparedStatement ps;
        Connection con = ConnectionProvider.getCon();
        //get all the friends of the user
        ps = con.prepareStatement("SELECT * FROM (SELECT * FROM friend_list WHERE user_id=?) f INNER JOIN user u ON f.friend_id=u.user_id");
        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();

        //creating chat threads for all the friends
        while (rs.next()) {
            int friendId = rs.getInt("friend_id");
            if (recievedMessages.get(friendId) != null) {
                recievedMessages.get(friendId).put(userId, new ArrayList<>());
                recievedMessages.get(userId).put(friendId, new ArrayList<>());
            }
        }

    }

    //this is called when user logs out
    static void terminate(int userId) {
        recievedMessages.remove(userId);
        chatThreads.remove(userId);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

    }

    @Override

    //catch the ajax get request from showUser() function
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            int FALSE = 0;
            int init = Integer.parseInt(request.getParameter("init"));
            int friendId = Integer.parseInt(request.getParameter("id"));
            int userId = (int) request.getSession().getAttribute("user_id");

            //if the chat is not initialized the initChat() will be called
            if (init == FALSE) {
                initChat(out, userId, friendId);
            } else if (recievedMessages.get(userId).get(friendId) != null) {

                addToRecieved(out, userId, friendId);
            }
        }
    }

    //synchronized method to manipulate the static Hash map ,reivedMessages 
    synchronized private void addToRecieved(PrintWriter out, int userId, int friendId) {
        List<Message> recievedMessagesFromFriend = recievedMessages.get(userId).get(friendId);
        if (recievedMessagesFromFriend.size() > 0) {
            Message m = recievedMessagesFromFriend.get(0);
            if (Chat.chatThreads.get(userId).get(friendId) != null) {
                Chat.chatThreads.get(userId).get(friendId).add(m);
            } else {
                Chat.chatThreads.get(userId).put(friendId, new ArrayList<>());
                Chat.chatThreads.get(userId).get(friendId).add(m);
            }
            recievedMessagesFromFriend.remove(m);
            out.println(m.getMessage());
        }
    }
    //generate the html for the chat window
    synchronized public void initChat(PrintWriter out, int userId, int friendId) {

        List<Message> chatThread;
        if (Chat.recievedMessages.get(friendId) == null) {
            out.println("<font style='color:grey;'>user offline..</font>");
        } else if (Chat.chatThreads.get(userId).get(friendId) != null) {
            chatThread = Chat.chatThreads.get(userId).get(friendId);
            
            for (Message m : chatThread) {
                out.println("<div class='row'><div class='col - lg - 12'><div class='media'>");
                out.println("<a class='pull-left' href='#'>");
                out.println("<img class='media-object img-circle' src='' alt=''>");
                out.println("</a>");
                out.println("<div class='media-body'><h4 class='media-heading'>");
                out.println(LoginDao.onlineUsers.get(m.getFromId()));
                out.println("<font id='chat-friend'></font>");
                out.println("<span class='small pull-right'>");
                out.println("</span>");
                out.println("</h4><p>");
                out.println(m.getMessage());
                out.println("</p></div></div></div></div>");
            }
        } else {

        }
    }

    
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
                    if (chatThreads.get(userId).get(friendId) != null) {
                        chatThreads.get(userId).get(friendId).add(msg);
                    } else {
                        chatThreads.get(userId).put(friendId, new ArrayList<>());
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
