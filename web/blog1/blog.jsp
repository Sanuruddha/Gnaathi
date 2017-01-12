
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
        margin-top: 50px;
        margin-right: 200px;
        margin-left: 380px;
        padding: 30px 30px 50px 30px;
        }
        #new-post{
        
        border: 3px solid black;
        position: absolute;
        top: 150px;
        left: 27px;
        padding: 30px 30px 50px 30px;
        width :300px ;
        height:700px;
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
                            String sql = "SELECT post_id,user_id,user_name,title,LEFT(body,300) AS body ,category,posted FROM posts  order by post_id desc";
                            Connection con = DB.getCon();
                            Statement stmt = con.createStatement();
                            ResultSet rs = stmt.executeQuery(sql);
                           // String user_name=session.getAttribute("user_name").toString();
                            
                            while (rs.next()) {
                                int id=rs.getInt("post_id");
                                
                        %>
                          
                            <h2 style="font-size:34px;"><b><%=rs.getString("title")%></b></h2>
                            <h3 style="font-size:24px;"><b>Post By : <%=rs.getString("user_name")%></b></h3>
                            <p style="font-size:20px;"><%=rs.getString("body")%><a href="post.jsp?post_id=<%=id%>" style="font-size:23px;">ReadMore</a></p>
                            
                            <p style="font-size:20px;font-family: Courier;"><b>Category : <%=rs.getString("category")%>||Date : <%=rs.getString("posted")%></b></p>  
                           <% if(session.getAttribute("user_id")!=null){
                               String user_id=session.getAttribute("user_id").toString();
                               if(user_id.equals(rs.getString("user_id"))){
                           %>
                            <a style="font-size:20px; position: absolute; right: 320px;"href="epost.jsp?post_id=<%=id%>" ><button>Edit</button></a>
                            <form action="../deletepost" method="post">
                                <input type="hidden" name="post_id" value="<%=rs.getString("post_id")%>">
                                <input style="font-size:20px; position: absolute; right: 240px;"type="submit" name="submit" value="Delete" /> 
                                </form>
                            
                           <%}}%>     
                            <br/><br/><br/><br/>
                            
                        <%
                            }

                        %>
                       


                    
        </div>
                        <div id="new-post"><center>
                                
                             <% if(session.getAttribute("user_id")!=null){ %>
                            <h2>If You Want To Add New Post<h2>
                           </artical><a class="c1" href="newpost.jsp" >NEW POST</a><br>
                           <%}%>
                           
                           <h3  style="font-size:35px; color: rgb(90,90,90); ">Categories</h3>
                           <br>
                          <a href="catpost.jsp?category='Ayurwedic'" style="font-size:22px;"><b>Ayurwedic</b></a><br><br>
                          <a href="catpost.jsp?category='Diseses'" style="font-size:22px;"><b>Diseses</a></b><br><br>
                          <a href="catpost.jsp?category='Medicine'" style="font-size:22px;"><b>Medicine</a></b><br><br>
                          <a href="catpost.jsp?category='sports'" style="font-size:22px;"><b>sports</a><br></b><br>
                          <a href="catpost.jsp?category='Healthcare'" style="font-size:22px;"><b>Healthcare</a></b><br><br>
                          <a href="catpost.jsp?category='Culture'" style="font-size:22px;"><b>Culture</a><br></b><br>
    
                          
                          
                        </center>            
                        </div>               
                        
                            
                        
    </body>
</html>
