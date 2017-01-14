
import com.geeth.DB;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Geeth
 */
@WebServlet(name = "deletepost", urlPatterns = {"/deletepost"})
public class deletepost extends HttpServlet{
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         HttpSession session=request.getSession();
        String user_id=session.getAttribute("user_id").toString();
        String p_id =request.getParameter("post_id");
       
        String sql = "delete  from posts where post_id= "+p_id;

        try {
            Connection con = DB.getCon();
            PreparedStatement ps = con.prepareStatement(sql);
           
            
            ps.executeUpdate();

            PrintWriter out = response.getWriter();
            out.println("<h1> thank you for deleting<h1/>");
        } catch (Exception e) {
            e.printStackTrace();
            PrintWriter out = response.getWriter();
            out.println("<h1> Errorin Register</h1>title="+p_id);

        }
       
        
        
        response.sendRedirect("blog/index.jsp#jump-to");
    }
    
}
