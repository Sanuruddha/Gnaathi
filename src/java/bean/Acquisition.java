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
public class Acquisition extends HttpServlet {

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
            Connection con = ConnectionProvider.getCon();
            
            String item, contact, id, btype;
            int area, itemId;
            boolean blood = false;
            itemId = Integer.parseInt(request.getParameter("item"));
            btype = "";
            if (itemId == 4) {
                btype = request.getParameter("btype");
                blood = true;
            }
            area = Integer.parseInt(request.getParameter("area"));
            id = request.getParameter("nic");
            contact = request.getParameter("contact");
            
            HttpSession session = request.getSession();
            if (Validator.validateNIC(id) && Validator.validateMobile(contact)) {
               System.out.println("here");
                String query = "insert into acquisitor values (?,?,?,?)";
                String query1 = "select * from acquisitor where user_id=?";
                PreparedStatement ps2 = con.prepareStatement(query1);
                PreparedStatement ps = con.prepareStatement(query);
                ps2.setInt(1, (int) session.getAttribute("user_id"));
                ResultSet rs2 = ps2.executeQuery();
                boolean status = rs2.next();
                if (!status) {

                    ps.setInt(1, (int) session.getAttribute("user_id"));
                    ps.setString(2, id);
                    ps.setInt(3, area);
                    ps.setString(4, contact);
                    if (!ps.execute()) {
                        System.out.println("insertion into donors unsuccessful");
                    }
                }
                query = "insert into donation (user_id,item_id,blood_type) values (?,?,?,?)";
                ps = con.prepareStatement(query);
                ps.setInt(1, (int) session.getAttribute("user_id"));
                ps.setInt(2, itemId);
                ps.setString(4, btype);
                if (ps.executeUpdate() == 0) {
                    System.out.println("insertion into donation unsuccessful");
                }
            } else {
                RequestDispatcher rd=request.getRequestDispatcher("userhome.jsp?donationunsuccess=true");
                rd.forward(request, response);
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
            Logger.getLogger(Acquisition.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Acquisition.class.getName()).log(Level.SEVERE, null, ex);
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
