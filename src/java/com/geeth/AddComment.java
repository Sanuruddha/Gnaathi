/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.geeth;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Geeth
 */
@WebServlet(name = "AddComment", urlPatterns = {"/AddComment"})
public class AddComment extends HttpServlet{
    
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       
        int f = Integer.parseInt(request.getParameter("var"));
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String comment = request.getParameter("comment");
        
        
        // Save in the DB
        
        String sql = "INSERT INTO comments (post_id,email_add,name,comment) VALUES (?,?,?,?)";

        try {
            Connection con = DB.getCon();
            PreparedStatement ps = con.prepareStatement(sql);
           ps.setInt(1, f);
            ps.setString(2, email);
            ps.setString(3, name);
            ps.setString(4, comment);   
            ps.executeUpdate();

            PrintWriter out = response.getWriter();
            out.println("<h1> thank you for Registering<h1/>");
        } catch (Exception e) {
            e.printStackTrace();
            PrintWriter out = response.getWriter();
            out.println("<h1> Errorin Register</h1>");

        }
        
        
        response.sendRedirect("blog/post.jsp?post_id="+f);

    }
    
}
