

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
        #wrapper{
            margin:auto;
            width:800;
        }
        label{display:block}
          #c1{
        
        border: 3px solid black;
        margin-top: 80px;
        margin-right: 250px;
        margin-left: 350px;
        padding: 30px 30px 50px 30px;
        }
    </style>
    <body>
        <h1 style="font-size:45px; color: rgb(0,0,90); "><center>Post Your Article</center></h1>
        <div id="wrapper">
          <div id="c1">
             <form action="../editpost?post_id=<%=request.getParameter("post_id")%>" method="post"  >
                      <%
                           // Object post_id=session.getAttribute("post_id");
                            
                           // int x=Integer.parseInt(post_id+"");
                           // int x=4;
                            String var =request.getParameter("post_id");
                            String sql = "SELECT post_id,title,body,category,posted FROM posts where post_id= "+ var;
                            Connection con = DB.getCon();
                            Statement stmt = con.createStatement();
                            ResultSet rs = stmt.executeQuery(sql);
                            while (rs.next()) {
                                

                        %>
                        
                        
                              
                            
                             <label style="font-size:20px;">Title :</label>
                        <input style="font-size:20px;" size="55" type="text"  name="title" value="<%=rs.getString("title")%>"/>
                      <br/><br/>
                        <label style="font-size:20px;" for="body">Body:</label>
                        <textarea style="font-size:20px;" name="body"  cols=55 rows=14 ><%=rs.getString("body")%></textarea>
                        <br/><br/>
                        <label style="font-size:20px;">Category :</label><select name="category" >
                         <option selected style="font-size:17px;"> <%=rs.getString("category")%></option>
                            <%
                         
                            String sql1 = "SELECT * FROM categories ";
                            Connection con1 = DB.getCon();
                            Statement stmt1 = con1.createStatement();
                            ResultSet rs1 = stmt1.executeQuery(sql1);
                            while (rs1.next()) {
                                
                        %>
                         
                        <option style="font-size:17px;"><%=rs1.getString("category")%></option>
                            
                        <%
                            }
                            
                            %></select>
                        
                        
                           
                        <%
                            }

                        %><br/><br/><br/>
                <input style="font-size:20px;" type="submit" name="submit" value="submit">


                    </form>
    </body>
</html>
