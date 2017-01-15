package bean;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Events extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Connection con = ConnectionProvider.getCon();
            String type = request.getParameter("type");
            String contact = request.getParameter("contact");
            String area = request.getParameter("area");
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            String regno = request.getParameter("reg-no");
            String name = request.getParameter("name");
            String ampm = request.getParameter("am-pm");
            String meridium="pm";
            
            if(ampm.equals("0")){
                meridium="am";
            }
            
            Map<Integer,String> events=new HashMap<>();
            events.put(0,"Religious activity");
            events.put(1,"Blood donation");
            events.put(2,"Pilgrimage");
            events.put(3,"Get together");
            
            String messageToUsers = "Elderly society "+name +" is organizing a "+events.get(Integer.parseInt(type))+
                    "event in your area on "+date+" "+time+meridium+". You can participate and help the gnaathi family grow while"
                   + " enjoying the event. You can get the further details by contacting the number "+contact;
            
            String selectQuery ="select user_id from user where area=?";
            PreparedStatement ps1=con.prepareStatement(selectQuery);
            ps1.setInt(1,Integer.parseInt(area));
            ResultSet rs=ps1.executeQuery();
            String query = "insert into notification (user_id,notification) values (?,?) ";
            HttpSession session=request.getSession();
            while(rs.next()){
                PreparedStatement ps = con.prepareStatement(query);
                ps.setInt(1,rs.getInt("user_id"));
                ps.setString(2, messageToUsers);
                ps.execute();
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
            Logger.getLogger(Events.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Events.class.getName()).log(Level.SEVERE, null, ex);
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
