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
public class Donation extends HttpServlet {

    static Map<Integer, String> cities = new HashMap<>();
    static Map<Integer, Map<Integer,Integer>> donations=new HashMap<>();
    

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            cities.put(1,"Ambalangoda");cities.put(2,"Ampara");cities.put(3,"Anuradhapura");cities.put(4,"Avissawella");cities.put(5,"Badulla");cities.put(6,"Balangoda");cities.put(7,"Bandarawela");cities.put(8,"Batticaloa");cities.put(9,"Beruwala");cities.put(10,"Chavakacheri");cities.put(11,"Chilaw");cities.put(12,"Colombo");cities.put(13,"Dambulla");cities.put(14,"Dehiwala-MountLavinia");cities.put(15,"Embilipitiya");cities.put(16,"Eravur");cities.put(17,"Galle");cities.put(18,"Gampaha");cities.put(19,"Gampola");cities.put(20,"Hambantota");cities.put(21,"Haputale");cities.put(22,"Harispattuwa");cities.put(23,"Hatton");cities.put(24,"Horana");cities.put(25,"Ja-Ela");cities.put(26,"Jaffna");cities.put(27,"Kadugannawa");cities.put(28,"Kalmunai");cities.put(29,"Kalmunai");cities.put(30,"Sainthamarathu");cities.put(31,"Kalutara");cities.put(32,"Kandy");cities.put(33,"Kattankudy");cities.put(34,"Katunayake");cities.put(35,"Kegalle");cities.put(36,"Kelaniya");cities.put(37,"Kolonnawa");cities.put(38,"Kuliyapitiya");cities.put(39,"Kurunegala");cities.put(40,"Mannar");cities.put(41,"Matale");cities.put(42,"Matara");cities.put(43,"Minuwangoda");cities.put(44,"Monaragala");cities.put(45,"Moratuwa");cities.put(46,"Nawalapitiya");cities.put(47,"Negombo");cities.put(48,"Nuwara");cities.put(49,"Panadura");cities.put(50,"Peliyagoda");cities.put(51,"Point");cities.put(52,"Puttalam");cities.put(53,"Ratnapura");cities.put(54,"Sigiriya");cities.put(55,"SriJayawardanapura");cities.put(56,"Talawakele");cities.put(57,"Tangalle");cities.put(58,"Trincomalee");cities.put(59,"Valvettithurai");cities.put(60,"Vavuniya");cities.put(61,"Wattala");cities.put(62,"Wattegama");           
            Connection con = ConnectionProvider.getCon();
            
            String item, contact, id, btype;
            int quantity, area, itemId;

            quantity = 0;
            boolean blood = false;
            itemId = Integer.parseInt(request.getParameter("item"));
            if (itemId != 4) {
                quantity = Integer.parseInt(request.getParameter("quantity"));
            }
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
                String query = "insert into donors values (?,?,?,?)";
                String query1 = "select * from donors where user_id=?";
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

                
                query = "insert into donation (user_id,item_id,count,blood_type) values (?,?,?,?)";
                ps = con.prepareStatement(query);
                ps.setInt(1, (int) session.getAttribute("user_id"));
                ps.setInt(2, itemId);
                ps.setInt(3, quantity);
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
