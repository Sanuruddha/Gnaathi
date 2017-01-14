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
import org.json.JSONObject;

/**
 *
 * @author Lock
 */
public class Notifications extends HttpServlet {

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
        
        try (PrintWriter out = response.getWriter()) {
            Connection con = ConnectionProvider.getCon();
            
            if (request.getParameter("type") != null) {
                if (request.getParameter("type").equals("1")) {
                    String querySelect = "select * from notification where user_id=?";
                    PreparedStatement selectStatement = con.prepareStatement(querySelect);
                    selectStatement.setInt(1,(int)request.getSession().getAttribute("user_id"));
                    ResultSet selectResult = selectStatement.executeQuery();
                    while (selectResult.next()) {
                        String queryInsert = "insert into old_notifications (user_id,notification) values(?,?)";
                        PreparedStatement insertStatement = con.prepareStatement(queryInsert);
                        insertStatement.setInt(1,(int)request.getSession().getAttribute("user_id"));
                        insertStatement.setString(2,selectResult.getString("notification"));
                        insertStatement.execute();

                        String queryDelete = "delete from notification where notification_id=?";
                        PreparedStatement deleteStatement = con.prepareStatement(queryDelete);
                        deleteStatement.setInt(1,selectResult.getInt("notification_id"));
                        deleteStatement.execute();
                    }

                    String sql = "select * from old_notifications where user_id=? order by notification_id desc";
                    PreparedStatement ps = con.prepareStatement(sql);
                    ps.setInt(1,(int)request.getSession().getAttribute("user_id"));
                    ResultSet rs = ps.executeQuery();
                    JSONObject obj = new JSONObject();
                    int number = 1;
                    while (rs.next()) {
                        //creating the friend list as a json object by inserting all the friends and their id's
                        obj.put(Integer.toString(number), rs.getString("notification"));
                        number++;
                    }
                    obj.toString();
                    out.print(obj);
                } else if (request.getParameter("type").equals("0")) {
                    String querySelect = "select * from notification where user_id=?";
                    PreparedStatement selectStatement = con.prepareStatement(querySelect);
                    selectStatement.setInt(1,(int)request.getSession().getAttribute("user_id"));
                    ResultSet selectResult = selectStatement.executeQuery();
                    if(selectResult.next()){
                        out.println("true");
                    }
                }
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
            Logger.getLogger(Notifications.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Notifications.class.getName()).log(Level.SEVERE, null, ex);
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
