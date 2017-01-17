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
    
    
    // acquisition servlet will recieve post data from acquisition form
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            Connection con = ConnectionProvider.getCon();

            String contact, id;
            int areaOfAcquisitor, itemId;
            int other=11;
            //get post data from the form
            itemId = Integer.parseInt(request.getParameter("item"));
            areaOfAcquisitor = Integer.parseInt(request.getParameter("area"));
            id = request.getParameter("id");
            contact = request.getParameter("contact");
            
            HttpSession session = request.getSession();
            
            if (Validator.validateNIC(id) && Validator.validateMobile(contact)) {
                
                if (itemId == other) {
                    //this areaOfAcquisitor is still not implemented
                    out.println("This area of system is still under construction");
                } else {
                    
                    PreparedStatement ps5;
                    ResultSet rs5;
                    
                    //search the database for a donor
                    
                    String selectFromDonationQuery = "select * from donation where item_id=?";
                    ps5 = con.prepareStatement(selectFromDonationQuery);
                    ps5.setInt(1, itemId);
                    rs5 = ps5.executeQuery();
                    
                    boolean foundMatchingDonor= false;
                    while (rs5.next()) {
                        int areaOfDoner=rs5.getInt("area");
                        if ( areaOfDoner== areaOfAcquisitor) {
                            foundMatchingDonor = true;
                            break;
                        }
                    }
                    
                     
                    
                    if (foundMatchingDonor) {

                        String donor;
                        String donorNo = rs5.getString("contact_no");

                        PreparedStatement ps2 = con.prepareStatement("select user_name from user where user_id=?");
                        ps2.setInt(1, rs5.getInt("user_id"));
                        ResultSet rs = ps2.executeQuery();

                        rs.next();
                        donor = rs.getString("user_name");
                        
                        //insert the notification for the donor into the notification table 
                        String messageToDonor = session.getAttribute("user_name") + " needs what you are willing to donate. "
                                + "He/she will contact you and this is his/her contact number "
                                + contact + ". If the donation did not take place please be kind enough to"
                                + " register in our system again as we delete the details after notifying the users";

                        int donorId = rs5.getInt("user_id");
                        String inserToNotificationQuery = "insert into notification (user_id,notification) values (?,?) ";
                        ps5 = con.prepareStatement(inserToNotificationQuery);
                        ps5.setInt(1, donorId);
                        ps5.setString(2, messageToDonor);
                        ps5.execute();
                        
                        
                        //insert the notification for the acquisitor into the notification table 
                        
                        String messageToAcquisitor = donor + " is willing to donate what you need. "
                                + "You can contact him/her with the contact number "
                                + donorNo + ". If the donation did not take place please be kind enough to"
                                + " register in our system again as we delete the details after notifying the users";

                        ps5 = con.prepareStatement(inserToNotificationQuery);
                        ps5.setInt(1, (int) session.getAttribute("user_id"));
                        ps5.setString(2, messageToAcquisitor);
                        ps5.execute();
                        
                        //if the donor has signup for more than quantity for an item , the database will be updated
                        //and the count will be reduced by 1
                        
                        if (rs5.getInt("count") > 1) {
                            
                            String query3 = "update donation set count=count-1 where donation_id=?";

                            ps5 = con.prepareStatement(query3);
                            ps5.setInt(1,rs5.getInt("donation_id"));
                            ps5.execute();
                        }
                        //else if the count is 1 then the whole record of donation will be removed from the database
                        else{
                            String query3 = "delete from donation where donation_id=?";

                            ps5 = con.prepareStatement(query3);
                            ps5.setInt(1,rs5.getInt("donation_id"));
                            ps5.execute();
                        }
                        
                        ///redirect user to the userhome with a success message
                        RequestDispatcher rd = request.getRequestDispatcher("userhome.jsp?donationunsuccess=false");
                        rd.forward(request, response);
                    } else {
                        //no donor is found
                        
                        String inserIntoAcquisitorQuery = "insert into acquisitor values (?,?,?,?)";
                        String selectFromAcquisitorQuery = "select * from acquisitor where user_id=?";
                        
                        PreparedStatement ps = con.prepareStatement(inserIntoAcquisitorQuery);
                        PreparedStatement ps2 = con.prepareStatement(selectFromAcquisitorQuery);
                        
                        ps2.setInt(1, (int) session.getAttribute("user_id"));
                        ResultSet rs2 = ps2.executeQuery();
                        boolean acquisitorAlreadyExsist = rs2.next();
                        //acquisitor is inserted into the the acquisitor table
                        if (!acquisitorAlreadyExsist) {
                            
                            ps.setInt(1, (int) session.getAttribute("user_id"));
                            ps.setString(2, id);
                            ps.setInt(3, areaOfAcquisitor);
                            ps.setString(4, contact);
                            ps.execute();
                        }
                        
                        //acquisition table is updated
                        String insertIntoAcquisitionQuery = "insert into acquisition (user_id,item_id,area,contact_no) values (?,?,?,?)";
                        ps = con.prepareStatement(insertIntoAcquisitionQuery);
                        ps.setInt(1, (int) session.getAttribute("user_id"));
                        ps.setInt(2, itemId);
                        ps.setInt(3, areaOfAcquisitor);
                        ps.setInt(4, Integer.parseInt(contact));
                        
                        int rowsAffected=ps.executeUpdate();
                        if (rowsAffected == 0) {
                            //redirect with error message
                            RequestDispatcher rd = request.getRequestDispatcher("userhome.jsp?donationunsuccess=true");
                            rd.forward(request, response);
                        } else {
                            //redirect with success message
                            RequestDispatcher rd = request.getRequestDispatcher("userhome.jsp?donationunsuccess=false");
                            rd.forward(request, response);
                        }
                    }
                }
            } else {
                
                //invalid details
                //redirect with an error message
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
