
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.geeth.DB"%>


<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        #c1{
        
        border: 3px solid black;
        margin-top: 50px;
        margin-right: 220px;
        margin-left: 390px;
        padding: 30px 30px 50px 30px;
        }
        #new-post{
        
        border: 3px solid black;
        position: absolute;
        top: 53px;
        left: 27px;
        padding: 30px 30px 50px 30px;
        width :250px ;
        height:600px;
        }
        #add-comment{
        
        border: 3px solid black;
        margin-right: 220px;
        margin-left: 390px;
        padding: 0px 30px 50px 30px;
        }
        #comment{
        
        border: 3px solid black;
        margin-right: 220px;
        margin-left: 390px;
        padding: 0px 30px 50px 30px;
        }
         a.c2:link, a.c2:visited {
        background-color:rgb(255, 95, 0);
        color: white;
        padding: 14px 25px;
        text-align: center; 
        text-decoration: none;
        display: inline-block;
        }

        a.c2:hover, a.c2:active {
        background-color: rgb(255, 190, 0);
        }
        label{display: block}
         td.t1{
            width:50px;
        }
         td.t2{
            width:60px;
        }
        td.t3{
            align:left;
            width:120px;
        }
        td.t4{
            width:10px;
        }
    </style>
   
    <body>
         
              <div id="c1">
          <artical>
                        <%
                           // Object post_id=session.getAttribute("post_id");
                            
                           // int x=Integer.parseInt(post_id+"");
                           // int x=4;
                            String var =request.getParameter("post_id");
                            String sql = "SELECT post_id,title,body ,posted FROM posts where post_id= "+ var;
                            Connection con = DB.getCon();
                            Statement stmt = con.createStatement();
                            ResultSet rs = stmt.executeQuery(sql);
                            while (rs.next()) {
                                

                        %>
                        
                        
                              
                            <h2 style="font-size:35px;"><%=rs.getString("title")%></h2>
                            <p style="font-size:20px;"><%=rs.getString("body")%></p>
                            
                           
                        <%
                            }

                        %>
                        
                       


                    </artical>
                    </div>
                        
                      <br>
                            <div id="comment">
                                <h2 >Comments</h2>
                                
                                  <%
                           
                           
                            String comments = "SELECT * FROM comments  Where post_id= "+ var;
                            Statement s = con.createStatement();
                            ResultSet rs1 = s.executeQuery(comments);
                            while (rs1.next()) {
                                

                        %>
                        <table>
                           <tr align="left">
                                <td class="t1" ><img src="face.png"  width="30" height="30" ></td>
                                <td class="t2"><p style="font-size:18px; color: rgb(60, 82, 255);"><%= rs1.getString("name")%> </p> </td>
                                <td class="t4">:</td>
                             <td class="t3"><p style="font-size:18px;" ><%=rs1.getString("comment")%></p></td>
                           </tr></table>
                            
                           
                        <%
                            }

                        %>
                                  
                                  
                              </div>
                      
                      
                      <br>
                      <div id="add-comment">
                          <h2 >Post a new comment</h2>
                          <form action="../AddComment" method="post">
                              <div>
                                  <label>Email Address</label><input ="text" name="email" />
                              </div>
                              
                              <div>
                                  <label>Name </label><input ="text" name="name"/>
                              </div>
                              
                              <div>
                                  <label>Comment </label><textarea name="comment"></textarea>
                              </div>
                              <input type="hidden" name="var" value="<% out.print(var);%>" /> 
                              <input type="submit" name="submit" value="Submit" /> 
                              </form></div>
                              
                              
            <div id="new-post"><center>
                            <% if(session.getAttribute("user_id")!=null){ %>
                            <h2>If You Want To Add New Post<h2>
                           </artical><a class="c2" href="newpost.jsp" >NEW POST</a><br>
                           <%}%>
                           
                           <h3  style="font-size:35px; color: rgb(90,90,90); ">Categories</h3>
                          <a style="font-size:20px;" href="catpost.jsp?category='Ayurwedic'" >Ayurwedic</a><br><br>
                          <a style="font-size:20px;" href="catpost.jsp?category='Diseses'" >Diseses</a><br><br>
                          <a style="font-size:20px;" href="catpost.jsp?category='Medicine'" >Medicine</a><br><br>
                          <a style="font-size:20px;" href="catpost.jsp?category='sports'" >sports</a><br><br>
                          <a style="font-size:20px;" href="catpost.jsp?category='Healthcare'" >Healthcare</a><br><br>
                          <a style="font-size:20px;" href="catpost.jsp?category='Culture'" >Culture</a><br><br>
                        </center>            
                        </div>                   
    </body>
</html>
