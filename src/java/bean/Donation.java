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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Lock
 */
public class Donation extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Connection con=ConnectionProvider.getCon();
            String item,contact,id,btype;
            int quantity,area,itemId;
            
            quantity=0;
            boolean blood=false;
            itemId=Integer.parseInt(request.getParameter("item"));
            if(itemId!=4){
                quantity=Integer.parseInt(request.getParameter("quantity"));
            }
            btype="";
            if(itemId==4){
                btype=request.getParameter("btype");
                blood=true;
            }
            area=Integer.parseInt(request.getParameter("area"));
            id=request.getParameter("nic");
            contact=request.getParameter("contact");
            String query="insert into donors values (?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(query);
            HttpSession session=request.getSession();
            ps.setInt(1,(int)session.getAttribute("user_id"));
            ps.setString(2,id);
            ps.setInt(3,area);
            ps.setString(4,contact);
            ResultSet rs=ps.executeQuery();
            if(!rs.next()){
                System.out.println("insertion unsuccessful");
            }
            
            query="insert into donation values (?,?,?,?)";
            PreparedStatement ps1=con.prepareStatement(query);
            ps.setInt(1,(int)session.getAttribute("user_id"));
            ps.setInt(2,itemId);
            ps.setInt(3,quantity);
            ps.setString(4,btype);
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
            Logger.getLogger(Donation.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Donation.class.getName()).log(Level.SEVERE, null, ex);
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
