<%-- 
    Document   : insertdata
    Created on : Sep 3, 2016, 7:26:15 PM
    Author     : kushan
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>insert post to data base</title>
    </head>
    
        <h1>Hello World!</h1>
      
        <%
         // out.println(request.getParameter("user"));
            // String name0=session.getAttribute("user_name").toString();
            String name1=session.getAttribute("user_id").toString();
            String name2="1";
          //  String name1= request.getParameter("user");
           // String name2=request.getParameter("category");
           // String name3= request.getParameter("content");
           //  String name4= request.getParameter("title");
            try{
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost/gnaathi","root","");
                Statement st=con.createStatement();
                
                st.executeUpdate("insert into user_like_event (user_id,event_id) values('"+name1+"','"+name2+"')");
                out.println("post inserted");
            }catch(Exception e){
                out.println(e);
            }
            finally{
                RequestDispatcher rd=request.getRequestDispatcher("forum.jsp");
                rd.forward(request, response);
               
                
            }
         %>
       
    
</html>
