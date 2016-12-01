<%-- 
    Document   : catpost
    Created on : Nov 26, 2016, 8:49:05 AM
    Author     : Geeth
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.geeth.DB"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        #post{
        
        border: 3px solid black;
        margin-top: 350px;
        margin-right: 250px;
        margin-left: 380px;
        padding: 30px 30px 50px 30px;
        }
        #new-post{
        
        border: 3px solid black;
        position: absolute;
        top: 560px;
        left: 27px;
        padding: 30px 30px 50px 30px;
        width :230px ;
        height:600px;
        }
         a.c1:link, a.c1:visited {
        background-color:rgb(255, 95, 0);
        color: white;
        padding: 14px 25px;
        text-align: center; 
        text-decoration: none;
        display: inline-block;
        }

        a.c1:hover, a.c1:active {
        background-color: rgb(255, 190, 0);
        }
    
    </style>
    <body>
   
         <div id="post">
           <artical>
                        <%
                           
                            String v =request.getParameter("category");
                            String sql = "SELECT post_id,title,LEFT(body,300) AS body ,category,posted FROM posts where category= "+v;
                            Connection con = DB.getCon();
                            Statement stmt = con.createStatement();
                            ResultSet rs = stmt.executeQuery(sql);
                            while (rs.next()) {
                                int id=rs.getInt("post_id");
                                

                        %>
                        
                        
                              
                            <h2 style="font-size:28px;"><%=rs.getString("title")%></h2>
                            <p style="font-size:18px;"><%=rs.getString("body")%><a href="post.jsp?post_id=<%=id%>" >ReadMore</a></p>
                            
                            <p>Category : <%=rs.getString("category")%>||Date : <%=rs.getString("posted")%></p> <br>
                            
                           
                        <%
                            }

                        %>
                        
                    </artical>
                         </div>
                        
                        <div id="new-post"><center>
                            <h2>If You Want To Add New Post<h2>
                           </artical><a class="c1" href="newpost.jsp" >NEW POST</a><br>
                           <h3  style="font-size:35px; color: rgb(90,90,90); ">Categories</h3>
                          <a href="catpost.jsp?category='Ayurwedic'" >Ayurwedic</a><br>
                          <a href="catpost.jsp?category='Diseses'" >Diseses</a><br>
                          <a href="catpost.jsp?category='Medicine'" >Medicine</a><br>
                          <a href="catpost.jsp?category='sports'" >sports</a><br>
                          <a href="catpost.jsp?category='Healthcare'" >Healthcare</a><br>
                          <a href="catpost.jsp?category='Culture'" >Culture</a><br>
    
                          
                          
                        </center>            
                        </div>  
    </body>
</html>
