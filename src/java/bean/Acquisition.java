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
import java.util.HashMap;
import java.util.Map;
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

            String contact, id;
            int area, itemId;

            itemId = Integer.parseInt(request.getParameter("item"));

            area = Integer.parseInt(request.getParameter("area"));
            id = request.getParameter("id");
            contact = request.getParameter("contact");

            HttpSession session = request.getSession();
            if (Validator.validateNIC(id) && Validator.validateMobile(contact)) {
                //////////////////////////////////////////////////
                if (itemId == 11) {
                    out.println("This area of system is still under construction");
                } else {
                    PreparedStatement ps5;
                    ResultSet rs5;

                    String query5 = "select * from donation where item_id=?";
                    ps5 = con.prepareStatement(query5);
                    ps5.setInt(1, itemId);
                    rs5 = ps5.executeQuery();
                    boolean found = false;
                    while (rs5.next()) {
                        if (rs5.getInt("area") == area) {
                            found = true;
                            break;
                        }
                    }

                    if (found) {

                        String donor;
                        String donorNo = rs5.getString("contact_no");

                        PreparedStatement ps2 = con.prepareStatement("select user_name from user where user_id=?");
                        ps2.setInt(1, rs5.getInt("user_id"));
                        ResultSet rs = ps2.executeQuery();

                        rs.next();
                        donor = rs.getString("user_name");

                        String messageToDonor = session.getAttribute("user_name") + " needs what you are willing to donate. "
                                + "He/she will contact you and this is his/her contact number "
                                + contact + ". if the donation did not take place please be kind enough to"
                                + "register in our system again as we delete the details after notifying the users";

                        int donorId = rs5.getInt("user_id");
                        query5 = "insert into notification (user_id,notification) values (?,?) ";
                        ps5 = con.prepareStatement(query5);
                        ps5.setInt(1, donorId);
                        ps5.setString(2, messageToDonor);
                        ps5.execute();

                        String messageToAcquisitor = donor + " is willing to donate what you need. "
                                + "You can contact him/her with the contact number "
                                + donorNo + ". if the donation did not take place please be kind enough to"
                                + "register in our system again as we delete the details after notifying the users";

                        ps5 = con.prepareStatement(query5);
                        ps5.setInt(1, (int) session.getAttribute("user_id"));
                        ps5.setString(2, messageToAcquisitor);
                        ps5.execute();
                        
                        if (rs5.getInt("count") > 1) {
                            
                            String query3 = "update donation set count=count-1 where donation_id=?";

                            ps5 = con.prepareStatement(query3);
                            ps5.setInt(1,rs5.getInt("donation_id"));
                            ps5.execute();
                        }
                        else{
                            String query3 = "delete from donation where donation_id=?";

                            ps5 = con.prepareStatement(query3);
                            ps5.setInt(1,rs5.getInt("donation_id"));
                            ps5.execute();
                        }
                        RequestDispatcher rd = request.getRequestDispatcher("userhome.jsp?donationunsuccess=false");
                        rd.forward(request, response);
                    } else {
                        /////////////////////////////////////////////////
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
                            ps.execute();
                        }

                        query = "insert into acquisition (user_id,item_id,area,contact_no) values (?,?,?,?)";
                        ps = con.prepareStatement(query);
                        ps.setInt(1, (int) session.getAttribute("user_id"));
                        ps.setInt(2, itemId);
                        ps.setInt(3, area);
                        ps.setInt(4, Integer.parseInt(contact));
                        if (ps.executeUpdate() == 0) {
                            RequestDispatcher rd = request.getRequestDispatcher("userhome.jsp?donationunsuccess=true");
                            rd.forward(request, response);
                        } else {
                            RequestDispatcher rd = request.getRequestDispatcher("userhome.jsp?donationunsuccess=false");
                            rd.forward(request, response);
                        }
                    }
                }
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("userhome.jsp?donationunsuccess=true");
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
