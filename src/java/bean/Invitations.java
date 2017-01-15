/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Lock
 */
public class Invitations extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Connection con = ConnectionProvider.getCon();
            String type = request.getParameter("type");
            String nic = request.getParameter("nic");
            String contact = request.getParameter("contact");
            String area = request.getParameter("area");
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            String ampm = request.getParameter("am-pm");

            String sql = "SELECT post_id,user_id FROM posts WHERE title like  '%"+type+"%'";

            PreparedStatement ps1 = con.prepareStatement(sql);
            
            ResultSet rs = ps1.executeQuery(sql);
            HttpSession session=request.getSession();
            
            String messageToUsers = "Researcher "+session.getAttribute("user_name") +" is conducting a research"+
                    "regarding "+type+" on "+date+" "+time+ampm+". You can participate and help the research."
                   + " You can get the further details by contacting the number "+contact;
            
            while(rs.next()){
                String query = "insert into notification (user_id,notification) values (?,?) ";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setInt(1,rs.getInt("user_id"));
                ps.setString(2, messageToUsers);
                ps.execute();
            }
            RequestDispatcher rd = request.getRequestDispatcher("researcherhome.jsp?success=true");
            rd.forward(request, response);
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
            Logger.getLogger(Invitations.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Invitations.class.getName()).log(Level.SEVERE, null, ex);
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
