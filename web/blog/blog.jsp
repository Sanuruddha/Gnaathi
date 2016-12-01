
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.geeth.DB"%>

<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
 //get record of database
String record_count="SELECT * FROM posts";
//amount displayed
int per_page=1;
//number of pages
int count = 0;
//get number of rows
Connection cont = DB.getCon();
Statement stm = cont.createStatement();
ResultSet s = stm.executeQuery(record_count);
while (s.next()) {
    ++count;
    // Get data from the current row and use it
}
//get  number of pages
int pages=count/per_page;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blog Page</title>
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
                   
             <p><%//out.println(pages);%></p>
                        <%
                            String sql = "SELECT post_id,title,LEFT(body,300) AS body ,category,posted FROM posts  order by post_id desc";
                            Connection con = DB.getCon();
                            Statement stmt = con.createStatement();
                            ResultSet rs = stmt.executeQuery(sql);
                            while (rs.next()) {
                                int id=rs.getInt("post_id");
                                
                        %>
                        
                        
                              
                            <h2><%=rs.getString("title")%></h2>
                            <p><%=rs.getString("body")%><a href="post.jsp?post_id=<%=id%>" >ReadMore</a></p>
                            
                            <p>Category : <%=rs.getString("category")%>||Date : <%=rs.getString("posted")%></p>  
                           <a href="epost.jsp?post_id=<%=id%>" >Edit</a>
                                
                            <br/>
                        <%
                            }

                        %>
                       


                    
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
