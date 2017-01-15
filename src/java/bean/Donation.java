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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
public class Donation extends HttpServlet {

    //static data structures to hold area codes and donation queue
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            ///adding area codes to the cities

            ///initiating a connection to database
            Connection con = ConnectionProvider.getCon();

            String itemName, contactNumber, nicNumber, bloodType;
            int noOfItems, area, itemId;

            //set the initial values of blood type and noOfItems because they are optional
            noOfItems = 0;
            boolean isBlood = false, isOther = false;

            itemId = Integer.parseInt(request.getParameter("item"));

            ///set the noOfItems 
            if (itemId != 10) {
                noOfItems = Integer.parseInt(request.getParameter("quantity"));
            }

            bloodType = "";

            ///set the blood type
            if (itemId == 10) {
                bloodType = request.getParameter("btype");
                isBlood = true;
            }
            if (itemId == 11) {
                isOther = true;
            }
            ///setting other parameters
            area = Integer.parseInt(request.getParameter("area"));
            nicNumber = request.getParameter("nic");
            contactNumber = request.getParameter("contact");

            ////get the session object
            HttpSession session = request.getSession();

            ///check if the given data are valid
            if (Validator.validateNIC(nicNumber) && Validator.validateMobile(contactNumber)) {
                if (isBlood) {
                    out.println("This area of system is still under construction");
                } else if (isOther) {
                    out.println("This area of system is still under construction");
                } else {
                    PreparedStatement ps;
                    ResultSet AcqSelectResult;

                    String query = "select * from acquisition where item_id=?";
                    ps = con.prepareStatement(query);
                    ps.setInt(1, itemId);
                    AcqSelectResult = ps.executeQuery();
                    boolean found = false;
                    while (AcqSelectResult.next()) {
                        if (AcqSelectResult.getInt("area") == area) {
                            found = true;
                            break;
                        }
                    }

                    if (found) {

                        String acquisitor;
                        String aquisitorNo = AcqSelectResult.getString("contact_no");

                        PreparedStatement ps2 = con.prepareStatement("select user_name from user where user_id=?");
                        ps2.setInt(1, AcqSelectResult.getInt("user_id"));
                        ResultSet rs = ps2.executeQuery();

                        rs.next();
                        acquisitor = rs.getString("user_name");

                        String messageToDonor = acquisitor + " needs what you are willing to donate. "
                                + "He/she will contact you and this is his/her contact number "
                                + aquisitorNo + ". if the donation did not take place please be kind enough to"
                                + "register in our system again as we delete the details after notifying the users";

                        query = "insert into notification (user_id,notification) values (?,?) ";
                        ps = con.prepareStatement(query);
                        ps.setInt(1, (int) session.getAttribute("user_id"));
                        ps.setString(2, messageToDonor);
                        ps.execute();

                        String messageToAcquisitor = session.getAttribute("user_name") + " is willing to donate what you need. "
                                + "You can contact him/her with the contact number "
                                + contactNumber + ". if the donation did not take place please be kind enough to"
                                + "register in our system again as we delete the details after notifying the users";

                        int acquisitorId = AcqSelectResult.getInt("user_id");
                        ps = con.prepareStatement(query);
                        ps.setInt(1, acquisitorId);
                        ps.setString(2, messageToAcquisitor);
                        ps.execute();
                        if (noOfItems > 1) {
                            noOfItems--;
                            String query3 = "insert into donation (user_id,item_id,count,area,contact_no) values (?,?,?,?,?)";

                            ps = con.prepareStatement(query3);
                            ps.setInt(1, (int) session.getAttribute("user_id"));
                            ps.setInt(2, itemId);
                            ps.setInt(3, noOfItems);
                            ps.setInt(4, area);
                            ps.setInt(5, Integer.parseInt(contactNumber));
                            ps.execute();
                        }
                        String query3 = "delete from acquisition where acquisition_id=?";
                        ps = con.prepareStatement(query3);
                        ps.setInt(1, AcqSelectResult.getInt("acquisition_id"));
                        ps.execute();

                        RequestDispatcher rd = request.getRequestDispatcher("userhome.jsp?donationunsuccess=false");
                        rd.forward(request, response);
                    } else {
                        String query1 = "insert into donors values (?,?,?,?)";
                        String query2 = "select * from donors where user_id=?";

                        ps = con.prepareStatement(query1);
                        PreparedStatement ps2 = con.prepareStatement(query2);

                        ps2.setInt(1, (int) session.getAttribute("user_id"));
                        ResultSet rs3 = ps2.executeQuery();
                        boolean status = rs3.next();
                        ///try to insert the donor into the donor table.if donor is already in the table this step is skipped
                        if (!status) {

                            ps.setInt(1, (int) session.getAttribute("user_id"));
                            ps.setString(2, nicNumber);
                            ps.setInt(3, area);
                            ps.setString(4, contactNumber);
                            ps.execute();
                            
                        }
                        String query3 = "insert into donation (user_id,item_id,count,area,contact_no) values (?,?,?,?,?)";

                        ps = con.prepareStatement(query3);
                        ps.setInt(1, (int) session.getAttribute("user_id"));
                        ps.setInt(2, itemId);
                        ps.setInt(3, noOfItems);
                        ps.setInt(4, area);
                        ps.setInt(5, Integer.parseInt(contactNumber));

                        ///try to insert the donation into the donation table
                        if (ps.executeUpdate() == 0) {
                            RequestDispatcher rd = request.getRequestDispatcher("userhome.jsp?donationunsuccess=true");
                            rd.forward(request, response);
                        } ///after the processing of the donation the response will be a redirected to the page the user was in
                        else {
                            RequestDispatcher rd = request.getRequestDispatcher("userhome.jsp?donationunsuccess=false");
                            rd.forward(request, response);
                        }
                    }
                } ///if the given data is invalid response will be a redirected to the page the user was in and it will show an
                /// error message
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
            Logger.getLogger(Donation.class
                    .getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Donation.class
                    .getName()).log(Level.SEVERE, null, ex);
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
