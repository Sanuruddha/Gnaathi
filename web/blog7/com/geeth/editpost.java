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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Geeth
 */
@WebServlet(name = "editpost", urlPatterns = {"/editpost"})
public class editpost extends HttpServlet {
    private Object calobj;
    
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session=request.getSession();
        String user_id=session.getAttribute("user_id").toString();
        String v =request.getParameter("post_id");
        String title = request.getParameter("title");
        System.out.println(title);
        String body = request.getParameter("body");
        System.out.println(title);System.out.println(title);
        String category = request.getParameter("category");
         DateFormat df = new SimpleDateFormat("yy/MM/dd HH:mm:ss");
          Date dateobj = new Date();
        String x=df.format(dateobj);
        
        
    
        
        

        // Save in the DB
        String sql = "update posts set user_id=?,title=?,body=?,category=?,posted=? where post_id = "+v;

        try {
            Connection con = DB.getCon();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user_id);
            ps.setString(2, title);
            ps.setString(3, body);
            ps.setString(4, category);
            ps.setString(5, x);
           
            
            ps.executeUpdate();

            PrintWriter out = response.getWriter();
            out.println("<h1> thank you for Registering<h1/>"+v);
        } catch (Exception e) {
            e.printStackTrace();
            PrintWriter out = response.getWriter();
            out.println("<h1> Errorin Register</h1>title="+title);

        }
        response.sendRedirect("blog/index.jsp#jump-to");
    
}}
